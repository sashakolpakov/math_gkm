"""Machine-authored exact local-statistic interpolation, not a theorem."""
import itertools,json,pathlib,time
from explore_4f8 import solve
from word_invariants_774 import product
out=pathlib.Path('evidence/markov-4f8ceeeb');start=time.monotonic()
rows=[];ys=[[],[],[]];patterns=list(itertools.product('AB',repeat=3));ends=list(itertools.product('AB',repeat=2))
names=[f'n^{i} m^{j}' for i in range(5) for j in range(5-i)]+['n*switch','m*switch','switch']+[''.join(z) for z in patterns]+['end '+''.join(z) for z in ends]
for n in range(2,10):
 for w in itertools.product('AB',repeat=n):
  m=w.count('B');sw=sum(w[i]!=w[i+1] for i in range(n-1))
  rows.append([n**i*m**j for i in range(5) for j in range(5-i)]+[n*sw,m*sw,sw]+[sum(w[i:i+3]==z for i in range(n-2)) for z in patterns]+[int(w[:2]==z)+int(w[-2:][::-1]==z) for z in ends])
  p=product('A'+''.join(w)+'B')[1]
  for k in range(3):ys[k].append(p.get((k+1,3-k),0))
fits=[solve(rows,y) for y in ys]
res=dict(status='exact finite interpolation only',words=len(rows),basis=names,fits=fits,seconds=time.monotonic()-start)
(out/'quartic-fit.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res))
