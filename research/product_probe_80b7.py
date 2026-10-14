"""Exact tests of products created by rank-one C deletion, not proofs."""
import json,itertools,pathlib,random,time
from aggregate_a3c5 import poly
from collections import defaultdict
O=pathlib.Path('evidence/markov-80b7912a')
def mul(p,q):
 d=defaultdict(int)
 for (i,j),c in p.items():
  for (k,l),e in q.items():d[i+k,j+l]+=c*e
 return dict(d)
def fail(p):
 for (i,j),a in p.items():
  b=p.get((i+1,j),0);c=p.get((i+2,j),0)
  if b*b<a*c:return dict(i=i,j=j,coefficients=[a,b,c])
def main():
 fs=[poly([False]*n) for n in range(31)];ct=0;bad=None
 for n in range(31):
  for m in range(n,31):
   p=mul(fs[n],fs[m]);bad=fail(p);ct+=1
   if bad:bad=dict(blocks=[n,m],**bad);break
  if bad:break
 result=dict(cases=ct,first_failure=bad,status='finite exact experiment')
 (O/'products.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
