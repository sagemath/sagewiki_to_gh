#pragma section-numbers 2
= Sage FAQ: Frequently Asked Questions =
<<TableOfContents>>

== Introduction ==
=== What is Sage? ===
Sage is a comprehensive open-source mathematics software suite that has the mission statement "Creating a viable free open source alternative to Magma, Maple, Mathematica, and Matlab."  See http://www.sagemath.org/ for more details.

== Getting Sage ==
=== Can I try out Sage without downloading anything? ===
Yes!  Go to http://www.sagenb.org/ and set up a free account.  If you log in, you will be working on a free Sage notebook server that will work identically to the one you get with Sage.

=== How do I get a Sage program I can run immediately? ===
Go to http://www.sagemath.org/download.html and click on the link for the binary for your operating system.

=== How do I get the Sage source code? ===
Go to http://www.sagemath.org/src/ to download the tar archive for any release of Sage.

=== How do I get a previous release of Sage? ===
Go to http://www.sagemath.org/src/ to download the tar archive for any release of Sage.

== Installing and running Sage ==
=== Wouldn't it be way better if Sage did not ship as a gigantic bundle? ===

This has been discussed over and over again and it [[/bigsagerant|plainly doesn't work]].


=== How do I compile the source to Sage? ===
Download the source tar archive, extract the archive, change your directory to be inside of it, and read the README.txt file there.  Basically, after making sure you have the proper prerequisite tools installed, you type {{{make}}}.

=== How do I run Sage on a platform other than VMWare or Windows? ===
Change your directory to the sage directory and run {{{./sage}}}

To start an online notebook server, start Sage and type {{{notebook()}}} at the sage command prompt.

=== How do I run Sage with VMWare? ===
You must install the VMWare software (the free VMWare Player should work).  Simply start the virtual machine using the VMWare software, wait for the virtual machine to boot up, then type {{{notebook}}} at the prompt.

=== How do I run Sage in Windows? ===
Windows is currently supported via the VMWare image, so see the instructions for running Sage under VMWare.
See [[windows]] for information on efforts to make a native port of Sage to Windows.

=== How do I run a parallel build? ===
{{{export MAKE="make -j8"}}} will enable 8 threads for parts of the build that support parallelism.

=== How do I run Sage in a browser that is not the system default ===
Issue this command "env SAGE_BROWSER=opera /usr/bin/sage -notebook" either from the command prompt or as a menu command for Sage. Assumes a Linux operating system, Opera as the browser, and I happen to use KDE as my desktop.

=== How to get Sage's Python to recognize my system's Tcl/Tk install? ===
It may be that you have Tcl/Tk installed and that your system's Python recognizes it but Sage's Python does not. To fix that, install the tcl/tk development library. On Ubuntu, this is the command

{{{
sudo apt-get install tk8.5-dev
}}}
Next, reinstall Sage's Python:

{{{
sage -f python-2.5.2.p8
}}}
This will pick up the tcl/tk library automatically. If
 
{{{#!python numbers=none
sage: import _tkinter
sage: import Tkinter
}}}
does not raise an ImportError then it worked.

=== How do I import Sage into a Python script? ===

Yes you can import Sage as a library in a Python script. One caveat is that you need to run that Python script using the version of Python that is bundled with Sage; currently Python 2.6.x. To import Sage, put the following in your Python script:

from sage.all import *

Then when you want to run your script, you need to invoke Sage with the option "-python" which would run your script using the Python that comes with Sage. For example, if Sage is in your PATH variable then you can do this:

sage -python /path/to/my/script.py

Another way is to write a Sage script and run that script using Sage itself. A Sage script has the file extension ".sage" and is more or less a Python script but uses Sage-specific functions and commands. You can then run that Sage script like so:

sage /path/to/my/script.sage

This will take care of loading the necessary environment variables and default imports for you.

=== I'm seeing an error about 'Permission denied' on a file called sage-flags.txt ===

When sage is built from source, it keeps track of what special instructions your CPU 
supports (such as `SSE2`), and records these (so that if you try running the code on a different machine,
which doesn't support these extra instructions, you get a sensible error message instead
of a segfault or illegal instruction). Since this should be stored with sage itself (as opposed 
to a user's `.sage` directory), it has to be created by someone with the appropriate permissions.

So if you're seeing something like this:

{{{#!python numbers=none
Traceback (most recent call last):
  File "/usr/local/sage-4.0.2/local/bin/sage-location", line 174, in <module>
    t, R = install_moved()
  File "/usr/local/sage-4.0.2/local/bin/sage-location", line 18, in install_moved
    write_flags_file()
  File "/usr/local/sage-4.0.2/local/bin/sage-location", line 82, in write_flags_file
    open(flags_file,'w').write(get_flags_info())
IOError: [Errno 13] Permission denied: '/usr/local/sage-4.0.2/local/lib/sage-flags.txt'
}}}

it probably means that you compiled/installed sage as one user, but haven't run it to let it
generate the `sage-flags.txt` file. Just run `sage` one time as whatever user installed it, and 
this problem should go away. This would also be easy to fix by having sage run once as part of
the install process; see [[http://trac.sagemath.org/sage_trac/ticket/6375|trac #6375]] for 
this fix.


=== I used Debian/Ubuntu to install Sage 3.0.5 and that version is giving lots of errors. What can I do? ===

The version of Sage, i.e. Sage version 3.0.5, that's available through apt-get in Debian and Ubuntu is very old. No-one has yet found time to update the Debian/Ubuntu version of Sage. Help wanted! You should download the latest version of Sage from the [[http://www.sagemath.org/download.html|download page]]. If you would like to help with updating the Debian/Ubuntu version of Sage, please email the [[http://groups.google.com/group/sage-devel|sage-devel]] mailing list.


== Developing in Sage ==
=== What tools do I need to develop in Sage? ===
You need the prerequisite tools listed in the README.txt file in the root directory of Sage.

=== Where is the source code to Sage? ===
You can browse the complete source code to everything in Sage at http://hg.sagemath.org/.  This is a web interface to the Mercurial repository.  The main source files are at http://hg.sagemath.org/sage-main?cmd=manifest;manifest=-1;path=/sage/.  The other directories include docs directories, the package system, etc.

== Working in Sage ==

=== What exactly does SAGE do when I type 0.6**2? ===

 * QUESTION: When I type 0.6**2 in python, it returns 0.35999999999999999.  When I do the same in Sage it returns 0.360000000000000.  Why?
 * ANSWER: See [[http://docs.python.org/tutorial/floatingpoint.html|the Python tutorial]] to understand why Python does what it does.    What Sage does is "preparse" the input and transforms it like this:
{{{
sage: preparse('0.6**2')
"RealNumber('0.6')**Integer(2)"
}}}
So what is *actually* run is:
{{{
RealNumber('0.6')**Integer(2)
}}}
The Sage developers (in fact, Carl Witty) decided that Sage floating point numbers should by default print only the known correct decimal digits, when possible, thus skirting the problem that Python has.  This decision has its pros and cons.  Note that {{{RealNumber}}} and {{{Integer}}} are Sage specific, so you wouldn't be able to just type the above into python and expect it to work without first doing {{{from sage.all import RealNumber, Integer, prepearse}}}. 


=== Why is Sage's command history different than Magma's ===

 * QUESTION: Using Sage, I am missing a feature of Magma command line interface. In Magma, if I enter a line found in history using up arrow key, and then
press down arrow key, then the next line in history is fetched. This feature allows me to fetch as many successive lines in history as like. Does Sage(or readline) have a similar feature?
 * ANSWER: No, Sage does not have a similar feature.  The IPython command prompt uses the readline library (via pyreadline), which evidently doesn't support this feature.  Magma has its own custom "readline-like" library, which does support this feature.   (Since so many people have requested this feature, if anybody can figure out how to implement it, then such an implementation would certainly be welcome!)


=== Type issues using scipy, cvxopt or numpy from Sage ===

 * QUESTION: I'm using scipy or cvxopt or numpy from Sage and get type errors, e.g., "TypeError: function not supported for these types, and can't coerce safely to supported types."
 * ANSWER: When you type in numbers into Sage, the pre-processor converts them to a base ring, which you can see by doing: 
 {{{#!python numbers=none
sage: preparse('stats.uniform(0,15).ppf([0.5,0.7])')
"stats.uniform(Integer(0),Integer(15)).ppf([RealNumber('0.5'),RealNumber('0.7')])"
}}}
Unfortunately, Numpy support of these advanced Sage types like Integer or RealNumber is not yet at 100%. 

As a solution, redefine RealNumber and/or Integer to change the behavior of the Sage preparser, so decimal literals are floats instead of Sage arbitrary precision real numbers, and integer literals are Python ints.  For example:
{{{#!python numbers=none
sage: RealNumber=float; Integer=int
sage: from scipy import stats
sage: stats.ttest_ind(list([1,2,3,4,5]),list([2,3,4,5,.6]))
(array(0.076752955645333687), 0.940704902474)
sage: stats.uniform(0,15).ppf([0.5,0.7])
array([  7.5,  10.5])
}}}

Alternatively, be explicit about data types, e.g.
{{{#!python numbers=none
sage: stats.uniform(int(0),int(15)).ppf([float(0.5),float(0.7)])
array([  7.5,  10.5])
}}}

As a third alternative, use the raw suffix:
{{{#!python numbers=none
sage: stats.uniform(0r,15r).ppf([0.5r,0.7r])
array([  7.5,  10.5])
}}}

Disabling the preprocessor is also achievable in code by {{{preparse(False)}}}. One may start IPython alone from the command line ("sage -ipython") which does not pre-load anything Sage-specific; or switching the Notebook language to "python".

=== How do I save an object so I don't have to compute it each time I open a worksheet? ===
The {{{save}}} and {{{load}}} commands will save and load an object, respectively.  In the notebook, the {{{DATA}}} variable is the location of the data storage area of the worksheet.  To save the object {{{my_stuff}}} in a worksheet, you could do {{{save(my_stuff, DATA+"my_stuff")}}} and to reload it, you would just do {{{my_stuff = load(DATA+"my_stuff")}}}



=== I get an error from jsMath or the math symbols don't look right when displaying in the notebook ===
If you see the error "It looks like jsMath failed to set up properly (error code -7).  I
will try to keep going, but it could get ugly.", you haven't installed the TeX fonts which help jsMath render beautiful mathematics.  To get the nice TeX 
display with jsMath, please download a set of fonts from here:

[[http://www.math.union.edu/~dpvc/jsMath/download/jsMath-fonts.html]]

If you are on Linux/Unix, ignore the instructions on the page and just unzip 
the fonts into your ~/.fonts directory. You can also install the "jsmath-fonts" package.

== Getting help ==
=== How do I get help? ===
Sage has two very active email lists: http://groups.google.com/group/sage-devel and http://groups.google.com/group/sage-support. There are also two very active IRC channels: #sage-devel and #sage-support on freenode.  Many developers also actively blog and also post other Sage-related tutorials and talks.  See http://www.sagemath.org/help.html for a listing of these resources.

== Other questions ==
----------
 * QUESTION: I downloaded a Sage binary and it crashes on startup with `Illegal instruction`. What can I do?
 
 * ANSWER: Short answer: One way to fix this is to build Sage entirely from source. Another option is to fix your Sage installation by rebuilding MPIR and ATLAS by typing the following in the root of your Sage installation directory and wait about 15-20 minutes:
 {{{
rm spkg/installed/mpir* spkg/installed/atlas*
make
 }}}
 More explanation: The binaries have been built for a newer architecture than what you have.  Nobody has yet figured out how to build Sage in such a way that MPIR and ATLAS work on all hardware.  This will eventually get fixed. 
----------
 * QUESTION: I created the file {{{SAGE_ROOT/devel/sage/sage/calculus/stokes.py}}}, and have changed my mind and want to completely delete it from Sage, but it keeps coming back (i.e. it is still importable) when I type {{{sage -br}}}.  What do I do?
 * ANSWER: Delete both {{{SAGE_ROOT/devel/sage/build/sage/calculus/stokes.py}}} '''and''' {{{SAGE_ROOT/devel/sage/build/lib.*/sage/calculus/stokes.py}}}.
----------
 * QUESTION: Does sage contain a function similar to Mathematica's ToCharacterCode[]? That is, I'd like to covert something like "Big Mac" to ascii numerals for further processing. Thanks
 * ANSWER: Yes, use {{{ord}}}, e.g., {{{map(ord,'abcde')}}} outputs {{{[97, 98, 99, 100, 101]}}}.
----------
 * QUESTION: Is there anything so Sage can be made to automatically execute commands on startup?
 * ANSWER: Yes, just make a file {{{$HOME/.sage/init.sage}}} and it will be executed any time you start sage.
----------
 * QUESTION: My Sage upgrade failed with missing gmp symbols on OSX 10.4. What can I do?
 * ANSWER: Moving a sage install on OSX 10.4 and then upgrading anything that is linked against NTL leads to link errors due to missing gmp symbols. The problem is the link mode with which the dynamic NTL is created. I have a fix, but I am currently verifying that it really fixes the issue. Everything that is linked against NTL needs to be recompiled, i.e. singular and cremona at the moment. To add to the confusion: This is not an issue on OSX 10.5. A fix for this issue went into 2.8.15, so please report if you see this with a more current Sage release.
----------
 * QUESTION: When I compile Sage my computer beeps and shuts down or hangs.
 * ANSWER 1: Compiling Sage is quite taxing on the CPU. The above behavior usually indicates that your computer has overheated. In many cases this can be fixed by cleaning the CPU fan and assuring proper ventilation of the system. Please ask your system administrator or a professional to do this in case you have never done this since you can potentially damage your system.
 * ANSWER 2: For Linux users, if you suspect that the compilation fails because of a resource issue, a fix might be to edit your /etc/inittab so that Linux boots into run level 3. The file /etc/inittab usually contains something similar to the following snippet:
 {{{
#   0 - halt (Do NOT set initdefault to this)
#   1 - Single user mode
#   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
#   3 - Full multiuser mode
#   4 - unused
#   5 - X11
#   6 - reboot (Do NOT set initdefault to this)
#
id:5:initdefault:
}}}
 which directs your Linux distribution to boot into a graphical login screen. Comment out the line "id:5:initdefault:" and add the line "id:3:initdefault:", so that you now have something like:
 {{{
#   0 - halt (Do NOT set initdefault to this)
#   1 - Single user mode
#   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
#   3 - Full multiuser mode
#   4 - unused
#   5 - X11
#   6 - reboot (Do NOT set initdefault to this)
#
# id:5:initdefault:
id:3:initdefault:
}}}
 Now if you reboot your system, you'll be greeted with a text based login screen. This allows you to log into your system with a text based session from within a virtual terminal, which doesn't consume as much system resources as would be the case with a graphical session. Then build your Sage source distribution from within your text based session.
----------
 * QUESTION: When I run doctests on OSX I see the following messages, but in the end Sage reports that everything went fine:
 {{{
sage -t  devel/sage-main/sage/libs/pari/gen.pyx
python(4563) malloc: *** vm_allocate(size=4096000000) failed (error code=3)
python(4563) malloc: *** error: can't allocate region
python(4563) malloc: *** set a breakpoint in szone_error to debug
}}}
 * ANSWER: The issue above isn't a doctest failure, it is an error message printed by the system and it is exactly what one expects to see -- in that particular doctest, we try to allocate a very large list in Pari that doesn't fit into physical memory (it is at least 100GB in size). So OSX tells you that it couldn't allocate a chunk of memory roughly 4 GB in size, which is expected, since Sage is still a 32 bit application on OSX.
----------
 * QUESTION: Sage 2.9 and higher fails compiling ATLAS on Linux. How can I fix this?
 * ANSWER: The most likely cause is enabled power management. Disabling it should fix the problem. Depending on your flavor of distribution, this might either be possible with some nice GUI tool or not. On the command line do the following as {{{root}}} for each CPU you have: {{{/usr/bin/cpufreq-selector -g performance -c #number CPU}}}. On Ubuntu try disabling "Power Manager" via "System --> Preferences --> Sessions" under the "Startup Programs" or using {{{cpufreq-set}}} via command line.
----------
 * QUESTION: Sage fails with the error message {{{restore segment prot after reloc: Permission denied}}}. What is wrong?
 * ANSWER: The problem is related to SELinux: http://www.ittvis.com/services/techtip.asp?ttid=3092. We are currently tracking this issue at http://www.sagetrac.org/sage_trac/ticket/480.
----------
 * QUESTION: When I start Sage, SELinux complains that '/path/to/libpari-gmp.so.2' requires text-relocation.  How can I fix it?
 * ANSWER: The problem can be fixed by running the following command "chcon -t textrel_shlib_t /path/to/libpari-gmp.so.2"
----------
 * QUESTION: Upgrading Sage went fine, but now the banner still shows the old version. How can I fix this?
 * ANSWER: Try doing {{{sage: hg_scripts.merge()}}} followed by {{{sage: hg_scripts.commit()}}}. As an alternative, you can simply try {{{hg_scripts.pull()}}}.
----------
 * QUESTION: How do I run sage in daemon mode, i.e. as a service?
 * ANSWER: We currently do not have a ready-to-go solution. There are several possibilities: Use screen, nohup or disown. We are tracking the issue at http://www.sagetrac.org/sage_trac/ticket/381 - so stay tuned.
----------
 * QUESTION: I just downloaded version 2.8.15 for Mac OSX and tried to run notebook() and dyld is unable to load libintl.3.dylib.  I don't have a libintl.3.dylib in {{{usr/local/lib}}} and I didn't find it in {{{$SAGE_ROOT/local/lib}}}. Is there a workaround?
 * ANSWER:  Yes, put the libintl3.dylib from http://sagemath.org/SAGEbin/apple_osx/intel/10.4-extra_files/ {{{in SAGE_ROOT/local/lib/}}}. Sage 2.8.15 and later contain a copy of the library, so please let us know if you experience the problem with any later release.
----------
 * QUESTION: I am using Mac OSX. Where do I put the jsMath "font" directory to eliminate the red box?
 * ANSWER: See http://www.math.union.edu/~dpvc/jsMath/download/jsMath-fonts.html where it says "For Mac OS X users: download and unpack the archive, then drag the fonts to your Library/Fonts folder (or to the FontBook, or just double-click them and press the "install" button).".
----------
 * QUESTION: The show command for plotting 3D objects does not work.
 * ANSWER 1: Since Sage 2.9.2 we have switched to using jmol, a Java applet, for 3D plotting. There are several possibilities for the cause of the malfunction: You do not have Java installed at all or the Java installed is an older GNU based alternative Java implementation, which causes some yet to determine problem. A solution to both issues is to either install Sun's Java SDK or to update the GNU based Java implementation. As of January 2008 Debian's Java in testing works, but stable does have problems.
 * ANSWER 2: If you are running a brand new (as of April 2008) Ubuntu 8.04, they ship the Java Plugin by IcedTea. This is basically a good idea, but a bit too early since it is broken. Either wait for an update or uninstall the IcedTea Plugin and install the "SUN Java 6 Plugin". Later, switch back to IcedTea, since it is based on OpenJDK 7 (or SUNs Java 7) which is the next Java version. You can check for the used plugin in Firefox 3 by typing "about:plugins" into the URL bar. [[https://bugs.launchpad.net/ubuntu/+source/icedtea-java7/|read more here at launchpad]]
----------
 * QUESTION: May I use Sage tools in a commercial environment?
 * ANSWER: YES!  Absolutely!  Basically the *only* constraint is that if you make changes to Sage itself and redistribute this changed version of Sage publicly, then you must make these changes available to us so that we can put them into the standard version of Sage (if we want).   Otherwise, you are free to use as many copies of Sage as you want completely for free to make money, etc., without paying any license fees at all.
----------
 * QUESTION: I want to write some Cython code that uses finite field arithmetic but {{{cimport sage.rings.finite_field_givaro}}} fails. What can I do?
 * ANSWER: You need to give hints to Sage so that it uses C++ (both Givaro and NTL are C++ libraries), and it also needs the GMP and STDC C++ libraries. Here is a small example:
 {{{#!python numbers=off
# These comments are hints to Sage/Pyrex about the compiler and
# libraries needed for the Givaro library:
#
#clang c++
#clib givaro gmpxx gmp m stdc++
cimport sage.rings.finite_field_givaro
# Construct a finite field of order 11.
cdef sage.rings.finite_field_givaro.FiniteField_givaro K
K = sage.rings.finite_field_givaro.FiniteField_givaro(11)
print "K is a", type(K)
print "K cardinality =", K.cardinality()
# Construct two values in the field:
cdef sage.rings.finite_field_givaro.FiniteField_givaroElement x
cdef sage.rings.finite_field_givaro.FiniteField_givaroElement y
x = K(3)
y = K(6)
print "x is a", type(x)
print "x =", x
print "y =", y
print "x has multiplicative order =", x.multiplicative_order()
print "y has multiplicative order =", y.multiplicative_order()
print "x*y =", x*y
# Show that x behaves like a finite field element:
for i in range(1, x.multiplicative_order() + 1):
    print i, x**i
assert x*(1/x) == K.one_element()
}}}
 To find out more, type {{{sage.rings.finite_field_givaro.FiniteField_givaro.}}} at the Sage prompt and hit tab, then use ?? to get more information on each function. For example: {{{sage.rings.finite_field_givaro.FiniteField_givaro.one_element??}}} tells you more about the multiplicative unit element in the finite field.
----------
 * QUESTION: How do I make the VMware appliance for Windows automatically login as "sage"?
 * ANSWER: Follow http://ubuntu-utah.ubuntuforums.org/showthread.php?t=303319.  Short version: put in the file {{{/usr/bin/autologin}}} the text
 {{{
#! /bin/sh
/bin/login -f sage
}}}
 and make this file executable; then edit {{{/etc/event.d/tty1}}}, comment out
 {{{
respawn /sbin/getty 38400 tty1
}}}
 and add
 {{{
respawn /sbin/getty -n -1 /usr/bin/autologin 38400 tty1
}}}
 Now every time the appliance reboots, it will automatically load directly to the sage: prompt.  Warning: This will make it nearly impossible to get a terminal prompt!  So only do this if you don't plan on any further management.

If you do need to escape to a shell, you can run the following from inside sage (untested):
{{{#!python numbers=none
import os
os.execp('sh')
}}}
then use "sudo -s" to get a root shell.
----------
 * QUESTION: When running Sage under VMware, if you log in under manage you are not given the permissions to create a file!
 * ANSWER: Type "sudo su" before creating files.
----------
 * QUESTION: I'm getting weird build failures on OSX. How do I fix this?
 * ANSWER: Search the build log (install.log) to see if you're getting "fork: Resource temporarily unavailable.". If so, try the following. Create (or edit) /etc/launchd.conf and include the following:
 {{{
limit maxproc 512 2048
}}}
 . then reboot.  See [[http://www.macosxhints.com/article.php?story=20050709233920660|this page]] for more details.
----------
 * QUESTION: How do I use the bitwise XOR operator in Sage?
 * ANSWER: Define two variables, for example {{{a = 5; b = 8}}}, and evaluate {{{a.__xor__(b)}}}, 13. You can also do {{{(5).__xor__(8)}}} (the parentheses are necessary so that Sage doesn't think you have a real number). There are several ways to define a function: {{{xor = lambda x, y: x.__xor__(y)}}} and then do {{{xor(3, 8)}}}. Another option, which sneaks around the Sage preparser, is {{{def xor(a,b):  return eval("%s^%s"%(a,b))}}}. You can also turn off the Sage preparser with {{{preparser(False)}}} -- then {{{^}}} will work just like in Python, and you can later turn on the preparser with {{{preparser(True)}}}. (That only works in command-line Sage; in a notebook, switch to Python mode.)
----------
 * QUESTION: When I try to use LaTeX in the notebook, it says it cannot find {{{fullpage.sty}}}!
 * ANSWER: That's not a question. But we can help you solve your problem. :) The general -- but perhaps not very helpful -- answer is that you need to install {{{fullpage.sty}}} into a directory searched by TeX. In Ubuntu (and probably many other Linux distributions), you should install the {{{texlive-latex-extra}}} package. If that's not available, try installing the {{{tetex-extra}}} package. If you are using OS X, you will have to use whatever TeX distribution you use to get {{{fullpage.sty}}} (if you use [[http://www.tug.org/mactex|MacTeX]], it's likely already installed). If you are using the VMware image in Windows, you'll need to log into the VMware image and install {{{texlive-latex-extra}}} there.
----------
 * QUESTION: With objects {{{a}}} and {{{b}}} and a function {{{f}}}, I accidentally typed {{{f(a) = b}}} instead of {{{f(a) == b}}}.  This returned a {{{TypeError}}} (as expected), but also deleted the object {{{a}}}.  Why?
 * ANSWER: It's because of how functions are  defined in Sage using the {{{f(x) = expr}}} notation using the preparser.  Also notice that if you make this mistake inside of an {{{if}}} statement, you will get a {{{SyntaxError}}} before anything else goes wrong, so in this case, there is no problem.

= ToDo =
 * QUESTION: Sage fails to compile on OSX 10.4
 * ANSWER: Most likely resource issue.
 * QUESTION: Notebook doesn't work
 * ANSWER: networking issues, firewall blocking, proxy setting screwed up
 * Individual FAQ entries should be referable by a URL, possibly http://wiki.sagemath.org/faq?someid=something
 * You can do that with page anchors: http://wiki.sagemath.org/faq?#something. Moin``Moin [[http://moinmo.in/HelpOnLinking|can insert page anchors]] but it doesn't seem like that facility is turned on for this installation. If we could get that enabled, we could insert anchors for all the questions on this page.
