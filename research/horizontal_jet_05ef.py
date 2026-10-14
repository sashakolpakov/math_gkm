"""Machine-authored exploratory exact second horizontal jet, no proof claims."""
from balanced_f80 import A,B,mm
import json,itertools,pathlib,time
def div1(c):
 q=[c[0]]
 for x in c[1:-1]:q.append(x-q[-1])
 return q if c[-1]==q[-1] else None
def jet(w):
 M=A
 for b in w:M=mm(M,B if b else A)
 p=mm(M,B)[1];n=len(w);m=sum(w)
 c=[p.get((i,2),0) for i in range(n+m+1)]
 low=next((i for i,a in enumerate(c) if a),0)
 c=c[low:];div=0
 while len(c)>1 and (q:=div1(c)) is not None:c=q;div+=1
 return dict(w=''.join(map(str,w)),n=n,m=m,low=low,binomial=div,seed=c)
out=[]
for w in itertools.product([0,1],repeat=6):out.append(jet(w))
pathlib.Path('evidence/markov-05ef7fab/horizontal-jet.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out[:15]));print('degrees',sorted(set(len(x['seed'])-1 for x in out)))
