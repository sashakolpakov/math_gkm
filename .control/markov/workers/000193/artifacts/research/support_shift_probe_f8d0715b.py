"""Machine-authored exact support-aware polynomial probes; no proof assertion."""
from middle_polynomial_probe_f8d0715b import raw,add,mul,scale
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-f8d0715b')
def run():
 start=time.monotonic();rows=[]
 for i in range(7,13):
  for r in [False,True]:
   B=5 if r else 4;K=max(0,(i+1-B+2)//3)
   a,b,c=[raw(j,r,K) for j in range(i,i+3)]
   g=add(mul(b,b),scale(mul(a,c),-1));bad=[(a,b,str(v)) for (a,b),v in g.items() if v<0]
   row=dict(i=i,r=r,K=K,terms=len(g),negative=len(bad),first_negative=bad[:4],seconds=time.monotonic()-start)
   rows.append(row);print(json.dumps(row),flush=True)
   (O/'support-shift-probe.json').write_text(json.dumps(dict(rows=rows,status='Finite exact polynomial coefficient tests; not a uniform sign proof.'),indent=2))
if __name__=='__main__':run()
