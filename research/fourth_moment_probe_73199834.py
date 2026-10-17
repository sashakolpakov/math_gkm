"""Machine-authored exact symbolic candidate using a beta fourth-moment bound.
The covariance/moment attachment is NOT proved by this script.
"""
from weighted_beta_symbolic_ca9709f2 import P,var,div_exact,expr
from fractions import Fraction as F
from pathlib import Path
import json
O=Path('/Users/sasha/math_gkm/evidence/markov-73199834')
raw=json.loads(Path('evidence/markov-20825094/stein-bound-symbolic.json').read_text())
ps={n:P({tuple(k):F(v) for k,v in vs}) for n,vs in raw.items()}
a,m,H,z=[var(j) for j in range(4)]
C=8*a+14;delta=C*m*m*F(1,2)-ps['E']
A=(a+m*F(1,2))*(H+m*F(1,2))*m*(H-a-3+m*F(1,2))
den=16*(2*a+1)*(2*a+3)
four=m*(2*a+m)*(3*m*(2*a+m)-4*a)
J=(ps['C0']+ps['Cp']*m*m*F(1,4))*delta*den-ps['Cp']*(A*den+C*four)
red=div_exact(J,a*m*(m-1))
q=red.ev([a,m,3*a+m*F(1,2)+4+H,z])
def data(q):return [[list(k),str(v)] for k,v in sorted(q.d.items())]
rows=[]
for c in [F(1,8),F(1,4),F(1,2),F(1),F(2),F(4)]:
 # Positive-cone transfer under a^2 >= c*m: replace a negative m^j term
 # by an equal factor of (a^2-c*m) and a negative higher-a term.
 d=q.d.copy();cert=[]
 for key in sorted(list(d),key=lambda k:(-k[1],k)):
  v=d.get(key,0)
  if v<0 and key[1]>0:
   target=(key[0]+2,key[1]-1,key[2],key[3])
   d[key]=0;d[target]=d.get(target,0)+v/c
   cert.append([list(key),str(-v/c)])
 bad=[(k,str(v)) for k,v in d.items() if v<0]
 rows.append(dict(c=str(c),negative=len(bad),sample=bad[:5]))
out=dict(status='exact symbolic candidate; no fourth-moment/covariance bridge proved',reduced=data(red),shifted=data(q),rows=rows)
more=[]
for offset in [2,3,5,10]:
 shifted=red.ev([a+offset,m+2,3*(a+offset)+(m+2)*F(1,2)+4+H,z])
 for c in [4,8,16,32,64]:
  rem=shifted.d.copy();cert=[]
  for j in range(max(k[1] for k in rem),0,-1):
   for key in sorted(k for k in list(rem) if k[1]==j):
    v=rem.get(key,0)
    if v<0:
     target=(key[0]+2,key[1]-1,key[2],key[3]);rem[key]=0
     rem[target]=rem.get(target,0)+v/c
     cert.append((key,-v/c))
  bad=[(k,v) for k,v in rem.items() if v<0]
  more.append(dict(offset=offset,c=c,negative=len(bad)))
  if not bad:
   out.setdefault('positive_certificates',[]).append(dict(offset=offset,c=c,remainder=data(P(rem)),factors=[[list(k),str(v)] for k,v in cert]))
out['shifted_rows']=more
(O/'fourth-moment-probe.json').write_text(json.dumps(out,indent=2))
print(json.dumps(dict(terms=len(red.d),shifted_terms=len(q.d),shifted_rows=more)))
