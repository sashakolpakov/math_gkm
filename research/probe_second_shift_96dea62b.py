"""Machine-authored symbolic diagnosis beyond the proved onset region; experiment only."""
from pathlib import Path
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,serialize
from probe_shift_f2da221d import load
from fourth_probe_01f51d63 import BOUNDS
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-96dea62b'
d=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())
rows=[load(x['numerator']) for x in d['rows']]
result=dict(status='Exact symbolic comparisons of saved candidate numerators; not a new Lean source theorem',chamber_bounds=BOUNDS,blocks=[],adjacent_differences=[])
for z in range(5):
 blocks=[P({k:v for k,v in p.items() if k[1]==z}) for p in rows]
 result['blocks'].append(dict(z_degree=z,all_chambers_identical=all(p==blocks[0] for p in blocks),min_x=[min((k[-1] for k in p),default=None) for p in blocks],max_x=[max((k[-1] for k in p),default=None) for p in blocks]))
 for a,b in zip(range(5),range(1,6)):
  diff=blocks[b]-blocks[a]
  if diff:
   first=min(k[-1] for k in diff)
   result['adjacent_differences'].append(dict(z_degree=z,left=a,right=b,first_x=first,first_coefficient=serialize(P({k:v for k,v in diff.items() if k[-1]==first})),terms=len(diff)))
(O/'second-shift-probe.json').write_text(json.dumps(result,indent=2)+'\n')
print(result['blocks']);print([(x['z_degree'],x['left'],x['right'],x['first_x']) for x in result['adjacent_differences']])
