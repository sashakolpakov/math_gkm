"""Machine-authored exact interpolation/probe. Formula identification is unproved."""
from sparse_probe_96ada19b import solve,O
from fractions import Fraction
from math import comb
import json
def pmul(a,b):
 z=[Fraction(0)]*(len(a)+len(b)-1)
 for i,c in enumerate(a):
  for j,d in enumerate(b):z[i+j]+=c*d
 return z
def padd(a,b):
 z=list(a)+[Fraction(0)]*max(0,len(b)-len(a))
 for i,c in enumerate(b):z[i]+=c
 return z
def interp(points):
 z=[]
 for x,y in points:
  p=[Fraction(y)]
  for t,_ in points:
   if t!=x:p=[v/Fraction(x-t) for v in pmul(p,[-t,1])]
  z=padd(z,p)
 return z
def numerator(q,r):
 a=solve(q,r,4,3*q+12)
 return [sum((-1)**k*comb(8,k)*a.get((4,j-k),0) for k in range(9)) for j in range(3*q+13)]
out={'status':'exact interpolated candidate, not source theorem','training_q':[20,21,22,23,24],'validated_q':[1,100],'checks':0,'families':{},'failures':[]}
for r in [False,True]:
 samples={q:numerator(q,r) for q in range(20,25)}
 forms=[]
 for k in range(4):
  for s in range(13):
   p=interp([(q,vals[k*q+s]) for q,vals in samples.items()])
   if any(p):forms.append((k,s,p))
 for q in range(1,101):
  vals=numerator(q,r)
  pred=[Fraction(0)]*len(vals)
  for k,s,p in forms:
   if k*q+s<len(pred):pred[k*q+s]+=sum(a*q**i for i,a in enumerate(p))
  for j,(a,b) in enumerate(zip(vals,pred)):
   out['checks']+=1
   if a!=b:out['failures'].append([q,r,j,str(a),str(b)])
 out['families'][str(r)]=[{'q_shift':k,'offset':s,'polynomial_q_ascending':[str(x) for x in p]} for k,s,p in forms]
(O/'column-candidate.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='families'}))
