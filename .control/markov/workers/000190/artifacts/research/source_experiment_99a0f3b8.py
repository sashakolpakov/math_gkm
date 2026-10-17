"""Machine-authored exact source recurrence checks. Experiments are not proofs."""
from pathlib import Path
from three_probe_9e205206 import frame
from source_experiment_55cf20d2 import upper,C
from exact_integer_experiment_73199834 import scalar,cut
from math import comb
import json,time,hashlib,random
O=Path('/Users/sasha/math_gkm/evidence/markov-99a0f3b8')
def fib(n,i,j):
 if i==0:return int(j==n)
 return C(n-j-1,i-1)*C(i+j,j) if i+j<=n else 0
def gain(q,r,i,j):
 def f(n,i,j):return fib(n,i,j) if i>=0 and j>=0 else 0
 if r:return f(q,i-1,j)+f(q,i,j-1)+f(q,i,j)+f(q+1,i,j)
 return f(q,i,j-1)+f(q+1,i-1,j)+f(q+1,i,j-1)+f(q+1,i,j)
def corrections(q,r,K):
 rows=[];eps=1 if r else 2
 for k in range(K+1):
  prev=rows[-1] if k else {};prev2=rows[-2] if k>=2 else {}
  p={i:4*gain(q,r,i-1,q+eps-k)+2*prev.get(i,0)-2*prev.get(i-1,0)-prev2.get(i,0)-2*prev2.get(i-1,0)-prev2.get(i-2,0) for i in range(1,k+3)}
  rows.append({i:v for i,v in p.items() if v})
 return rows
def source():
 start=time.monotonic();out=dict(coefficient_checks=0,zeros=0,rows=0,correction_sign_checks=0,wide_triples=0,first_triples=0,raw_triples=[0,0,0],failures=[],witnesses=[])
 polys=[]
 for q in list(range(1,26))+[32,48,72]:
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r]);polys.append((a,b,p));cor=corrections(q,r,q)
   for k in range(q+1):
    t=q+3+k;j=b+2-t
    if 2*t>b:continue
    out['rows']+=1
    for c in range(t+5):
     raw=p.get((c,j),0);diff=cor[k].get(c,0)
     out['coefficient_checks']+=1;out['zeros']+=raw==0;out['correction_sign_checks']+=1
     if raw!=upper(b,t,c)+diff:out['failures'].append(['identity',q,r,k,c])
     if diff<0 or (c>k+1 and diff!=0):out['failures'].append(['correction',q,r,k,c,diff])
    for c in range(t+3):
     vals=[p.get((c+z,j),0) for z in range(3)]
     if k==0:
      out['first_triples']+=1
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['first',q,r,c])
     if c>=9 and k+1<c and 12*t+2<=4*b+3*c:
      out['wide_triples']+=1
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['wide',q,r,k,c])
      if k>=2 and c+2<=t and len(out['witnesses'])<6:out['witnesses'].append(dict(q=q,r=r,b=b,t=t,k=k,c=c,j=j,raw=vals,gap=vals[1]**2-vals[0]*vals[2]))
 rng=random.Random(190)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(6)]) for _ in range(16))
 polys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})]);seen=set()
 for a,b,p in polys:
  if (a,b) in seen:continue
  seen.add((a,b))
  def inside(i,j):return a*b<=b*i+a*j and i+j<=a+b-1
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      vs=[p.get(z,0) for z in pts];out['raw_triples'][direction]+=1
      if vs[0]*vs[2]>vs[1]**2:out['failures'].append(['raw',a,b,direction,pts,vs])
 out.update(labels=sorted(seen),seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),status='finite exact experiment only')
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2));print(json.dumps({k:v for k,v in out.items() if k not in ['labels','witnesses']}))
if __name__=='__main__':source()
