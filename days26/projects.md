= PROJECT GROUPS =

<<TableOfContents>>

== Computing the Cartier operator acting on 1-forms ==

PEOPLE: Rachel P., Aly, Gagan, Anja, Sarah, Marina, Kate

  * See [[days26/Pries Project|this page]].

  * sage worksheet that is slow and just implements algorithm (correctly!)
    * this appears to be done here: [[attachment:Computing N for Hyperelliptic curve.sws]]
    * need data to check that this is correct.
    * for what range of primes is this code reasonable?

  * make it really, really fast (cython). 

  * get included in sage itself

  * make a big table or something?   Rachel: "I would love to find a curve with p-rank 0 and a-number 1.   I did genus 4 and p=3."


== Making Drew Sutherland's smalljac code usable in Sage and extending Kate's data ==

PEOPLE: Kate, William S., Lola, Aly, Erin, Bianca

See the [[days26/Stange Project|Project Page]].  Subprojects are:

  * make smalljac code usable from Python (involves Cython)

  * cubic and sextic residue symbol

  * explicit calculation of Grossencharacters (aka Hecke characters). 


== Computing L-series of Jacobians of Certain Hyperelliptic Curves ==

PEOPLE: Jennifer B., Jennifer P., Jennifer J., Bianca

  * Decide if curve is attached to a modular form, and if so find it, then use that to compute L-series (use Sturm bound -- see paper of Ribet with appendix by Agashe/Stein)

  * Need the analogue of Tate's algorithm to get from the Namikawa-Ueno classification to the Euler factor at the bad primes

  * Plug L-series into Dokchitser and get numbers.

  * Make a table.  Starting with [[https://www.math.lsu.edu/~wamelen/CMcurves.txt|"van Wamelen"'s table]].  See also [[http://echidna.maths.usyd.edu.au/kohel/dbs/index.html|Kohel's tables]].

  * Incorporate Robert Bradshaw's code into Purple Sage.  http://code.google.com/p/purplesage/issues/detail?id=14


== Computing in the class group of non-maximal orders of quadratic imaginary fields ==

PEOPLE: William S., Bianca, 

  * Make a list of what you want to be able to do:
      - Such computations come up for Stein in http://wstein.org/papers/kolyconj2/

  * List why Magma/PARI aren't good enough (bugs, issues, speed, etc.)

  * Write really really fast code to implement some of this. 

  
== Sara's (mostly Combinatorics) wishlist ==

PEOPLE:  Needs people!

  * Better index of software
   
  * sbcl in Sage
    
  * Quasisymmetric function bases (Jason Bandlow has preliminary implementations on sage-combinat)
  
  * hyperplane arrangements
  
  * wikipedia and Sage pages linked to each other


== Some combinatorics projects from Anne's talk ==

  * LaTeX support for tableaux, compatible with jsmath/mathjax for visualization in the notebook, see trac#4355

  * Implementation of cyclage graph. PEOPLE: Anne S. 

  * Implementation of the Schuetzenberger involution Omega_2 on tableaux and words:

     - tableaux --> word --> something --> tableaux:  result is a sage worksheet, then function included in sage?!  easy.   PEOPLE: Erin, Ilke

  * Faster implementation of crystal graph isomorphisms (would have implications for the energy function and R-matrix).  PEOPLE: Anne S., William S.

     - view crystal graph and check if it is isomorphic to another graph (would build on Robert Miller's "NICE" package, which will check if any two graphs are isomorphic, which is fully available in Sage).   Hopefully this makes this project easy?

  * make the k-Schur function and their duals live in the right subspace/quotient of the ring of symmetric functions

     - in Sage, but live in the wrong space.  Should live in a subspace.  Have sample code in worksheet that "does the job" (see this link in Sage Days 20.5 in Toronto in May).  Want to put this code into Sage.  PEOPLE: Erin.

== Symbolic projects ==

PEOPLE:  Flavia, Karen

  * reviewing patches for hypergeometric functions [[http://trac.sagemath.org/sage_trac/ticket/2516|#2516]] and orthogonal polynomials [[http://trac.sagemath.org/sage_trac/ticket/9706|#9706]]

  * make beta symbolic [[http://trac.sagemath.org/sage_trac/ticket/9130|#9130]] and make log_gamma symbolic [[http://trac.sagemath.org/sage_trac/ticket/10075|#10075]]

  * add derivatives to floor, ceiling functions [[http://trac.sagemath.org/sage_trac/ticket/9874|#9874]]

  * doctest desolve  [[http://trac.sagemath.org/sage_trac/ticket/8931|#8931]]

  * add Stefan Boettner's parallel integration code
