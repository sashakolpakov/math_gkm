"""Machine-authored exploratory terminal-A raw gap; not a Lean theorem."""
from symbolic_second_f52ba141 import sp,k,l,m,t
from pathlib import Path
import json
def H(k,l,m,t,r):
 n=k+l
 return 4*t*l*(l-1)*(l-2)+(9*m*m+7*m+2-4*r)*k*l*(l-1)+(6*m*m+6*m*n+4*n)*k*(k-1)*l+(m+n)*(m+n+1)*k*(k-1)*(k-2)
def gap(t,r):return (k+1)*(l+1)*H(k,l,m,t,r)**2-k*l*H(k-1,l+1,m,t,r)*H(k+1,l-1,m,t,r)
out=[]
for r in [0,1]:
 g0=gap(0,r);g2=gap(2*m-r,r)
 gm=(k+1)*(l+1)*2*H(k,l,m,0,r)*H(k,l,m,2*m-r,r)-k*l*(H(k-1,l+1,m,0,r)*H(k+1,l-1,m,2*m-r,r)+H(k-1,l+1,m,2*m-r,r)*H(k+1,l-1,m,0,r))
 for kn,kk in [('one',1),('two',2),('large',k+3)]:
  for ln,ll in [('one',1),('two',2),('large',l+3)]:
   if kn==ln=='one':continue
   for nm,g in [('zero',g0),('end',g2),('mixed',gm)]:
    p=g.subst([kk,ll,m+1,0]);neg=[(e,str(c)) for e,c in p.items() if c<0]
    out.append({'r':r,'k':kn,'l':ln,'gap':nm,'terms':len(p),'negative':len(neg),'examples':neg[:3]})
Path('evidence/markov-f52ba141/terminal-a-symbolic.json').write_text(json.dumps({'status':'Exact polynomial exploration only; no formal coefficient or LC bridge','charts':out},indent=2)+'\n')
print(json.dumps({'charts':len(out),'negative_charts':[x for x in out if x['negative']]}))
