"""Machine-authored right-spine low columns; exact exploratory arithmetic."""
import pathlib,sys,json,math
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul,initial,child
out=pathlib.Path('evidence/markov-f6506bc6')
def div_linear(c):
 q=[c[0]]
 for x in c[1:-1]:q.append(x-q[-1])
 assert c[-1]==q[-1]
 return q
f=initial; rows=[];samples=[]
for n in range(1,25):
 p=f[1][2]; assert f[1][:2]==(n,n+1)
 if n>=5:
  c=[p.get((2,j),0) for j in range(n-2,2*n-1)]
  for _ in range(n-5):c=div_linear(c)
  rows.append([n,c])
 samples.append([n,[p.get((i,n+2),0) for i in range(3)]])
 f=child(f,True)
res=dict(status='finite exact evidence only',factor='[u^2]P_n=v^(n-2)(1+v)^(n-5)R_n(v), n>=5',residuals=rows,normalized_test_row=samples)
(out/'right-spine-experiment.json').write_text(json.dumps(res,indent=2)+'\n'); print(json.dumps(res))
