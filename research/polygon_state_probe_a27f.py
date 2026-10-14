"""Machine-authored guarded ambient-state tests; arbitrary words remain distinct from sources."""
from transfer_states_b5db import states
import itertools,pathlib,json,time,random
out=pathlib.Path('evidence/markov-a27f6d42');start=time.monotonic();counts={};fails={};done=0
def check(w,kind):
 global done
 f,g,F=states(w);N=len(w)+1;a=sum(w)+1;b=N+1
 for s in range(N-1):
  for j in range(min(a+s,b*s//(b-a))+1):
   u=[f.get((s+k,j-1),0) if j else 0 for k in range(3)];v=[g.get((s+k,j),0) for k in range(3)]
   A=(s+2)*(N-s);B=(s+1)*(N-s-1)
   gaps=dict(f=B*u[1]**2-A*u[0]*u[2],g=B*v[1]**2-A*v[0]*v[2],mixed=2*B*u[1]*v[1]-A*(u[0]*v[2]+v[0]*u[2]),F=B*(u[1]+v[1])**2-A*(u[0]+v[0])*(u[2]+v[2]))
   for name,gap in gaps.items():
    key=kind+'_'+name;counts[key]=counts.get(key,0)+1
    if gap<0 and key not in fails:fails[key]=dict(word=''.join('B' if r else 'A' for r in w),a=a,b=b,s=s,j=j,f=u,g=v,gap=gap)
 done+=1
def save():
 r=dict(status='finite exact virtual-polygon experiments; arbitrary words not source witnesses',words=done,counts=counts,first_failures=fails,seconds=time.monotonic()-start)
 (out/'polygon-state-probe.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r),flush=True)
for n in range(13):
 for w in itertools.product([False,True],repeat=n):check(w,'all')
 if n%3==0:save()
rng=random.Random(27469)
for n in [30,60,100]:
 for p in [.05,.2,.5,.8,.95]:
  for _ in range(5):check(tuple(rng.random()<p for _ in range(n)),'random')
save()
