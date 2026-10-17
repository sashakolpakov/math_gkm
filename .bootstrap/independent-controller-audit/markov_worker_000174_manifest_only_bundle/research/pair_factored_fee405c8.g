# Machine-authored symbolic candidate; common-factor removal is experimental.
x:=Indeterminate(Rationals,"x");;g:=Indeterminate(Rationals,"g");;
z:=Indeterminate(Rationals,"z");;T:=Indeterminate(Rationals,"T");;
t:=T+1;;n:=x;;m:=x+g+2;;j:=m+z;;
W:=v->(t+v+4)*(t+v+5)+4*(j-v)*(t+j+4);;
an:=v->[v,t+v+4,t+v+5,W(v)-2];;
bn:=v->[j-v,t+v+4,t+v+5,W(v)+2];;
ad:=v->[j-v+1,t+v+2,t+v+3];;
bd:=v->[v+1,t+v+6,t+v+7];;
pts:=[m,n,m-1,n+1];;
termf:=function(i,k)
 local factors,a;
 factors:=Concatenation(an(pts[i]),bn(pts[k]));
 for a in [1..4] do
  if a<>i then Append(factors,ad(pts[a]));fi;
  if a<>k then Append(factors,bd(pts[a]));fi;
  if a<>i and a<>k then Add(factors,W(pts[a]));fi;
 od;
 return factors;
end;;
fs:=[termf(1,2),termf(2,1),termf(3,4),termf(4,3)];;
common:=[];;
for p in ShallowCopy(fs[1]) do
 if ForAll(fs,a->p in a) then
  Add(common,p);
  for a in fs do Remove(a,Position(a,p));od;
 fi;
od;
Print("common=",common,"\n");
p:=Product(fs[1])+Product(fs[2])-Product(fs[3])-Product(fs[4]);;
e:=ExtRepPolynomialRatFun(p);;c:=List([1..Length(e)/2],i->e[2*i]);;
Print("terms=",Length(c)," negative_coefficients=",Number(c,v->v<0),"\n");
PrintTo("evidence/markov-fee405c8/pair-factored-extrep.txt",e,"\n");
PrintTo("evidence/markov-fee405c8/pair-factors-extrep.txt",List(fs,a->List(a,ExtRepPolynomialRatFun)),"\n");
QUIT;
