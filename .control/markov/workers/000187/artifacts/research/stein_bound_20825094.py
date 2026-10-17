"""Machine-authored exact symbolic generator bound; candidate only."""
from weighted_beta_symbolic_ca9709f2 import P,var,expr,div_exact
from stein_symbolic_ca9709f2 import add,mul,sc,ev
from pathlib import Path
import json
O=Path('/Users/sasha/math_gkm/evidence/markov-20825094')
a,m,H,z=[var(j) for j in range(4)];Q=H-a-2
k={1:P(1)};l={0:m,1:P(-1)};p=mul(k,l)
B=mul({0:a,1:P(1)},{0:H,1:P(1)},l,{0:Q+m-1,1:P(-1)})
D=mul(k,{0:Q-1,1:P(1)},{0:a+m,1:P(-1)},{0:H+m,1:P(-1)})
Lp=add(mul(B,{0:m-1,1:P(-2)}),mul(D,{0:-m-1,1:P(2)}))
F=Lp[0];E=-(Lp[2]-Lp[4]*m*m);DD=-Lp[4]
assert add(Lp,sc(add({0:F},sc(p,E),sc(mul(p,p),-DD)),P(-1)))=={}
Ak=mul(k,{0:H,1:P(1)});Al=mul(l,{0:H+m,1:P(-1)})
ff=add(sc(mul(Ak,Al),2*(a+1)*(a+4)),sc(add(mul(Ak,{0:P(-1),1:P(1)},{0:H+1,1:P(1)}),mul(Al,{0:m-1,1:P(-1)},{0:H+m+1,1:P(-1)})),-a*(a+3)))
# (4a+7)F2 = -2(a+2)Lp + C0 + Cp p.
rem=add(sc(ff,4*a+7),sc(Lp,2*(a+2)));C0=rem[0];Cp=-rem[2]
assert not add(rem,sc(add({0:C0},sc(p,Cp)),P(-1)))
den=DD*m*m-4*E
num=C0*den+4*Cp*F
print('D',expr(DD,['a','m','H','z']));print('E',expr(E,['a','m','H','z']));print('F',expr(F,['a','m','H','z']))
# H>=3a+m/2+4 gives substitution with 2H=6a+m+8+2z.
for amin in [1,2,3,4,5,6,7,8,10]:
 shifted=num.ev([a+amin,m+2,3*(a+amin)+(m+2)*P(0.5)+4+z,z])
 print(amin,len(shifted.d),len([v for v in shifted.d.values() if v<0]))
out={name:[[list(k),str(v)] for k,v in sorted(val.d.items())] for name,val in dict(D=DD,E=E,F=F,C0=C0,Cp=Cp,den=den,num=num).items()}
(O/'stein-bound-symbolic.json').write_text(json.dumps(out,indent=2))
print('C0',expr(C0,['a','m','H','z']));print('Cp',expr(Cp,['a','m','H','z']))
