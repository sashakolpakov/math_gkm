"""Machine-authored exact finite tests of the new rational representation.
Original source mutation is used independently; zeros and all directions retained.
"""
from pathlib import Path
from math import comb
import json,time,hashlib
from gf_identity_13e37040 import u,v,t,pol
from three_probe_9e205206 import frame,add,mul,neg
O=Path('evidence/markov-13e37040');start=time.monotonic()
def series(p):
 out=[{} for _ in range(max((k for i,j,k in p),default=0)+1)]
 for (i,j,k),c in p.items():out[k][i,j]=c
 return out
def expand(num,den,N):
 num,den=series(num),series(den);assert den[0]=={(0,0):1}
 out=[]
 for n in range(N+1):
  a=num[n].copy() if n<len(num) else {}
  for k in range(1,min(n,len(den)-1)+1):a=add(a,neg(mul(den[k],out[n-k])))
  out.append(a)
 return out
def K(a,b,j,k,e):
 if j<0 or k<0:return 0
 return sum((3*z+e)*comb(j-z+a,a)*comb(k-z+b,b) for z in range(min(j,k)+1))
def D(c,j,k):
 if k<0:return 0
 return sum((1 if z==0 else 4*z)*comb(j-z+c+3,c+3)*comb(k-z+c,c) for z in range(min(j,k)+1))
qs=list(range(1,25))+[29,33,37,41]
N=max(qs)
master=expand(u**3*t*(1+v*t**2)**2,
 (1-v*t**2)**2*(1-v*t)**3*((1-t)*(1-v*t)-u*t),3*N+2)
out={'q_values':qs,'coefficients':0,'source_zeros':0,'D_extractions':0,'E_extractions':0,'triples':[0,0,0],'failures':[]}
de=(1-v**3*t**2)**2*(1-v*t)*(1-v**2*t)**2*((1-v*t)*(1-v**2*t)-u*v*t)
for r in (False,True):
 ne=4*u**3*v**(4 if r else 3)*t**(3 if r else 2)*((2+v**3*t**2) if r else (1+2*v**3*t**2))
 es=expand(ne,de,N)
 for q in qs:
  a,b,p=frame([False]*(q-1)+[True,r]);md=master[b];e=es[q]
  for i in range(3,b+6):
   for j in range(max(0,b+7-i)):
    actual=p.get((i,j),0);dv=md.get((i,j),0);ev=e.get((i,j),0)
    out['coefficients']+=1;out['source_zeros']+=int(actual==0)
    out['D_extractions']+=1;out['E_extractions']+=1
    expectedD=D(i-3,j,b+2-i-j);expectedE=4*K(i-1,i-2,j-q-1,b-q-i-j,2 if r else 1)
    if actual!=dv+ev or dv!=expectedD or ev!=expectedE:
     out['failures'].append([q,r,i,j,actual,dv,ev,expectedD,expectedE])
  inside=lambda i,j: i>=0 and j>=0 and 3*b<=b*i+3*j and i+j<=b+2
  for i in range(b+3):
   for j in range(b+3-i):
    for z,ps in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*x) for x in ps):
      out['triples'][z]+=1;x,y,zv=[p.get(pt,0) for pt in ps]
      if x*zv>y*y:out['failures'].append(['LC',q,r,ps,[x,y,zv]])
out.update(seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='Finite exact experiments only; not universal coefficient extraction or log-concavity proof.')
(O/'gf-source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
