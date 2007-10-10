= Sage Days 5 Schedule =

The times are as follows, unless otherwise stated below. 
{{{
MORNING TALK 1 (9:15 - 10:15)
MORNING TALK 2 (10:30 - 11:30)
AFTERNOON TALK (1-2pm)
DINNER (5-7pm)
EVENING REPORTS (7-8pm)
EVENING WORKING SESSION (8pm-?)
}}} 

== SATURDAY ==
7pm -- Dinner at [http://www.penangusa.com/location_cambridge_menu_dinein.html Penang] in Harvard Square; 57 JFK Street, Harvard Square, Cambridge, MA 02138. We would like to make a reservation; please let William know if you plan to attend.

== SUNDAY ==

MORNING TALK 1 (9:15-10:15)
{{{
Speaker: William Stein
Title: Computations Related to the Birch and Swinnerton-Dyer Conjecture using Sage
}}}
[http://wstein.org/talks/20070930-stein-bsd/ Slides]
[http://video.google.com/videoplay?docid=7984448761799110577&hl=en Google Video]

MORNING TALK 2 (10:30-11:30)
{{{
Speaker: David Roe
Title: p-adic Arithmetic in SAGE
}}}
Abstract: I will outline the current status of $p$-adic arithmetic in Sage.  In particular, I will discuss the different types of $p$-adics in Sage, extensions of $\mathbf Q_p$, polynomials and matrices over such local fields and their rings of integers.  I will outline a number of algorithms for treating precision in polynomial and matrix computations.  Come with comments on what aspects of $p$-adic arithmetic are most needed for your own projects.

[http://wiki.sagemath.org/days5/sched?action=AttachFile&do=view&target=padic_arith.pdf Slides]
[http://video.google.com/videoplay?docid=-8817702470712955205&hl=en Google Video part 1 (of 2)]
[http://video.google.com/videoplay?docid=-7834241264390846749&hl=en Google Video part 2 (of 2)]

AFTERNOON TALK (1-2)
{{{
Speaker: Fernando Rodriguez-Villegas
Title: Identities between p-adic multi-polylogs and p-adic zeta values
}}}
Abstract: This is a talk about some work in progress which involves identities between $p$-adic multipolylogs and $p$-adic zeta values. Some I can (almost) prove others I can't and I find pretty surprising. Mostly I'd like to have some feedback on it. It wouldn't really be that computational except for the issue of how to compute linear relations among constants in the $p$-adics (but the again may be this is well known--to others). 

[http://video.google.com/videoplay?docid=-5758635886902061837&hl=en Google Video]

ORGANIZATIONAL MEETING 2:30 - 3:30:

After a 30-minute ''Overall Sage Status Report'' by William stein, we will  discuss the plan for working groups for the remainder of the workshop.


EVENING REPORTS (7-8)

{{{
Speaker: Craig Citro
Title: Modular forms in SAGE: A status report
}}}
Abstract: I'll give a short overview of the state of affairs of modular forms in SAGE. Mostly, I'll detail what we can do, what MAGMA can do that we can't, and some speed comparisons. 

[http://video.google.com/videoplay?docid=2930757134671857575&hl=en Google Video]

{{{
Speaker: Martin Albrecht
Title: Commutative Algebra and Sparse Linear Algebra in SAGE (Singular, PolyBoRi)
}}}
Abstract: I will cover libSINGULAR (with some examples, to show that the code isn't as scary as people believe), a bit of PolyBoRi, maybe something about CoCoALib, some benchmarks, and stuff we desperately need and don't know how to get. Obviously, I would throw in some benchmarks and stuff.  Actually, I would like to add some (unrelated) slides on the state of sparse linear algebra over finite fields. That would cover what package can do it (not many!) and how SAGE is in that area (surprisingly good it seems for now) and what is done to improve it. Also, someone in the audience might have some input on William's echelon via solve idea adapted to this setting.

[attachment:20071003_-_commutative_algebra.pdf] [http://video.google.com/videoplay?docid=156475786677736141&hl=en Google Video]

EVENING WORKING SESSION (8pm-?)
   

== MONDAY ==

MORNING TALK 1
{{{
Speaker: Amnon Besser
Title: On the Computation of p-adic Height Pairings on Jacobians of Hyperelliptic Curves
}}}
Abstract: The talk will present an algorithm for the computation of $p$-adic height pairings on hyperelliptic curves over number fields. Our work
is not directly related to the work of Mazur Stein and Tate, though there are some similarities in the difficulties that occur and in the
use of Kedlaya's algorithm. I will first explain where this height pairing arise, and how it decomposes into a sum of local terms at the
places of the field. The most interesting is for places above the prime $p$. We use a description of these local terms given by Coleman
and Gross that uses the theory of Coleman integration. There are two parts for the computation at these primes. One computes a certain
projection from the space of meromorphic forms on the curve to its first de Rham cohomology, which can be computed using Coleman
integration and the theory of the so called double index. The second involves computation of Coleman integrals, which are however mroe
general than the ones computed in recent work on the subject (Gutnik, Kedlaya, ...) so there are some tricks involved which I'll explain. Finally I will discuss the situation at other primes, where there are still some delicate issues to resolve.

[attachment:besser.pdf] [http://video.google.com/videoplay?docid=1477916588819702201&hl=en Google Video]

MORNING TALK 2
{{{
Speaker: Robert Bradshaw & Kiran Kedlaya
Title: Coleman integration
}}}
Abstract: We will discuss the theory of Coleman integration (as referenced in the previous talk), describe an algorithm for computing some Coleman integrals on hyperelliptic curves, and discuss (and perhaps demonstrate) how this is implemented in SAGE. Besides the application to computing p-adic heights, there are also potential applications to finding torsion and rational points on curves over number fields (also due to Coleman); we will say a bit about these too.

[attachment:coleman.pdf] [http://video.google.com/videoplay?docid=7414272363294014907&hl=en Google Video]

AFTERNOON TALKS
{{{
Speaker: Mark Watkins
Title: SYMPOW
}}}
Abstract: We discuss the SYMPOW package to compute special values of symmetric powers of elliptic curve $L$-functions.
[http://video.google.com/videoplay?docid=7753480221612447282&hl=en Google Video]

{{{
Speaker: William Stein
Title: Algebraic Number Theory in SAGE, a Status Report
}}}
[attachment:stein-ant.pdf] [http://video.google.com/videoplay?docid=3470453209835871513&hl=en Google Video]

EVENING REPORTS
{{{
Speaker: Bill Hart
Title: A short talk on short division : FLINT (Fast Library for Number Theory) a status report by Bill Hart.
}}}
Abstract: FLINT is a C library, in the very early stages of development, which has the aim of extending the state of the art in core arithmetic computations and eventually algebraic number theory.  We will briefly discuss progress that has been made so far in polynomial and integer arithmetic, including a new variant/implementation of Mulder's recursive polynomial "short division" algorithm which we have worked up for doing faster polynomial division.

[http://video.google.com/videoplay?docid=-5481874090998683168&hl=en Google Video]


{{{
Speaker: Michael Abshoff
Title: Valgrind Tutorial
}}}
http://video.google.com/videoplay?docid=-2913379305263249139&hl=en Google Video]

{{{
Speaker: Michael Abshoff
Title: Managing the SAGE development workflow
}}}

http://sage.math.washington.edu/home/mabshoff/trac-talk-2007-10-01.tar.gz [http://video.google.com/videoplay?docid=-8784589193845902962&hl=en Google Video]

EVENING WORKING SESSION (8pm-?)
   

== TUESDAY ==

MORNING TALK 1
{{{
Speaker: Gonzalo Tornaria
Title: Stark-Heegner points and the Shimura correspondence
}}}
[http://video.google.com/videoplay?docid=1078890468756181537&hl=en Google Video (part 1 of 2)] [http://video.google.com/videoplay?docid=1514873828205448855 Google Video (part 2 of 2)]


MORNING TALK 2
{{{
Speaker: Dimitar Jetchev
Title: Computing Heegner points
}}}

[attachment:jetchev.pdf]

AFTERNOON TALK
{{{
Speaker: Michael Abshoff
Title: [Ap]CoCoALib
}}}

EVENING REPORTS
{{{
Speaker: Robert Bradshaw
Title: Cython status report
}}}

attachment:cython-status-07.pdf [http://video.google.com/videoplay?docid=8155731528590036456&hl=en Google Video]

{{{
Speaker: Robert Bradshaw
Title: Coercion Status Report
}}}
Abstract: In this controversial report, I will describe the "right" way to discover coercion and explain why the idea of using extending baserings is wrong.

attachment:coercion.pdf [http://video.google.com/videoplay?docid=6579542972326274959&hl=en Google Video (part 1)] [http://video.google.com/videoplay?docid=7943196399220997534&hl=en Google Video (part 2)]


EVENING WORKING SESSION (8pm-?)

== WEDNESDAY ==

MORNING TALK 1 (at Harvard, 9:00-10:00)

{{{
Speaker: J-P. Serre
Location: Science Center 507
Title: Finite Groups in Number Theory (part 3)
}}}

MORNING TALK 2

{{{
Speaker: William Stein
Title: On convergence in the Sato-Tate conjecture
}}}
Abstract: This is a talk on convergence in the Sato-Tate conjecture, in particular, it is an application of Sage to studying how quickly convergence happens in the Sato-Tate conjecture; this in fact leads to a new conjecture and new questions.  This is joint work with Barry Mazur. 

[attachment:stein-sato-tate.pdf]

AFTERNOON
{{{
Speaker: Moderator
Project Wrap-up
}}}
[http://video.google.com/videoplay?docid=1589461731048191073&hl=en Google Video of the Final Status Reports]

NUMBER THEORY SEMINAR (at Harvard, 3:00-4:00)
{{{
Title: Ranks of Elliptic Curves
Speaker: Mark Watkins
Location: Science Center 507 (Harvard)
}}}

EVENING WORKING SESSION:
{{{
   Informal working and coding session for people still around (e.g., William Stein, David Roe, etc.)
}}}
