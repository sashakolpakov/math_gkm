"""Machine-authored component-wise Newton probes; finite exact evidence only."""
from correction_kernel_d0292f14 import C,top,correction,differences,O
from fractions import Fraction
import json,time
def run():
 start=time.monotonic();out=[]
 for c in range(3,19):
  for r in [False,True]:
   N=4*c+4;grids=[[],[],[]]
   for x in range(N+1):
    vals=[[],[],[]]
    for k in range(N+1):
     a,b,z=[top(x,x+3*k+(5 if r else 4),h-3) for h in range(c,c+3)]
     A,B,Z=[correction(x+(3 if r else 2),k,r,h) for h in range(c,c+3)]
     for row,v in zip(vals,[b*b-a*z,B*B-A*Z,2*b*B-a*Z-A*z]):row.append(v)
    for grid,row in zip(grids,vals):grid.append(differences(row))
   cs=[[[*differences([g[x][j] for x in range(N+1)])] for j in range(N+1)] for g in grids]
   row=dict(c=c,r=r,components=[])
   for name,coeff in zip(['template','correction','cross'],cs):
    bad=[(a,b,v) for b,col in enumerate(coeff) for a,v in enumerate(col) if v<0]
    row['components'].append(dict(name=name,negative_count=len(bad),first_negative=bad[:2]))
   row['total_negative']=sum(sum(cs[h][j][i] for h in range(3))<0 for i in range(N+1) for j in range(N+1))
   row['template_plus_cross_negative']=sum(cs[0][j][i]+cs[2][j][i]<0 for i in range(N+1) for j in range(N+1))
   row['minimum_template_negative_cross_ratio']=str(min(Fraction(cs[0][j][i],-cs[2][j][i]) for i in range(N+1) for j in range(N+1) if cs[2][j][i]<0))
   out.append(row);print(json.dumps(row),flush=True)
   (O/'newton-components.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-start,status='Finite exact experiments, no proof.'),indent=2))
if __name__=='__main__':run()
