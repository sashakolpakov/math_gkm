"""Machine-authored exploratory exact two-state invariants, not proofs."""
from ambient_transfer_probe_5c90 import add,shift,mul
import itertools,json,time,pathlib
def states(w):
 f={(1,0):1,(1,1):1};g={(0,0):1,(1,0):1,(1,1):1}
 for r in reversed(w):
  if r:
   h=mul({(1,1):1,(1,2):1},f);k=mul({(1,0):1,(1,1):1},g)
   f,g=add(shift(f,0,1),h,k),add({ij:2*c for ij,c in shift(f,0,1).items()},h,g,k)
  else:
   h=add(shift(f,1,1),shift(g,1,0));f,g=h,add(h,g)
 return f,g,add(shift(f,0,1),g)
t=time.monotonic();counts={};fails={}
def test(name,gap,w,s,j,vals):
 counts[name]=counts.get(name,0)+1
 if gap<0 and name not in fails:fails[name]=dict(word=''.join('B' if r else 'A' for r in w),s=s,j=j,values=vals,gap=gap)
for n in range(11):
 for w in itertools.product([False,True],repeat=n):
  N=n+1;f,g,F=states(w)
  for name,p in [('f',f),('g',g),('F',F)]:
   for s in range(N+1):
    for j in range(N+sum(w)+3):
     a,b,c,d=[p.get(z,0) for z in [(s,j),(s+1,j),(s,j+1),(s+1,j+1)]]
     test(name+'_TP2',a*d-b*c,w,s,j,[a,b,c,d])
     if s+2<=N:
      e=p.get((s+2,j),0)
      test(name+'_ULC',(s+1)*(N-s-1)*b*b-(s+2)*(N-s)*a*e,w,s,j,[a,b,e])
  # Adjacent-state ratio order, tested in both orientations.
  for s in range(N):
   for j in range(N+sum(w)+3):
    a,b,c,d=[p.get((t,j),0) for p,t in [(f,s),(f,s+1),(g,s),(g,s+1)]]
    test('state_forward',b*c-a*d,w,s,j,[a,b,c,d])
    test('state_reverse',a*d-b*c,w,s,j,[a,b,c,d])
 rec=dict(status='finite exact exploratory tests only',max_word_length=n,counts=counts,first_failures=fails,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-b5dbe087/transfer-invariants.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps(dict(length=n,tests=sum(counts.values()),failed_candidates=list(fails),seconds=time.monotonic()-t)),flush=True)
