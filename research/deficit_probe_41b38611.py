"""Machine-authored exact auxiliary moment-bound exploration, not proof."""
from fractions import Fraction as Q
from pathlib import Path
import json
out=[]
for i in [5,10,15,20,25,30,40,50,75,100,200,500,1000]:
 bad=[]; minimum=None
 for r in list(range(2,300))+[500,1000,10000,1000000]:
  for d in [0,1,10,1000,1000000]:
   H=r+2*i+d+9
   m=Q(2*r+i+1,i+3)
   s=Q(i*(i+1)+6*r*(i+1)+6*r*r,(i+3)*(i+4))
   L=r*H-(H+r)*m
   gap=L*L/(i+1)+(H-r+1)*L-(H+r)**2*s
   if gap<0 or L<0:bad.append([r,d,str(gap),str(L)])
   if minimum is None or gap<minimum[0]:minimum=(gap,[r,d])
  # Every scalar test is exact; no uniform inference.
 out.append(dict(i=i,bad_count=len(bad),first_bad=bad[:3],minimum=[str(minimum[0]),minimum[1]]))
Path('evidence/markov-41b38611/deficit-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
