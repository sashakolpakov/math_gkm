"""Machine-authored exact symbolic exploration of the central cut generator.
Outputs are experiments; all eventual identities require Lean checking.
"""
from pathlib import Path
from fractions import Fraction as F
import json
import weighted_beta_symbolic_ca9709f2 as w
w.N=5
P=w.P;var=w.var
a,m,r,H,k=[var(j) for j in range(5)]
l=m-k;n=m-r;p=k*l
B=(a+k)*l*(r-k-1)*(k-n+1)
D=k*(a+l)*(r-k+1)*(k-n-1)
L=B*(m-2*k-1)+D*(2*k-m-1)
S=2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*(k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
def coeff(q,e):return P({z[:4]+(0,):v for z,v in q.d.items() if z[4]==e})
C=-coeff(L,4);Fc=-coeff(S,4)
E=-coeff(L+C*p*p,2);G=coeff(L,0)
assert not (L-(G+E*p-C*p*p)).d
rem=C*S-Fc*L
cp=-coeff(rem,2);c0=coeff(rem,0)
assert not (rem-c0-cp*p).d
E=E-2*C*r*n
G=G+(E+2*C*r*n)*r*n-C*(r*n)**2
c0=c0+cp*r*n
den=C*(2*r-m)**2-4*E
R=c0*den+4*cp*G
def data(q):return [[list(k),str(v)] for k,v in sorted(q.d.items())]
def describe(q):return dict(terms=len(q.d),negative=sum(v<0 for v in q.d.values()))
x,s,n,z,_=[var(j) for j in range(5)]
args=[x+2,s+2+2*n,s+2+n,3*(x+2)+s+2+n+4+z,0]
qs=dict(C=C,Fc=Fc,E=E,G=G,cp=cp,c0=c0,den=den,R=R)
shift={name:q.ev(args) for name,q in qs.items()}
out=dict(status='exact symbolic experiment; not proof',polynomials={name:data(q) for name,q in qs.items()},shifted={name:data(q) for name,q in shift.items()},summary={name:describe(q) for name,q in shift.items()})
Path('evidence/markov-73199834/central-generator-symbolic.json').write_text(json.dumps(out,indent=2))
print(json.dumps(out['summary']))
for name in ['C','Fc']:print(name,w.expr(qs[name],['a','m','r','H','k']))
