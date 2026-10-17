"""Machine-authored 7a344181. Direct weighted correction outputs, finite only."""
from pathlib import Path
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-7a344181')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(d,j,t):
 return C(d+j,t)*C(t+j+3,j)+4*sum((j-s)*C(d+s,t)*C(t+s+3,s) for s in range(j))
def main():
 start=time.monotonic()
 out={'status':'finite auxiliary experiment; not universal or a root proof',
      'ranges':{'d':[0,50],'j':[3,30],'c':[4,8]},'triples':0,'zeros':0,'failures':[]}
 for d in range(51):
  for j in range(3,31):
   vals=[L(d,j,t) for t in range(d+j+4)]
   for c in [4,8]:
    a=[0,0,c]+[v+c*C(d,t+1) for t,v in enumerate(vals)]
    for t in range(len(a)-2):
     out['triples']+=1;out['zeros']+=0 in a[t:t+3]
     if a[t]*a[t+2]>a[t+1]**2:out['failures'].append([d,j,c,t-2,a[t:t+3]])
 out['seconds']=time.monotonic()-start
 (O/'weighted-correction-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
