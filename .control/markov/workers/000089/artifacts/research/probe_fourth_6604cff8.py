"""Machine-authored exact arbitrary-run exploration. No proof claims."""
from pathlib import Path
from functools import cache
from itertools import product
import json,time
import experiment_be5676f9 as e
from fourth_probe_01f51d63 import P,C,R,sub,BOUNDS,ser
e.gauge=cache(e.gauge)
O=Path('evidence/markov-6604cff8'); start=time.monotonic(); rows=[]
for n in range(4,9):
 table={bits:e.local4(n,*bits) for bits in product(range(2),repeat=4)}
 chambers=[]
 for z in range(6):
  M,f=e.chamber_poly(n,z,table); deg=max(k[2] for k in f)
  cs=[P({(i,j,0):v for (i,j,k),v in f.items() if k==a}) for a in range(deg+1)]
  p,q=BOUNDS[z];s,t=BOUNDS[z+1]
  gaps=[sub(cs[j+1]**2-cs[j]*cs[j+2],q*(C+1)+t*(R+1),p*(C+1)+s*(R+1)) for j in range(deg-1)]
  chambers.append(dict(chamber=z,degree=deg,negative_terms=[sum(v<0 for v in g.values()) for g in gaps],gap_terms=[len(g) for g in gaps]))
 rows.append(dict(n=n,chambers=chambers))
 rec=dict(status='Exact symbolic experiments for finitely many runs, not universal proof or source closure',runs=rows,seconds=time.monotonic()-start)
 (O/'fourth-run-probe.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps(rows[-1]),flush=True)
