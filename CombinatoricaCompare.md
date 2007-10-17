= Combinatorica Comparison =
This page compares the functionality in SAGE with that of the Combinatorica package in Mathematica.  We compare to Mathematica version 6 and  Combinatorica version 2.1.0.

== SAGE functions ==
This table lists the functions available in SAGE and the equivalent Combinatorica functions.  It also has some notes about the implementation and suggestions on how to make SAGE better.
||'''SAGE Class   ''' ||'''      SAGE function    ''' ||'''      Combinatorica   ''' ||'''      Combinatorica Notes     ''' ||'''      SAGE notes      ''' ||
||      !GenericGraph || || || || ||
|| ||      add_vertex ||      !AddVertex ||      Can specify coordinates for new vertices || ||
|| ||      add_vertices ||      !AddVertices ||      Can specify coordinates and graphical info for new vertices || ||
|| ||      am ||      !ToAdjacencyMatrix ||      Can return edge weight matrix and matrix counting loops/multiple edges as well || ||
|| ||antisymmetric ||AntiSymmetricQ || || ||
|| ||      associate || || ||      Can we add this functionality to the add_vertex functions? ||
|| ||      breadth_first_search ||      !BreadthFirstTraversal ||      Returns list of vertices, edges, the tree, or just the levels of traversal || ||
|| ||      cartesian_product ||      !GraphProduct || ||      How are vertex properties transferred?  How are loops/multiple edges handled? ||
|| ||      center ||      !GraphCenter || || ||
|| ||      clear || || ||      Is this more efficient than just setting the graph to the empty graph? ||
|| ||      clique_number || || || ||
|| ||      cliques ||      !MaximumClique || ||      Can find a k-clique, not just a maximum clique ||
|| ||      cliques_containing_vertex || || || ||
|| ||      cliques_get_clique_bipartite || || || ||
|| ||      cliques_get_max_clique_graph || || || ||
|| ||      cliques_vertex_clique_number || || || ||
|| ||      cliques_number_of || || || ||
|| ||      cluster_transitivity ||      TransitiveQ ||      I think these two functions are/can be made equivalent || ||
|| ||      cluster_triangles || || || ||
|| ||      clustering_average || || || ||
|| ||      clustering_coeff || || || ||
|| ||      complement ||      !GraphComplement || ||      Pick a convention to deal with loops and make an option to switch conventions.  We can also make an option for a max number of edges to set a convention for multiple edges ||
|| ||      cores || || || ||
|| ||      delete_vertex ||      !DeleteVertex || || ||
|| ||      delete_vertices ||      !DeleteVertices || || ||
|| ||      density || || || ||
|| ||      depth_first_search ||      !DepthFirstTraversal ||      Returns list of vertices, edges, or the traversal tree || ||
|| ||      diameter ||      Diameter || ||      max( {} ) isn't right in the latex version ||
|| ||      disjoint_union ||      !GraphUnion ||      not restricted to two graphs, and can easily make copies of the same graph || ||
|| ||      disjunctive_product || || || ||
|| ||      distance ||      Distances ||      Returns list of distances to every other vertex || ||
|| ||      eccentricity ||      Eccentricity || ||      Much more complete ||
|| ||      get_boundary || || ||The boundary functions let you make a set of vertices special.  You can then get or set the boundary of a graph. ||
|| ||      has_vertex || || || ||
|| ||      lexicographic_product || || || ||
|| ||line_graph||LineGraph|| || ||
|| ||      loop_vertices || || || ||
|| || || || || ||
|| ||      loops ||      SelfLoopsQ || || ||
|| ||      name || || || ||
|| ||      neighbors ||      Neighborhood ||      can return neighbors distance k or less, not just immediate neighbors || ||
|| ||      networkx_graph || || || ||
|| ||      networkx_info || || || ||
|| ||      obj || || || ||
|| ||      order ||      V || || ||
|| ||      periphery || || || ||
|| ||      plot ||      !ShowGraph || ||      Plotting differences should be looked at more carefully. ||
|| ||      radius ||      Radius || || ||
|| ||      random_subgraph || || || ||
|| ||      relabel ||      !PermuteSubgraph ||      can relabel a subgraph, not just entire graph || ||
|| ||      set_boundary || || || ||
|| ||      shortest_path ||      !ShortestPath ||      Also uses !BellmanFord algorithm?  Automatically switches between this and Dijkstra depending on whether the graph has negative weights and the density of the graph || ||
|| ||      shortest_path_all_pairs || || || ||
|| ||      shortest_path_length || || ||      what is the difference between this and distance? ||
|| ||      shortest_path_lengths || || || ||
|| ||      shortest_paths || || || ||
|| ||      show ||      !ShowGraph || ||      what is the difference between this and the plot function? ||
|| ||      size ||      M || || ||
|| ||      strong_product || || || ||
|| ||      tensor_product || || || ||
|| || to_simple || !MakeSimple || || ||
|| ||transitive_closure ||!TransitiveClosure || || ||
|| ||      union || || ||      What does “common vertices will be renamed” mean in the docs? ||
|| ||      vertex_boundary || || || ||
|| ||      vertex_iterator || || || ||
|| ||      vertices ||      Range[V[#]]& ||      Since vertices are always numerically numbered, the range gives the list of vertices || ||
|| ||      ______cmp__ ||      IdenticalQ ||      IdenticalQ isn't quite the same, I don't think it cares about loops/multiple edge settings, just the actual edge list. || ||
|| ||      __contains__ || || ||      extend this to handle edges? ||
|| ||      _matrix_ || || ||This is the adjacency matrix. ||
|| || || || || ||
||      Graph || || || || ||
|| ||      add_cycle || || || ||
|| ||      add_edge ||      !AddEdge || || ||
|| ||      add_edges ||      !AddEdges || || ||
|| ||      add_path || || || ||
|| ||      adjacency_matrix ||      !ToAdjacencyMatrix || || ||
|| ||      all_paths || || || ||
|| ||      automorphism_group ||      Automorphisms || || ||
|| ||bipartite_color, bipartite_sets||TwoColor|| || ||
|| ||      canonical_label || || || ||
|| ||      centrality_betweenness || || || ||
|| ||      centrality_closeness || || || ||
|| ||      centrality_degree || || || ||
|| ||      connected_component_containing_vertex || || || ||
|| ||      connected_components ||      !ConnectedComponents || || ||
|| ||      connected_components_number || || || ||
|| ||      connected_components_subgraphs || || || ||
|| ||      copy || || || ||
|| ||      degree ||      !DegreeSequence, Degrees || ||      can return only some degrees. ||
|| ||      degree_histogram || || || ||
|| ||      degree_iterator || || || ||
|| ||      delete_edge ||      !DeleteEdge ||      nondestructive; “All” Option to delete all multiple edges || ||
|| ||      delete_edges ||      !DeleteEdges ||      nondestructive; “All” Option to delete all multiple edges || ||
|| ||      delete_multiedge ||      !DeleteEdge || ||      can we make this an option in delete_edge and delete_edges? ||
|| ||      edge_boundary || || || ||
|| ||      edge_iterator || || || ||
|| ||      edge_label || || || ||
|| ||      edge_labels ||      !GetEdgeLabels || || ||
|| ||      edges ||      Edges || || ||
|| ||      edges_incident || || || ||
|| ||      genus || || || ||
|| ||      graph6_string || || ||      extend this to handle bigger graphs ||
|| ||      has_edge || || || ||
|| ||      incidence_matrix ||      !IncidenceMatrix || ||      example shows a 0,1,-1 matrix.  Should this be 0,1 matrix? ||
|| ||      interior_paths || || || ||
|| ||is_bipartite||BipartiteQ|| || ||
|| ||      is_circular_planar || || ||      write an outer_planar function using this. ||
|| ||      is_connected ||      ConnectedQ || || ||
|| ||      is_directed ||      Not[UndirectedQ[#]]& || || ||
|| ||      is_isomorphic ||      IsomorphicQ || ||      examine the differences between Combinatorica and SAGE later ||
|| ||      kirchhoff_matrix || || || ||
|| ||      loop_edges || || || ||
|| ||      multiple_edges ||      MultipleEdgesQ || || ||
|| ||      neighbor_iterator || || || ||
|| ||      number_of_loops || || || ||
|| ||      plot3d || || || ||
|| ||      remove_loops ||      !RemoveSelfLoops || ||      can remove loops from selected vertices ||
|| ||      remove_multiple_edges ||      !RemoveMultipleEdges || ||      extend to just remove multiple edges between sets of vertices ||
|| ||      set_edge_label ||      !SetEdgeLabels || ||      How does this handle multiedges? ||
|| ||      show3d || || || ||
|| ||      sparse6_string || || ||      extend this to handle bigger graphs ||
|| ||      spectrum ||      Spectrum || || ||
|| ||      subgraph ||      !InduceSubgraph || || ||
|| ||      to_directed ||      !MakeDirected ||      “All” option to transfer edge attributes to both directed edges || ||
|| ||      to_undirected ||      !MakeUndirected || || ||
|| ||      weighted_adjacency_matrix || || ||      make an option in “adjacency_matrix” ||
|| ||      write_to_eps || || || ||
|| || || || || ||
||      !DiGraph || || || || ||
|| ||      add_edge ||      !AddEdge || || ||
|| ||      add_edges ||      !AddEdges || || ||
|| ||      adjacency_matrix ||      !ToAdjacencyMatrix || || ||
|| ||      edge_boundary || || || ||
|| ||      edge_iterator || || || ||
|| ||      edge_label || || || ||
|| ||      edge_labels ||      !GetEdgeLabels || || ||
|| ||      edges ||      Edges || || ||
|| ||      automorphism_group ||      Automorphisms || || ||
|| ||      canonical_label || || || ||
|| ||      connected_component_containing_vertex || || || ||
|| ||      connected_components ||      !ConnectedComponents || || ||
|| ||      connected_components_number || || || ||
|| ||      connected_components_subgraphs || || || ||
|| ||      copy || || || ||
|| ||      degree || || || ||
|| ||      degree_iterator || || || ||
|| ||      delete_edge ||      !DeleteEdge ||      nondestructive; “All” Option to delete all multiple edges || ||
|| ||      delete_edges ||      !DeleteEdges ||      nondestructive; “All” Option to delete all multiple edges || ||
|| ||      delete_multiedge ||      !DeleteEdge || ||      can we make this an option in delete_edge and delete_edges? ||
|| ||      dig6_string || || || ||
|| ||      has_edge || || || ||
|| ||      in_degree ||      !InDegree || || ||
|| ||      in_degree_iterator || || || ||
|| ||      incidence_matrix ||      !IncidenceMatrix ||      Convention for sign is opposite (1 means outgoing in Combinatorica) || ||
|| ||      incoming_edge_iterator || || || ||
|| ||      incoming_edges || || || ||
|| ||      is_connected ||      ConnectedQ ||      Options for strong or weakly connected || ||
|| ||      is_directed || || || ||
|| ||      is_directed_acyclic ||      DirectedQ and AcyclicQ ||      Can do acyclic test for undirected graphs too || ||
|| ||      is_isomorphic ||      IsomorphicQ || || ||
|| ||      loop_edges || || || ||
|| ||      multiple_edges ||      MultipleEdgesQ || || ||
|| ||      neighbor_iterator || || ||      make option for “out” edges or “in” edges ||
|| ||      number_of_loops || || || ||
|| ||      out_degree ||      !OutDegree || || ||
|| ||      out_degree_iterator || || || ||
|| ||      outgoing_edge_iterator || || || ||
|| ||      outgoing_edges || || || ||
|| ||      plot3d || || || ||
|| ||      predecessor_iterator || || ||      make this an option for neighbor_iterator and neighbors ||
|| ||      predecessors || || ||      make this an option for neighbor_iterator and neighbors ||
|| ||      remove_loops ||      !RemoveSelfLoops || || ||
|| ||      remove_multiple_edges ||      !RemoveMultipleEdges || || ||
|| ||      reverse ||      !ReverseEdges || || ||
|| ||      set_edge_label ||      !SetEdgeLabels || || ||
|| ||      show3d || || || ||
|| ||      subgraph ||      !InduceSubgraph || || ||
|| ||      successor_iterator || || ||      make this an option for neighbor_iterator and neighbors ||
|| ||      successors || || ||      make this an option for neighbor_iterator and neighbors ||
|| ||      to_directed ||      !MakeDirected || || ||
|| ||      to_undirected ||      !MakeUndirected || || ||
|| ||      topological_sort ||      !TopologicalSort || || ||
|| ||      topological_sort_generator || || || ||
|| || || || || ||
||      graphs || || || || ||
|| ||      !BalancedTree ||      !CompleteKaryTree ||      can specify the total number of vertices ||      can specify the height ||
|| ||      !BarbellGraph || || || ||
|| ||      !BullGraph || || || ||
|| ||      !ChvatalGraph ||      !ChvatalGraph || ||      put “smallest triangle-free, 4-regular, 4-chromatic graph.” in docs? ||
|| ||      !CircularLadderGraph || || || ||
|| ||CirculantGraph||CirculantGraph|| || ||
|| ||      !ClawGraph || || || ||
|| ||      !CompleteBipartiteGraph ||      CompleteKPartiteGraph ||      can create complete multipartite graph || ||
|| ||      !CompleteGraph ||      !CompleteGraph || || ||
|| ||      !CubeGraph ||      Hypercube || || ||
|| ||      !CycleGraph ||      Cycle || || ||
|| ||      !DegreeSequence ||      !RealizeDegreeSequence || ||      should “random” be “semirandom”, like in the Combinatorica documentation? ||
|| ||      !DegreeSequenceConfigurationModel || || ||      Can this be an option in !DegreeSequence? ||
|| ||      !DegreeSequenceExpected || || ||      Can this be an option in !DegreeSequence? ||
|| ||      !DegreeSequenceTree || || ||      Can this be an option in !DegreeSequence? ||
|| ||      !DesarguesGraph || || || ||
|| ||      !DiamondGraph || || || ||
|| ||      !DodecahedralGraph ||      !DodecahedralGraph || || ||
|| ||      !DorogovtsevGoltsevMendesGraph || || || ||
|| ||      !EmptyGraph ||      !EmptyGraph[0] ||      can give a number of vertices to include (empty means no edges) || ||
|| ||      !FlowerSnark || || || ||
|| ||      !FruchtGraph ||      !FruchtGraph || || ||
|| ||      !Grid2dGraph ||      !GridGraph || || ||
|| ||      !GridGraph ||      !GridGraph ||      Only does up to 3 dimensions || ||
|| ||      !HeawoodGraph ||      !HeawoodGraph ||      smallest (6, 3)-cage || ||
|| ||      !HexahedralGraph || || || ||
|| ||      !HouseGraph || || || ||
|| ||      HouseXGraph || || || ||
|| ||      !IcosahedralGraph ||      !IcosahedralGraph || || ||
|| ||      !KrackhardtKiteGraph || || || ||
|| ||      !LadderGraph || || || ||
|| ||      LCFGraph || || || ||
|| ||      !LollipopGraph || || || ||
|| ||      !MoebiusKantorGraph || || || ||
|| ||      !OctahedralGraph ||      !OctahedralGraph || || ||
|| ||      !PappusGraph || || || ||
|| ||      !PathGraph ||      Path || || ||
|| ||      !PetersenGraph ||      !PetersenGraph || || ||
|| ||      !RandomBarabasiAlbert || || || ||
|| ||      RandomDirectedGN || || || ||
|| ||      RandomDirectedGNC || || || ||
|| ||      RandomDirectedGNR || || || ||
|| ||      RandomGNM || || || ||
|| ||      RandomGNP ||      !RandomGraph? || || ||
|| ||      !RandomHolmeKim || || || ||
|| ||      !RandomLobster || || || ||
|| ||      !RandomNewmanWattsStrogatz || || || ||
|| ||      !RandomRegular || || || ||
|| ||      !RandomShell || || || ||
|| ||      !RandomTreePowerlaw || || || ||
|| ||      !StarGraph ||      Star || || ||
|| ||      !TetrahedralGraph ||      !TetrahedralGraph || || ||
|| ||      !ThomsenGraph || || || ||
|| ||      !WheelGraph ||      Wheel || || ||


== Combinatorica functions not in SAGE ==
These functions are implemented in Combinatorica, but not in SAGE.  Feel free to implement them!

 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/AlternatingPaths.html AlternatingPaths][g, start, ME] returns the alternating paths in graph g with respect to the matching ME, starting at the vertices in the list start. The paths are returned in the form of a forest containing trees rooted at vertices in start.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/AnimateGraph.html AnimateGraph][g, l] displays graph g with each element in the list l successively highlighted. Here l is a list containing vertices and edges of g. An optional flag, which takes on the values All and One, can be used to inform the function about whether objects highlighted earlier will continue to be highlighted or not. The default value of flag is All. All the options allowed by the function Highlight are permitted by [http://reference.wolfram.com/mathematica/Combinatorica/ref/AnimateGraph.html AnimateGraph], as well. See the usage message of Highlight for more details.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ApproximateVertexCover.html ApproximateVertexCover][g] produces a vertex cover of graph g whose size is guaranteed to be within twice the optimal size.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ArticulationVertices.html ArticulationVertices][g] gives a list of all articulation vertices in graph g. These are vertices whose removal will disconnect the graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html BellmanFord][g, v] gives a shortest-path spanning tree and associated distances from vertex v of graph g. The shortest-path spanning tree is given by a list in which element i is the predecessor of vertex i in the shortest-path spanning tree. [http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html BellmanFord] works correctly even when the edge weights are negative, provided there are no negative cycles.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/BiconnectedComponents.html BiconnectedComponents][g] gives a list of the biconnected components of graph g. If g is directed, the underlying undirected graph is used.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/BipartiteMatching.html BipartiteMatching][g] gives the list of edges associated with a maximum matching in bipartite graph g. If the graph is edge weighted, then the function returns a matching with maximum total weight.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/BipartiteMatchingAndCover.html BipartiteMatchingAndCover][g] takes a bipartite graph g and returns a matching with maximum weight along with the dual vertex cover. If the graph is not weighted, it is assumed that all edge weights are 1.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/BiconnectedQ.html BiconnectedQ][g] yields True if graph g is biconnected. If g is directed, the underlying undirected graph is used.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/BooleanAlgebra.html BooleanAlgebra][n] gives a Hasse diagram for the Boolean algebra on n elements. The function takes two options: Type and [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel], with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel] is set to True, labels are produced for the vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/BrelazColoring.html BrelazColoring][g] returns a vertex coloring in which vertices are greedily colored with the smallest available color in decreasing order of vertex degree.
 * Bridges[g] gives a list of the bridges of graph g, where each bridge is an edge whose removal disconnects the graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ButterflyGraph.html ButterflyGraph][n] returns the n-dimensional butterfly graph, a directed graph whose vertices are pairs (w, i), where w is a binary string of length n and i is an integer in the range 0 through n and whose edges go from vertex (w, i) to (w', i+1), if w' is identical to w in all bits with the possible exception of the (i+1)th bit. Here bits are counted left to right. An option [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel], with default setting False, is allowed. When this option is set to True, vertices are labeled with strings (w, i).
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/CageGraph.html CageGraph][k, r] gives a smallest k-regular graph of girth r for certain small values of k and r. [http://reference.wolfram.com/mathematica/Combinatorica/ref/CageGraph.html CageGraph][r] gives [http://reference.wolfram.com/mathematica/Combinatorica/ref/CageGraph.html CageGraph][3, r]. For k = 3, r can be 3, 4, 5, 6, 7, 8, or 10. For k = 4 or 5, r can be 3, 4, 5, or 6.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ChangeEdges.html ChangeEdges][g, e] replaces the edges of graph g with the edges in e. e can have the form {{s1, t1}, {s2, t2}, ...} or the form { {{s1, t1}, gr1}, {{s2, t2}, gr2}, ...}, where {s1, t1}, {s2, t2}, ... are endpoints of edges and gr1, gr2, ... are graphics information associated with edges.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ChangeVertices.html ChangeVertices][g, v] replaces the vertices of graph g with the vertices in the given list v. v can have the form {{x1, y1}, {x2, y2}, ...} or the form { {{x1, y1}, gr1}, {{x2, y2}, gr2}, ...}, where {x1, y1}, {x2, y2}, ... are coordinates of points and gr1, gr2, ... are graphics information associated with vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ChromaticNumber.html ChromaticNumber][g] gives the chromatic number of the graph, which is the fewest number of colors necessary to color the graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ChromaticPolynomial.html ChromaticPolynomial][g, z] gives the chromatic polynomial P(z) of graph g, which counts the number of ways to color g with, at most, z colors.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/CircularEmbedding.html CircularEmbedding][n] constructs a list of n points equally spaced on a circle. [http://reference.wolfram.com/mathematica/Combinatorica/ref/CircularEmbedding.html CircularEmbedding][g] embeds the vertices of g equally spaced on a circle.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/CodeToLabeledTree.html CodeToLabeledTree][l] constructs the unique labeled tree on n vertices from the Prufer code l, which consists of a list of n-2 integers between 1 and n.
 * Contract[g, {x, y}] gives the graph resulting from contracting the pair of vertices {x, y} of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/CostOfPath.html CostOfPath][g, p] sums up the weights of the edges in graph g defined by the path p.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/CoxeterGraph.html CoxeterGraph] gives a non-Hamiltonian graph with a high degree of symmetry such that there is a graph automorphism taking any path of length 3 to any other.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/CubeConnectedCycle.html CubeConnectedCycle][d] returns the graph obtained by replacing each vertex in a d-dimensional hypercube by a cycle of length d. Cube-connected cycles share many properties with hypercubes but have the additional desirable property that for d > 1 every vertex has degree 3.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/DeBruijnGraph.html DeBruijnGraph][m, n] constructs the n-dimensional De Bruijn graph with m symbols for integers m > 0 and n > 1. [http://reference.wolfram.com/mathematica/Combinatorica/ref/DeBruijnGraph.html DeBruijnGraph][alph, n] constructs the n-dimensional De Bruijn graph with symbols from alph. Here alph is nonempty and n > 1 is an integer. In the latter form, the function accepts an option [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel], with default value False, which can be set to True, if users want to associate strings on alph to the vertices as labels.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/DegreesOf2Neighborhood.html DegreesOf2Neighborhood][g, v] returns the sorted list of degrees of vertices of graph g within a distance of 2 from v.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/DeleteCycle.html DeleteCycle][g, c] deletes a simple cycle c from graph g. c is specified as a sequence of vertices in which the first and last vertices are identical. g can be directed or undirected. If g does not contain c, it is returned unchanged; otherwise g is returned with c deleted."
 * Dijkstra[g, v] gives a shortest-path spanning tree and associated distances from vertex v of graph g. The shortest-path spanning tree is given by a list in which element i is the predecessor of vertex i in the shortest-path spanning tree. Dijkstra does not work correctly when the edge weights are negative; [http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html BellmanFord] should be used in this case.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/DilateVertices.html DilateVertices][v, d] multiplies each coordinate of each vertex position in list v by d, thus dilating the embedding. [http://reference.wolfram.com/mathematica/Combinatorica/ref/DilateVertices.html DilateVertices][g, d] dilates the embedding of graph g by the factor d.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/DominationLattice.html DominationLattice][n] returns a Hasse diagram of the partially ordered set on integer partitions of n in which p < q if q dominates p. The function takes two options: Type and [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel], with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel] is set to True, labels are produced for the vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeChromaticNumber.html EdgeChromaticNumber][g] gives the fewest number of colors necessary to color each edge of graph g, so that no two edges incident on the same vertex have the same color.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeColoring.html EdgeColoring][g] uses Brelaz's heuristic to find a good, but not necessarily minimal, edge coloring of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeConnectivity.html EdgeConnectivity][g] gives the minimum number of edges whose deletion from graph g disconnects it. [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeConnectivity.html EdgeConnectivity][g, Cut] gives a set of edges of minimum size whose deletion disconnects the graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeWeight.html EdgeWeight] is an option that allows the user to associate weights with edges. 1 is the default weight. [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeWeight.html EdgeWeight] can be set as part of the graph data structure.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/EquivalenceRelationQ.html EquivalenceRelationQ][r] yields True if the matrix r defines an equivalence relation. [http://reference.wolfram.com/mathematica/Combinatorica/ref/EquivalenceRelationQ.html EquivalenceRelationQ][g] tests whether the adjacency matrix of graph g defines an equivalence relation.
 * Equivalences[g, h] lists the vertex equivalence classes between graphs g and h defined by their vertex degrees. Equivalences[g] lists the vertex equivalences for graph g defined by the vertex degrees. Equivalences[g, h, f1, f2, ...] and Equivalences[g, f1, f2, ...] can also be used, where f1, f2, ... are functions that compute other vertex invariants. It is expected that for each function fi, the call fi[g, v] returns the corresponding invariant at vertex v in graph g. The functions f1, f2, ... are evaluated in order, and the evaluation stops either when all functions have been evaluated or when an empty equivalence class is found. Three vertex invariants, [http://reference.wolfram.com/mathematica/Combinatorica/ref/DegreesOf2Neighborhood.html DegreesOf2Neighborhood], [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOf2Paths.html NumberOf2Paths], and Distances are Combinatorica functions and can be used to refine the equivalences.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/EulerianCycle.html EulerianCycle][g] finds an Eulerian cycle of g if one exists.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/EulerianQ.html EulerianQ][g] yields True if graph g is Eulerian, meaning there exists a tour that includes each edge exactly once.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ExactRandomGraph.html ExactRandomGraph][n, e] constructs a random labeled graph of exactly e edges and n vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ExtractCycles.html ExtractCycles][g] gives a maximal list of edge-disjoint cycles in graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/FindCycle.html FindCycle][g] finds a list of vertices that define a cycle in graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/FiniteGraphs.html FiniteGraphs] produces a convenient list of all the interesting, finite, parameterless graphs built into Combinatorica.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/FolkmanGraph.html FolkmanGraph] returns a smallest graph that is edge-transitive but not vertex-transitive.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/FranklinGraph.html FranklinGraph] returns a 12-vertex graph that represents a 6-chromatic map on the Klein bottle. It is the sole counterexample to Heawood's map coloring conjecture.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/FunctionalGraph.html FunctionalGraph][f, v] takes a set v and a function f from v to v and constructs a directed graph with vertex set v and edges (x, f(x)) for each x in v. [http://reference.wolfram.com/mathematica/Combinatorica/ref/FunctionalGraph.html FunctionalGraph][f, v], where f is a list of functions, constructs a graph with vertex set v and edge set (x, fi(x)) for every fi in f. An option called Type that takes on the values Directed and Undirected is allowed. Type -> Directed is the default, while Type -> Undirected returns the corresponding underlying undirected graph. [http://reference.wolfram.com/mathematica/Combinatorica/ref/FunctionalGraph.html FunctionalGraph][f, n] takes a nonnegative integer n and a function f from {0,1,..., n-1} onto itself and produces the directed graph with vertex set {0, 1,..., n-1} and edge set {x, f(x)} for each vertex x."
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GeneralizedPetersenGraph.html GeneralizedPetersenGraph][n, k] returns the generalized Petersen graph, for integers n > 1 and k > 0, which is the graph with vertices {u1, u2, ..., un} and {v1, v2, ..., vn} and edges {ui, u(i+1)}, {vi, v(i+k)}, and {ui, vi}. The Petersen graph is identical to the generalized Petersen graph with n = 5 and k = 2.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GetEdgeWeights.html GetEdgeWeights][g] returns the list of weights of the edges of g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/GetEdgeWeights.html GetEdgeWeights][g, es] returns the list of weights in graph g of the edges in es.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexLabels.html GetVertexLabels][g] returns the list of labels of vertices of g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexLabels.html GetVertexLabels][g, vs] returns the list of labels in graph g of the vertices specified in list vs.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexWeights.html GetVertexWeights][g] returns the list of weights of vertices of g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexWeights.html GetVertexWeights][g, vs] returns the list of weights in graph g of the vertices in vs.
 * Girth[g] gives the length of a shortest cycle in a simple graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphDifference.html GraphDifference][g, h] constructs the graph resulting from subtracting the edges of graph h from the edges of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphicQ.html GraphicQ][s] yields True if the list of integers s is a graphic sequence, and thus represents a degree sequence of some graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphIntersection.html GraphIntersection][g1, g2, ...] constructs the graph defined by the edges that are in all the graphs g1, g2, ....
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphJoin.html GraphJoin][g1, g2, ...] constructs the join of graphs g1, g2, and so on. This is the graph obtained by adding all possible edges between different graphs to the graph union of g1, g2, ....
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphPolynomial.html GraphPolynomial][n, x] returns a polynomial in x in which the coefficient of x^m is the number of nonisomorphic graphs with n vertices and m edges. [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphPolynomial.html GraphPolynomial][n, x, Directed] returns a polynomial in x in which the coefficient of x^m is the number of nonisomorphic directed graphs with n vertices and m edges.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphPower.html GraphPower][g, k] gives the kth power of graph g. This is the graph whose vertex set is identical to the vertex set of g and that contains an edge between vertices i and j for each path in g between vertices i and j of length at most k.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphSum.html GraphSum][g1, g2, ...] constructs the graph resulting from joining the edge lists of graphs g1, g2, and so forth.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GrayGraph.html GrayGraph] returns a 3-regular, 54-vertex graph that is edge-transitive but not vertex-transitive; the smallest known such example."
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GreedyVertexCover.html GreedyVertexCover][g] returns a vertex cover of graph g constructed using the greedy algorithm. This is a natural heuristic for constructing a vertex cover, but it can produce poor vertex covers.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/GroetzschGraph.html GroetzschGraph] returns the smallest triangle-free graph with chromatic number 4. This is identical to [http://reference.wolfram.com/mathematica/Combinatorica/ref/MycielskiGraph.html MycielskiGraph][4].
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianCycle.html HamiltonianCycle][g] finds a Hamiltonian cycle in graph g if one exists. [http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianCycle.html HamiltonianCycle][g, All] gives all Hamiltonian cycles of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianPath.html HamiltonianPath][g] finds a Hamiltonian path in graph g if one exists. [http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianPath.html HamiltonianPath][g, All] gives all Hamiltonian paths of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianQ.html HamiltonianQ][g] yields True if there exists a Hamiltonian cycle in graph g, or in other words, if there exists a cycle that visits each vertex exactly once.
 * Harary[k, n] constructs the minimal k-connected graph on n vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/HasseDiagram.html HasseDiagram][g] constructs a Hasse diagram of the relation defined by directed acyclic graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/HerschelGraph.html HerschelGraph] returns a graph object that represents a Herschel graph.
 * Highlight[g, p] displays g with elements in p highlighted. The second argument p has the form {s1, s2,...}, where the sis are disjoint subsets of vertices and edges of g. The options, [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexStyle.html HighlightedVertexStyle], [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeStyle.html HighlightedEdgeStyle], [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexColors.html HighlightedVertexColors], and [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeColors.html HighlightedEdgeColors] are used to determine the appearance of the highlighted elements of the graph. The default settings of the style options are [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexStyle.html HighlightedVertexStyle]->Disk[Large] and [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeStyle.html HighlightedEdgeStyle]->Thick. The options [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexColors.html HighlightedVertexColors] and [http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeColors.html HighlightedEdgeColors] are both set to {Black, Red, Blue, Green, Yellow, Purple, Brown, Orange, Olive, Pink, [http://reference.wolfram.com/mathematica/Combinatorica/ref/DeepPink.html DeepPink], [http://reference.wolfram.com/mathematica/Combinatorica/ref/DarkGreen.html DarkGreen], Maroon, Navy}. The colors are chosen from the palette of colors with color 1 used for s1, color 2 used for s2, and so on. If there are more parts than colors, then the colors are used cyclically. The function permits all the options that [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html SetGraphOptions] permits, for example, [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexColor.html VertexColor], [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexStyle.html VertexStyle], [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeColor.html EdgeColor], and [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeStyle.html EdgeStyle]. These options can be used to control the appearance of the non-highlighted vertices and edges.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/IntervalGraph.html IntervalGraph][l] constructs the interval graph defined by the list of intervals l.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/InversionPoset.html InversionPoset][n] returns a Hasse diagram of the partially ordered set on size-n permutations in which p < q if q can be obtained from p by an adjacent transposition that places the larger element before the smaller. The function takes two options: Type and [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel], with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel] is set to True, labels are produced for the vertices.
 * Isomorphism[g, h] gives an isomorphism between graphs g and h if one exists. Isomorphism[g, h, All] gives all isomorphisms between graphs g and h. Isomorphism[g] gives the automorphism group of g. This function takes an option Invariants -> {f1, f2, ...}, where f1, f2, ... are functions that are used to compute vertex invariants. These functions are used in the order in which they are specified. The default value of Invariants is {[http://reference.wolfram.com/mathematica/Combinatorica/ref/DegreesOf2Neighborhood.html DegreesOf2Neighborhood], [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOf2Paths.html NumberOf2Paths], Distances}.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/IsomorphismQ.html IsomorphismQ][g, h, p] tests if permutation p defines an isomorphism between graphs g and h.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/KnightsTourGraph.html KnightsTourGraph][m, n] returns a graph with m*n vertices in which each vertex represents a square in an m x n chessboard and each edge corresponds to a legal move by a knight from one square to another.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/LabeledTreeToCode.html LabeledTreeToCode][g] reduces the tree g to its Prufer code.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/LeviGraph.html LeviGraph] returns the unique (8, 3)-cage, a 3-regular graph whose girth is 8.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html ListGraphs][n, m] returns all nonisomorphic undirected graphs with n vertices and m edges. [http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html ListGraphs][n, m, Directed] returns all nonisomorphic directed graphs with n vertices and m edges. [http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html ListGraphs][n] returns all nonisomorphic undirected graphs with n vertices. [http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html ListGraphs][n, Directed] returns all nonisomorphic directed graphs with n vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MakeGraph.html MakeGraph][v, f] constructs the graph whose vertices correspond to v and edges between pairs of vertices x and y in v for which the binary relation defined by the Boolean function f is True. [http://reference.wolfram.com/mathematica/Combinatorica/ref/MakeGraph.html MakeGraph] takes two options, Type and [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel]. Type can be set to Directed or Undirected and this tells [http://reference.wolfram.com/mathematica/Combinatorica/ref/MakeGraph.html MakeGraph] whether to construct a directed or an undirected graph. The default setting is Directed. [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel] can be set to True or False, with False being the default setting. Using [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel] -> True assigns labels derived from v to the vertices of the graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximalMatching.html MaximalMatching][g] gives the list of edges associated with a maximal matching of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximumAntichain.html MaximumAntichain][g] gives a largest set of unrelated vertices in partial order g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximumIndependentSet.html MaximumIndependentSet][g] finds a largest independent set of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximumSpanningTree.html MaximumSpanningTree][g] uses Kruskal's algorithm to find a maximum spanning tree of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/McGeeGraph.html McGeeGraph] returns the unique (7, 3)-cage, a 3-regular graph with girth 7.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MeredithGraph.html MeredithGraph] returns a 4-regular, 4-connected graph that is not Hamiltonian, providing a counterexample to a conjecture by C. St. J. A. Nash-Williams.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumChainPartition.html MinimumChainPartition][g] partitions partial order g into a minimum number of chains.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumChangePermutations.html MinimumChangePermutations][l] constructs all permutations of list l such that adjacent permutations differ by only one transposition.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumSpanningTree.html MinimumSpanningTree][g] uses Kruskal's algorithm to find a minimum spanning tree of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumVertexColoring.html MinimumVertexColoring][g] returns a minimum vertex coloring of g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumVertexColoring.html MinimumVertexColoring][g, k] returns a k-coloring of g, if one exists.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumVertexCover.html MinimumVertexCover][g] finds a minimum vertex cover of graph g. For bipartite graphs, the function uses the polynomial-time Hungarian algorithm. For everything else, the function uses brute force.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/MycielskiGraph.html MycielskiGraph][k] returns a triangle-free graph with chromatic number k, for any positive integer k.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html NetworkFlow][g, source, sink] returns the value of a maximum flow through graph g from source to sink. [http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html NetworkFlow][g, source, sink, Edge] returns the edges in g that have positive flow along with their flows in a maximum flow from source to sink. [http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html NetworkFlow][g, source, sink, Cut] returns a minimum cut between source and sink. [http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html NetworkFlow][g, source, sink, All] returns the adjacency list of g along with flows on each edge in a maximum flow from source to sink. g can be a directed or an undirected graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlowEdges.html NetworkFlowEdges][g, source, sink] returns the edges of the graph with positive flow, showing the distribution of a maximum flow from source to sink in graph g. This is obsolete, and [http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html NetworkFlow][g, source, sink, Edge] should be used instead.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NonLineGraphs.html NonLineGraphs] returns a graph whose connected components are the 9 graphs whose presence as a vertex-induced subgraph in a graph g makes g a nonline graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NoPerfectMatchingGraph.html NoPerfectMatchingGraph] returns a connected graph with 16 vertices that contains no perfect matching.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NormalizeVertices.html NormalizeVertices][v] gives a list of vertices with a similar embedding as v but with all coordinates of all points scaled to be between 0 and 1.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOf2Paths.html NumberOf2Paths][g, v] returns a sorted list that contains the number of paths of length 2 to different vertices of g from v.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfDirectedGraphs.html NumberOfDirectedGraphs][n] returns the number of nonisomorphic directed graphs with n vertices. [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfDirectedGraphs.html NumberOfDirectedGraphs][n, m] returns the number of nonisomorphic directed graphs with n vertices and m edges.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfGraphs.html NumberOfGraphs][n] returns the number of nonisomorphic undirected graphs with n vertices. [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfGraphs.html NumberOfGraphs][n, m] returns the number of nonisomorphic undirected graphs with n vertices and m edges.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfKPaths.html NumberOfKPaths][g, v, k] returns a sorted list that contains the number of paths of length k to different vertices of g from v. [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfKPaths.html NumberOfKPaths][al, v, k] behaves identically, except that it takes an adjacency list al as input.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfSpanningTrees.html NumberOfSpanningTrees][g] gives the number of labeled spanning trees of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/OddGraph.html OddGraph][n] returns the graph whose vertices are the size-(n-1) subsets of a size-(2n-1) set and whose edges connect pairs of vertices that correspond to disjoint subsets. [http://reference.wolfram.com/mathematica/Combinatorica/ref/OddGraph.html OddGraph][3] is the Petersen graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/OrientGraph.html OrientGraph][g] assigns a direction to each edge of a bridgeless, undirected graph g, so that the graph is strongly connected.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ParentsToPaths.html ParentsToPaths][l, i, j] takes a list of parents l and returns the path from i to j encoded in the parent list. [http://reference.wolfram.com/mathematica/Combinatorica/ref/ParentsToPaths.html ParentsToPaths][l, i] returns the paths from i to all vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/PartialOrderQ.html PartialOrderQ][g] yields True if the binary relation defined by edges of the graph g is a partial order, meaning it is transitive, reflexive, and antisymmetric. [http://reference.wolfram.com/mathematica/Combinatorica/ref/PartialOrderQ.html PartialOrderQ][r] yields True if the binary relation defined by the square matrix r is a partial order.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/PartitionLattice.html PartitionLattice][n] returns a Hasse diagram of the partially ordered set on set partitions of 1 through n in which p < q if q is finer than p, that is, each block in q is contained in some block in p. The function takes two options: Type and [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel], with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel] is set to True, labels are produced for the vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/PerfectQ.html PerfectQ][g] yields True if g is a perfect graph, meaning that for every induced subgraph of g the size of a largest clique equals the chromatic number.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/PermutationGraph.html PermutationGraph][p] gives the permutation graph for the permutation p.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/PlanarQ.html PlanarQ][g] yields True if graph g is planar, meaning it can be drawn in the plane so no two edges cross.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/PseudographQ.html PseudographQ][g] yields True if graph g is a pseudograph, meaning it contains self-loops.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RadialEmbedding.html RadialEmbedding][g, v] constructs a radial embedding of the graph g in which vertices are placed on concentric circles around v depending on their distance from v. [http://reference.wolfram.com/mathematica/Combinatorica/ref/RadialEmbedding.html RadialEmbedding][g] constructs a radial embedding of graph g, radiating from the center of the graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomTree.html RandomTree][n] constructs a random labeled tree on n vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomVertices.html RandomVertices][g] assigns a random embedding to graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html RankedEmbedding][l] takes a set partition l of vertices {1, 2,..., n} and returns an embedding of the vertices in the plane such that the vertices in each block occur on a vertical line with block 1 vertices on the leftmost line, block 2 vertices in the next line, and so on. [http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html RankedEmbedding][g, l] takes a graph g and a set partition l of the vertices of g and returns the graph g with vertices embedded according to [http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html RankedEmbedding][l]. [http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html RankedEmbedding][g, s] takes a graph g and a set s of vertices of g and returns a ranked embedding of g in which vertices in s are in block 1, vertices at distance 1 from any vertex in block 1 are in block 2, and so on.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RankGraph.html RankGraph][g, l] partitions the vertices into classes based on the shortest geodesic distance to a member of list l.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ReadGraph.html ReadGraph][f] reads a graph represented as edge lists from file f and returns a graph object.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ReflexiveQ.html ReflexiveQ][g] yields True if the adjacency matrix of g represents a reflexive binary relation.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RegularGraph.html RegularGraph][k, n] constructs a semirandom k-regular graph on n vertices, if such a graph exists.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RegularQ.html RegularQ][g] yields True if g is a regular graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ResidualFlowGraph.html ResidualFlowGraph][g, flow] returns the directed residual flow graph for graph g with respect to flow.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RobertsonGraph.html RobertsonGraph] returns a 19-vertex graph that is the unique (4, 5)-cage graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RootedEmbedding.html RootedEmbedding][g, v] constructs a rooted embedding of graph g with vertex v as the root. [http://reference.wolfram.com/mathematica/Combinatorica/ref/RootedEmbedding.html RootedEmbedding][g] constructs a rooted embedding with a center of g as the root.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/RotateVertices.html RotateVertices][v, theta] rotates each vertex position in list v by theta radians about the origin (0, 0). [http://reference.wolfram.com/mathematica/Combinatorica/ref/RotateVertices.html RotateVertices][g, theta] rotates the embedding of the graph g by theta radians about the origin (0, 0).
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SelfComplementaryQ.html SelfComplementaryQ][g] yields True if graph g is self-complementary, meaning it is isomorphic to its complement.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html SetEdgeWeights][g] assigns random real weights in the range [0, 1] to edges in g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html SetEdgeWeights] accepts options [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html WeightingFunction] and [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html WeightRange]. [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html WeightingFunction] can take values Random, [http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomInteger.html RandomInteger], Euclidean, or LNorm[n] for nonnegative n, or any pure function that takes two arguments, each argument having the form {Integer, {Number, Number}}. [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html WeightRange] can be an integer range or a real range. The default value for [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html WeightingFunction] is Random and the default value for [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html WeightRange] is [0, 1]. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html SetEdgeWeights][g, e] assigns edge weights to the edges in the edge list e. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html SetEdgeWeights][g, w] assigns the weights in the weight list w to the edges of g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html SetEdgeWeights][g, e, w] assigns the weights in the weight list w to the edges in edge list e.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html SetGraphOptions][g, opts] returns g with the options opts set. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html SetGraphOptions][g, {v1, v2, ..., vopts}, gopts] returns the graph with the options vopts set for vertices v1, v2, ... and the options gopts set for the graph g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html SetGraphOptions][g, {e1, e2,..., eopts}, gopts], with edges e1, e2,..., works similarly. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html SetGraphOptions][g, {{elements1, opts1}, {elements2, opts2},...}, opts] returns g with the options opts1 set for the elements in the sequence elements1, the options opts2 set for the elements in the sequence elements2, and so on. Here, elements can be a sequence of edges or a sequence of vertices. A tag that takes on values One or All can also be passed in as an argument before any options. The default value of the tag is All and it is useful if the graph has multiple edges. It informs the function about whether all edges that connect a pair of vertices are to be affected or only one edge is affected.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexLabels.html SetVertexLabels][g, l] assigns the labels in l to vertices of g. If l is shorter than the number of vertices in g, then labels get assigned cyclically. If l is longer than the number of vertices in g, then the extra labels are ignored."
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html SetVertexWeights][g] assigns random real weights in the range [0, 1] to vertices in g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html SetVertexWeights] accepts options [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html WeightingFunction] and [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html WeightRange]. [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html WeightingFunction] can take values Random, [http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomInteger.html RandomInteger], or any pure function that takes two arguments, an integer as the first argument and a pair {number, number} as the second argument. [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html WeightRange] can be an integer range or a real range. The default value for [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html WeightingFunction] is Random and the default value for [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html WeightRange] is [0, 1]. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html SetVertexWeights][g, w] assigns the weights in the weight list w to the vertices of g. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html SetVertexWeights][g, vs, w] assigns the weights in the weight list w to the vertices in the vertex list vs.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ShakeGraph.html ShakeGraph][g, d] performs a random perturbation of the vertices of graph g, with each vertex moving, at most, a distance d from its original position.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ShortestPathSpanningTree.html ShortestPathSpanningTree][g, v] constructs a shortest-path spanning tree rooted at v, so that a shortest path in graph g from v to any other vertex is a path in the tree. An option Algorithm that takes on the values Automatic, Dijkstra, or [http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html BellmanFord] is provided. This allows a choice between Dijkstra's algorithm and the Bellman-Ford algorithm. The default is Algorithm -> Automatic. In this case, depending on whether edges have negative weights and depending on the density of the graph, the algorithm chooses between Bellman-Ford and Dijkstra.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ShowLabeledGraph.html ShowLabeledGraph][g] displays graph g according to its embedding, with each vertex labeled with its vertex number. [http://reference.wolfram.com/mathematica/Combinatorica/ref/ShowLabeledGraph.html ShowLabeledGraph][g, l] uses the ith element of list l as the label for vertex i.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ShuffleExchangeGraph.html ShuffleExchangeGraph][n] returns the n-dimensional shuffle-exchange graph whose vertices are length n binary strings with an edge from w to w' if (i) w' differs from w in its last bit or (ii) w' is obtained from w by a cyclic shift left or a cyclic shift right. An option [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html VertexLabel] is provided, with default setting False, which can be set to True, if the user wants to associate the binary strings to the vertices as labels."
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SimpleQ.html SimpleQ][g] yields True if g is a simple graph, meaning it has no multiple edges and contains no self-loops.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SmallestCyclicGroupGraph.html SmallestCyclicGroupGraph] returns a smallest nontrivial graph whose automorphism group is cyclic.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SpringEmbedding.html SpringEmbedding][g] beautifies the embedding of graph g by modeling the embedding as a system of springs. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SpringEmbedding.html SpringEmbedding][g, step, increment] can be used to refine the algorithm. The value of step tells the function for how many iterations to run the algorithm. The value of increment tells the function the distance to move the vertices at each step. The default values are 10 and 0.15 for step and increment, respectively.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/StronglyConnectedComponents.html StronglyConnectedComponents][g] gives the strongly connected components of directed graph g as lists of vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/SymmetricQ.html SymmetricQ][r] tests if a given square matrix r represents a symmetric relation. [http://reference.wolfram.com/mathematica/Combinatorica/ref/SymmetricQ.html SymmetricQ][g] tests if the edges of a given graph represent a symmetric relation.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ThomassenGraph.html ThomassenGraph] returns a hypotraceable graph, a graph G that has no Hamiltonian path but whose subgraph G-v for every vertex v has a Hamiltonian path.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ToAdjacencyLists.html ToAdjacencyLists][g] constructs an adjacency list representation for graph g. It allows an option called Type that takes on values All or Simple. Type -> All is the default setting of the option, and this permits self-loops and multiple edges to be reported in the adjacency lists. Type -> Simple deletes self-loops and multiple edges from the constructed adjacency lists. [http://reference.wolfram.com/mathematica/Combinatorica/ref/ToAdjacencyLists.html ToAdjacencyLists][g, [http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeWeight.html EdgeWeight]] returns an adjacency list representation along with edge weights.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ToOrderedPairs.html ToOrderedPairs][g] constructs a list of ordered pairs representing the edges of the graph g. If g is undirected each edge is interpreted as two ordered pairs. An option called Type that takes on values Simple or All can be used to affect the constructed representation. Type -> Simple forces the removal of multiple edges and self-loops. Type -> All keeps all information and is the default option.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/ToUnorderedPairs.html ToUnorderedPairs][g] constructs a list of unordered pairs representing the edges of graph g. Each edge, directed or undirected, results in a pair in which the smaller vertex appears first. An option called Type that takes on values All or Simple can be used, and All is the default value. Type -> Simple ignores multiple edges and self-loops in g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TransitiveReduction.html TransitiveReduction][g] finds a smallest graph that has the same transitive closure as g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TranslateVertices.html TranslateVertices][v, {x, y}] adds the vector {x, y} to the vertex embedding location of each vertex in list v. [http://reference.wolfram.com/mathematica/Combinatorica/ref/TranslateVertices.html TranslateVertices][g, {x, y}] translates the embedding of the graph g by the vector {x, y}.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TravelingSalesman.html TravelingSalesman][g] finds an optimal traveling salesman tour in a Hamiltonian graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TravelingSalesmanBounds.html TravelingSalesmanBounds][g] gives upper and lower bounds on a minimum cost traveling salesman tour of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TreeIsomorphismQ.html TreeIsomorphismQ][t1, t2] yields True if the trees t1 and t2 are isomorphic. It yields False otherwise.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TreeQ.html TreeQ][g] yields True if graph g is a tree.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TreeToCertificate.html TreeToCertificate][t] returns a binary string that is a certificate for the tree t such that trees have the same certificate if and only if they are isomorphic.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TriangleInequalityQ.html TriangleInequalityQ][g] yields True if the weights assigned to the edges of graph g satisfy the triangle inequality.
 * Turan[n, p] constructs the Turan graph, the extremal graph on n vertices that does not contain [http://reference.wolfram.com/mathematica/Combinatorica/ref/CompleteGraph.html CompleteGraph][p].
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/TutteGraph.html TutteGraph] returns the Tutte graph, the first known example of a 3-connected, 3-regular, planar graph that is non-Hamiltonian.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/Uniquely3ColorableGraph.html Uniquely3ColorableGraph] returns a 12-vertex, triangle-free graph with chromatic number 3 that is uniquely 3-colorable.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/UnitransitiveGraph.html UnitransitiveGraph] returns a 20-vertex, 3-unitransitive graph discovered by Coxeter, that is not isomorphic to a 4-cage or a 5-cage.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/UnweightedQ.html UnweightedQ][g] yields True if all edge weights are 1 and False otherwise.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexColoring.html VertexColoring][g] uses Brelaz's heuristic to find a good, but not necessarily minimal, vertex coloring of graph g. An option Algorithm that can take on the values Brelaz or Optimum is allowed. The setting Algorithm -> Brelaz is the default, while the setting Algorithm -> Optimum forces the algorithm to do an exhaustive search to find an optimum vertex coloring.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexConnectivity.html VertexConnectivity][g] gives the minimum number of vertices whose deletion from graph g disconnects it. [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexConnectivity.html VertexConnectivity][g, Cut] gives a set of vertices of minimum size, whose removal disconnects the graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexConnectivityGraph.html VertexConnectivityGraph][g] returns a directed graph that contains an edge corresponding to each vertex in g and in which edge disjoint paths correspond to vertex disjoint paths in g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexCover.html VertexCover][g] returns a vertex cover of the graph g. An option Algorithm that can take on values Greedy, Approximate, or Optimum is allowed. The default setting is Algorithm -> Approximate. Different algorithms are used to compute a vertex cover depending on the setting of the option Algorithm.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexCoverQ.html VertexCoverQ][g, c] yields True if the vertices in list c define a vertex cover of graph g.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexWeight.html VertexWeight] is an option that allows the user to associate weights with vertices. 0 is the default weight. [http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexWeight.html VertexWeight] can be set as part of the graph data structure.
 * Vertices[g] gives the embedding of graph g, that is, the coordinates of each vertex in the plane. Vertices[g, All] gives the embedding of the graph along with graphics options associated with each vertex.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/WaltherGraph.html WaltherGraph] returns the Walther graph.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/WeaklyConnectedComponents.html WeaklyConnectedComponents][g] gives the weakly connected components of directed graph g as lists of vertices.
 * [http://reference.wolfram.com/mathematica/Combinatorica/ref/WriteGraph.html WriteGraph][g, f] writes graph g to file f using an edge list representation.
 * Zoom[{i, j, k, ...}] is a value that the [http://reference.wolfram.com/mathematica/Combinatorica/ref/PlotRange.html PlotRange] option can take on in [http://reference.wolfram.com/mathematica/Combinatorica/ref/ShowGraph.html ShowGraph]. Setting [http://reference.wolfram.com/mathematica/Combinatorica/ref/PlotRange.html PlotRange] to this value zooms the display to contain the specified subset of vertices, i, j, k, ....
== Combinatorica functions implemented, but not included yet ==
 * Trac #904:
  * graph.is_clique: CliqueQ[g, c] yields True if the list of vertices c defines a clique in graph g.  Also g.is_clique(directed_clique=True) is equivalent to CompleteQ.
  * graph.is_independent_set: IndependentSetQ[g, i] yields True if the vertices in list i define an independent set in graph g.  g.is_independent_set() is equivalent to EmptyQ as well.
