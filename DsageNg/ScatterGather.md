## page was renamed from GlennTarbox/ScatterGather
## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:CategoryTemplate
##master-date:Unknown-Date
#format wiki
#language en

[[TableOfContents]]

= DsageNg Scatter Gather Alpha Edition =

This is not an official release or anything close... but it seems to work.

Also, you're entirely off the reservation here.  This is just for those few who want to play around with the simplest of simple first cases of DsageNg.  All comments should come to me for the time being...  sage-devel ain't gonna help you with this one

= List =

http://groups.google.com/group/sage-dsageng

= Code =

The tip of my repo is at:

http://noc2.tarbox.org:8080/?p=sage-finance/.git;a=summary

You can grab a tarball of any point.  I'll be making an Hg Clone of snapshots.  How to use them can be viewed at

GlennTarbox/HgDevelopment

= High Level Architecture =

There are a few key elements in the proposed architecture
 * Twisted for asynchronous communications, event management, scheduling
 * PyProcessing for spawning local processes and IPC
 * Foolscap for Remote Procedure Call (RPC) abstraction over Twisted

== Architecture Diagram ==
[[ImageLink(DOC.png, height=500)]]

The client itself, now has 2 processes.  In the example above, the notebook layer supports the browser view into Sage.  In Scatter Gather, another process is spawned using PyProcessing and communications between the two processes is maintained through Queues.

 1. The Client Child is passed a set of url's identifying the remote processes for execution.  While this is a very general capability, for ''Scatter Gather'', it simply means a process which takes a block of work and returns a result.
 1. The Client Parent generates a ''Task'' which in its simplest case (for scatter gather) is simply the argument set of a function call.  Fortunately, since we're using Python, this simply means we need to generate an args list and kargs dict for each Task.  A ''Scatter Set'' is simply a list of args, kargs tuples.

{{{#!python
""" Create list of args, kargs for remote method """
inList[]
for x in range(100):
    inList.append(([x,3.14159,'hello'],{'distribution':'normal',
                           'loc':1,'scale':1,'bins':10}))
}}}


 1. This list is simply inserted in the downward queue in the figure.  The result of the function call is returned in the upward queue.  A nice feature is the ability to check for result availability without blocking.  In the case of the notebook, one can continuously add jobs to be processsed while investigating the results of previous jobs.
 1. If desired, you can block waiting for results as well.
 1. The heavy lifting of object marshalling, fortunately, is handled by Sage's dumps() method.  Essentially, I can take a tuple(args,kargs) and push it through dumps() and use loads() on the other side.  Foolscap provides a simple way to use custom marshalling

{{{#!python
class AllWrap(Copyable, RemoteCopy):
    """ copious documentation """
    
    copytype = typeToCopy = "unique-string-AllWrap" # easy to mach

    def __init__(self):
        #log.msg("AllWrap __init__")
        pass

    def setValue(self, inVal):
        #log.msg("AllWrap.setVal: ")        
        self.v = inVal
        return self

    def getStateToCopy(self):
        #log.msg("AllWrap.getStateToCopy")                
        d = {}
        d['value'] = cPickle.dumps(self.v)
        return d

    def setCopyableState(self, d):
        #log.msg("AllWrap.setCopyableState")                        
        self.v = cPickle.loads(d['value'])

}}}

 1. And the worker process is simply invoked like

{{{#!python
    def remote_execJob(self,wrap):
        """ suck args and kargs out of allwrap transport
        and wrap em back up for the long trip home """
        #log.msg("AllServer.remote_execJob: " + repr(wrap.v))
        return AllWrap().setValue(self.local_execJob(*wrap.v[0],**wrap.v[1]))

    def local_execJob(self, sizeSeries,distribution='normal',
                       loc=1,scale=1,bins=50):
        s='AllServer.local_execJob %d, %s, %d, %d, %d'
        #log.msg(s % (sizeSeries, distribution,loc, scale, bins))
        ts = TimeSeries(sizeSeries)
        ts.randomize(distribution,loc,scale)
        return ts.histogram(bins=bins)
}}}

 1. The blocks from the trivial test workbook are

