load "newton.magma";

R<x>:=PolynomialRing(Rationals());
R<T>:=PolynomialRing(Rationals());
C:=CremonaDatabase();

function ap(E,p)
	F:=FiniteField(p);
	return(Trace(E,F));
end function;

function MSEven(M,r)
 	return(ModularSymbolEven(M,r)[1]/4);
end function;

function MSOdd(M,r)
 	return(ModularSymbolOdd(M,r)[1]/4);
end function;

function MS_twist(M,r,D)
	answer:=0;
	for a in [0..Abs(D)-1] do
		if KroneckerSymbol(D,a) ne 0 then
			if D ge 0 then
				ms:=MSEven(M[1],r-a/D);
			else
				ms:=MSOdd(M[2],r+a/D);
			end if;
			answer:=answer+ms*KroneckerSymbol(D,a);
		end if;
	end for;

	return(answer);
end function;

Cremona:=CremonaDatabase();

function form_curve_ap(N,a_2,a_3,a_5,a_7)
	R<x>:=PolynomialRing(Rationals());
	M1:=ModularSymbols(N,2,+1);
	M2:=ModularSymbols(N,2,-1);
	I:=[<2,x-a_2>,<3,x-a_3>,<5,x-a_5>,<7,x-a_7>]; 
	V1:=Kernel(I,M1);
	V2:=Kernel(I,M2);
	MSEven(V1,1/2);
	ModularSymbolOdd(V2,1/2);

	return([V1,V2]);
end function;

function form_curve(N,k)
	E:=EllipticCurve(Cremona,N,k,1);
	a_2:=ap(E,2);
	a_3:=ap(E,3);
	a_5:=ap(E,5);
	a_7:=ap(E,7);
	
	return form_curve_ap(N,a_2,a_3,a_5,a_7);
end function;


function alphabet(k)
	case k:
		when 1: return("A");
		when 2: return("B");
		when 3: return("C");
		when 4: return("D");
		when 5: return("E");
		when 6: return("F");
		when 7: return("G");
		when 8: return("H");
		when 9: return("I");
		when 10: return("J");
		when 11: return("K");
		when 12: return("L");
		when 13: return("M");
		when 14: return("N");
		when 15: return("O");
		when 16: return("P");
		when 17: return("Q");
		when 18: return("R");
		when 19: return("S");
		when 20: return("T");
		when 21: return("U");
		when 22: return("V");
		when 23: return("W");
		when 24: return("X");
		when 25: return("Y");
		when 26: return("Z");
	end case;
end function;

function form_filename(N,k,p,sign)
  return(IntegerToString(N) cat alphabet(k) cat "." cat IntegerToString(p) cat "." cat IntegerToString(sign));
end function;

//Here answer = {a} mod p^m
function one_teich(a,p,m)
	local answer,t;

	if p ne 2 then
		answer := a mod p;
		for k in [2..m] do
			t := 0;
			while (answer + t*p^(k-1))^(p-1) mod p^k ne 1 do
				t := t+1;
			end while;
			answer := answer + t*p^(k-1); 
		end for;
	else
		if a mod 4 eq 1 then
			return(1);
		else
			return(-1);
		end if;
	end if;

	return(answer);
end function;
			
//Here answer[a] = {a} (mod p^m) 
function list_of_teich(p,m)
	local answer;

	answer := [];
	if p ne 2 then
		for a in [1..p-1] do
			Append(~answer,one_teich(a,p,m));
		end for;
	else
		for a in [1,3] do
			Append(~answer,one_teich(a,p,m));
		end for;
	end if;		
	return(answer);
end function;

function teich(a,p,TEICH)
	if p ne 2 then
		return(TEICH[a]);
	else
		assert a in [1,3];
		if a eq 1 then
			return(TEICH[1]);
		else
			return(TEICH[2]);
		end if;
	end if;
end function;

function form_alpha(N,p,a_p,D,m)
	assert N mod p^2 ne 0;
	assert a_p mod p ne 0;
	assert D mod p ne 0;

	if N mod p eq 0 then
		return(a_p*KroneckerSymbol(D,p));
	else
		a_p := a_p * KroneckerSymbol(D,p);
		temp := a_p mod p;
		for k in [2..m] do
			t := (-(temp^2-a_p*temp+p) div p^(k-1) mod p) * InverseMod(2*temp - a_p,p);
			temp := temp + t*p^(k-1);
		end for;
		return(temp);
	end if;
end function;

function Pn(V,p,n,D)
//	print "Computing at level ",n;
	R<T>:=PolynomialRing(Rationals());
	TEICH := list_of_teich(p,n+1);
	answer:=0;
	oneplusTpower:=1;
	gammapower:=1;
	if p ne 2 then
		gamma:=1+p;
		if p ne 3 then
			for j in [0..p^n-1] do  // if j mod 1000 eq 0 then print(j); end if;
				for a in [1..((p-1) div 2)] do 
					ms := MS_twist(V,gammapower * teich(a,p,TEICH)/p^(n+1),D); 
					answer := (answer + ms * oneplusTpower) ;
				end for;
				gammapower := gammapower * gamma;
				oneplusTpower := (oneplusTpower * (1+T));
			end for;
		else 
			for j in [0..p^n-1] do
				// if j mod 1000 eq 0 then print j; end if;
				ms := MS_twist(V,gammapower/p^(n+1),D);
				answer := answer + ms * oneplusTpower;
				gammapower := gammapower * gamma;
				oneplusTpower := oneplusTpower * (1+T);
			end for;
		end if;
	else
		gamma:=5;
		for j in [0..p^n-1] do
			ms := 2*MS_twist(V,gammapower/p^(n+2),D);
			answer := answer + ms * oneplusTpower;
			gammapower := gammapower * gamma;
			oneplusTpower := oneplusTpower * (1+T);
		end for;
	end if;

	return(answer);
