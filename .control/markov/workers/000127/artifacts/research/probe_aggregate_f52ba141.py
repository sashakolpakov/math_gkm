"""Machine-authored exact aggregate-gap experiment; finite evidence only."""
from pathlib import Path
import json,random,time,itertools
from experiment_8833 import add,mul
O=Path('/Users/sasha/math_gkm/evidence/markov-f52ba141')
one={(0,0):1};x={(1,0):1};y={(0,1):1};h=add(one,x)
def shift(p,di=0,dj=0):return {(i+di,j+dj):v for (i,j),v in p.items() if j+dj<=8}
def astep(q,p):return shift(add(q,shift(p,1)),dj=1),add(q,add(p,shift(p,1)))
def cstep(q,p):
 r=add(q,shift(p,1));return add(q,shift(r,dj=1)),r
def gap(p,i,j):return p.get((i+1,j),0)**2-p.get((i,j),0)*p.get((i+2,j),0)
def mixed(p,q,i,j):return 2*p.get((i+1,j),0)*q.get((i+1,j),0)-p.get((i,j),0)*q.get((i+2,j),0)-p.get((i+2,j),0)*q.get((i,j),0)
counts={};fails={};examples={};mins={};zeros=0
def check(kind,p,q,w):
 global zeros
 mx=max((i for i,j in p.keys()|q.keys()),default=0)
 for j in range(9):
  for i in range(mx+2):
   z=mixed(p,q,i,j);counts[kind]=counts.get(kind,0)+1
   if p.get((i+1,j),0)==0 or q.get((i+1,j),0)==0:zeros+=1
   if z<0:
    fails[kind]=fails.get(kind,0)+1
    if kind not in examples:examples[kind]={'word':[int(t) for t in w],'j':j,'i':i,'p':[p.get((i+k,j),0) for k in range(3)],'q':[q.get((i+k,j),0) for k in range(3)],'mixed':z,'gap_sum':gap(p,i,j)+gap(q,i,j),'total_gap':gap(add(p,q),i,j)}
def main():
 start=time.monotonic();words=[]
 for n in range(0,9):words += [(False,)+w for w in itertools.product([False,True],repeat=n)]
 for a in [1,2,3,5,9,17,33]:
  for b in [1,2,3,5,9,17,33]:
   for c in [1,2,5,13]:
    words += [tuple([False]+[True]*a+[False]*b+[True]*c),tuple([False]*a+[True]*b+[False]*c)]
 rng=random.Random(5252141)
 words += [tuple([False]+[rng.choice([False,True]) for _ in range(rng.randrange(10,80))]) for _ in range(200)]
 completed=0
 for w in words:
  q,p=one,{}
  for bit in w:
   q,p=astep(q,p)
   if bit:q,p=cstep(q,p)
  r=add(q,shift(p,1));s=add(r,p)
  yr=shift(r,dj=1);xs=shift(s,1);hs=add(s,xs)
  for name,f,g in [('R_LC',r,r),('S_LC',s,s),('B_group',yr,xs),('AA_group',yr,hs),('A_compensated',add(yr,hs),add(yr,hs))]:check(name,f,g,w)
  completed+=1
  if completed%100==0:
   (O/'aggregate-progress.json').write_text(json.dumps({'completed':completed,'seconds':time.monotonic()-start,'counts':counts,'failures':fails,'examples':examples},indent=2))
  if time.monotonic()-start>150:break
 out={'status':'Finite exact enlarged-word experiment; truncated at y degree 8, all zero centers retained','words':completed,'planned_words':len(words),'counts':counts,'failures':fails,'examples':examples,'zero_centers':zeros,'seconds':time.monotonic()-start}
 (O/'aggregate-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
