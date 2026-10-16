"""Exact symbolic raw gap certificates, exploratory until Lean checked."""
import horizontal_third_13d40bd7 as sp
from pathlib import Path
import json
sp.N=4
k,l,m,t=[sp.var(i) for i in range(4)]
def H(k,l,m,t):
 n=k+l
 return 4*t*l*(l-1)*(l-2)+(9*m*m+13*m+6)*k*l*(l-1)+(6*m*m+6*m*n+8*m+6*n+6)*k*(k-1)*l+(m+n+2)*(m+n+1)*k*(k-1)*(k-2)
def gap(t):return (k+1)*(l+1)*H(k,l,m,t)**2-k*l*H(k-1,l+1,m,t)*H(k+1,l-1,m,t)
G0=gap(0);G2=gap(2*m)
GM=(k+1)*(l+1)*2*H(k,l,m,0)*H(k,l,m,2*m)-k*l*(H(k-1,l+1,m,0)*H(k+1,l-1,m,2*m)+H(k-1,l+1,m,2*m)*H(k+1,l-1,m,0))
def main():
 out=[]
 for kn,kk in [('one',1),('two',2),('large',k+3)]:
  for ln,ll in [('one',1),('two',2),('large',l+3)]:
   if kn==ln=='one':continue
   for gn,g in [('zero',G0),('end',G2),('mixed',GM)]:
    p=g.subst([kk,ll,m,0]);neg=[(e,str(c)) for e,c in p.items() if c<0]
    out.append({'k':kn,'l':ln,'gap':gn,'terms':len(p),'negative':len(neg),'examples':neg[:3]})
 print(json.dumps(out));Path('evidence/markov-f52ba141/second-symbolic.json').write_text(json.dumps(out,indent=2)+'\n')
if __name__=='__main__':main()
