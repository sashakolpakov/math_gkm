"""Machine-authored a24fe23d. Adaptive shift existence is experimental."""
from probe_a24fe23d import H,O
import json
d={'cases':0,'failures':[],'shift_counts':{}}
for a in range(3,28):
 for j in range(2*a+1):
  for s in range(1,a-1):
   pairs=[(q,r,H(a,j,s,q)*H(a,j,s+2,r)) for q in range(a-s+1) for r in range(a-s-1)]
   pairs=[x for x in pairs if x[2]]
   if not pairs:continue
   good=[]
   for c in range(5):
    if all(v<=H(a,j,s+1,min(q,r+c))*H(a,j,s+1,max(q,r+c)-c) for q,r,v in pairs):good.append(c)
   d['cases']+=1
   if not good:
    d['failures'].append([a,j,s]);break
   k=str(good);d['shift_counts'][k]=d['shift_counts'].get(k,0)+1
  if d['failures']:break
 if d['failures']:break
(O/'adaptive-shift.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d))
