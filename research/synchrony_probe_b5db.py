"""Machine-authored exact mixed-gap tests for the ambient terminal sum."""
from transfer_states_b5db import states
import itertools,json,time,pathlib,math,random
t=time.monotonic();counts={};fails={};inputs=[]
def check(w,kind,label):
 N=len(w)+1;f,g,F=states(w)
 for s in range(N-1):
  for j in range(N+sum(w)+3):
   fs=[f.get((s+k,j-1),0) if j else 0 for k in range(3)]
   gs=[g.get((s+k,j),0) for k in range(3)]
   A=(s+2)*(N-s);B=(s+1)*(N-s-1)
   mixed=2*B*fs[1]*gs[1]-A*(fs[0]*gs[2]+gs[0]*fs[2])
   for nm,gap in [('mixed',mixed),('f',B*fs[1]**2-A*fs[0]*fs[2]),('g',B*gs[1]**2-A*gs[0]*gs[2])]:
    key=kind+'_'+nm;counts[key]=counts.get(key,0)+1
    if gap<0 and key not in fails:fails[key]=dict(label=label,word=''.join('B' if r else 'A' for r in w),s=s,j=j,f=fs,g=gs,gap=gap)
for n in range(19):
 for half in itertools.product([False,True],repeat=(n+1)//2):
  check(half+half[:n//2][::-1],'palindrome',n)
for b in range(2,36):
 for a in range(1,b):
  if math.gcd(a,b)==1:check(tuple(a*k//b<a*(k+1)//b for k in range(b))[1:-1],'source',[a,b])
rng=random.Random(5187)
for n in [30,50,80]:
 for prob in [.1,.5,.9]:
  for _ in range(5):
   half=tuple(rng.random()<prob for _ in range(n//2));w=half+half[::-1]
   label=dict(n=n,prob=prob,word=''.join('B' if x else 'A' for x in w));inputs.append(label)
   check(w,'seeded_palindrome',label)
rec=dict(status='finite exact mixed-gap experiments only',counts=counts,first_failures=fails,random_seed=5187,random_inputs=inputs,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-b5dbe087/synchrony.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps({k:v for k,v in rec.items() if k!='random_inputs'}))
