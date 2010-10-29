= Sage Days 6 Coding Sprints =

== Wrap-Up ==
 *  Benchmarking (was, malb, wjp)
   * developed a file format for benchmarks
   * wrote code which parses, runs, generates plots for these
   * going to be in the 2.9 release
   * might form the basis for new benchmarking document in the spirit of the constructions document

 * Cython Syntax Highlighting (robertwb)
   * visualization to show how good your Cython code is
   * HTML output

 * Wrapping g0n (jec)
   * g0n is optional package now
   * first wrapper written
   * memleaks fixed in g0n

 * Rewrapping Simon's Ell GP Scripts (robertwb, jec)
   * much simpler now because Simon updated code

 * Flint (Bill Hart)
   * many bugs fixed

 * Coercion (robertwb, roed, ...)
   * some beta available, other's can start working with it

 * Programming Guide
   * see [[days6/sprint/prog_guide| new plan]]

 * FFT Improvements for NTL (dmharvey)
   * much faster on Opterons
   * not so much faster on Core2Duo (~ 20%)
   * available on [[http://www.math.harvard.edu/~dmharvey/code/ntl-fft/index.html|David's website]]
   * automatic tuning required, not ready for inclusion

 * Sympy & SAGE (Ondrej)
   * mixing SAGE/SymPy expressions
  
 * Debian package of Cython (Ondrej)
   * preliminary package available

 * Matrix Permanents (Jaap)
   * hope to achieve 30 - 50% speed-up for permanents

 * Gröbner Basis Update (malb)
   * generic implementation for Gröbner bases over any field (slow!!)
   * implementation for Gröbner bases over ZZ (slow!!)

 * Doctest Benchmark (wjp)
   * timings of all doctests
   * basic comparison possible eg. 2.8.12 vs. 2.8.13

 * PolyBoRi (Michael, Burcin)
   * Python Interface of PolyBoRi reimplemented in Cython
   * new wrapper can run most testcases
   * PolyBoRi release next weekend

== Projects ==
 * elliptic curves (John, rpw, was)
  * getting g0n into Sage
  * sparse linear algebra over $F_q$
  * $\#E(F_q)$

 * multivariate polynomial quotient rings (Burcin, malb, Ludovic, Michael Brickenstein)
  * generic polynomial division/reduction
  * quotient rings via libSINGULAR
  * PolyBoRi integration
  * FGB integration

 * coercion model/calculus/programming manual (robertwb, roed, John Hanke, Ondrey, David Loeffler, Jaap)

 * [[days6/sprint/packages|packages/updates/LinBox]] (cpernet, mabshoff)
  * LinBox bugfixes and updates
  * Givaro
  * IML

 * benchmarking (robertwb, Willem)
  * doctest benchmarking interface


== Originally Proposed Projects ==

 * (wstein and ondrej certik) [[/debian| determine exactly which sage packages are in debian]]

 * (robertwb, roed, willem, jaap, jon hanke, david loeffler, ondrej) [[/prog_guide| Programming Guide]]

 * (robertwb, roed, willem, jaap, jon hanke, david loeffler, ondrej) [[/coercion| Coercion]]

 * (robertwb, roed, willem, jaap, jon hanke, david loeffler, ondrej) [[/calculus| Calculus]]

 * (wstein) upgrade the freetype package in sage.

 * (wstein) upgrade the cvxopt package to 0.9

 * (wstein) Number fields -- Reduction modulo a prime ideal, or any ideal.

 * (wstein) Number fields -- optimize K([1,2,3,4,5]), etc., for K number field or order.

 * (wstein) Timing of doctests (partially done)

 * (wstein) Double question mark for spyx files doesn't work.; docstrings work.

 * (wstein) Markup Cython code based on what C code it generates.

 * (wstein) R Python expect interface

 * (wstein) [[/edwards| Redo all the "edwards coord" proofs in Sage instead of Magma.]]  

 * (wstein) ATLAS into Sage on Linux.

 * (wstein) Linbox -- get rid of all the crappy hacks for minpoly/charpoly use in Sage.

 * (wstein) Linbox -- fix wrapping of smith_form problems in Sage.

 * (wstein) Create pickle database

 * (wstein) Document number fields.

 * (wstein) Compute kernels of matrices over $\mathbf{Z}/p^n\mathbf{Z}$.

 * (Ondrej Certik) simplify/improve calculus in SAGE [[/calculus| see this link for more info]]

 * (mabshoff) fix BlasMatrix::Hom leak in LinBox

 * (mabshoff) start of 2.8.13 release cycle

 * (david harvey) try to improve cache efficiency of NTL's FFT routine

 *(Bill Allombert) improve PARI ECM implementation

 * (john.cremona) adapt interface to new Simon gp scripts

 * (john.cremona) elliptic curve isomorphisms, urst transforms of curves and points

 * (john.cremona) improved $\#E(F_q^d)$ for elliptic curves defined over $F_q$

 * (malb) speed up $GF(p^n)$ for $p \neq 2$ and $p^n \geq 2^{16}$ (using NTL::ZZ_pE and NTL::zz_pE)

 * (malb) implement quotient rings over multivariate polynomial rings over finite fields using libSINGULAR

 * (malb) implement multivariate polynomial rings over number fields using libSINGULAR

 * --((malb) implement sparse matrices over $GF(p^n)$ (using Givaro) modelled after sparse matrices modint.)--

 * (weinmann) related to malb's point directly above: merge smatlib code into SAGE.

 * (weinmann) extend MPolynomialSystemGenerator such that equation systems for (stream and block) ciphers can be generated in a generic way.
