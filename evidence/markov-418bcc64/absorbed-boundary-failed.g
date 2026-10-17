# Machine-authored exact GAP experiment; no theorem is inferred.
T:=Indeterminate(Rationals,"T");;
G:=Indeterminate(Rationals,"G");;
Z:=Indeterminate(Rationals,"Z");;
t:=T+4;; B:=Z+1;;
for pair in [[2,4],[3,8]] do
 for mode in [0,1] do
  if mode=0 then d:=t+2+G; else d:=t+1; fi;
  j:=d+pair[1];; c:=pair[2];;
  W:=function(v,m) return (v+m+4)*(v+m+5)+4*(j-m)*(v+j+4); end;
  D:=function(v,m) return (v+m+4)*(v+m+5); end;
  b0:=B*W(t,0)/D(t,0);;
  b10:=B*(t+j+4)*W(t+1,0)/((t+4)*D(t+1,0));;
  b11:=B*j*(t+j+4)*W(t+1,1)/((t+4)*D(t+1,1));;
  b20:=B*(t+j+4)*(t+j+5)*W(t+2,0)/((t+4)*(t+5)*D(t+2,0));;
  b21:=B*j*(t+j+4)*(t+j+5)*W(t+2,1)/((t+4)*(t+5)*D(t+2,1));;
  b22:=B*j*(j-1)*(t+j+4)*(t+j+5)*W(t+2,2)/(2*(t+4)*(t+5)*D(t+2,2));;
  a0:=c*(d-t)/(t+1);;a1:=c*(d-t-1)/(t+2);;
  if mode=0 then a2:=c*(d-t-2)/(t+3); else a2:=0;fi;
  gaps:=[b11^2-(b0+a0)*b22,2*b11*(b10+a1)-(b0+a0)*b21,(b10+a1)^2-(b0+a0)*(b20+a2)];;
  for k in [1..3] do
   e:=ExtRepPolynomialRatFun(NumeratorOfRationalFunction(gaps[k]));;
   cs:=List([1..Length(e)/2],i->e[2*i]);;
   Print("s=",pair[1]," mode=",mode," k=",k," terms=",Length(cs)," negative=",Number(cs,x->x<0),"\n");
  od;
 od;
od;
QUIT;
