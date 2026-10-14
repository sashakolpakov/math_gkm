"""Machine-authored exact independent transfer experiment; not a proof."""
import json,pathlib,time,itertools,random,math
from aggregate_a3c5 import poly,add,shift
out=pathlib.Path('evidence/markov-5c90b506')
def mul(p,q):
 z={}
 for (s,j),c in p.items():
  for (t,k),d in q.items():z[s+t,j+k]=z.get((s+t,j+k),0)+c*d
 return z
def transfer(w):
 f={(1,0):1,(1,1):1};g={(0,0):1,(1,0):1,(1,1):1}
 for r in reversed(w):
  if r:
   h=mul({(1,1):1,(1,2):1},f)
   k=mul({(1,0):1,(1,1):1},g)
   f,g=add(shift(f,0,1),h,k),add({ij:2*c for ij,c in shift(f,0,1).items()},h,g,k)
  else:
   h=add(shift(f,1,1),shift(g,1,0));f,g=h,add(h,g)
 return add(shift(f,0,1),g)
def main():
 t=time.monotonic();rng=random.Random(590);words=0;triples=0;fails={};inputs=[];identities=0
 tests=[w for n in range(11) for w in itertools.product([False,True],repeat=n)]
 tests += [tuple(rng.random()<p for _ in range(n)) for p in [.05,.2,.5,.8,.95] for n in [20,40,60,100] for _ in range(10)]
 for w in tests:
  F=transfer(w);N=len(w)+1;a=sum(w)+1;d=N+a
  assert max(s for s,j in F)==N
  assert {j:c for (s,j),c in F.items() if s==0}=={0:1}
  assert {j:c for (s,j),c in F.items() if s==N}=={j:math.comb(d,j) for j in range(d+1)}
  if len(w)<=10:
   p=poly(tuple(x for r in w for x in ((False,True) if r else (False,)))+(False,))
   assert F=={(i+j-a,j):c for (i,j),c in p.items()};identities+=1
  else:inputs.append(''.join('B' if r else 'A' for r in w))
  for (s,j),L in F.items():
   if s+2>N:continue
   R=F.get((s+2,j),0);M=F.get((s+1,j),0)
   if not L*R:continue
   gap=(s+1)*(N-s-1)*M*M-(s+2)*(N-s)*L*R;triples+=1
   if gap<0:fails.setdefault('ambient',dict(word=list(w),s=s,j=j,coefficients=[L,M,R],gap=gap))
  words+=1
  if words%100==0:
   print(json.dumps(dict(words=words,triples=triples,seconds=time.monotonic()-t,failures=fails)),flush=True)
 rec=dict(status='finite exact experiments, not universal proof',words=words,triples=triples,independent_transfer_identities=identities,seed=590,random_words=inputs,failures=fails,seconds=time.monotonic()-t)
 (out/'ambient-transfer.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k!='random_words'}))
if __name__=='__main__':main()
