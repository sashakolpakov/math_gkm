"""Machine-authored exact residual cubic exploration; experiments are not proofs."""
import itertools,json,pathlib,sys,time
from word_invariants_774 import product
from fractions import Fraction as F
out=pathlib.Path('evidence/markov-4f8ceeeb');out.mkdir(exist_ok=True)
start=time.monotonic(); rows=[]; ys=[[],[]]
for n in range(1,8):
 for w in itertools.product('AB',repeat=n):
  m=w.count('B');bb=sum(w[i]==w[i+1]=='B' for i in range(n-1));ends=(w[0]=='B')+(w[-1]=='B')
  p=product('A'+''.join(w)+'B')[1]
  rows.append([n**i*m**j for i in range(4) for j in range(4-i)]+[bb,ends])
  for k in range(2):ys[k].append(p.get((k+1,2-k),0))
def solve(rows,y):
 a=[[F(x) for x in row]+[F(v)] for row,v in zip(rows,y)];r=0;piv=[]
 for c in range(len(rows[0])):
  k=next((k for k in range(r,len(a)) if a[k][c]),None)
  if k is None:continue
  a[r],a[k]=a[k],a[r];d=a[r][c];a[r]=[x/d for x in a[r]]
  for k in range(len(a)):
   if k!=r and a[k][c]:
    d=a[k][c];a[k]=[x-d*z for x,z in zip(a[k],a[r])]
  piv.append(c);r+=1
 if any(not any(row[:-1]) and row[-1] for row in a):return 'inconsistent'
 ans=[F(0)]*len(rows[0])
 for k,c in enumerate(piv):ans[c]=a[k][-1]
 return list(map(str,ans))
fits=[solve(rows,y) for y in ys]
result=dict(status='finite symbolic interpolation, not proof',basis=[f'n^{i} m^{j}' for i in range(4) for j in range(4-i)]+['BB','B endpoints'],fits=fits,words=len(rows),seconds=time.monotonic()-start)
(out/'cubic-fit.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
