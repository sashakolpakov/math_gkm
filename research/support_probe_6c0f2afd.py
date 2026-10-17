"""Machine-authored exact symbolic probes beyond inherited columns; not proofs."""
from middle_polynomial_probe_f8d0715b import raw,add,mul,scale
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-6c0f2afd')
start=time.monotonic();rows=[]
for c in [13,16,20]:
 for r in [False,True]:
  B=5 if r else 4;K=max(0,(c+3-B)//3)
  a,b,d=[raw(j,r,K) for j in range(c,c+3)]
  g=add(mul(b,b),scale(mul(a,d),-1));bad=[(i,j,str(v)) for (i,j),v in g.items() if v<0]
  row=dict(c=c,r=r,shift=K,terms=len(g),negative=len(bad),first_negative=bad[:5],seconds=time.monotonic()-start)
  rows.append(row);print(json.dumps(row),flush=True)
  (O/'support-probe.json').write_text(json.dumps(dict(rows=rows,status='Finite exact symbolic coefficients; no uniform-in-column positivity proof.'),indent=2))
