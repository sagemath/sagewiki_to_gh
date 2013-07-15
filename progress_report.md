Here is the Benford Checker [[attachment:Benford.py]]. If you want to use it in conjunction with elliptic divisibility sequences, which are not in Sage, Kate Stange has a class to deal with these on [[http://math.colorado.edu/~kstange/scripts.html | her website]]. Some notes on this:

 * You should only use this with non-integer bases, because the computations are suffering some rounding errors since, as far as I know, Sage computes logs in non-integer bases by doing ln(number)/ln(b). Until the bug (which was reported) gets fixed in Sage, if you are using an int base in your logs, you should coerce the numbers into integers first and not leave them as reals, because those are calculated more accurately in Sage.

 * To use the classes in Sage, you have to attach it to your program using 'attach.' For example, I had it saved on my desktop, so I used 
   ''attach "/Users/amyfeaver/Desktop/Benford.py"''.

 * Currently the class can display: data_list, base, first_digit_count, Benford_prediction, chi_square, bar_graph and line_graph. So to get the bar graph you would do the following in Sage: sage: B=BenfordChecker(data list, base)   sage: B.bar_graph()

 * The output from chi_square should be formatted better at some point, but right now the output consists of (chi square value, "p"); a p value close to 1 seems to indicate that the list is close to Benford, and a p close to 0 seems to indicate little or no correlation.

 * Future improvements should include giving the user the option to choose colors and labels for the graph, and also changing the formatting to go along with whatever the standards are used in Sage.
