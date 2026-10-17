"""Machine-authored finite shape tests for the middle correction, not proofs."""
from source_experiment_99a0f3b8 import corrections
from source_experiment_55cf20d2 import upper
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-99a0f3b8');start=time.monotonic()
out=dict(cases=0,negative=[],lc_failures=[],cross_failures=[],source_gap_failures=[])
for q in list(range(5,61))+[100,200]:
 for r in [False,True]:
  b=3*q+(1 if r else 2);K=b//2-q-3
  if K<0:continue
  for k,D in enumerate(corrections(q,r,K)):
   t=q+3+k;out['cases']+=1
   for c in range(k+3):
    ds=[D.get(c+z,0) for z in range(3)];bs=[upper(b,t,c+z) for z in range(3)]
    if ds[0]<0:out['negative'].append([q,r,k,c])
    if ds[0]*ds[2]>ds[1]**2:out['lc_failures'].append([q,r,k,c,ds])
    cross=2*bs[1]*ds[1]-bs[0]*ds[2]-ds[0]*bs[2]
    gap=(bs[1]+ds[1])**2-(bs[0]+ds[0])*(bs[2]+ds[2])
    if cross<0 and c>=2 and k>=2 and min(bs)>=0 and len(out['cross_failures'])<5:out['cross_failures'].append(dict(q=q,r=r,k=k,c=c,template=bs,correction=ds,cross=cross,actual_gap=gap))
    if gap<0:out['source_gap_failures'].append([q,r,k,c])
out.update(seconds=time.monotonic()-start,status='finite exact experiment only')
(O/'correction-shape-interior.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
