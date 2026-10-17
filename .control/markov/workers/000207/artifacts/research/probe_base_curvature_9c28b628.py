"""Machine-authored finite test of OPEN BaseCurvatureM9C28, not a proof."""
from math import comb
from pathlib import Path
import json,hashlib
def D(t,j,k):
    return sum((1 if a==0 else 4*a)*comb(j-a+t+3,t+3)*comb(k-a+t,t) for a in range(min(j,k)+1))
out=dict(status='Finite exact experiment, not proof',t_max=10,j_max=40,k_max=40,checks=0,failures=[])
for t in range(11):
    for j in range(41):
        for k in range(41):
            a,b,c=D(t,j+2,k),D(t+1,j+1,k),D(t+2,j,k)
            out['checks']+=1
            if (t+5)*a*c>(t+4)*b*b:out['failures'].append([t,j,k,a,b,c])
out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
Path('evidence/markov-9c28b628/base-curvature-script-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
