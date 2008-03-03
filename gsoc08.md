= Google Summer of Code 2008 =

== Important Dates ==
Check http://code.google.com/soc/2008/faqs.html#0.1_timeline for important dates.

== Potential Projects ==

=== Graph Automorphism Computation; Improve Permutation Groups ===
  
This project is to improve the world's *only* open source implementation of a general
graph automorphism computation algorithm, and improve Sage's ability to compute with
permutations and permutation groups.  

 * Robert Miller, Tom Boothby
  . There are some very general permutation group questions that can be tackled in the same manner as the graph isomorphism problem, and it would be good to do these in Cython within Sage instead of farming out to GAP.
  * Polynomial problems:
   * Group order
   * Containment
   * Random group elements
   * Center of a group
   * Solvability/Nilpotency
  * Harder (many of which are graph isomorphism complete) problems:
   * Centralizers/Normalizers
   * Group intersections
   * Set stabilizers
   * Automorphism groups of combinatorial structures
   * Subgroups satisfying a certain property (given generators and a black box yes/no function, compute generators of the subgroup)
   * Upper central series
   * Conjugacy of elements
   * Testing whether two elements or subsets are in the same orbit of a group action
   * Canonical representatives of orbits under a group action
   * Transversals of orbits

=== Notebook ===

The Sage notebook is an AJAX application similar to Google Documents that provides
functionality for all mathematical software somewhat like Mathematica notebooks. 
It was written from scratch (in Javascript and Python) by the Sage development team,
and has been used daily by thousands of people over the last year.  It's one of the
main ``killer features'' of Sage.  This project is about improving the notebook.
No special mathematical knowledge is required. 

 * Use standard javascript library: jQuery.
 * Add Manipulate functionality
 * Standardize api to communicate with Sage
 * Improve the Notebook, some relevant trac tickets:
  * #386  Enhance "attach <file>" in the notebook
  * #406  notebook -- improve support for other system modes
  * #408  Notebook glitch in Safari
  * #413  saving non-evaluated cells
  * #1466  improve the "click to the left" aspect of the notebook
  * #1467  make it possible to upload/download worksheets as plain text
  * #1468  notebook -- create a global option so that word wrap is on or off by default always
  * #1496  notebook -- make it easy to link different worksheets
  * #5  full keyboard mode for notebook
  * #245  a bunch of random notebook improvement ideas
  * #246  height of a notebook cell
  * #251  Notebook worksheet multithreading
  * #260  transparent graphics output
  * #301  Create some functions for notebook history
  * #302  Report server errors to online notebook users
  * #322  Have global code page for Notebook
  * #336  Create an option to clear all cell output
  * #338  In doc browser make hyper links to referenced code in SAGE library
  * #353  public sage notebook robustness
  * #359  Consider adding dhtml javascript drawing functionality to the SAGE notebook

=== Cython ===
 * Improve C++ support
   * better integration of stl classes (vector, list, etc.)
   * automatically generated constructor, destructor
 * automatic parallelization via thread pools
 * improve code generaton support to have better code dependency checking.
 * glib/high performance c libary integration
 * Add multiple inheritance support
 * Attractive features from Aldor (www.aldor.org)

=== Calculus Improvements - (Student: Gary Furnish) ===
 * Cython version of symbolics
 * Differential Geometry Support via the new symbolics system.
Currently support of symbolics is slow at best and uses maxima through a pexpect interface for almost all calculations. Furthermore it does not support integrals over differential forms or other higher dimensional integrals.  There is a possible new symbolics framework that has been designed.  Built in Cython and using native c libraries, it is significantly faster then anything built in python.  General speed improvements for this would still be useful, especially in adding special algorithms for larger and special cases of symbolic arithmetic.  It would also be a good idea to implement a very simple integration algorithm for at least polynomials to improve speed so that it is not necessary to call maxima for simple cases. Based on the material discussed at Sage Days 8, Numpy arrays would be an ideal base to work over to build support for tensors with basis (as opposed to abstract tensors) because they natively support multidimensional operations.  The  new symbolic framework supports defining operations other then the regular scalar ones, so it is possible to define operations (such as index contraction, wedge product, etc) over abstract tensors.  This would be useful for physicists in general relativity and would help Sage become more useful in applied mathematics. Using Numpy would also require better integration with Cython and changes to the Cython code generator to ensure that tensor multiplication is fast enough to be useful for scientific computation.  Although not the primary goal, these Cython would benefit a significant number of other developers because most applications of Numpy are speed dependent.  

=== Commutative Algebra (Mentor: Martin Albrecht) ===
 * Write an excellent documentation for commutative algebra in Sage
  * read Magma's documentation http://magma.maths.usyd.edu.au/magma/htmlhelp/part14.htm
  * read Singular's documentation http://www.singular.uni-kl.de/Manual/latest/index.htm
  * compare to Sage's documentation http://www.sagemath.org/doc/html/ref/node287.html
 * Replicate every single example from the book "A Singular Introduction to Commutative Algebra" in Sage.
  * this can be done because Sage's commutative algebra is built on Singular's
  * if something doesn't feel "natural"/Sage-ish fix that, wrap Singular's functionality
 * Increase doctest coverage for everything "commutative algebra" to 100%
 * Check what in Magma is missing in Sage 
  * If it can be added, add it, document it
 * Gröbner bases and related functionality over $\mathbb{Z}$ and $\mathbb{Z}_N$
  * either a possibly slow native implementation
  * or (preferred) talk to Oliver Wienand who works on this for Singular and contribute there if possible
 * Wrap all Singular supported base fields via libSingular ($\mathbb{C}$, $\mathbb{R}$, number fields)
 * Write excellent documentation (with examples) on how to use libSingular without Sage and contribute it upstream if possible


=== Free abelian groups and integer lattices ===

Integer lattices (free abelian groups endowed with a bilinear,
integer-valued form) are important objects in geometry and
combinatorics.  The best available mathematical software for lattice
computations is the (expensive and proprietary) program Magma.  However,
Magma can only compute with lattices that have a positive definite
bilinear form.  Many of the most interesting geometric applications
involve negative definite or indefinite forms; furthermore, many
uniqueness and classification results apply only to indefinite lattices.
The first step toward expanding Sage's integer lattice capability is
to expand Sage's capability for working with free abelian groups; this
would have even wider and more fundamental applications.
  
=== Distributed Computing with dsage ===
  * Add an administrative page to dsage web interface
  * Add more functionality to the web interface
  * Implement automated worker upgrading
  * Add documentation to dsage
  * Document/implement methods for deploying dsage workers easily
  * Implement database versioning/upgrade 
  * Improve performance with large number of workers 
  * Add more examples 

=== Algorithmic Number Theory Examples in Sage and Software for Web Publishing (Mentor: Dan Shumow) ===
This project is to write examples of number theoretic algorithms in SAGE, and evaluate and/or develop software to publish these examples on the web.  The first part of the project is to learn about some number theory algorithms and write instructive examples in SAGE.  The purpose of this is to showcase how SAGE can be an excellent tool for students to learn number theory algorithms.  The second part of this project is to publish these examples in an extensible way.  This will allow users to add their own SAGE examples and discuss examples.  Specifically, the student should evaluate using open source web based source version control software in conjunction with open source message board software to allow internet users to discuss and modify SAGE examples.

== Potential Mentors ==
 * William Stein
 * Michael Abshoff
 * Burcin Erocal
 * Martin Albrecht
 * Dan Shumow
