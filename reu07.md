[[TableOfContents]]

== REU Resources ==
 * [http://www.math.washington.edu/~morrow/reu07/reu.html Jim Morrow's page]: Relevant papers.
 * [http://www.math.washington.edu/~reu/ REU Archives]
 * [http://www.math.washington.edu/~billey/classes/schubert.notes/notes.pdf Sara Billey's Schubert Variety notes]
 * Dive into Python: http://www.diveintopython.org/
 * Python Library reference: http://www.python.org/doc/current/lib/lib.html

=== Talks ===
 *  All talks are posted on [http://www.math.washington.edu/~reu/papers/current/]
=== Schedule ===
 * [:reu07/sched_archive:Archive Schedule]
 * Thursday, July 26
  * 9:30 am: More Plexers (Andrew and Tracy)
  * 5:30 pm Laurelhurst salmon bake; details:   http://www.seattle.gov/parks/centers/Laurelhurst/activity.htm
  * 7:05: Mariners game
 * Friday, July 27
  * 9:30: James
  * 2:30: Anton Dochtermann on Topology of Graph Homomorphisms; Sieg 220
  * July 27-29, Victoria trip?
 * Sunday, July 29, 2007
  * 1:05 pm -- Mariners game
 * Wednesday, August 1
  * 5:00 pm: Last Pizza
 * Thursday, August 2
  * 5:30 pm - closing; Laurelhurst Beach Club, tables 10 and 11; 51st Ave NE and NE Laurelcrest Lane. Location: http://maps.live.com/default.aspx?v=2&cp=47.656182~-122.272474&style=h&lvl=17&tilt=-90&dir=0&alt=-1000&scene=3693735&encType=1
 * Friday, August 3
  * 9:30 am: Lindsay
  * 10:45 am: Jeremiah 
 * Monday, August 6
  * 9:30 am: A Coxeter Approach to Graph Embeddings (Robert)
  * 10:45 am: Joe and Tom
 * Tuesday, August 7
  * 9:30 am: Nate and James
  * 10:45 am: Joey
 * Wednesday, August 8
  * 9:30 am: Sean and Emily
  * 10:45 am: Kari and Lindsay
  * 2:00 - 2:20pm: Friends and Enemies Simulation
  * 6:00 pm: Gorditos, 213 N 85th St
 * Thursday, August 9
  * 9:30 am: Tracy, Tom, Andrew
  * 10:45 am: Joe and Jaime
  * 1:00 pm: Photo at the Troll
 * Friday, August 10
  * Review
=== Projects ===
 1. Update Nick's Genus Code.
  * Emily Kirkman, Robert Miller
    * The current version is implemented in SAGE 2.7.1 (available at https://sage.math.washington.edu:8600 )
    * Backtracking should lead to a significant improvement.  (This will probably be hacked at after the REU is over, but you guys should check back because it will be awesome).
 1. Algorithm to test for recoverability
  * Emily Kirkman
  * Circular Planarity Testing: 
    * Status: Linear time achievable by modifying the graph before calling an O(n) planar embedding (testing) algorithm.  (Not reinventing the wheel, just sticking one in the graph).  Currently working on including the Boost library in SAGE.
    * Resources: 
      * A simple O(n) Planarity Testing [http://www.cs.uvic.ca/~wendym/my_pubs/boyer.ps Algorithm]
      * [http://boost.sourceforge.net/ Boost] implementation of the algorithm.
  * Criticality
 1. Enhancing precision with exact linear algebra
  * Tom Boothby, Emily Kirkman
 1. Combinatorics of Coxeter Groups (with Sara Billey)
  * Sean Howe, Emily Kirkman, Robert Miller
  * [:reu07/bruhat_notes]
 1. Dirichlet Problem for Directed Networks
  * Kari Christianson, Lindsay Erickson
 1. Complexers
  * Lindsay Erickson
 1. Graphs and Connections on a Surface of Arbitrary Genus
  * Joe Mitchell
 1. Angle Systems and Embeddings
  * Joey Greer
 1. New Algorithm for Finding Planar Embeddings with user-defined Topological Constraints
  * Emily Kirkman - This will also come after inclusion of Boost.  (see above)
 1. [:Leon:Update] Jeffrey Leon's Partition Backtracking code
  * Tom Boothby, Robert Miller
=== Pictures ===
 * [:emilyk:Emily Kirkman]

== T-shirt Decision ==
 * Crab full size on back
 * Owen'ed full size on front, UW Math REU 2007 Jaime-style on top / bottom
 * Blue shirts with yellow text

== Wiki examples ==
To include a link:

{{{
[http://www.math.washington.edu/~morrow/reu07/reu.html Jim Morrow's page]
[:Leon: update]
}}}
To add a table of contents:

{{{
[[TableOfContents]]
}}}
To format the table of contents (simultaneously formatting the page):

{{{
== Top Level, No. 1 ==
== Top Level, No. 2 ==
=== Next Level, No. 1 ===
=== Next Level, No. 2 ===
==== Another Level, etc. ====
== Top Level, No. 3 ==
}}}
To create a new wiki page, simply navigate there, and you will be given a new blank page.

MoinMoin, this particular brand of wiki, also allows you to use LaTeX:

$$\sum_{k=1}^n{n \choose k}x^k$$

$\sum_{k=1}^n{n \choose k}x^k$

$$\left[\begin{array}{cccc}1 & 0 & 0 & 0 \\0 & 1 & 0 & 0 \\0 & 0 & 0 & \omega \\0 & 0 & -\omega & 0\end{array}\right]$$

Here's how to do that:

{{{
$$\sum_{k=1}^n{n \choose k}x^k$$
$\sum_{k=1}^n{n \choose k}x^k$
$$\left[\begin{array}{cccc}1 & 0 & 0 & 0 \\0 & 1 & 0 & 0 \\0 & 0 & 0 & \omega \\0 & 0 & -\omega & 0\end{array}\right]$$
}}}
NOTE: The double-dollar notation is a replacement for LaTeX's math environment \[...\], which does not work in the wiki.