end function;

function cyclotomic(p,n)
	if n gt 0 then
		answer:=0;
		for a in [0..p-1] do
			answer:=answer+(1+T)^(a*p^(n-1));
		end for;
		return(answer);
	else
		return(T);
	end if;
end function;

function Lfunc_ord(V,p,a_p,n,D)
        N:=Level(V[1]);
        assert N mod p^2 ne 0;
	assert a_p mod p ne 0;
        alpha:=form_alpha(N,p,a_p,D,11);
        P:=Pn(V,p,n,D);
        Q:=Pn(V,p,n-1,D);
        L:=1/alpha^n*P-1/alpha^(n+1)*Q*cyclotomic(p,n);

	return L;
end function;

function valuation_of_coefficients(f,p)
	answer := [];
	f:=f+0*T;
	if f eq 0 then
		return([10000]);
 	else
		for j in [1..Degree(f)+1] do
			if Coefficient(f,j-1) eq 0 then
				answer := answer cat [10000];
			else
				answer := answer cat [Valuation(Coefficient(f,j-1),p)];
			end if;
		end for;
	end if;

	return(answer);
end function;
		
function iwasawa_invariants_poly(f,p)
	m,l:=Min(valuation_of_coefficients(f,p));
	return m,l-1;
end function;

//num only counts in ss case where it
//denotes + or -
function max_level(a_p,p,num)
	if a_p mod p ne 0 then
		if p eq 2 then
			return(6);  //(ok to 31)
		else
			if p eq 3 then
				return(4); //(ok to 26)
			else 
				if p eq 5 then
					return(3); //(ok to 24)
				else
					return(2); //(ok to p-1)
				end if;
			end if;
		end if;
	end if;
	if num eq 1 then
		if p eq 2 then
			return(5); //(ok to 85)
		else
			return(3); //(ok to 20 resp. 104)
		end if;
	else
		if p eq 2 then
			return(4); //(ok to 42)
		else
			if p eq 3 then	
				return(3); //(ok to 60)
			else 
				return(2); //(p=5 ok to 20)
			end if;
		end if;
	end if;
end function;

function split(N,p,a_p,D)
	return((N mod p eq 0) and (KroneckerSymbol(D,p)*a_p eq 1));
end function;

function twisted_sign(e,N,D)
	return(e*KroneckerSymbol(D,N)*KroneckerSymbol(D,-1));
end function;