{{{#!python
%python
urls=[("pbu://ghtmyth:",12345,"/all_series",2)]
#urls.append(("pbu://hq2:",12345,"/all_series",8))

inList=[]
}}}

{{{#!python
%python
for x in range(100):
    inList.append(([1000],{'distribution':'normal',
                           'loc':1,'scale':1,'bins':10}))
}}}

{{{#!python
%python
f=open('/tmp/client.log','w')
c=sage.all.dsageng.spawnScatterGather(urls,logFile=f)
goVal = c.waitForResult(); goVal
}}}

{{{#!python
%python
c.addJob(inList)
}}}

{{{#!python
%python
r=c.waitForResult(); r[0:5]
}}}

{{{#!python
%python
c.command('refresh')
c.command('die') # kills the child... probably don't wanna do this
}}}

== Additional Prose ==

Briefly, the client (which is command line or notebook) forks a single
pyprocess which is the twisted/foolscap scatter gather controller.
There are persistent compute servers on multiple machines, each with
multiple processes having been forked by pyprocessing. Each subordinate
process is nailed to the scatter gather controller as a "worker"

In my case, I have 4 servers each with 8 cores hence 8 processes.  So my
scatter gather controller has 32 workers.

The "actual" client (command line or notebook) submits jobs on a queue
as a block of work to be scatter / gathered... and can block waiting for
results... or check whether results have arrived in a non-blocking
way... perfect for the notebook... 

meanwhile, the client's child process, is fully asynchronous... able to
handle results, continue feeding the workers... and could, of course,
field exogenous events.  Currently, these events don't cause anything to
happen in the client so must be polled... but that's our current
interaction metaphor... easily adjusted / enhanced in the future.

﻿The remote "worker" processes can be "refreshed" meaning killed and
reforked very quickly because the parent doesn't do any computation so
is always "clean".  One command across the wire and they die and refork
almost instantly.

Nothing fancy required. PyProcessing makes the server-pool spawning
trivial and asynchronous event handling and IPC on the clients
trivial... foolscap makes remote marshalling and general RPC signature
semantics trivial...

what was really cool was the IPC queues... I just shove full blown sage
objects in one side of the queue (currently as lists of args, kargs each
element of which can be an arbitrary Sage objects), the child process on
the client side sucks from the Q, invokes all the workers who suck a job
off, ﻿marshall the list of lists of objects across the wire to a remote
server process, gets the result (a deferred manages each expected
result), stores it, grabs another etc... so, its completely asynchronous
and each worker process stays full regardless.

Results are handed back in a result queue.

I couldn't believe it all just worked...

Very easily, I can send new blocks of code out to each of the
workers, compile it, use it, and refresh...  at which point we're mostly
done from the infrastructure perspective.

The last steps are more complex event chains... but there's no work
there from an infrastructure perspective... that's mostly
initialization.  Nailing arbitrary topologies is trivialized by foolscap
because I can pickle references... which open direct connections between
objects in processes on whatever machine.. dynamic heterogeneous mesh.

== Enhancements Comming Soon ==

First, answers to the questions I expect:

 * Interactive Use - This means to most, tab completion and use from the notebook.  This does work from the notebook, but the meta-data for tab completion needs to be added.  The good news is it appears straightforward
 * Dynamic Code Migration - This is also likely straightforward.  Numerous approaches exist:
  1. Send a block of code in a string and have it compiled and resident on the servers
  1. Pickle a python function and send it over (gfurnish has this capability coded up)
  1. Task Objects - send over an object with a well-known interface (this is easily extended to be very general)

= Installation =

You'll need foolscap and PyProcessing

{{{
source SAGE_ROOT/local/bin/sage-env
cd /tmp
hg clone http://foolscap.lothar.com/repos/trunk foolscap-trunk
cd foolscap-trunk
./setup.py install
sage -i processing-0.52
}}}

Then grab the tarball (or the repo... but the tarball is easier) from the Distributed branch

http://noc2.tarbox.org:8080/?p=sage-finance/.git;a=shortlog;h=refs/heads/distributed

Unwind the tarball into SAGE_ROOT/devel/sage-finance

{{{
sage -b finance
}}}

Now you're mostly good to go.

Insert useful instructions here...


----
CategoryDsageNg
