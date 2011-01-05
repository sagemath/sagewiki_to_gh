= Sage Interactions =

This is a collection of pages demonstrating the use of [[http://sagemath.org/doc/reference/sagenb/notebook/interact.html#sagenb.notebook.interact.interact|the interact command]] in Sage. It should be easy to just scroll through and copy/paste examples into Sage notebooks. If you have suggestions on how to improve interact, add them [[interactSuggestions|here]] or email sage-support@googlegroups.com . Of course, your own examples are also welcome!

 * [[interact/algebra|Algebra]]
 * [[interact/bio|Bioinformatics]]
 * [[interact/calculus|Calculus]]
 * [[interact/chemistry|Chemistry]]
 * [[interact/diffeq|Differential Equations]]
 * [[interact/graphics|Drawing Graphics]]
 * [[interact/dynsys|Dynamical Systems]]
 * [[interact/fractal|Fractals]]
 * [[interact/games|Games and Diversions]]
 * [[interact/geometry|Geometry]]
 * [[interact/graph_theory|Graph Theory]]
 * [[interact/linear_algebra|Linear Algebra]]
 * [[interact/misc|Miscellaneous]]
 * [[interact/number_theory|Number Theory]]
 * [[interact/stats|Statistics/Probability]]
 * [[interact/web|Web Applications]]

== Explanatory example: Taylor Series ==

This is the code and a mockup animation of the interact command. It defines a slider, seen on top, that can be dragged. Once dragged, it changes the value of the variable "order" and the whole block of code gets evaluated. This principle can be seen in various examples presented on the pages above!

{{{#!python numbers=none
var('x')
x0  = 0
f   = sin(x)*e^(-x)
p   = plot(f,-1,5, thickness=2)
dot = point((x0,f(x=x0)),pointsize=80,rgbcolor=(1,0,0))
@interact
def _(order=(1..12)):
  ft = f.taylor(x,x0,order)
  pt = plot(ft,-1, 5, color='green', thickness=2)
  html('$f(x)\;=\;%s$'%latex(f))
  html('$\hat{f}(x;%s)\;=\;%s+\mathcal{O}(x^{%s})$'%(x0,latex(ft),order+1))
  show(dot + p + pt, ymin = -.5, ymax = 1)
}}}
{{attachment:taylor_series_animated.gif}}
