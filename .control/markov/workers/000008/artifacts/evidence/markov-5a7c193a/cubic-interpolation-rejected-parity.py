"""Machine-authored exact exploratory interpolation; not a universal proof."""
import sys,itertools,json,pathlib,time
from fractions import Fraction as F
sys.path.insert(0,str(pathlib.Path('research').resolve()))
from word_invariants_774 import product
def solve(rows, vals):
 a=[[F(x) for x in r]+[F(y)] for r,y in zip(rows,vals)]; k=0; piv=[]
 for j in range(len(a[0])-1):
  ix=next((i for i in range(k,len(a)) if a[i][j]),None)
  if ix is None: continue
  a[k],a[ix]=a[ix],a[k]; c=a[k][j]; a[k]=[x/c for x in a[k]]
  for i in range(len(a)):
   if i!=k and a[i][j]:
    c=a[i][j]; a[i]=[x-c*y for x,y in zip(a[i],a[k])]
  piv.append(j); k+=1
 for r in a:
  if all(x==0 for x in r[:-1]) and r[-1]: raise ValueError('inconsistent')
 ans=[F(0)]*(len(a[0])-1)
 for i,j in enumerate(piv):ans[j]=a[i][-1]
 return ans
def main():
 start=time.monotonic(); powers=[(i,j) for i in range(4) for j in range(4-i)]
 rows=[]; vals=[[],[]]; count=0; diagonal_failures=[]
 for n in range(9):
  for ww in itertools.product('AB',repeat=n):
   w=''.join(ww); p=product('A'+w+'B')[1]; m=w.count('B'); s=sum(w[i]!=w[i+1] for i in range(n-1))
   rows.append([n**i*m**j for i,j in powers]+[s,s%2]); count+=1
   for i in [1,2]: vals[i-1].append(p.get((i,3-i),0))
   for r in range(n+2):
    cs=[p.get((i,r-i),0) for i in range(r+1)]
    if any(cs[i]**2<cs[i-1]*cs[i+1] for i in range(1,r)) and len(diagonal_failures)<5:
     diagonal_failures.append(dict(word='A'+w+'B',r=r,coefficients=cs))
 solutions=[solve(rows,v) for v in vals]
 result=dict(status='finite exact interpolation, not proof',words=count,
  variables='n=core length,m=core B count,s=adjacent switches in core',
  basis=powers+['s','s%2'],solutions=[[str(x) for x in c] for c in solutions],
  diagonal_failures=diagonal_failures,seconds=time.monotonic()-start)
 pathlib.Path('evidence/markov-5a7c193a/cubic-interpolation.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps(result))
if __name__=='__main__':main()
