= List of Computations where Sage is Noticeably Faster than Magma.... =

A binary of Sage 4.0.1-rc1 is available at /home/wbhart/sage-4.0.1.rc1/sage on eno

A binary of Magma is available in /usr/local/magma-2.15/bin

== Machines used ==

eno: (a script to stop background processes for benchmarking purposes is available at /home/wbhart/script - but please stop it when done)

{{{
4-core: model name	: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz
}}}

== Benchmarks ==

* Computing factorials (Sage is more than twice the speed).

{{{
[wbhart@eno sage-4.0.1.rc1]$ ./sage
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: magma.version()
((2, 15, 8), 'V2.15-8')
sage: time n = factorial(10^6)
CPU times: user 0.57 s, sys: 0.01 s, total: 0.58 s
Wall time: 0.59 s
sage: time magma.eval('time n := Factorial(10^6);')
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 1.45 s
'Time: 1.440'
sage: time magma.eval('time n := Factorial(10^7);')
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 27.33 s
'Time: 27.300'
sage: time n = factorial(10^7)
CPU times: user 11.50 s, sys: 0.25 s, total: 11.75 s
Wall time: 11.75 s
sage: 27.30/11.75
2.32340425531915
}}}

* Large degree polynomial multiplication modulo n (Sage is three times as fast).

{{{
[wbhart@eno sage-4.0.1.rc1]$ ./sage
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: magma.version()
((2, 15, 8), 'V2.15-8')
sage: R.<t> = Zmod(next_prime(8000^3))[]
sage: ff = R.random_element(degree=3200)
sage: time v = [ff*ff for i in [1..100]]
CPU times: user 0.18 s, sys: 0.00 s, total: 0.18 s
Wall time: 0.18 s
sage: S = magma(R)
sage: f = magma(ff)
sage: magma.eval('time z:=[%s*%s : i in [1..100]]'%(f.name(), f.name()))
'Time: 0.530'
}}}

* Large degree polynomial multiplication over ZZ (Sage is five times as fast).

{{{
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: R.<x>=ZZ['x']
sage: ff = R.random_element(degree=3200)
sage: gg = R.random_element(degree=3200)
sage: time v = [ff*gg^i for i in [1..40]]
CPU times: user 22.29 s, sys: 0.22 s, total: 22.50 s
Wall time: 22.51 s
sage: S = magma(R)
sage: f = magma(ff)
sage: g = magma(gg)
sage: magma.eval('time z:=[%s*%s^i : i in [1..40]]'%(f.name(), g.name()))
'Time: 112.820'
}}}

* Sage is asymptotically faster for Quotrem over ZZ (used in computation of Sturm sequences)

{{{
sage: R.<x>=ZZ['x']
sage: ff = R.random_element(degree=10000)
sage: gg = R.random_element(degree=5000)
sage: time v=ff.quo_rem(gg)
CPU times: user 0.17 s, sys: 0.02 s, total: 0.18 s
Wall time: 0.18 s

sage: f=magma(ff)
sage: g=magma(gg)
sage: magma.eval('time z:=Quotrem(%s,%s)'%(f.name(), g.name()))
'Time: 1.970'
}}}

* Exact logarithm of integers is faster in Sage.

{{{
sage: def zlog(m, n, k):
....:         for i in range(0, m/1000):
....:             a = ZZ.random_element(n)+2
....:             b = ZZ.random_element(k)
....:             c = a^b
....:             for j in range (0, 1000):
....:                 c.exact_log(a)
....:
sage: time zlog(1000000, 100, 100)
CPU times: user 0.62 s, sys: 0.23 s, total: 0.85 s
Wall time: 0.85 s
sage: time zlog(1000000, 2^50, 100)
CPU times: user 2.10 s, sys: 0.27 s, total: 2.36 s
Wall time: 2.36 s
sage: time zlog(1000000, 100, 2^10)
CPU times: user 1.75 s, sys: 0.26 s, total: 2.01 s
Wall time: 2.01 s
}}}

{{{
> procedure z_log(m, n, k)
procedure> for i := 0 to (m div 1000) do
procedure|for> a := Random(n) + 2;
procedure|for> b := Random(k);
procedure|for> c := a^b;
procedure|for> for j := 1 to 1000 do
procedure|for|for> d := Ilog(a, c);
procedure|for|for> end for;
procedure|for> end for;
procedure> end procedure;
> time z_log(1000000, 100, 100);
Time: 1.180
> time z_log(1000000, 2^50, 100);
Time: 5.830
> time z_log(1000000, 100, 2^10);
Time: 6.450
}}}

* Rank of random dense matrices over GF(2) (Sage is more than twice the speed).

