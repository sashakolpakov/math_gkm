"""Machine-authored full-degree grouped raw gap test, no row truncation."""
from pathlib import Path
from experiment_8833 import add
from itertools import product
import random,time,json
O=Path('/Users/sasha/math_gkm/evidence/markov-f52ba141')
def sh(p,a=0,b=0):return {(i+a,j+b):v for (i,j),v in p.items()}
def A(q,p):return sh(add(q,sh(p,1)),b=1),add(q,add(p,sh(p,1)))
def C(q,p):
 r=add(q,sh(p,1));return add(q,sh(r,b=1)),r
def main():
 st=time.monotonic();counts={};fail={};first={};zero=0
 words=[(False,)+w for n in range(11) for w in product([False,True],repeat=n)]
 rng=random.Random(525214100)
 words += [tuple([False]+[rng.choice([False,True]) for _ in range(rng.randrange(12,80))]) for _ in range(300)]
 done=0
 for w in words:
  q,p={(0,0):1},{}
  for z in w:
   q,p=A(q,p)
   if z:q,p=C(q,p)
  r=add(q,sh(p,1));s=add(r,p);f=sh(r,b=1);g=sh(s,1)
  deg=max(i+j for i,j in f.keys()|g.keys())
  for j in range(deg+2):
   for i in range(deg+2-j):
    a,b,c=[f.get((i+k,j),0) for k in range(3)]
    d,e,h=[g.get((i+k,j),0) for k in range(3)]
    zero+=int(b==0 or e==0)
    for key,z in [('mixed_B',2*b*e-a*h-c*d),('gap_R',b*b-a*c),('gap_S',e*e-d*h)]:
     counts[key]=counts.get(key,0)+1
     if z<0:
      fail[key]=fail.get(key,0)+1
      if key not in first:first[key]={'word':list(map(int,w)),'i':i,'j':j,'f':[a,b,c],'g':[d,e,h],'gap':z}
  done+=1
  if done%100==0:(O/'full-aggregate-progress.json').write_text(json.dumps({'words':done,'counts':counts,'failures':fail,'examples':first,'seconds':time.monotonic()-st},indent=2))
  if time.monotonic()-st>150:break
 out={'status':'Finite exact enlarged-word test, full degree triangle plus zero boundary','words':done,'planned':len(words),'counts':counts,'failures':fail,'first_examples':first,'zero_centers':zero,'seconds':time.monotonic()-st}
 (O/'full-aggregate-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
