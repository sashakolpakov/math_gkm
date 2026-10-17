# Machine-authored exact symbolic experiment; not a proof.
u:=Indeterminate(Rationals,"u");; v:=Indeterminate(Rationals,"v");;
s:=u+v+1;; F:=[1,u+v];;
for n in [1..10] do Add(F,s*F[Length(F)]-v*F[Length(F)-1]); od;
mat:=List([0..3],q->[F[3*q+1],F[3*q+2],v^q*F[q+1],v^q*F[q+2]]);;
for r in [0,1] do
 vals:=[];;
 for q in [0..3] do
  x:=F[q+2];;y:=F[q+1];;
  if r=1 then p:=x^3+v*x*y^2+s*v*y^3;
  else p:=s*x^3+v*x^2*y+v^2*y^3; fi;
  Add(vals,p);
 od;
 aug:=List([1..4],i->Concatenation(mat[i],[vals[i]]));;
 for i in [1..4] do
  if IsZero(aug[i][i]) then
   k:=First([i+1..4],j->not IsZero(aug[j][i]));tmp:=aug[i];aug[i]:=aug[k];aug[k]:=tmp;
  fi;
  piv:=aug[i][i];aug[i]:=List(aug[i],z->z/piv);
  for j in [1..4] do
   if j<>i then fac:=aug[j][i];aug[j]:=aug[j]-fac*aug[i];fi;
  od;
 od;
 sol:=List(aug,row->row[5]);;
 Print("residue ",r,"\n");
 for z in sol do
  Print("N ",Factors(NumeratorOfRationalFunction(z)),"\nD ",Factors(DenominatorOfRationalFunction(z)),"\n");
 od;
od;
QUIT;
