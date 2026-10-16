"""Machine-authored finite test of an unformalized lower-row convolution formula."""
from pathlib import Path
from math import comb
import json,sys,time
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw
def C(n,k):return comb(n,k) if 0<=k<=n else 0
t=time.monotonic();out={'status':'finite experiment only; general identity and sign theorem unformalized',
 'sources':0,'rows':0,'identities':0,'zero_values':0,'failures':[]}
for q in range(1,31):
 p=raw(2,2*q+1);out['sources']+=1
 for d in range(q):
  j=q-d;out['rows']+=1
  for i in range(2*q+5):
   pred=sum(C(2*d,h)*C(2*i-2-h,i)*(C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h))
            for h in range(i-1)) if i>=2 else 0
   actual=p.get((i,j),0)
   if pred!=actual:out['failures'].append([q,d,i,pred,actual])
   out['identities']+=1;out['zero_values']+=int(actual==0)
out['seconds']=time.monotonic()-t
Path('evidence/markov-6e1369de/offset-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
