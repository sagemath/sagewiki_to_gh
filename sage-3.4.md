= Sage 3.4 Release Tour =

Sage 3.4 was released on FIXME. For the official, comprehensive release note, please refer to [[http://www.sagemath.org/src/announce/sage-3.4.txt|sage-3.4.txt]]. The following points are some of the foci of this release:

 * Merging of Jon Hanke's quadratic forms code
 * Sphinxifying the Sage documentation and move its content to the main Sage development repository

All tickets in the 3.4 milestone can be found on the [[http://trac.sagemath.org/sage_trac/milestone/sage-3.4|trac server]]. Here's a summary of features in this release, categorized under various headings.

== Algebra ==

== Build ==

== Combinatorics ==

== Distribution ==

== Doctest ==

== Documentation ==


== Graphics ==


 * Arrowheads in multi-edge digraphs (Emily Kirkman) -- This feature has been in Sage even before this release. However, in version 3.4, Emily worked on enhancing the visualization of multi-edge digraphs. In a multi-edge digraph, the arrowheads pointing to a vertex are now clearly displayed. Here's [[attachment:a plot]] of a multi-edge digraph, produced using the following code:
 {{{
sage: S = SupersingularModule(389)
sage: D = DiGraph(S.hecke_matrix(2))
sage: D.plot(vertex_size=50).show(figsize=10)
 }}}


== Linear Algebra ==


 * Optimize transpose and antitranspose for dense matrices (Rob Beezer, Yann Laigle-Chapuy) -- A rewrite of sections of the method {{{transpose()}}} in the class {{{sage.matrix.matrix_dense.Matrix_dense}}}, resulting in an improvement of up to 5x, depending on the computer architecture. For a system with architecture
 {{{
CPU: Intel(R) Core(TM)2 Duo CPU T5450  @ 1.66GHz
RAM: 2066004 KB
Linux kernel: 2.6.24-23
 }}}
 one would obtain the following timing and memory statistics for a 3000x3000 identity matrix:
 {{{
# BEFORE
sage: m=identity_matrix(3000)
sage: time m2=m.transpose(); m3=m.antitranspose()
CPU times: user 14.13 s, sys: 1.11 s, total: 15.44 s
Wall time: 15.44 s
sage: get_memory_usage()
1254.28125

# AFTER
sage: m=identity_matrix(3000)
sage: time m2=m.transpose(); m3=m.antitranspose()
CPU times: user 2.92 s, sys: 0.46 s, total: 3.38 s
Wall time: 3.38 s
sage: get_memory_usage()
835.6171875
 }}}
 Furthermore, on KUbuntu 8.10 with architecture
 {{{
CPU: Intel(R) Core(TM)2 Duo CPU E8500 @ 3.16GHz
RAM: 8 GB
 }}}
 for a 5000x5000 identity matrix, the previous time was 11.94s and the new improved time would be about 2.46s.


 * Optimize transpose for integer and rational dense matrices (Yann Laigle-Chapuy) -- New methods {{{transpose()}}} and {{{antitranspose()}}} for the classes {{{sage.matrix.matrix_integer_dense.Matrix_integer_dense}}} and {{{sage.matrix.matrix_rational_dense.Matrix_rational_dense}}}. The new method {{{transpose()}}} returns the transpose of an integer (respectively rational) dense matrix without changing the original matrix itself. In addition, the new method {{{antitranspose()}}} returns the antitranspose of an integer (respectively rational) matrix, leaving the original matrix unchanged.


== Miscellaneous ==

== Notebook ==

== Number Theory ==

== Numerical ==


== Packages ==


 * Update the [[http://www.gnupg.org/index.en.html|libgcrypt]] spkg to {{{libgcrypt-1.4.3.p0.spkg}}} (Michael Abshoff) -- Originally based on Gnu Privacy Guard (GnuPG), libgcrypt is a general purpose library of cryptographic primitives. As such, it does not provide an implementation of any cryptographic protocols, but rather serves as a collection of cryptographic building blocks.


 * Update the [[http://www.python.org|Python]] spkg to {{{python-2.5.2.p9.spkg}}} (Michael Abshoff) -- Python is a general purpose, object oriented programming language. Together with various other open source components, Python serves as a fundamental tool that unify the components of Sage under a common interface.


 * Upgrade [[http://www.mpfr.org|MPFR]] to version 2.4.1 upstream release (Michael Abshoff) -- Version 2.4.1 of MPFR fixes critical security vulnerabilities in {{{mpfr_snprintf()}}} and {{{mpfr_vsnprintf()}}}, in particular, [[http://cwe.mitre.org/top25/#CWE-119|buffer overflow]] or off-by-one vulnerabilities. These vulnerabilities have been reported in previous versions of MPFR, and they can be exploited to compromise an application that uses the MPFR library. Users are advised to upgrade to the new MPFR spkg {{{mpfr-2.4.1.spkg}}}. A Secunia security advisory can be found [[http://secunia.com/advisories/34063|here]] and a [[http://www.securityfocus.com/bid/33945|SecurityFocus]] security advisory is also available.


 * Upgrade [[http://pypi.python.org/pypi/pycrypto|PyCrypto]] to version 2.0.1 upstream release (Michael Abshoff) -- Version 2.0.1 fixes a buffer overflow vulnerability in the hash functions [[http://en.wikipedia.org/wiki/SHA256|SHA256]] and [[http://en.wikipedia.org/wiki/RIPEMD|RIPEMD]], which previously failed to adequately verify user-supplied input. The affected module is {{{ARC2}}}, an implementation of the [[http://en.wikipedia.org/wiki/RC2|RC2]] block cipher. A successful exploit may allow an attacker to execute arbitrary code in the context of applications that uses the previously vulnerable ARC2 module. Furthermore, a failed attempt may lead to a [[http://en.wikipedia.org/wiki/Denial-of-service_attack|denial-of-service]] attack. Users are advised to upgrade to the new PyCrypto spkg {{{pycrypto-2.0.1.p3.spkg}}}. A SecurityFocus security advisory can be found [[http://www.securityfocus.com/bid/33674/info|here]].


== Porting ==


== Quadratic Forms ==


 * Merge Jon Hanke's quadratic forms code (Gonzalo Tornaria, Michael Abshoff) -- John Hanke has written a substantial amount of Sage code for working with [[http://en.wikipedia.org/wiki/Quadratic_forms|quadratic forms]]. Hanke's code can serve as base for further enhancement to the case of binary quadratic forms, which are quadratic forms involving two variables. There are currently a number of patches on the trac server for enhancing the functionalities of binary quadratic forms.


 * [FIXME] Clifford invariant and Clifford conductor (Gonzalo Tornaria) -- New functions {{{clifford_invariant()}}} and {{{clifford_conductor()}}} for computing Clifford invariants and conductors. The Clifford invariant is the class in the [[http://en.wikipedia.org/wiki/Brauer_group|Brauer group]] of the [[http://en.wikipedia.org/wiki/Clifford_algebra|Clifford algebra]] for even dimension. The new function {{{clifford_invariant()}}} computes the Clifford invariant of the even Clifford algebra for odd dimension. The new function {{{clifford_conductor()}}} computes the Clifford conductor, i.e. the product of all primes where the Clifford invariant is -1. See the following text for the definition of the Clifford invariant and p.119 for the formula relating it to the Hasse invariant:
   * T.Y. Lam. "Introduction to Quadratic Forms over Fields". Graduate Studies in Mathematics, vol.67. American Mathematical Society, 2005.



== Solaris ==

== User Interface ==

== Website/Wiki ==
