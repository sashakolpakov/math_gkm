"""Machine-authored new conjectural positive middle correction representation.
Checks use the original finite source recurrence, not a fitted coefficient table.
"""
from pathlib import Path
from math import comb
from three_probe_9e205206 import frame
import json,time,hashlib
start=time.monotonic()
def kernel(a,b,j,k,slope,intercept):
 if j<0 or k<0:return 0
 return sum((slope*z+intercept)*comb(j-z+a,a)*comb(k-z+b,b) for z in range(min(j,k)+1))
def D(c,j,k):
 if k<0:return 0
 return comb(j+c+3,c+3)*comb(k+c,c)+kernel(c+3,c,j-1,k-1,4,4)
out=dict(coefficients=0,correction_positive=0,correction_zero=0,source_zeros=0,failures=[])
for q in list(range(1,45))+[51,63]:
 for r in (False,True):
  _,b,p=frame([False]*(q-1)+[True,r])
  for i in range(3,b+7):
   for j in range(b+7-i):
    c=i-3;d=D(c,j,b+2-i-j)
    correction=4*kernel(c+2,c+1,j-q-1,b-q-i-j,3,2 if r else 1)
    actual=p.get((i,j),0);out['coefficients']+=1
    out['correction_positive']+=int(correction>0);out['correction_zero']+=int(correction==0)
    out['source_zeros']+=int(actual==0)
    if actual!=d+correction:out['failures'].append([q,r,i,j,actual,d,correction])
out.update(seconds=time.monotonic()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
 formula='A(i,j)=D_(i-3)(j,b+2-i-j)+4 K_(i-1,i-2)^(3s+epsilon)(j-q-1,b-q-i-j), i>=3; epsilon=2 if b=3q+1, else 1; kernels zero outside nonnegative coordinates.',
 status='Finite exact source-recurrence verification of a NEW CONJECTURAL global coefficient identity. No universal source bridge proved.')
Path('evidence/markov-50c262c5/correction-model.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
