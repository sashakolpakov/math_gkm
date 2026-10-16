"""Exact symbolic exploratory arithmetic; not a theorem."""
from fractions import Fraction as F
from collections import defaultdict
from pathlib import Path
import json
class P(dict):
 def __add__(self,q):
  if not isinstance(q,dict):q=P({(0,0,0):F(q)})
  d=P(self)
  for e,c in q.items():d[e]=d.get(e,0)+c
  return P({e:c for e,c in d.items() if c})
 __radd__=__add__
 def __neg__(self):return P({e:-c for e,c in self.items()})
 def __sub__(self,q):return self+-q
 def __mul__(self,q):
  if not isinstance(q,dict):q=P({(0,0,0):F(q)})
  d=defaultdict(F)
  for e,c in self.items():
   for f,b in q.items():d[tuple(x+y for x,y in zip(e,f))]+=c*b
  return P({e:c for e,c in d.items() if c})
 __rmul__=__mul__
 def __pow__(self,n):
  r=P({(0,0,0):F(1)})
  for _ in range(n):r=r*self
  return r
a=P({(1,0,0):F(1)}); b=P({(0,1,0):F(1)});t=P({(0,0,1):F(1)})
def D(a,b,t):return 2*(a+2)*(b+2)*(a+t+2)*(b+t+2)-(a+t+1)*(b+t+1)*(a+t+2)*(b+t+2)-(a+1)*(b+1)*(a+2)*(b+2)
d=D(a,b,t)
print('D',sorted(d.items()))
# Test a,b >= (t^2-t)/2, both expressed with independent nonnegative slacks.
e=D(a+(t*t-t)*F(1,2),b+(t*t-t)*F(1,2),t)
print('half margin',sorted(e.items()))
out={'expanded':[[list(k),str(v)] for k,v in sorted(d.items())], 'half_margin':[[list(k),str(v)] for k,v in sorted(e.items())]}
Path('evidence/markov-ac3d4ab9/gap-probe.json').write_text(json.dumps(out,indent=2)+'\n')
