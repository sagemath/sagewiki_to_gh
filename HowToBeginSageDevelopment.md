== How to Begin Sage Development ==

This is a quick guide for developers who want to contribute to Sage. It is intended especially for newbie programmers.

First, Sage's main language is [[http://www.python.org|Python]]. Some parts of Sage can be written in other languages, especially the [[http://www.sagemath.org/links-components.html|components]] that do the heavy number crunching, but most native functionality is done in Python, including "glue code".

One of the good aspects of Python that Sage inherits is that working code is considered more valuable than just fast code. Sure, fast code is good, but clean, readable code is important, and as anything math-related, inaccurate results are unacceptable. Correctness comes before optimization.

If you don't know Python, you should start there, since it is Sage's main language. A good place to start is the [[http://docs.python.org/tutorial/|Python Official Tutorial]] and other documents available at http://python.org/doc/ . Another good place to take a look at is [[http://www.diveintopython.org/|Dive Into Python]], which may be pretty helpful in some specific topics like test-driven development.

In the meantime, you can grab your copy of the [[http://www.sagemath.org/download-source.html|sage source]] and get used to [[http://www.selenic.com/mercurial/wiki/|mercurial]]. The [[http://hgbook.red-bean.com/hgbook.html|mercurial book]] is recommended for those who aren't used to that version control system (and to some extent to those who never used such a system).

Once you are comfortable with Python itself (which is pretty fast for basics) you can start using Sage. If you want, you can try to learn Python by using Sage, but that isn't recommended because it's helpful to know what is pure Python and what is Sage doing its "magic". There are many things that work on one that don't on the other, because Sage does a lot of type conversions behind the scenes.

Then take a look at the [[http://www.sagemath.org/doc/prog/prog.html|official development guide]] for Sage. After that, you can take a look at the [[http://wiki.sagemath.org/TracGuidelines|trac guidelines]] which details some aspects of Sage development and how to get a Trac account. You can also join the [[http://groups.google.com/group/sage-devel|sage-devel]] list at Google Groups and hang around the #sage-devel IRC channel on [[http://freenode.net/|Freenode]]. Getting an account in this wiki can be helpful too.

Then, you can choose to grab a ticket from the [[http://trac.sagemath.org/sage_trac|trac server]] to solve or you may want to implement some feature you have in mind. If you want to implement something, it's good practice to include a ticket and/or discuss in the group first, so that the gurus can give their opinion (and it's nice to listen to them, since they know Sage's internals much better and may give some advice). They are pretty open to new ideas, too, like all mathematicians should be :)
