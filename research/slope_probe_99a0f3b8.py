"""Machine-authored rational-slope certificate exploration, exact arithmetic."""
from sign_probe_99a0f3b8 import P,var,ps,red,F,O
import json,time
a,m,H,w=[var(j) for j in range(4)];start=time.monotonic();out=[]
for slope in [F(2),F(9,4),F(5,2),F(11,4)]:
 for h in [0,2,4,8,16]:
  for off in [7,10,16,32]:
   bad={}
   for name,p in [('delta',ps['delta']),('A',ps['A']),('C',ps['C']),('minusK',-ps['K']),('reduced',red)]:
    q=p.ev([a+off,m+2,slope*(a+off)+(m+2)*F(1,2)+h+H,w]);bad[name]=sum(v<0 for v in q.d.values())
   out.append(dict(slope=str(slope),h=h,offset=off,negative=bad))
   if not any(bad.values()):break
(O/'slope-probe.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-start),indent=2));print(json.dumps(out))
