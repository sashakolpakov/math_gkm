# Machine-authored exploratory rational identity; not a Lean theorem.
x:=Indeterminate(Rationals,"x");;
g:=Indeterminate(Rationals,"g");;
z:=Indeterminate(Rationals,"z");;
T:=Indeterminate(Rationals,"T");;
t:=T+1;; n:=x;; m:=x+g+2;; j:=m+z;;
W:=v->(t+v+4)*(t+v+5)+4*(j-v)*(t+j+4);;
A:=v->v*(t+v+4)*(t+v+5)*(W(v)-2)/((j-v+1)*(t+v+2)*(t+v+3)*W(v));;
B:=v->(j-v)*(t+v+4)*(t+v+5)*(W(v)+2)/((v+1)*(t+v+6)*(t+v+7)*W(v));;
Print("start normalized pair rational difference\n");
f:=A(m)*B(n)+A(n)*B(m)-A(m-1)*B(n+1)-A(n+1)*B(m-1);;
Print("difference constructed\n");
p:=NumeratorOfRationalFunction(f);;
e:=ExtRepPolynomialRatFun(p);;
c:=List([1..Length(e)/2],i->e[2*i]);;
Print("terms=",Length(c)," negatives=",Number(c,v->v<0),"\n");
Print("numerator=",e,"\n");
Print("denominator=",ExtRepPolynomialRatFun(DenominatorOfRationalFunction(f)),"\n");
QUIT;
