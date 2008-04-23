= Sage 3.0 Release Tour =
Sage 3.0 was released on April 21st, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see [http://sagemath.org/announce/sage-3.0.txt sage-3.0.txt].

== Random Numbers ==

Sage has a new random number framwork (by Carl Witty) with a global random number state, so that results using pseudo-random numbers can be reproducible.  Randomized doctests are now actually tested, instead of having their results ignored.  Use {{{set_random_seed(n)}}} to set a new random number seed, and {{{initial_seed()}}} to find the most recently set seed (or the seed set at Sage startup, if no new seed has been set).  For much more information on the new random number framework, type {{{sage.misc.randstate?}}}.

== GCC 4.3 Support ==

Sage 3.0 has full GCC 4.3 support, which means that every included package was fixed to compile with GCC 4.3 and the changes were pushed upstream.

== Boolean Polynomials ==

The PolyBoRi library was updated to version 0.3.1 leading to greater stability and better performance. The interface to PolyBoRi was also improved and the documentation updated. Also the conversion to/from PolyBoRi, Singular and Magma was greatly improved.

=== Example Usage ===

{{{#!python
sage: sr = mq.SR(1,1,1,4,gf2=True) # create a small scale AES system
sage: F,s = sr.polynomial_system()
sage: P = F.ring() # polynomial ring
sage: B = BooleanPolynomialRing(P.ngens(),P.variable_names(),order='lex') # quotient ring
sage: IB = Ideal([B(f) for f in F]) # create ideal
sage: IM = IB._magma_() # convert to Magma
sage: IS = IB._singular_() # convert to Singular
sage: gb = IS.groebner() 
sage: P.change_ring(order='lex') == B.cover_ring()
True
}}}


== Modular Abelian Varieties ==


== Increased Doctest Coverage ==

We dramatically increased our automated testing and example suite so that 51.5 % of functions have autotested examples. There are now nearly 60,000 lines of input examples. In February our testing was in the 30% range. This was a huge amount of work by many many Sage developers, and it has the practical impact that when you type foo? it is nearly twice as likely that you'll see a helpful example.

== R Pexpect Interface ==

There is now a new interface to R that uses a pseudotty; this is a completely different alternative to rpy, which makes it possible for the web-based Sage notebook to work as an R GUI, and also makes it so any R command can be used from Sage 100% exactly as in R. It is still clunky and has numerous issues, but it is fairly usable, documented, and has a test suite.

== Crystals ==

FIXME

== Lautent Polynomials ==

FIXME
