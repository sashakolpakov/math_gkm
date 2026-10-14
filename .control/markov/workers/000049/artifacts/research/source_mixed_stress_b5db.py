"""Machine-authored seeded source mixed-gap stress with durable checkpoints."""
from transfer_states_b5db import states
import pathlib,json,time,random,math
t=time.monotonic();rng=random.Random(518749);pairs=set()
for b in [40,60,80,100,120]:
 for a in [1,2,3,b//2-1,b//2+1,b-3,b-2,b-1]:
  if 0<a<b and math.gcd(a,b)==1:pairs.add((a,b))
for _ in range(100):
 b=rng.randrange(40,121);a=rng.randrange(1,b)
 if math.gcd(a,b)==1:pairs.add((a,b))
counts=dict(fractions=0,mixed=0,f=0,g=0,F=0);fail={};completed=[]
for a,b in sorted(pairs,key=lambda ab:(ab[1],ab[0])):
 w=tuple(a*k//b<a*(k+1)//b for k in range(b))[1:-1];N=b-1
 f,g,F=states(w)
 for s in range(N-1):
  for j in range(N+a+1):
   fs=[f.get((s+k,j-1),0) if j else 0 for k in range(3)];gs=[g.get((s+k,j),0) for k in range(3)]
   A=(s+2)*(N-s);B=(s+1)*(N-s-1)
   vals=dict(mixed=2*B*fs[1]*gs[1]-A*(fs[0]*gs[2]+gs[0]*fs[2]),f=B*fs[1]**2-A*fs[0]*fs[2],g=B*gs[1]**2-A*gs[0]*gs[2],F=B*(fs[1]+gs[1])**2-A*(fs[0]+gs[0])*(fs[2]+gs[2]))
   assert vals['F']==vals['mixed']+vals['f']+vals['g']
   for name,gap in vals.items():
    counts[name]+=1
    if gap<0 and name not in fail:fail[name]=dict(a=a,b=b,s=s,j=j,f=fs,g=gs,gap=gap)
 counts['fractions']+=1;completed.append([a,b])
 rec=dict(status='finite exact seeded source stress only',seed=518749,requested_pairs=sorted(pairs),completed_pairs=completed,counts=counts,first_failures=fail,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-b5dbe087/source-mixed-stress.json').write_text(json.dumps(rec,indent=2)+'\n')
 if len(completed)%10==0:print(json.dumps(dict(completed=len(completed),requested=len(pairs),failures=fail,seconds=time.monotonic()-t)),flush=True)
print(json.dumps(dict(completed=len(completed),requested=len(pairs),counts=counts,failures=fail,seconds=time.monotonic()-t)),flush=True)
