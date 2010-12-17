= Les vendredis Sage au LaCIM - LaCIM Sage Fridays =

Tous les vendredis après-midi à 13h à compter du 17 septembre 2010.

''Every Fridays Afternoon 1 pm starting September 17th 2010.''

== Lieu : PK-4205 ou PK-4323 ou PK-4214 , LaCIM, UQAM, Montréal, Canada ==

  * [[http://lacim.uqam.ca/|LaCIM - Laboratoire de combinatoire et d'informatique mathématique]]

== Contexte ==

Les étudiants, postdoctorants et plus récemment des professeurs au LaCIM ont utilisé et contribué au développement de Sage depuis 2008. Cette année plusieurs développeurs sont rassemblés au LaCIM et nous profiterons de l'occasion pour terminer chaque semaine en résolvant des bugs de Sage, en y apportant des améliorations et bien sûr en étant là pour répondre aux questions des utilisateurs. Une courte présentation par semaine sera possiblement donnée pour entamer l'après-midi (ex: sagetex, utiliser les queues avec hg, utiliser hg pour partager des répertoire, utiliser trace, utiliser le serveur sage-combinat).

''Students, postdocs and more recently professors at LaCIM have been using and developing Sage since 2008. This year many developers are gathered at LaCIM and we intend to finish each week by solving bugs, improving code and of course introducing Sage to anyone interested. Quick presentations will possibly be given each week to start the afternoon (ex : sagetex package, using hg, using hg to share repositories, using trace, using sage-combinat server).''
 
== Organisateurs ==

  * Alexandre Blondin Massé
  * Sébastien Labbé
  * Franco Saliola

== À propos de Sage ==

Sage est un logiciel libre et gratuit de mathématiques. Sa mission est d'offrir une alternative viable aux logiciels commerciaux comme Maple ou Mathematica, et sa communauté est en pleine croissance dans le monde entier. Vous trouverez plus d'informations sur Sage sur le site:

  * http://www.sagemath.org

Un récent vidéo fait par William Stein, l'initiateur de Sage, à l'occasion de Sage Days  25 en Inde (en anglais) :

  * [[http://vimeo.com/13986940|Introduction to Sage: History, Goals, Demo]], 49 min.

Un livre en français sur les mathématiques et sur Sage, sous la licence Creative Commons, a été publié récemment:

  * Calcul mathématique avec Sage, livre libre et gratuit, juillet 2010, http://sagebook.gforge.inria.fr/ 

== Vendredi suivant : 7 janvier 2011 ==

Suggestions :

  * Alexandre Blondin Massé :
      * Résoudre des équations sur les mots impliquant des morphismes et des antimorphismes

== Vendredi précédents ==

=== 17 décembre 2010 ===

  * Marco Robado:
      * L'outil rsync pour synchroniser des répertoires.

  * Sébastien Labbé, Marco Robado, Samuel :
      * Correction du ticket : [[http://trac.sagemath.org/sage_trac/ticket/10463|#10463]]

  * Marco Robado: 
      * Pour utiliser un pager par défaut pour les sorties Mercurial:

{{{
[extensions]
pager =

[pager]
pager = LESS='FSRX' less
attend = log, help, version, status, qseries, diff
}}}


=== 10 décembre 2010 ===

Documentation (coverage) de Sage

  * Alexandre Blondin Massé:
      * [[http://trac.sagemath.org/sage_trac/ticket/10461|#10461]]
  * Sébastien Labbé et Marco Robado:
      * [[http://trac.sagemath.org/sage_trac/ticket/10462|#10462]] et
      * [[http://trac.sagemath.org/sage_trac/ticket/10463|#10463]]
  * Franco:
      * [[http://trac.sagemath.org/sage_trac/ticket/8670|#8670]] 
  * Samuel:
      * Remplacement de Fedora par Ubuntu!

=== 3 décembre 2010 ===

Quelques présentations :

  * Alexandre Blondin Massé:
      * Syntaxe cython pour vim
  * Sébastien Labbé:
      * Utilisation de docutils et ReStructuredText pour générer des démos.
      * rst2html, rst2latex, rst2odt, rst2s5, etc.
      * Objectif : sage -rst2html
      * Objectif : sage -rst2sws
      * Un exemple de présentation faite avec rst2s5 : http://groups.google.com/group/cython-users/browse_thread/thread/ef615c8d2fc0ff78
  * Franco:
      * Syntaxe sage + ReST pour vim

Il faudrait ajouter des liens vers ce qu'on a fait.

=== 26 novembre 2010 ===

  * Alexandre Blondin Massé:
      * Arbitrage de [[http://trac.sagemath.org/sage_trac/ticket/10266|#10266]] et de [[http://trac.sagemath.org/sage_trac/ticket/10265|#10265]].
      * Arbre suffixe

  * Sébastien Labbé:
      * Terminer les corrections de [[http://trac.sagemath.org/sage_trac/ticket/10266|#10266]] : Needs Review again.
      * Travail sur layout_graphviz
      * Préparation de la présentation sur Sage à Montréal Python (avec Franco)

=== 19 novembre 2010 ===

  * Sébastien Labbé:
      * Terminer les corrections de [[http://trac.sagemath.org/sage_trac/ticket/10266|#10266]] : Needs Review again.
      * Wrote [[SharingYourBranch]] page.

=== 12 novembre 2010 ===

  * Alexandre Blondin Massé et Sébastien Labbé ont travaillé sur 
      * L'implémentation d'un arbre suffixe en Cython.
      *  #8739: Addition of Kolakoski word
      *  #8431: Substitutions over unit cube faces (Rauzy fractals)
      *  #10266: Add sum of digits of a sequence to the word constructor
      *  #10267: Add a method that returns the balance level of a finite word
      *  #10265: Add palindrome defect word to the word constructor
      *  #8674: Comparison of combinatorial class of words with word paths is broken
      *  #10134: Provide the enumeration of word morphisms from a range of integers
      *  #10261: Improve documentation for word (over str vs over integer)

=== 5 novembre 2010 ===

  * Franco Saliola a expliqué comment utiliser le Python Debugger. Il a fait une page HTML avec du code ReST. Il faudrait ajouter le lien ici.

=== 29 octobre 2010 ===

  * Alexandre Blondin Massé, Sébastien Labbé et Franco Saliola ont travaillé sur l'implémentation d'un arbre suffixe en Cython.

=== 22 octobre 2010 ===

  * Marco Robado a expliqué comment utiliser le protocole RSA pour les connexion SSH.
  * Sébastien Labbé et Franco Saliola ont travaillé sur les permutations codées par des chemins.

=== 15 octobre 2010 ===

  * Sébastien Labbé :
      * Terminer les corrections de [[http://trac.sagemath.org/sage_trac/ticket/8670|#8670]] : Needs Review again.
      * Création de [[http://trac.sagemath.org/sage_trac/ticket/10134|#10134]] : Needs Review.
      * Implémentation de is_pisot and is_unimodular for word morphisms.
  * Franco Saliola and Christian Stump:
      * Innefficient work on Poset code [[http://trac.sagemath.org/sage_trac/ticket/6641|#6641]].

=== 8 octobre 2010 ===

  * Sébastien Labbé :
      * Arbitrage de [[http://trac.sagemath.org/sage_trac/ticket/10063|#10063]].
      * Travailler sur [[http://trac.sagemath.org/sage_trac/ticket/8670|#8670]].
  * Alexandre Blondin Massé et Marco Robado :
      * Discussions à propos de Git.
      * Écriture d'un manuel sur Git.

=== 1er octobre 2010 ===

  * Alexandre Blondin Massé
      * Arbitrage de [[http://trac.sagemath.org/sage_trac/ticket/8431|#8431]] et [[http://trac.sagemath.org/sage_trac/ticket/9877|#9877]]
  * Sébastien Labbé :
      * Arbitrage de [[http://trac.sagemath.org/sage_trac/ticket/8431|#8431]].

=== 24 septembre 2010 ===

  * Marco Robado :
      * Discussions sur vim, en particulier à propos des plugins `autoclose` et `surround`.
  * Sébastien Labbé :
      * Arbitrage de [[http://trac.sagemath.org/sage_trac/ticket/8431|#8431]].
  * Alexandre Blondin Massé et Marco Robado :
      * Discussions à propos de Git.

=== 17 septembre 2010 ===

  * Sébastien Labbé : 
      * Démo de la librairie sage/combinat/words à Alessandro.
      * Démo de l'outil sagetex à Nicolas et Louis-François.
      * Démo de l'utilisation du serveur sage-combinat à Christian Stump.      
  * Franco Saliola : 
      * Résolution du problème d'utilisation de Gap sur les ordinateurs du PK-4205 : [[http://trac.sagemath.org/sage_trac/ticket/9938|#9938]]
