= Dynamics in Sage =

This page is an organization wiki for the implementation in Sage of various algorithms related to dynamics.

== Introduction ==

Different aspects of dynamical systems involve computers

  * simulation and experimentation
  * numerical algorithms seen as dynamical systems
  * prospection of combinatorial structures associated to dynamical systems (infinite words, ...)
  * intrinsically discrete dynamics: shifts, cellular automata, ...
  * ...

== Quick links ==

  * [[dynamics/examples]]: examples that are produced with the code of sage-dynamics
  * [[https://lma.metelu.net/mailman/listinfo/sage-dynamics|sage-dynamics]]:  lma.metelu.net mailing-list
  * [[http://groups.google.com/group/sage-dynamics | sage-dynamics]]: Google group (web forum + mailing list)
  * [[combinat|combinat wiki]]: the wiki page of the combinat community (see in particular the following [[combinat/Installation|installation instructions]] for installing sage-combinat on your computer)

== Organization ==

We plan organize the sage.dynamics repository with the following hierarchy

  * arithmetic_dynamics (?)
  * cellular_automata (?)
  * complex_dynamics (?)
  * shifts (sage-combinat)
    * tilings (WangTile)
    * substitutive shift
      * self similar interval exchange map
    * s-adic shift
      * Sturmian
      * interval exchange maps
  * surface_dynamics (sage-combinat)
    * flat_surfaces
      * origamis
      * veech_surfaces
      * linear suspensions of iet
    * train_tracks
    * hyperbolic_dynamics
      * geodesic flow
      * Fuchsian groups
    * hamiltonian flows
      * logarithmic suspensions of iet
  * picewise (sage-combinat)
    * interval_exchange_transformations and linear_involutions
    * affine_iet
    * interval_translation
    * 2D (?)

== Subprojects ==

  * [[dynamics/ArithmeticAndComplex|Arithmetic and Complex Dynamics]]
  * [[dynamics/FlatSurfaces]]
  * [[LanguagesAndTilings]]

== Other programs ==

 * [[http://homepages.math.uic.edu/~culler/chaos/|Fractal, chaos and complex dynamics]] by M. Culler and H. Masur: educational purpose software
 * [[http://www.math.uiuc.edu/~nmd/computop/|computop.org]] references several interesting softwares, many of them written in python
