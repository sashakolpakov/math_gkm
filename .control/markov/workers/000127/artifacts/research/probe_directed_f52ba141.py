"""Machine-authored tests of directional components of the grouped B gap."""
from probe_aggregate_f52ba141 import *
from math import gcd
def main():
 start=time.monotonic();counts={};fails={};examples={};words=[]
 for n in range(9):words += [('arbitrary',(False,)+w) for w in itertools.product([False,True],repeat=n)]
 for b in range(2,46):
  for a in range(1,b):
   if gcd(a,b)==1:words.append(('source',tuple(bool((k+1)*a//b-k*a//b) for k in range(b))))
 for typ,w in words:
  q,p=one,{}
  for bit in w:
   q,p=astep(q,p)
   if bit:q,p=cstep(q,p)
  r=add(q,shift(p,1));s=add(r,p)
  f=shift(r,dj=1);g=shift(s,1)
  for j in range(9):
   for i in range(max((i for i,j in f.keys()|g.keys()),default=0)+2):
    f0,f1,f2=[f.get((i+k,j),0) for k in range(3)]
    g0,g1,g2=[g.get((i+k,j),0) for k in range(3)]
    for nm,z in [('left',f1*g1-f0*g2),('right',f1*g1-f2*g0)]:
     key=typ+'_'+nm;counts[key]=counts.get(key,0)+1
     if z<0:
      fails[key]=fails.get(key,0)+1
      if key not in examples:examples[key]={'word':list(map(int,w)),'i':i,'j':j,'f':[f0,f1,f2],'g':[g0,g1,g2],'gap':z}
 out={'status':'Finite exact test, rows 0..8; zeros retained','words':len(words),'counts':counts,'failures':fails,'first_examples':examples,'seconds':time.monotonic()-start}
 (O/'directed-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
