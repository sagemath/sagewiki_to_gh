=== People ===

Sebastian Pauli, Brian Sinclair, Maurizio Monge, David Roe, Xavier Caruso

=== Description ===

Implement a native Sage algorithm for local field polynomial factorization. For more detail, see [[http://wiki.sagemath.org/padics/PolynomialFactoring]].

=== Current Progress ===

A functioning version of the algorithm is up: See [[http://trac.sagemath.org/sage_trac/ticket/12561|#12561]].

Initial doctests show that some examples are incorrectly returned as irreducible.

=== A question ===

Given a polynomial P, can we derive from this algorithm a way to compute the graph (embedded in the Berkovich line) whose edges are the roots of P?
