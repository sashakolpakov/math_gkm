"""Machine-authored exact raw terminal-A tests. Experiments are not proofs."""
from pathlib import Path
from itertools import product
from math import comb
import json,random,time
O=Path('/Users/sasha/math_gkm/evidence/markov-263d8c71')
def add(*ps):
 q={}
 for p in ps:
  for k,v in p.items():q[k]=q.get(k,0)+v
 return {k:v for k,v in q.items() if v}
def sh(p,a=0,b=0):return {(i+a,j+b):v for (i,j),v in p.items()}
def A(q,p):return sh(add(q,sh(p,1)),b=1),add(q,p,sh(p,1))
def C(q,p):
 r=add(q,sh(p,1));return add(q,sh(r,b=1)),r
def pair(w):
 q,p={(0,0):1},{}
 for z in w:
  q,p=A(q,p)
  if z:q,p=C(q,p)
 return q,p
def main():
 st=time.monotonic();rng=random.Random(263871)
 words=[w for n in range(10) for w in product([0,1],repeat=n)]
 words += [tuple(rng.randrange(2) for _ in range(rng.randrange(10,65))) for _ in range(150)]
 small=[];counts={'identity':0,'adjacent':0,'zeros':0};fails=[]
 for w in words:
  q,p=pair((0,)+w+(0,)); n=len(w);m=sum(w)
  row=[p.get((i,2),0) for i in range(n+m+3)]
  if n<=2:small.append({'core':w,'row':row})
  for i in range(len(row)-2):
   counts['adjacent']+=1;counts['zeros']+=int(0 in row[i:i+3])
   if row[i+1]**2<row[i]*row[i+2]:fails.append(['adjacent',w,i,row[i:i+3]])
  if n>=3:
   r=w[-1];t=w[0]+2*sum(a*b for a,b in zip(w,w[1:]))
   assert t+r<=2*m
   J=[4*t,9*m*m+7*m+2-4*r,6*m*m+6*m*n+4*n,(m+n)*(m+n+1)]
   for i in range(n+m+4):
    lhs=2*(p.get((i-1,2),0) if i else 0)
    rhs=sum(c*comb(n-3,i-m-k) for k,c in enumerate(J) if 0<=i-m-k<=n-3)
    counts['identity']+=1
    if lhs!=rhs:fails.append(['identity',w,i,lhs,rhs])
 out={'status':'finite exact experiment, not proof','words':len(words),'counts':counts,'failures':fails,'small':small,'seconds':time.monotonic()-st}
 (O/'terminal-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
