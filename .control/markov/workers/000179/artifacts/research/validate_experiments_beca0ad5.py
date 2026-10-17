"""Machine-authored exact independent checks of the new representations.
Finite computations only. Source-family experiment is recorded separately.
"""
from pathlib import Path
from math import comb,prod
from fractions import Fraction as F
from itertools import permutations,combinations_with_replacement
import json,time,hashlib,random
from probe_beca0ad5 import check
O=Path('/Users/sasha/math_gkm/evidence/markov-beca0ad5')
def w(r):return 0 if r<0 else 1 if r==0 else 4*r
def fall(n,r):return prod(range(n-r+1,n+1)) if 0<=r<=n else 0
def rk(j,s,r):return F(w(r)*fall(j,r),fall(s+j+3,r))
def cv(j,s,t,h):return sum(rk(j,s,r)*rk(j,t,h-r) for r in range(h+1))
def ck(j,s,h,r):return w(r)*fall(j,r)*fall(s+j+3-r,h-r)
def cc(j,s,t,h,m):return sum(ck(j,s,h,r)*ck(j,t,h,m-r) for r in range(m+1))
def raw(j,s,t,n):return sum(w(j-i)*w(j-n+i)*comb(s+i+3,i)*comb(t+n-i+3,n-i) for i in range(max(0,n-j),min(j,n)+1))
def determinant(a):
 return sum((-1)**sum(p[i]>p[j] for i in range(4) for j in range(i+1,4))*prod(w(a[i]-i+p[i]) for i in range(4)) for p in permutations(range(4)))
def run():
 start=time.monotonic();out=dict(status='finite exact checks, not proof',reverse_formulas=0,cleared_formulas=0,polynomial_identities=0,determinants=0,forbidden_zeros=0,top_gaps=0,failures=[])
 for j in range(1,41):
  for s in [0,1,4,10]:
   for h in range(j+1):
    for t in [s,s+2]:
     out['reverse_formulas']+=1
     r=cv(j,s,t,h)
     if raw(j,s,t,2*j-h)!=comb(s+j+3,j)*comb(t+j+3,j)*r:out['failures'].append(['reverse',j,s,t,h])
     out['cleared_formulas']+=1
     if cc(j,s,t,h,h)!=fall(s+j+3,h)*fall(t+j+3,h)*r:out['failures'].append(['cleared',j,s,t,h])
 for h in range(2,13):
  p=json.loads((O/f'reverse-certificate-h{h}.json').read_text())
  for k in [0,1,3,10,50]:
   for s in [0,1,4,20]:
    j=h+k
    gap=cc(j,s+1,s+1,h,h-1)*cc(j,s,s+2,h,h)-cc(j,s+1,s+1,h,h)*cc(j,s,s+2,h,h-1)
    value=sum(v*k**e[0]*s**e[1] for e,v in p)
    out['polynomial_identities']+=1
    if value!=gap:out['failures'].append(['polynomial',h,k,s,value,gap])
 for a in range(17):
  for b in range(a+1):
   for c in range(b+1):
    for d in range(c+1):
     value=determinant([a,b,c,d]);out['determinants']+=1
     expected=0 if c>=3 else 16*(a-b+1)*(1+(c==1)+(d==1)) if b>=2 else 1 if a==0 else 4*((2*(b+c+d)+1)*a-(b+c+d))
     out['forbidden_zeros']+=c>=3
     if value!=expected:out['failures'].append(['det',a,b,c,d,value,expected])
 for j in range(3,121):
  for s in range(21):
   x=s+j+3
   g2=cv(j,s+1,s+1,1)*cv(j,s,s+2,2)-cv(j,s+1,s+1,2)*cv(j,s,s+2,1)
   expected=F(128*j*j*(j-1)*(2*x+1),x*x*(x-1)*(x+1)**2*(x+2))
   out['top_gaps']+=1
   if g2!=expected:out['failures'].append(['second gap',j,s])
 out['seconds']=time.monotonic()-start;out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'representation-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
 # Reproduce the auxiliary searches; no source-family witness is implied.
 rng=random.Random(983);aux=dict(cases=0,failures=[],status='finite arbitrary increasing log-concave weight experiment')
 for trial in range(1000):
  j=rng.randrange(2,18);rs=sorted([F(rng.randrange(10,80),10) for _ in range(j)],reverse=True);ww=[F(1)]
  for r in rs:ww.append(ww[-1]*r)
  assert all(ww[i]<=ww[i+1] for i in range(j)) and all(ww[i]**2>=ww[i-1]*ww[i+1] for i in range(1,j))
  for s in [0,2,9]:
   aux['cases']+=1;bad=check(ww,j,s)
   if bad:aux['failures'].append(dict(j=j,s=s,w=list(map(str,ww)),bad=[(n,str(g)) for n,g in bad]));break
  if aux['failures']:break
 (O/'increasing-lc-reproduced.json').write_text(json.dumps(aux,indent=2)+'\n');print(json.dumps(aux),flush=True)
if __name__=='__main__':run()