{{{
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: A = random_matrix(GF(2),10^4,10^4)
sage: %time A.rank()
CPU times: user 1.20 s, sys: 0.01 s, total: 1.20 s
Wall time: 1.20 s
9999

sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.rank()
CPU times: user 9.34 s, sys: 0.02 s, total: 9.36 s
Wall time: 9.36 s
19937

sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.echelonize(algorithm='pluq')
CPU times: user 6.79 s, sys: 0.01 s, total: 6.80 s
Wall time: 6.80 s

sage: A = random_matrix(GF(2),3.2*10^4,3.2*10^4)
sage: %time A.rank()
CPU times: user 31.57 s, sys: 0.05 s, total: 31.62 s
Wall time: 31.63 s
19937

sage: %time A.echelonize(algorithm='pluq')
CPU times: user 27.10 s, sys: 0.04 s, total: 27.14 s
Wall time: 27.15 s
}}}

{{{
Magma V2.15-8     Thu Jun  4 2009 21:58:05 on eno      [Seed = 3168701748]
Type ? for help.  Type <Ctrl>-D to quit.
> A:=RandomMatrix(GF(2),10^4,10^4);
> time Rank(A);
9999
Time: 3.040

> A:=RandomMatrix(GF(2),2*10^4,2*10^4);
> time Rank(A);
19999
Time: 17.750

> A:=RandomMatrix(GF(2),32*10^3,32*10^3);
> time Rank(A);
31999
Time: 62.980

}}}

* Fast HNF and determinant for integer matrices, especially as the entries get large.

 http://wstein.org/papers/hnf/hnf.pdf

* Modular composition over GF(2)

{{{
sage: P.<x> = GF(2)[]  
sage: d = 5*10^4; f,g,h = P.random_element(d),P.random_element(d),P.random_element(d)
sage: %time r = f.modular_composition(g,h)                                           
CPU times: user 2.69 s, sys: 0.01 s, total: 2.69 s                                   
Wall time: 2.70 s  
}}}

{{{
sage: fM,gM,hM = magma(f),magma(g),magma(h)
sage: t = magma.cputime(); rM = fM.ModularComposition(gM,hM); magma.cputime(t)
13.44
sage: rM == magma(r)
True
}}}


{{{
sage: d = 5*10^5; f,g,h = P.random_element(d),P.random_element(d),P.random_element(d)
sage: %time r = f.modular_composition(g,h)
^ACPU times: user 288.13 s, sys: 0.14 s, total: 288.26 s
Wall time: 288.34 s

sage: %time r = f.modular_composition(g,h,algorithm='ntl')
CPU times: user 303.45 s, sys: 0.04 s, total: 303.49 s
Wall time: 303.60 s

sage: fM,gM,hM = magma(f),magma(g),magma(h)
sage: t = magma.cputime(); rM = fM.ModularComposition(gM,hM); magma.cputime(t)
832.03999999999996
}}}

* Sage computes ranks of elliptic curves and generators, fast... and correctly (see Rogers, N.F., Rank Computations for the congruent number elliptic curves, Experimental Mathematics, 9 (2000), 591-594.)

{{{
sage: D=6611719866
sage: E=EllipticCurve([0,0,0,-D^2,0])
sage:  time E.rank()
CPU times: user 0.01 s, sys: 0.01 s, total: 0.02 s
Wall time: 3.20 s
6
sage:  time E.gens()
CPU times: user 0.07 s, sys: 0.06 s, total: 0.13 s
Wall time: 5.89 s

[(247424194842066/37249 : 373863724821481185720/7189057 : 1),
 (165541824817/16 : 51806810701954601/64 : 1),
 (15062000442 : 1660900534642656 : 1),
 (548503784857/36 : -365985935192610019/216 : 1),
 (11638545941238203281/246490000 : 39314069377271931544287972679/3869893000000 : 1),
 (514136077885092448181278/169697035249 : -368651568597676351513664298941602072/69905505791578807 : 1)]
}}}

{{{
> D:=6611719866;
> E:=EllipticCurve([0,0,0,-D^2,0]);
> time Rank(E);
Warning: rank computed (2) is only a lower bound
(It may still be correct, though)
2
Time: 9.640
> time Generators(E);
Height bound (50.6331) on point search is too large -- reducing to 15.0000
This means that the computed group may only generate a group of finite
index in the actual group.
[ (-6611719866 : 0 : 1), (0 : 0 : 1), (-156630507 : -82723846945707 : 1),
(213545146551959209/902500 : -98642697824946986013197323/857375000 : 1) ]
Time: 57.970
}}}

= ....But Magma has the following features which Sage doesn't have (yet) =

* fast and correct multivariate polynomial factorisation algorithm

* fast Gröbner basis computations mod p (p > 2, p prime) and QQ

* fast GCD of multivariate polynomials

* 3, 4, and 8 descent

* fast computation of Riemann/Siegel theta functions

* fast dense linear algebra over finite extension fields
