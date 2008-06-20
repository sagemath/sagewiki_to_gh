Merge up at http://cython.org/coercion/hgwebdir.cgi/sage-coerce-3.0.3/ (pull on top of 3.0.3 release candidate) Should build and start without problems. 



Hint: If something doesn't work, try typing 

{{{
sage: coercion_traceback()
}}}

which will give a listing of all errors caught in the coercion model. 


=== Doctests ===

Done
 * integer_mod
 * calculus
 * catalogue, dsage, media, stats, server, logic, tests, misc
 * probability
 * monoids
 * games
 * algebras
 * libs
 * lfunctions
 * quadratic forms
 * databases
 * sets
 * rings/rational
 * rings/real_lazy
 * finite fields
 * structure/formal_sums
 * rings/padics
 * graphs
 * ext
 * functions
 * complex, real
 * numerical
 * crypto
 * interfaces
 * qqbar
 * combinat
 * gsl 
 * abelian_grps
 * geometry

In Progress
 * rings/number_field (robertwb)
 * matrix (robertwb, errors related to number fields)
 * schemes (ncalexan)
 * modular (craigcitro)
 * modules (cwitty)
 * coding (cwitty)

To Do

 * groups (generic.pyx due to elliptic curves over finite field problems)
 * rings/polynomial
 * modular

---- /!\ '''Edit conflict - other version:''' ----

---- /!\ '''Edit conflict - your version:''' ----

---- /!\ '''End of edit conflict''' ----
 * rings (residue_field.pyx)
 * categories (category_types.py -- 1 failure due to Spec in schemes)
 * structure
 * plot (animate.py)


=== Files to fix (Make all parents conform to the spec) ===

Useful script to list all parents in a given module that still need work: [attachment:list_parents.sage]

Nothing to do
 * catalogue, dsage, databases, ext, games, media, stats, server, plot, logic, tests lfunctions, misc, numerical,gsl, quadratic_forms


Done
 * coding, functions, graphs
 * matrix [http://sage.math.washington.edu/home/robertwb/coerce/coerce-all.hg]
 * complex, real [http://sage.math.washington.edu/home/robertwb/coerce/coerce-real-complex.hg]
 * modules [attachment:coerce-free-module.patch]
 * quotient rings
 * finite fields (including natural embeddings into each other when Conway polynomials are used)
 * calculus
 * number fields
 * sets
 * geometry
 * libs
 * probability
 * interfaces
 * combinat
 * rings
 * algebras
 * monoids
 * schemes (modulo some dependance on Groups)
 * crypto

In progress
 * groups
 * modular

Little to do

 * categories

Lots to do



Base classes
 * structure

=== Coercion doctesting ===

Comment from William: 
{{{
teragon:sage was$ sage -coverage categories/action.pyx
structure/element.pyx structure/coerce.pyx |grep SCORE
SCORE categories/action.pyx: 0% (0 of 22)
SCORE structure/element.pyx: 18% (28 of 153)
SCORE structure/coerce.pyx: 2% (1 of 39)

I tried to understand and use the coercion model code to trac down the issue with #2079 and
was amazed at how nonexistent the doctesting and documentation of
functions is there.
In order for people to write lots of coercion code all of Sage, it's critical that they can
read the coercion model code so they can track down -- for themselves -- what is going
wrong when they run into trouble.  I would put getting the coverage of the above files
(and whatever else is related to coercion) up to 100% as the first step in your coercion
model stuff.   Seriously.   And don't say it can't be doctested, since even though there are
a lot of things not easily accessible now from the interpreter, such as the coercion model
}}}

=== Categories to implement ===


=== Old notes ===

To start, get a copy of Sage 2.10.1, install the latest cython spkg (available at http://sage.math.washington.edu/home/robertwb/cython/), pull from http://cython.org/coercion/hgwebdir.cgi/sage-coerce/ and build. 

Import [attachment:fix-random.patch] to sage-scripts to ignore random tests.
