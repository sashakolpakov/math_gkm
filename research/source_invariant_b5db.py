"""Machine-authored exact source-word probe of transfer invariants."""
from ambient_transfer_probe_5c90 import add,shift,mul
import json,time,pathlib,math
def states(w):
 f={(1,0):1,(1,1):1};g={(0,0):1,(1,0):1,(1,1):1}
 for r in reversed(w):
  if r:
   h=mul({(1,1):1,(1,2):1},f);k=mul({(1,0):1,(1,1):1},g)
   f,g=add(shift(f,0,1),h,k),add({ij:2*c for ij,c in shift(f,0,1).items()},h,g,k)
  else:
   h=add(shift(f,1,1),shift(g,1,0));f,g=h,add(h,g)
 return f,g,add(shift(f,0,1),g)
t=time.monotonic();counts={};fails={};fractions=0
def test(name,gap,a,b,s,j,vals):
 counts[name]=counts.get(name,0)+1
 if gap<0 and name not in fails:fails[name]=dict(a=a,b=b,s=s,j=j,values=vals,gap=gap)
for b in range(2,46):
 for a in range(1,b):
  if math.gcd(a,b)!=1:continue
  fractions+=1;w=[a*k//b<a*(k+1)//b for k in range(b)][1:-1];N=b-1
  f,g,F=states(w)
  for name,p in [('f',f),('g',g),('F',F)]:
   for s in range(N+1):
    for j in range(N+a+1):
     u,v,x,y=[p.get(z,0) for z in [(s,j),(s+1,j),(s,j+1),(s+1,j+1)]]
     test(name+'_TP2',u*y-v*x,a,b,s,j,[u,v,x,y])
     if s+2<=N:
      z=p.get((s+2,j),0)
      test(name+'_ULC',(s+1)*(N-s-1)*v*v-(s+2)*(N-s)*u*z,a,b,s,j,[u,v,z])
  for s in range(N):
   for j in range(N+a+1):
    u,v,x,y=[p.get((t,j),0) for p,t in [(f,s),(f,s+1),(g,s),(g,s+1)]]
    test('state_forward',v*x-u*y,a,b,s,j,[u,v,x,y])
 rec=dict(status='finite exact source-word tests only',denominator_bound=b,fractions=fractions,counts=counts,first_failures=fails,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-b5dbe087/source-invariants.json').write_text(json.dumps(rec,indent=2)+'\n')
 if b%5==0:print(json.dumps(dict(b=b,tests=sum(counts.values()),failures=fails)),flush=True)
