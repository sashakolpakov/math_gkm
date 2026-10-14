"""Machine-authored exact candidate formula search, not a universal proof."""
from fractions import Fraction as F
import itertools,json,pathlib,random,time
from next_slice_26dd import step,terminal,R

patterns=[''.join(w) for w in itertools.product('01',repeat=4)]
monoms=[(i,j) for i in range(6) for j in range(6-i)]
smons=[(i,j) for i in range(3) for j in range(3-i)]
tmons=[(i,j) for i in range(2) for j in range(2-i)]
names=[f'n^{i} m^{j}' for i,j in monoms]+[f's n^{i} m^{j}' for i,j in smons]+[f't n^{i} m^{j}' for i,j in tmons]+patterns

def features(w):
 n=len(w);m=w.count('1');s=sum(x!=y for x,y in zip(w,w[1:]));t=sum(x==z and y=='0' for x,y,z in zip(w,w[1:],w[2:]))
 return [n**i*m**j for i,j in monoms]+[s*n**i*m**j for i,j in smons]+[t*n**i*m**j for i,j in tmons]+[sum(w[i:i+4]==z for i in range(n-3)) for z in patterns]

def vals(w):
 p=[[0]*(r+1) for r in range(R+1)];p[0][0]=1;q=p
 for bit in w:p,q=step(p,q,bit=='1')
 return terminal(p,q,5)[1:5]

def main():
 start=time.monotonic();basis={};ncols=len(names);count=0;bad=[]
 rng=random.Random(260014)
 words=[''.join(w) for n in range(3,10) for w in itertools.product('01',repeat=n)]
 words+=[''.join(rng.choice('01') for _ in range(n)) for n in range(10,24) for _ in range(20)]
 for w in words:
  row=list(map(F,features(w)+vals(w)));count+=1
  for c,b in sorted(basis.items()):
   if row[c]:
    k=row[c];row=[x-k*y for x,y in zip(row,b)]
  pivot=next((c for c in range(ncols) if row[c]),None)
  if pivot is None:
   if any(row[ncols:]):bad.append(w);break
  else:
   k=row[pivot];basis[pivot]=[x/k for x in row]
 sols=[[F(0)]*ncols for _ in range(4)]
 for c,row in sorted(basis.items(),reverse=True):
  for k in range(4):sols[k][c]=row[ncols+k]-sum(row[j]*sols[k][j] for j in range(c+1,ncols))
 fits=[{names[i]:str(v) for i,v in enumerate(sol) if v} for sol in sols]
 holdbad=[]
 if not bad:
  for n in range(10,51):
   for _ in range(50):
    w=''.join(rng.choice('01') for _ in range(n));f=features(w);v=vals(w)
    if any(sum(a*b for a,b in zip(f,sol))!=v[k] for k,sol in enumerate(sols)):holdbad.append(w)
 out=dict(status='candidate exact interpolation only; no universal proof',basis=names,rank=len(basis),training_words=count,
   inconsistency=bad,fits=fits,holdout_words=2050,holdout_failures=holdbad,seconds=time.monotonic()-start)
 pathlib.Path('evidence/markov-26dd33d6/quintic-fit.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
