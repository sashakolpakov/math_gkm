"""Machine-authored exact polynomial expansion; Lean must check each identity."""
from pathlib import Path
import json
class P(dict):
 def __add__(a,b):
  if isinstance(b,int):b=P({(0,0,0):b})
  z=P(a)
  for k,v in b.items():z[k]=z.get(k,0)+v
  return P({k:v for k,v in z.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  if isinstance(b,int):b=P({(0,0,0):b})
  z=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));z[m]=z.get(m,0)+v*w
  return P({k:v for k,v in z.items() if v})
 __rmul__=__mul__
h=P({(1,0,0):1});k=P({(0,1,0):1});t=P({(0,0,1):1})
def gap(j,i,h):return (j+i+1)*(i+2)*(2*i-1-h)*(2*i+2-h)-(j+i+2)*(i+1)*(2*i+1-h)*(2*i-h)
def lean(p):
 return '+'.join(str(v)+''.join('*'+x+('^'+str(e) if e>1 else '') for x,e in zip(['h','k','t'],key) if e) for key,v in sorted(p.items()))
cases={'positive_k':gap(k+1+t+1,k+1+h+2,h),'zero_k':gap(t+2,h+2,h)}
out={key:{'terms':[[*k,v] for k,v in sorted(p.items())],'all_nonnegative':all(v>=0 for v in p.values()),'lean':lean(p)} for key,p in cases.items()}
Path('evidence/markov-58e57003/mixed-certificate.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
