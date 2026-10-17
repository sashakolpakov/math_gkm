"""Machine-authored strengthened-gap probe, finite exact evidence only."""
from correction_kernel_d0292f14 import top,raw,differences,O
import json,time
def run():
 start=time.monotonic();out=[]
 for c in range(16):
  for mode in ['top','false','true']:
   N=4*c+18;grid=[]
   for x in range(N+1):
    vals=[]
    for y in range(N+1):
     v=[top(x,y,c+j) if mode=='top' else raw(x,y,mode=='true',c+j+3) for j in range(3)]
     vals.append((c+4)*v[1]**2-(c+5)*v[0]*v[2])
    grid.append(differences(vals))
   coeffs=[differences([grid[x][j] for x in range(N+1)]) for j in range(N+1)]
   bad=[(i,j,v) for j,col in enumerate(coeffs) for i,v in enumerate(col) if v<0]
   case=dict(c=c,mode=mode,negative_count=len(bad),first_negative=bad[:2],nonzero=sum(v!=0 for col in coeffs for v in col))
   out.append(case);print(json.dumps(case),flush=True)
   (O/'strong-gap-probe.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-start,status='Finite exact probe, no universal sign theorem.'),indent=2))
if __name__=='__main__':run()
