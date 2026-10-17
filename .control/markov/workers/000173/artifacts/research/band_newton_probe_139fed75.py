"""Machine-authored 139fed75. Finite Newton-coefficient diagnostic."""
from band_experiment_139fed75 import Q,O
import json
out={'status':'finite exact interpolation, not a universal identity','rows':[],'negative':[],'checks':0}
for r in [False,True]:
 for k in range(13):
  row=[]
  for m in range(k+1):
   vals=[Q(d+2*k+(2 if r else 1),r,k)[m] for d in range(m+2)]
   cs=[]
   for z in range(m+1):
    cs.append(vals[0]); vals=[b-a for a,b in zip(vals,vals[1:])]
   assert not vals[0]
   if any(c<0 for c in cs):out['negative'].append([r,k,m,cs])
   row.append(cs);out['checks']+=1
  out['rows'].append({'r':r,'k':k,'newton_in_d':row})
(O/'newton-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'checks':out['checks'],'negative':out['negative'],'samples':out['rows'][3:6]}))
