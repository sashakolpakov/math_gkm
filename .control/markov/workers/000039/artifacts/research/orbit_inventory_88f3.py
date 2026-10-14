"""Machine-authored exact orbit inventory for source 1/4; experiment only."""
import json,collections,pathlib
from orbit_probe_88f3 import paths,core,charge
ps=paths(core(1,4));groups={}
for p in ps:
 for q in ps:
  cp=charge(p[1]);cq=charge(q[1])
  if tuple(a+b for a,b in zip(cp,cq))!=(4,2):continue
  # At each layer retain the unordered pair of fully decorated edges.
  sig=tuple(tuple(sorted([(p[0][k],p[0][k+1],*p[1][k]),
                          (q[0][k],q[0][k+1],*q[1][k])])) for k in range(len(p[1])))
  groups.setdefault(sig,collections.Counter())[cp]+=1
rows=[]
for sig,counts in groups.items():
 end=counts[(1,1)];mid=counts[(2,1)]
 rows.append(dict(overlay=sig,charges=sorted([[list(k),v] for k,v in counts.items()]),endpoint_pairs=end,middle_pairs=mid,gap=mid-end))
r=dict(status='exact finite inventory, not a universal theorem',source=[1,4],total_charge=[4,2],
 paths=len(ps),overlays=len(rows),endpoint_pairs=sum(x['endpoint_pairs'] for x in rows),middle_pairs=sum(x['middle_pairs'] for x in rows),
 negative_overlays=[x for x in rows if x['gap']<0],gap_histogram=dict(collections.Counter(x['gap'] for x in rows)),rows=rows)
pathlib.Path('evidence/markov-88f3b553/orbit-inventory.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k!='rows'}))
