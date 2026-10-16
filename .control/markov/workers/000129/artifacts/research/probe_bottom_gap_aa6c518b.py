"""Machine-authored candidate exact gap algebra; not a Lean proof."""
import horizontal_third_13d40bd7 as sp
from pathlib import Path
import json
sp.N=4
a,k,l,t=[sp.var(i) for i in range(4)]
N=k+l;b=N+1;m=a-1;n=b-2
A=3*a-1;B=a+b-1
D=9*m*m+13*m+6
E=6*m*m+6*m*n+8*m+6*n+6
F=(m+n+2)*(m+n+1)
G=2*(k+1)*(N-2)*(N-3)*l*((l-1)*A+k*B)**2-N*(N-1)*(l-1)*(4*t*(l-2)*(l-3)*(l-4)+(k+1)*(D*(l-2)*(l-3)+E*k*(l-2)+F*k*(k-1)))
def main():
 out=[]
 for an,aa in [('all',a+1),('large',a+2)]:
  for kn,kk in [('zero',0),('one',1),('large',k+2)]:
   for ln,ll in [('two',2),('three',3),('four',4),('large',l+5)]:
    if kn=='zero' and ln in ('two','three'):continue
    if kn=='one' and ln=='two':continue
    for sn,ss in [('zero',0),('source_high',2*(2*aa-kk-ll-1))]:
     p=G.subst([aa,kk,ll,ss]);ng=[(e,str(c)) for e,c in p.items() if c<0]
     out.append(dict(a=an,k=kn,l=ln,s=sn,terms=len(p),negative=len(ng),examples=ng[:2]))
 Path('evidence/markov-aa6c518b/bottom-gap-candidates.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
