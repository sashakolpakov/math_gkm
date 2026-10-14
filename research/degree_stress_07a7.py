"""Machine-authored targeted exact degree-group stress, not source proof."""
from pathlib import Path
import json,time,random
from degree_groups_07a7 import grouped
from cuts_fe01 import value
O=Path('evidence/markov-07a7e5b7')
def main():
 t=time.monotonic();rng=random.Random(707);words=[]
 for n,m in [(10,5),(15,5),(5,15),(12,12),(20,10),(10,20),(20,20)]:
  words.extend([(1,)*n+(0,)*m,(0,)*m+(1,)*n,(1,)*(n//2)+(0,)*m+(1,)*(n-n//2)])
 words.extend(tuple(int(rng.random()<p) for _ in range(n)) for n in [20,30,40] for p in [.15,.5,.85] for _ in range(3))
 tests=0;fail=None;done=[]
 for w in words:
  G=grouped(w)
  for (s,d),p in G.items():
   for j in range(1,len(p)):
    tests+=1
    if p[j]**2<value(p,j-1)*value(p,j+1):fail=dict(word=w,s=s,d=d,j=j,p=p);break
   if fail:break
  done.append(w)
  if fail or time.monotonic()-t>100:break
 rec=dict(status='finite enlarged-word experiment only',seed=707,words=done,tests=tests,failure=fail,seconds=time.monotonic()-t)
 (O/'degree-stress.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(words=len(done),tests=tests,failure=fail,seconds=rec['seconds'])))
if __name__=='__main__':main()
