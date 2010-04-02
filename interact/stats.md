= Sage Interactions - Statistics and Probability =
goto [[interact|interact main page]]


<<TableOfContents>>

== A Random Walk ==

by William Stein

{{{
html('<h1>A Random Walk</h1>')
vv = []; nn = 0
@interact
def foo(pts = checkbox(True, "Show points"), 
        refresh = checkbox(False, "New random walk every time"),
        steps = (50,(10..500))):
    # We cache the walk in the global variable vv, so that
    # checking or unchecking the points checkbox doesn't change
    # the random walk. 
    html("<h2>%s steps</h2>"%steps)
    global vv
    if refresh or len(vv) == 0:
        s = 0; v = [(0,0)]
        for i in range(steps): 
             s += random() - 0.5
             v.append((i, s)) 
        vv = v
    elif len(vv) != steps:
        # Add or subtract some points
        s = vv[-1][1]; j = len(vv)
        for i in range(steps - len(vv)):
            s += random() - 0.5
            vv.append((i+j,s))
        v = vv[:steps]
    else:
        v = vv
    L = line(v, rgbcolor='#4a8de2')
    if pts: L += points(v, pointsize=10, rgbcolor='red')
    show(L, xmin=0, figsize=[8,3])
}}}
{{attachment:randomwalk.png}}

== 3D Random Walk ==
{{{
@interact
def rwalk3d(n=(50,1000), frame=True):
    pnt = [0,0,0]
    v = [copy(pnt)]
    for i in range(n):
        pnt[0] += random()-0.5
        pnt[1] += random()-0.5
        pnt[2] += random()-0.5
        v.append(copy(pnt))
    show(line3d(v,color='black'),aspect_ratio=[1,1,1],frame=frame)
}}}
{{attachment:randomwalk3d.png}}


== Hidden Markov Model: The Occasionally Dishonest Casino ==

by Marshall Hampton
based on the classic example in "Biological Sequence Analysis" by Durbin et al.
To get the dice picture you need to download this {{dishonest_casino.sws|worksheet copy}}
{{{
m = hmm.DiscreteHiddenMarkovModel([[0.8,0.2],[0.1,0.9]], [[1/10,1/10,1/10,1/10,1/10,1/2],[1/6,1/6,1/6,1/6,1/6,1/6]], [.2,.8],emission_symbols=[1,2,3,4,5,6])
@interact
def dishonest_casino(auto_update=False):
    test = list(m.generate_sequence(80))
    a = os.system('cp '+DATA+'dice_sm.png ./dice.png')
    vit_test = list(m.viterbi(test[0])[0])
    html('<h3>The Occasionally Dishonest Casino</h3>')
    html('<img src="'+DATA+'dice_sm.png">')
    html('Emissions:'+str(test[0]).replace(',','').replace(' ','')[1:-1])
    vit_str = str(vit_test).replace(',','').replace(' ','')
    vit_str = vit_str.replace('1','F').replace('0','<font color="#FF0000">L</font>')[1:-1]
    html('Viterbi:  '+vit_str)
    actual_str = str(list(test[1])).replace(',','').replace(' ','')
    actual_str = actual_str.replace('1','F').replace('0','<font color="#FF0000">L</font>')[1:-1]
    html('Actual:   '+ actual_str)
}}} 
{{attachment:hmm_casino.png}}
