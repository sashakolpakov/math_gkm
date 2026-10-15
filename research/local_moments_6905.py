"""Machine-authored symbolic integer polynomial arithmetic, no CAS dependency.
Derives local cubic moment contractions modulo bit idempotence. The generated
Lean identities are checked separately by ordinary ring proofs and Bool cases.
"""
from pathlib import Path
import json
O=Path('evidence/markov-6905e489')
# monomials (prev,current,next,y); first three exponents reduced to {0,1}
def add(*ps):
 d={}
 for p in ps:
  for k,v in p.items():d[k]=d.get(k,0)+v
 return {k:v for k,v in d.items() if v}
def mul(p,q):
 d={}
 for k,a in p.items():
  for l,b in q.items():
   h=tuple(min(k[i]+l[i],1) if i<3 else k[i]+l[i] for i in range(4))
   d[h]=d.get(h,0)+a*b
 return {k:v for k,v in d.items() if v}
def c(n):return {(0,0,0,0):n} if n else {}
def neg(p):return {k:-v for k,v in p.items()}
def scale(n,p):return mul(c(n),p)
def power(p,n):
 q=c(1)
 for _ in range(n):q=mul(p,q)
 return q
def var(i):return {tuple(int(j==i) for j in range(4)):1}
p,q,r,y=[var(i) for i in range(4)];one=c(1);s=add(one,y)
def d(a,b):return add(one,scale(2,mul(a,y)),mul(b,s))
def cc(a,b):return add(y,scale(2,mul(a,power(y,2))),mul(b,add(scale(-2,y),scale(-2,mul(a,power(y,2))),scale(2,mul(a,power(y,3))))))
def d2(a,b):return mul(mul(b,add(one,scale(2,mul(a,y)))),power(s,2))
def b2(b):return mul(b,power(s,2))
def a1(b):return add(y,mul(b,add(power(y,2),neg(y))))
K=add(scale(2,d2(p,q)),scale(2,cc(p,q)),neg(power(d(p,q),2)))
L=add(scale(2,power(d(p,q),3)),scale(-6,mul(d(p,q),d2(p,q))),
 scale(6,add(mul(cc(p,q),b2(r)),neg(mul(y,d2(p,q))))),
 scale(-6,mul(cc(p,q),add(d(p,q),d(q,r)))),scale(6,mul(cc(p,q),a1(r))))
def fmt(P,names=('bp','bq','br','y')):
 terms=[]
 for ex,k in sorted(P.items()):
  mon='*'.join(n if e==1 else f'{n}^{e}' for n,e in zip(names,ex) if e)
  terms.append(str(k) if not mon else f'({k})*{mon}')
 return ' + '.join(terms) or '0'
def aggregate(P):
 # count p=q=r=r; adjacent pq and qr=q; pr=t+u; pqr=u
 d={}
 labels={ (0,0,0):['c'],(1,0,0):['r'],(0,1,0):['r'],(0,0,1):['r'],
  (1,1,0):['q'],(0,1,1):['q'],(1,0,1):['t','u'],(1,1,1):['u']}
 for ex,k in P.items():
  for label in labels[ex[:3]]:d[label,ex[3]]=d.get((label,ex[3]),0)+k
 return {k:v for k,v in d.items() if v}
def fmtagg(P):return ' + '.join(f'({k})*{name}'+(f'*y^{e}' if e else '') for (name,e),k in sorted(P.items()))
rec=dict(status='symbolic derivation; checked Lean identity still required',K=fmt(K),L=fmt(L),Ksum=fmtagg(aggregate(K)),Lsum=fmtagg(aggregate(L)))
(O/'local-moments.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec,indent=2))
