# Machine-authored exact symbolic experiment. Lean certificates required.
x:=Indeterminate(Rationals,"x");;j:=Indeterminate(Rationals,"j");;
a1:=4*j*(1/x+1/(x+2));;
b1:=8*j/(x+1);;
a2:=8*j*(j-1)*(1/(x*(x-1))+1/((x+2)*(x+1)))+16*j^2/(x*(x+2));;
b2:=16*j*(j-1)/(x*(x+1))+16*j^2/(x+1)^2;;
gap:=b1*a2-b2*a1;;
Print("gap=",gap,"\n");
Print("numerator=",NumeratorOfRationalFunction(gap),"\n");
Print("denominator=",DenominatorOfRationalFunction(gap),"\n");
QUIT;
