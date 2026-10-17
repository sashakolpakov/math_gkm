"""Machine-authored exact template polynomial exploration; no proof claim."""
from middle_polynomial_probe_f8d0715b import L,cp,one,add,mul,scale
from math import comb,lcm
from pathlib import Path
import json,time
def top(c,Tshift):
 a={}
 for l in range(c+4):
  a=add(a,scale(mul(cp(L(1,0,2*c+8),c+3-l),add(cp(L(0,1,Tshift),c+l),scale(cp(L(0,1,Tshift+1),c+l+2),4))),comb(c+l,c)))
 return a
if __name__=='__main__':
 start=time.monotonic();rows=[]
 for c in range(5,16):
  a,b,z=[top(j,c+2) for j in range(c,c+3)]
  for N in [1,8]:
   n=N*(c+4)
   g=add(scale(mul(b,b),n),scale(mul(a,z),-(n+1)))
   bad=[(i,j,str(v)) for (i,j),v in g.items() if v<0]
   row=dict(c=c,N=N,terms=len(g),negative=len(bad),first=bad[:3],seconds=time.monotonic()-start)
   rows.append(row);print(json.dumps(row),flush=True)
  Path('evidence/markov-6738b4ea/template-probe.json').write_text(json.dumps(rows,indent=2))