function iwasawa_invariants_ord(V,p,a_p,D,e)
	local cycl,N,P,Q,r,L,m,l;
	cycl:=[];
	N:=Level(V[1]);
	assert N mod p^2 ne 0;
	alpha:=form_alpha(N,p,a_p,D,11); 
	P:=Pn(V,p,0,D); 
	Q:=Pn(V,p,1,D); 
	lmw:=0;
	r:=0;
	L:=Q-1/alpha*P*cyclotomic(p,1); 
	if (twisted_sign(e,N,D) eq -1) or (not split(N,p,a_p,D) and (L mod T eq 0)) then
		cycl:=cycl cat [0];
		lmw:=1;
		r:=1; 
	end if;
	m,l:=iwasawa_invariants_poly(L,p); 
	if (m eq 0) then
		if(#cycl gt 0) and (cycl[1] eq 0) and (twisted_sign(e,N,D) eq 1) then
			lmw := lmw+1;
			r := 2;
		end if;
		if split(N,p,a_p,D) then
			return(<D,r,m,l,lmw,"split">);
		else
			return(<D,r,m,l,lmw>);
		end if;
	else
		n:=2;  
		while (n le max_level(a_p,p,1)) do //print(n);
			P:=Q;
			Q:=Pn(V,p,n,D);
			if (N mod p eq 0) then
				L:=Q;
			else;
				L:=Q-1/alpha*P*cyclotomic(p,n);  
			end if; 
			if L mod cyclotomic(p,n-1) eq 0 then
				cycl:=cycl cat [n-1];
				lmw := lmw + p^(n-1) - p^(n-2);
			end if;
			m,l:=iwasawa_invariants_poly(L,p); //print([m,l]);
			if (m eq 0) then
				if (#cycl gt 0) and (cycl[1] eq 0) and (twisted_sign(e,N,D) eq 1) then
					lmw := lmw+1;
					r := 2;
				end if;
				if not split(N,p,a_p,D) then
					return(<D,r,m,l,lmw>);
				else
					return(<D,r,m,l,lmw,"split">);
				end if;
			else
				n:=n+1;
			end if;
		end while;
	end if;
	if not split(N,p,a_p,D) then
		return(<D,r,m,l,lmw,"non-zero mu">);
	else
		return(<D,r,m,l,lmw,"split","non-zero mu">);
	end if;
end function;

function q(n,p)
	answer:=0;
	while n gt 1 do
		answer:=answer + p^(n-1)-p^(n-2);
		n:=n-2;
	end while;
	return(answer);
end function;

function iwasawa_invariants_ss(V,p,a_p,D,e)
	cycl:=[];
	err:=false;
	N:=Level(V[1]);
	L:=Pn(V,p,0,D);
	r:=0;
	pluslmw:=0;
	minuslmw:=0;
	minusm:=0;
	minusl:=0;
	plusm:=0;
	plusl:=0;
	if L mod cyclotomic(p,0) eq 0 then
		cycl:=cycl cat [0];
		r:=1;
		pluslmw:=pluslmw+1;
		minuslmw:=minuslmw+1;
	end if;
	m,l:=iwasawa_invariants_poly(L,p); //print(0); print([m,l]);
	if (m eq 0) then  
		plusm:=0;
		plusl:=0;
		pluslmw:=0;
		minusm:=0;
		minusl:=0;
		minuslmw:=0;
	else
		n:=1;
		while (n le max_level(a_p,p,-1)) and (m ne 0) do 
			L:=Pn(V,p,2*n,D);
			if L mod cyclotomic(p,2*n) eq 0 then
				cycl:=cycl cat [2*n];
				minuslmw := minuslmw + p^(2*n) - p^(2*n-1);
			end if;			
			m,l:=iwasawa_invariants_poly(L,p); //print(n); print([m,l]);
			if (m eq 0) then
				minusm:=m;
				minusl:=l-q(2*n,p);
			end if;
			n:=n+1;
		end while;
		if (m ne 0) then
			err:=true;
			minusm:=m;
			minusl:=l-q(2*(n-1),p);
		end if;
	end if;

	L:=Pn(V,p,1,D);
	if L mod cyclotomic(p,1) eq 0 then
		cycl:=cycl cat [1];			
		pluslmw:=pluslmw+p-1;
	end if;			
	
	m,l:=iwasawa_invariants_poly(L,p); //print(1);print([m,l]);
	if (m eq 0) then  
		plusm:=m;
		plusl:=l;
	else
		n:=2;
		while (n le max_level(a_p,p,1)) and (m ne 0) do
			L:=Pn(V,p,2*n-1,D);
			if L mod cyclotomic(p,2*n-1) eq 0 then
				cycl:=cycl cat [2*n-1];
				pluslmw:=pluslmw+p^(2*n-1)-p^(2*n-2);
			end if;			
			m,l:=iwasawa_invariants_poly(L,p); //print(n);print([m,l]);
			if (m eq 0) then
				plusm:=m;
				plusl:=l-q(2*n-1,p);
			end if;
			n:=n+1;
		end while;
		if (m ne 0) then
			err:=true;
			plusm:=m;
			plusl:=l-q(2*n-3,p);
		end if;
	end if;

	if (r gt 0) and (twisted_sign(e,N,D) eq 1) then
		r:=2;
		pluslmw:=pluslmw+1;
		minuslmw:=minuslmw+1;
	end if;
	if p ne 2 then
		if not err then
			return(<D,r,plusm,plusl,pluslmw,minusm,minusl,minuslmw>);
		else
			return(<D,r,plusm,plusl,pluslmw,minusm,minusl,minuslmw,"error">);
		end if;
	else
		if not err then
			return(<D,r,minusm,minusl,minuslmw,plusm,plusl,pluslmw>);
			else
			return(<D,r,minusm,minusl,minuslmw,plusm,plusl,pluslmw,"error">);
		end if;
	end if;
end function;
	

//This function computes the Iwasawa invariants of the curve V twisted
//by the quadratic character of conductor D at the prime p
//
//Input:	V   - space of plus/minus modular symbols (produced by form_curve)
//		p   - prime
//		a_p - Fourier coefficient
//		D   - discriminant of qudratic twist
//		e   - sign of functional equation (e = 1 means plus; e = -1 means minus)
//
//Output:	if p is ordinary this function returns
//			<D,rank,mu,lambda,lambda_MW>
//		if p is ss it returns
//			<D,rank,mu^+,lambda^+,lambda_MW^+,mu^-,lambda^-,lambda_MW>
function iwasawa_invariants(V,p,a_p,D,e)
//	print [D,p];
	assert D mod p ne 0;
	assert Level(V[1]) mod p^2 ne 0;
	if e eq 0 then 
		if MSEven(V[1],0) eq 0 then
			e:=-1;
		else
			e:=1;
		end if;
	end if;
	if a_p mod p eq 0 then
		return(iwasawa_invariants_ss(V,p,a_p,D,e));
	else
		return(iwasawa_invariants_ord(V,p,a_p,D,e));
	end if;
end function;

function form_list_of_good_twists(N,p,bottom,top)
	answer:=[];
	for d in [bottom..top] do
		if (Gcd(d,p) eq 1) and (Gcd(d,N) eq 1) and (KroneckerSymbol(d,-1) eq 1) then
			if (d eq Squarefree(d)) and (d mod 4 eq 1) then
				answer := answer cat [d];
			end if;
			if (d mod 4 eq 0) and (d div 4 eq SquareFree(d div 4)) and ((d div 4) mod 4 ne 1) then
				answer := answer cat [d];
			end if;
		end if;
	end for;
	return(answer);
end function;

function form_list_of_good_twists_bound(N,p,bottom,top,start,sign)
	answer:=[];
	if sign eq -1 then
		return([]);
	else 
		for d in [start..top] do
			if (Gcd(d,p) eq 1) and (Gcd(d,N) eq 1) and (KroneckerSymbol(d,-1) eq 1) then
				if (d eq Squarefree(d)) and (d mod 4 eq 1) then
					answer := answer cat [d];
				end if;
				if (d mod 4 eq 0) and (d div 4 eq SquareFree(d div 4)) and ((d div 4) mod 4 ne 1) then
					answer := answer cat [d];
				end if;
			end if;
		end for;
		return(answer);
	end if;
end function;

function form_list_of_good_twists_neg(N,p,bottom,top)
	answer:=[];
	for e in [bottom..top] do
		d := -e;
		if (Gcd(d,p) eq 1) and (Gcd(d,N) eq 1) then
			if (d eq Squarefree(d)) and (d mod 4 eq 1) then
				answer := answer cat [d];
			end if;
			if (d mod 4 eq 0) and (d div 4 eq SquareFree(d div 4)) and ((d div 4) mod 4 ne 1) then
				answer := answer cat [d];
			end if;
		end if;
	end for;
	return(answer);
end function;

function form_list_of_good_twists_neg_bound(N,p,bottom,top,start,sign)
	answer:=[];
	if sign eq 1 then
		return(form_list_of_good_twists_neg(N,p,bottom,top));
	else
		for e in [start..top] do
			d := -e;
			if (Gcd(d,p) eq 1) and (Gcd(d,N) eq 1) then
				if (d eq Squarefree(d)) and (d mod 4 eq 1) then
					answer := answer cat [d];
				end if;
				if (d mod 4 eq 0) and (d div 4 eq SquareFree(d div 4)) and ((d div 4) mod 4 ne 1) then
					answer := answer cat [d];
				end if;
			end if;
		end for;
		return(answer);
	end if;
end function;

function display(data)
	if #data lt 8 then
		info:=[];
		for k in [1..5] do
			info := info cat [data[k]];
		end for;
		if #data eq 5 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ";
		end if;
		if #data eq 6 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],"|";
		end if;
		if #data eq 7 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],"|",data[7],"|";
		end if;
	else
		info:=[];
		for k in [1..8] do
			info := info cat [data[k]];
		end for;
		if #data eq 8 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],data[7],data[8]," |";
		end if;
		if #data eq 9 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],data[7],data[8]," |",data[9],"|";
		end if;
	end if;	
	return(1);
end function;

function display_single_curve(data,curve)
	if #data lt 8 then
		info:=[];
		for k in [1..5] do
			info := info cat [data[k]];
		end for;
		if #data eq 5 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ";
		end if;
		if #data eq 6 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],"|";
		end if;
		if #data eq 7 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],"|",data[7],"|";
		end if;
	else
		info:=[];
		for k in [1..8] do
			info := info cat [data[k]];
		end for;
		if #data eq 8 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],data[7],data[8]," |";
		end if;
		if #data eq 9 then
			print data[1],"|",data[2],"| ",data[3],data[4],data[5]," | ",data[6],data[7],data[8]," |",data[9],"|";
		end if;
	end if;	
	return(1);
end function;

function display_title(N,p,a_p,curve,sign)
	print curve;
	print "p =",p;
	if (N mod p eq 0) then
		print "Multiplicative";
	else
		if (a_p mod p ne 0) then
			print "Good ordinary ( a_p =",a_p,")";
		else
			print "Good supersingular ( a_p =",a_p,")";
		end if;
	end if;
	if sign eq 1 then
		print "Positive twists";
	else
		print "Negative twists";
	end if;
	print "";
	return(1);
end function;

function compute_invariants_of_twists(V,p,a_p,minD,maxD,sign,filename)
	assert Level(V[1]) mod p^2 ne 0;
	if MSEven(V[1],0) eq 0 then
		e := -1;
	else
		e := 1;
	end if;
	if sign gt 0 then
		twists:=form_list_of_good_twists(Level(V[1]),p,minD,maxD);
	else
		twists:=form_list_of_good_twists_neg(Level(V[1]),p,minD,maxD);
	end if;
	k:=1;
	for k in [1..#twists] do
		D:=twists[k];
		data:=iwasawa_invariants(V,p,a_p,D,e);
		SetOutputFile(filename);
		a:=display(data);
		UnsetOutputFile();
	end for;
	return(1);
end function;

function compute_invariants(V,p,a_p)
	assert Level(V[1]) mod p^2 ne 0;
	data:=iwasawa_invariants(V,p,a_p,1,0);
	a:=display_single_curve(data);
	return(1);
end function;
			
function run_thru_primes(V,Q,minp,maxp)
	if MSEven(V[1],0) eq 0 then
		e:=-1;
	else
		e:=1;
	end if;
	N:=Level(V[1]);
	for p in [minp..maxp] do
		if IsPrime(p) then
			if N mod p^2 ne 0 then
				a_p :=Numerator(Coefficient(Q,p));
				data:=iwasawa_invariants(V,p,a_p,1,e);
				if a_p mod p ne 0 then
					if split(N,p,a_p,1) then
						print p," | ",data[3],data[4],data[5],"*|";
					else
						print p," | ",data[3],data[4],data[5]," |";
					end if;
				else
					print  p," | ",data[3],data[4],data[5]," | ",data[6],data[7],data[8];
				end if;
			else
				print p,"-";
			end if;
		end if;
	end for;
	return(1);
end function;
	
//This function produces the plus and minus spaces of modular symbols 
//for the k-th curve of conductor N in Cremona's tables
//
//Input:	N - conductor
//		k - isogeny class
function form_curve(N,k)
	curve:=IntegerToString(N) cat alphabet(k); 
//	print "Forming curve ",curve;
	E:=EllipticCurve(C,curve);
	M1:=ModularSymbols(N,2,1);
	p:=2;
	while Dimension(M1) gt 1 do
		M1:=Kernel([<p,x-ap(E,p)>],M1);
		p:=NextPrime(p);
	end while;
	M2:=ModularSymbols(N,2,-1);
	p:=2;
	while Dimension(M2) gt 1 do
		M2:=Kernel([<p,x-ap(E,p)>],M2);
		p:=NextPrime(p);
	end while;
	V:=[M1,M2];
	return(V);
end function;

function run_thru_curves(minp,maxp,minN,maxN,minD,maxD)
	for N in [minN..maxN] do
		for k in [1..NumberOfIsogenyClasses(C,N)] do			
			curve:=IntegerToString(N) cat alphabet(k); 
			print "Forming curve ",curve;
			M:=ModularSymbols(curve);
			Q:=qEigenform(M,50);
			M1:=ModularSymbols(N,2,1);
			p:=2;
			while Dimension(M1) gt 1 do
				M1:=Kernel([<p,x-Coefficient(Q,p)>],M1);
				p:=NextPrime(p);
			end while;
			M2:=ModularSymbols(N,2,-1);
			p:=2;
			while Dimension(M2) gt 1 do
				M2:=Kernel([<p,x-Coefficient(Q,p)>],M2);
				p:=NextPrime(p);
			end while;
			V:=[M1,M2];
			for p in [minp..maxp] do
				if IsPrime(p) then
					if N mod p^2 ne 0 then
						a_p:=Numerator(Coefficient(Q,p));

						filename:=form_filename(N,k,p,1);
						curve:=IntegerToString(N) cat alphabet(k);
						SetOutputFile(filename);
						a:=display_title(N,p,a_p,curve,1);
						UnsetOutputFile();
						a:=compute_invariants_of_twists(V,p,a_p,minD,maxD,1,filename);

						filename:=form_filename(N,k,p,-1);
						SetOutputFile(filename);
						a:=display_title(N,p,a_p,curve,-1);
						UnsetOutputFile();
						a:=compute_invariants_of_twists(V,p,a_p,minD,maxD,-1,filename);
					end if;
				end if;
			end for;
			DisownChildren(M);
			DisownChildren(M1);
			DisownChildren(M2);
		end for;
	end for;
	return(1);
end function;

//startD is the first discriminant to start with on the first run
//and sign is the sign of the discriminant
function run_thru_twists(minp,maxp,minN,maxN,minD,maxD,startD,startsign)
	local p,N,k,M,Q,M1,V,L,e,sign,list1,list2,D,first;
	first:=1;
	for N in [minN..maxN] do
		for k in [1..NumberOfIsogenyClasses(C,N)] do			
			V:=form_curve(N,k);
			curve:=IntegerToString(N) cat alphabet(k); 
			E:=EllipticCurve(C,curve);
			L:=LRatio(V[1],1);
			if L eq 0 then
				e := -1;
			else
				e := 1;
			end if;
			done := false;
			for sign in [1,-1] do
			if first eq 1 then
				if sign gt 0 then
					twists:=form_list_of_good_twists_bound(Level(V[1]),-1,minD,maxD,startD,startsign);
				else
					twists:=form_list_of_good_twists_neg_bound(Level(V[1]),-1,minD,maxD,startD,startsign);
					first:=0;
				end if;
			else
				if sign gt 0 then
					twists:=form_list_of_good_twists(Level(V[1]),-1,minD,maxD);
				else
					twists:=form_list_of_good_twists_neg(Level(V[1]),-1,minD,maxD);
				end if;
			end if;
			for k in [1..#twists] do
				D:=twists[k];
					
				list1:=[];
				list2:=[];
				L:=MS_twist(V,0,D);
			for p in [minp..maxp] do
				if IsPrime(p) then
					a_p:=ap(E,p);
					if (N mod p^2 ne 0) and (D mod p ne 0) then
						if (N mod p eq 0) or (a_p*KroneckerSymbol(D,p) mod p eq 1) or 
						   (Valuation(L,p) ne 0) or (p eq 2) then
							done := true;
							data:=iwasawa_invariants(V,p,a_p,D,e); print(data);
							if ((#data eq 6) or (#data eq 7) or (#data eq 9)) and 
								(data[#data] eq "error") then
								print "error!";
							end if;
							if #data lt 8 then
								list1 := list1 cat [[data[3],data[4],data[5]]];
								if (#data gt 5) and (data[6] eq "split") then
									list1 := list1 cat [[-1,-1,-1]];
								end if;
								list2 := list2 cat [[-2,-2,-2]];
							else
								list1 := list1 cat [[data[3],data[4],data[5]]];
								list2 := list2 cat [[data[6],data[7],data[8]]];
							end if;
						else
							list1 := list1 cat [[0,0,0]];
							if a_p mod p eq 0 then
								list2 := list2 cat [[0,0,0]];
							else
								list2 := list2 cat [[-2,-2,-2]];
							end if;
						end if;
					else
						list1 := list1 cat [[-2,-2,-2]];
						list2 := list2 cat [[-2,-2,-2]];
						data := [0,0,0,0,0];
					end if;			
				end if;
			end for;
			if not done then
				data := [0,0];
			end if;
			line:=IntegerToString(D);
			if Abs(D) lt 10 then
				line := line cat "  ";
			else
				if Abs(D) lt 100 then
					line := line cat " ";
				end if;
			end if;
			line := line cat " | " cat IntegerToString(data[2]) cat " | ";
			for k in [1..#list1] do
				if list1[k][1] ge 0 then
					if ((k lt #list1) and (list1[k+1][1] ne -1)) or (k eq #list1) then
						if list1[k][2] lt 10 then
							line := line cat " ";
						end if;
						line := line cat IntegerToString(list1[k][1]) cat " "
								cat IntegerToString(list1[k][2]) cat " "
								  cat IntegerToString(list1[k][3]);
						if list1[k][3] lt 10 then
							line := line cat " ";
						end if;
						line := line cat " | ";
					else
						if list1[k][2] lt 10 then
							line := line cat " ";
						end if;
						line := line cat IntegerToString(list1[k][1]) cat " "
								cat IntegerToString(list1[k][2]) cat " "
								  cat IntegerToString(list1[k][3]);
						if list1[k][3] lt 10 then
							line := line cat " ";
						end if;
						line := line cat "*| ";
					end if;
				else
					if list1[k][1] eq -2 then
						line := line cat "        | ";
					end if;
				end if;
			end for;
			SetOutputFile(curve cat "." cat IntegerToString(sign));
			print line;
			line := "";
			if D gt 0 then
				line := "   ";
			else 
				line := "    ";
			end if;
			line := line cat " |   | ";
			for k in [1..#list2] do
				if list2[k][1] ne -2 then
					if list1[k][2] lt 10 then
						line := line cat " ";
					end if;
					line := line cat IntegerToString(list2[k][1]) cat " "
							cat IntegerToString(list2[k][2]) cat " "
							  cat IntegerToString(list2[k][3]);
					if list1[k][3] lt 10 then
						line := line cat " ";
					end if;
					line := line cat " | ";
				else
					line := line cat "        | ";
				end if;
			end for;
			print line;				
			UnsetOutputFile();
			end for;
			end for;
			DisownChildren(V[1]);
			DisownChildren(V[2]);
		end for;
	end for;
	return(1);
end function;


function run_thru_cremona(minp,maxp,minN,maxN)
	SetOutputFile("curves1-5000");
	for N in [minN..maxN] do 
		for k in [1..NumberOfIsogenyClasses(C,N)] do			
			curve:=IntegerToString(N) cat alphabet(k); 
			V:=form_curve(N,k);
			E:=EllipticCurve(C,curve);
			list1:=[];
			list2:=[];
			L:=LRatio(V[1],1);
			if L eq 0 then
				e := -1;
			else
				e := 1;
			end if;
			done := false;
			for p in [minp..maxp] do 
				if IsPrime(p) then //print(p); print(ap(E,p));
					a_p:=ap(E,p);
					if N mod p^2 ne 0 then
						if (N mod p eq 0) or (a_p mod p eq 1) or (Valuation(L,p) ne 0) or (p eq 2) then
							done := true;
							data:=iwasawa_invariants(V,p,a_p,1,e); //print(data);
							if ((#data eq 6) or (#data eq 7) or (#data eq 9)) and 
								(data[#data] eq "error") then
								print "error!";
							end if;
							if #data lt 8 then
								list1 := list1 cat [[data[3],data[4],data[5]]];
								if (#data gt 5) and (data[6] eq "split") then
									list1 := list1 cat [[-1,-1,-1]];
								end if;
								list2 := list2 cat [[-2,-2,-2]];
							else
								list1 := list1 cat [[data[3],data[4],data[5]]];
								list2 := list2 cat [[data[6],data[7],data[8]]];
							end if;
						else
							list1 := list1 cat [[0,0,0]];
							if a_p mod p eq 0 then
								list2 := list2 cat [[0,0,0]];
							else
								list2 := list2 cat [[-2,-2,-2]];
							end if;
						end if;
					else
						list1 := list1 cat [[-2,-2,-2]];
						list2 := list2 cat [[-2,-2,-2]];
					end if;			
				end if;
			end for;
			if not done then
				data := [0,0];
			end if;
			line:=curve;
			for j in [1..5-#line] do
				line:= line cat " ";
			end for;
			line:=line cat " | " cat IntegerToString(data[2]) cat " | ";
			for k in [1..#list1] do
				if list1[k][1] ge 0 then
					if ((k lt #list1) and (list1[k+1][1] ne -1)) or (k eq #list1) then
						if list1[k][2] lt 10 then
							line := line cat " ";
						end if;
						line := line cat IntegerToString(list1[k][1]) cat " "
								cat IntegerToString(list1[k][2]) cat " "
								  cat IntegerToString(list1[k][3]);
						if list1[k][3] lt 10 then
							line := line cat " ";
						end if;
						line := line cat " | ";
					else
						if list1[k][2] lt 10 then
							line := line cat " ";
						end if;
						line := line cat IntegerToString(list1[k][1]) cat " "
								cat IntegerToString(list1[k][2]) cat " "
								  cat IntegerToString(list1[k][3]);
						if list1[k][3] lt 10 then
							line := line cat " ";
						end if;
						line := line cat "*| ";
					end if;
				else
					if list1[k][1] eq -2 then
						line := line cat "        | ";
					end if;
				end if;
			end for;
			print line;
			line := "     ";
			line := line cat " |   | ";
			for k in [1..#list2] do
				if list2[k][1] ne -2 then
					if list2[k][2] lt 10 then
						line := line cat " ";
					end if;
					line := line cat IntegerToString(list2[k][1]) cat " "
							cat IntegerToString(list2[k][2]) cat " "
							  cat IntegerToString(list2[k][3]);
					if list2[k][3] lt 10 then
						line := line cat " ";
					end if;
					line := line cat " | ";
				else
					line := line cat "        | ";
				end if;
			end for;
			print line;				
			UnsetOutputFile();
			SetOutputFile("curves1-5000");
			DisownChildren(V[1]);
		end for;
	end for;
	UnsetOutputFile();
	return(1);
end function;



function ranktwo(V,e,bottom,top,bottom_neg,top_neg)
	answer:=[];
	list:=form_list_of_good_twists(Level(V[1]),1,bottom,top);
	for k in [1..#list] do print(list[k]);
		if (twisted_sign(e,Level(V[1]),list[k]) eq 1) then 
			if (MS_twist(V,0,list[k]) eq 0) then
				answer := answer cat [list[k]];
			end if;
		end if;
	end for;
	answer_neg:=[];
	list:=form_list_of_good_twists_neg(Level(V[1]),1,bottom_neg,top_neg);
	for k in [1..#list] do print(list[k]);
		if (twisted_sign(e,Level(V[1]),list[k]) eq 1) then 
			if (MS_twist(V,0,list[k]) eq 0) then
				answer_neg := answer_neg cat [list[k]];
			end if;
		end if;
	end for;
	return(<answer,answer_neg>);
end function;

function frac_mod(r,p,n)

        a:=Numerator(r) mod p^n;
        b:=InverseMod(Denominator(r),p^n);
        return(a*b mod p^n);

end function;

//This function computes the value of f/g evaluated at zero.
//
//Input: 	V - space of modular symbols
//		p - prime
//		n - accuracy
//		r - order of vanishing of f and g
//		D - discriminant of twist
function ratio_constant_terms_ss(V,p,n,r,D)

        P:=Pn(V,p,2*n+1,D);
	for i in [1..2*n+1] do
		if i mod 2 eq 0 then
			P := P div cyclotomic(p,i);
		end if;
	end for;
        Q:=Pn(V,p,2*n,D);
	for i in [1..2*n] do
		if i mod 2 eq 1 then
			Q := Q div cyclotomic(p,i);
		end if;
	end for;

        a:=Coefficient(P,r);
	if n ne 0 then
	        b:=Coefficient(Q,r);
	else
		b:=Q;
	end if;

	print "Plus constant term:",a;
	print "Minus constant term:",b;
	print "Valuation of plus term:",Valuation(a,p);
	print "Valuation of minus term:",Valuation(b,p);
	done:=false;
	if (Valuation(a,p) eq Valuation(b,p)) and (n gt Valuation(a,p)) then
		print "The ratio a/b is:",frac_mod(a/b,p,n-Valuation(a,p)),"(mod ",p,"^",n-Valuation(a,p),")";
	else
		print "Accuracy too low.";
	end if;

	print "";

	if ((Valuation(a,p) gt Valuation(b,p)) and (Valuation(b,p) lt n)) or
	   ((Valuation(b,p) gt Valuation(a,p)) and (Valuation(a,p) lt n)) or
	   ((Valuation(a,p) eq Valuation(b,p)) and (Valuation(a,p) lt n) and (frac_mod(a/b,p,n-Valuation(a,p)) ne ((p-1) div 2))) then
		return [*true,a,b,Valuation(a,p),Valuation(b,p),n*];
	else
		return [*false,a,b,Valuation(a,p),Valuation(b,p),n*];
	end if;

end function;

function smooth_valuations(C)
	for j in [2..#C] do
		if C[j] gt C[j-1] then
			C[j]:=C[j-1];
		end if;
	end for;

	return C;
end function;	

function accurate_coefficients(f,p,n)
	w:=T;
	for i in [1..n] do
		if (n-i) mod 2 eq 0 then 
			w := w * cyclotomic(p,i);
		end if;
	end for;
	D:=smooth_valuations(valuation_of_coefficients(w,p));
	E:=valuation_of_coefficients(f,p);
	C:=[(j lt #D) and (E[j] lt D[j]) : j in [1..#E]];

	if E[1] gt 1000 then
		C[1]:=true;
	end if;

	if (#E gt 1) and (E[2] gt 1000) then
		C[2]:=true;
	end if;

	return C;
			
end function;

function accuracy_of_coefficient(f,p,n,r)
	w:=1;
	for i in [1..n] do
		if (n-i) mod 2 eq 0 then 
			w := w * cyclotomic(p,i);
		end if;
	end for;
	D:=smooth_valuations(valuation_of_coefficients(w,p));

	return D[r+1];
end function;

function newton_polygon(C)
        local k,here,next,min_slope,answer,okay,prev_slope;

        answer:= [];
        okay:=true;

        here:=1;
        next:=1;

        while here lt #C do

                min_slope:=100000;

                for k in [here+1..#C] do
                        if (C[k]-C[here])*(1.0)/(k-here) le 1.0*min_slope then
                                min_slope := (C[k]-C[here])/(k-here);
                                next := k;
                        end if;
                end for;

                answer := answer cat [[next-here,-min_slope]];
                here := next;

        end while;

	C:=answer;
	return [C[j] : j in [1..#C] | C[j][2] gt 0];

end function;


function newton(f,p)
	C:=newton_polygon(valuation_of_coefficients(f,p));
	return [C[j] : j in [1..#C] | C[j][2] gt 0];
end function;

function break_points(C)
	count:=1;
	D:=[count];
	for j in [1..#C] do
		count:=count + Integers()!C[j][1];
		D:=D cat [count];
	end for;

	return D;
end function;

function is_newton_accurate(f,p,n);
	if Min(valuation_of_coefficients(f,p)) eq 0 then
		w:=T;
		for i in [1..n] do
			if (n-i) mod 2 eq 0 then 
				w := w * cyclotomic(p,i);
			end if;
		end for;
		D:=smooth_valuations(valuation_of_coefficients(w,p));
		C:=valuation_of_coefficients(f,p);
		for j in [1..#C] do
			if (C[j] gt D[j]) and (C[j] lt 100) then
				C[j]:=D[j];
			end if;
		end for;

		B:=break_points(newton_polygon(C));
		acc:=accurate_coefficients(f,p,n);
		correct:=true;
		for j in [1..#B] do
			correct := correct and acc[B[j]];
			if not correct then
				print "         not enough accuracy at coefficient",B[j];
			end if;
		end for;

		if correct then
			print "         Done!";
		end if;
	else
		print "         Mu is positive.";
		correct:=false;
	end if;

	return correct;
end function;

function signed_newton(V,p,D,sgn,e)
	e:=twisted_sign(e,Level(V[1]),D);

	done:=false;

	if sgn eq 1 then 
		del:=1;
	else
		del:=0;
	end if;	

	j:=del;
	while not done do
		print "Trying j =",j;
		P:=Pn(V,p,j,D);
		if P ne 0 then
			for i in [1..j] do
				if (i mod 2) eq ((del+1) mod 2) then
					P := P div cyclotomic(p,i);
				end if;
			end for;
			if (Coefficient(P,0) eq 0) and (e eq 1) then
				P:=P-Coefficient(P,1)*T;
			end if;
			print newton(P,p);
			done:=is_newton_accurate(P,p,j);
		else 
			print "        zero";
		end if;
		j:=j+2;
	end while;
	

	return newton(P,p);
end function;

function pm_newton(V,p,D,e)

	print "Plus newton..."; 
	print "";
	plus:=signed_newton(V,p,D,1,e);
	print plus;
	print "";
	print "";

	print "Minus newton..."; print "";
	minus:=signed_newton(V,p,D,-1,e);
	print minus;

	print "";
	print "";
	print "The plus newton polygon is:";
	print plus;
	print "";
	print "The minus newton polygon is:";
	print minus;

	return 1;
end function;

function newton_pm(V,p,D,e)
	e:=twisted_sign(e,Level(V[1]),D);

	done_plus_np:=false;
	done_minus_np:=false;

	j:=0;
	while (not done_plus_np) or (not done_minus_np) do 
		print "";
		print "";
		print "Trying j =",j,",",j+1;
		print "   For j =",j;
		if (not done_minus_np) then	
			print "      Minus newton polygon equals:";
			P:=Pn(V,p,j,D);
			if P ne 0 then
				for i in [1..j] do
					if (i mod 2) eq 1 then
						P := P div cyclotomic(p,i);
					end if;
				end for;
				if (j ne 0) and (Coefficient(P,0) eq 0) and (e eq 1) then
					P:=P-Coefficient(P,1)*T;
				end if;
				minus_np:=newton(P,p);
				print minus_np;
				done_minus_np:=is_newton_accurate(P,p,j);
			else 
				print "        zero";
			end if;
		else
			print "      Minus newton polygon already computed.";
		end if;


		print "   For j =",j+1;
		j:=j+1;
		if (not done_plus_np) then	
			print "      Plus newton polygon equals:";
			P:=Pn(V,p,j,D);
			if P ne 0 then
				for i in [1..j] do
					if (i mod 2) eq 0 then
						P := P div cyclotomic(p,i);
					end if;
				end for;
				if (Coefficient(P,0) eq 0) and (e eq 1) then
					P:=P-Coefficient(P,1)*T;
				end if;
				plus_np:=newton(P,p);
				print plus_np;
				done_plus_np:=is_newton_accurate(P,p,j);
			else 
				print "        zero";
			end if;
		else
			print "      Plus newton polygon already computed.";
		end if;
						
		j:=j+1;
	end while;

	print "";
	print "";
	print "";
	
	print "Plus newton:";
	print plus_np;

	print "Minus newton:";
	print minus_np;

	return "Done!";
end function;

function do_it_all(V,p,list,e)

	for k in [1..#list] do
		D:=list[k][1];
		r:=list[k][2];
		print "WORKING ON D=",D;
		done:=false;
		n:=1;
		info:=ratio_constant_terms_ss(V,p,n,r,D);
		while (not info[1]) and (n lt 4) do
			n:=n+1;
			info:=ratio_constant_terms_ss(V,p,n,r,D);
		end while;
		print info;
	end for;

	return "Done!";

end function;
