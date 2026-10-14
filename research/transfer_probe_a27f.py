"""Machine-authored exact finite experiments; not mathematical proof."""
from transfer_states_b5db import states
from ambient_transfer_probe_5c90 import add,shift
import itertools,json,time,pathlib,math,random
out=pathlib.Path('evidence/markov-a27f6d42');start=time.monotonic()
counts={};fails={};words={}
def check(w,kind,label):
 f,g,F=states(w);N=len(w)+1
 h=add(g,{ij:-c for ij,c in f.items()});H=add(f,shift(f,0,1))
 assert all(c>=0 for c in h.values())
 assert add(H,h)==F
 assert max(s for (s,j),c in h.items() if c)==N-1
 pols={'f':f,'h':h,'H':H,'F':F}
 for nm,p in pols.items():
  deg=N-1 if nm=='h' else N
  for s in range(max(N-1,0)):
   for j in range(N+sum(w)+3):
    a,b,c=[p.get((s+k,j),0) for k in range(3)]
    if s+2<=deg:
     A=(s+2)*(deg-s);B=(s+1)*(deg-s-1)
     gap=B*b*b-A*a*c;key=kind+'_'+nm
     counts[key]=counts.get(key,0)+1
     if gap<0 and key not in fails:fails[key]=dict(label=label,word=''.join('B' if r else 'A' for r in w),s=s,j=j,degree=deg,coefficients=[a,b,c],gap=gap)
 for s in range(N-1):
  for j in range(N+sum(w)+3):
   v=[H.get((s+k,j),0) for k in range(3)];z=[h.get((s+k,j),0) for k in range(3)]
   A=(s+2)*(N-s);B=(s+1)*(N-s-1)
   gap=2*B*v[1]*z[1]-A*(v[0]*z[2]+z[0]*v[2]);key=kind+'_mixed'
   counts[key]=counts.get(key,0)+1
   if gap<0 and key not in fails:fails[key]=dict(label=label,word=''.join('B' if r else 'A' for r in w),s=s,j=j,H=v,h=z,gap=gap)
 words[kind]=words.get(kind,0)+1
def save():
 r=dict(status='finite exact experiments only',words=words,counts=counts,first_failures=fails,seconds=time.monotonic()-start)
 (out/'positive-state-probe.json').write_text(json.dumps(r,indent=2)+'\n')
 print(json.dumps(r),flush=True)
for n in range(10):
 for w in itertools.product([False,True],repeat=n):check(w,'all',n)
save()
for b in range(2,46):
 for a in range(1,b):
  if math.gcd(a,b)==1:check(tuple(a*k//b<a*(k+1)//b for k in range(b))[1:-1],'source',[a,b])
save()
