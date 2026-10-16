"""Machine-authored exact finite correspondence check of the GAP candidate."""
from pathlib import Path
from fractions import Fraction as F
import ast,json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fee405c8';start=time.monotonic()
read=lambda n:ast.literal_eval((O/n).read_text().replace('\\\n',''))
fs=read('pair-factors-extrep.txt');expanded=read('pair-factored-extrep.txt');raw=read('pair-raw-extrep.txt')
def ev(e,v):
 total=0
 for k in range(0,len(e),2):
  mon,c=e[k:k+2];prod=c
  for a in range(0,len(mon),2):prod*=v[mon[a]-1]**mon[a+1]
  total+=prod
 return total
def prod(xs):
 r=1
 for x in xs:r*=x
 return r
out={'status':'finite exact candidate consistency check only; not proof','comparisons':0,'expanded_terms':len(expanded)//2,'raw_terms':len(raw)//2,'negative_coefficients':sum(expanded[k]<0 for k in range(1,len(expanded),2)),'failures':[]}
for x,g,z,T in [(0,0,0,0),(1,0,0,0),(0,1,0,0),(0,0,1,0),(0,0,0,1),(2,3,4,5),(4,2,1,9),(0,8,0,1),(7,0,10,0),(3,4,8,11)]:
 vals=[x,g,z,T];t=T+1;n=x;m=x+g+2;j=m+z;pts=[m,n,m-1,n+1]
 W=lambda v:(t+v+4)*(t+v+5)+4*(j-v)*(t+j+4)
 ad=lambda v:(j-v+1)*(t+v+2)*(t+v+3)
 bd=lambda v:(v+1)*(t+v+6)*(t+v+7)
 A=lambda v:F(v*(t+v+4)*(t+v+5)*(W(v)-2),ad(v)*W(v))
 B=lambda v:F((j-v)*(t+v+4)*(t+v+5)*(W(v)+2),bd(v)*W(v))
 den=prod(ad(v)*bd(v)*W(v) for v in pts)
 delta=A(m)*B(n)+A(n)*B(m)-A(m-1)*B(n+1)-A(n+1)*B(m-1)
 factored=prod(ev(e,vals) for e in fs[0])+prod(ev(e,vals) for e in fs[1])-prod(ev(e,vals) for e in fs[2])-prod(ev(e,vals) for e in fs[3])
 common=prod([x+g+T+7,x+T+6,x+g+T+9,x+T+4,x+g+T+5,x+T+8])
 candidates=[delta*den,factored*common,ev(expanded,vals)*common,ev(raw,vals)]
 out['comparisons']+=3
 if len(set(candidates))!=1:out['failures'].append([vals,[str(a) for a in candidates]])
out['seconds']=time.monotonic()-start;(O/'pair-candidate-consistency.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
