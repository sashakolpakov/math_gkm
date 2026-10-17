"""Machine-authored 139fed75. Rational interpolation proposes a formula;
only a subsequent Lean identity proof can certify it."""
from band_experiment_139fed75 import Q,O
from fractions import Fraction as F
import json,math
def plus(a,b):return [((a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0)) for i in range(max(len(a),len(b)))]
def times(a,b):
 c=[F(0)]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def interp(xs,ys):
 ans=[]
 for i,x in enumerate(xs):
  p=[F(ys[i])]
  for j,y in enumerate(xs):
   if i!=j:p=[v/F(x-y) for v in times(p,[-y,1])]
  ans=plus(ans,p)
 return ans
out={'status':'rational interpolation, not proof','formulas':[],'witnesses':[]}
for r in [False,True]:
 samples=[]
 for k in range(2,8):
  qs=list(range(2*k+2,2*k+5));den=k*(k-1)*(k+1)*(k+2)
  samples.append(interp(qs,[F(Q(q,r,k)[2],den) for q in qs]))
 cs=[interp(list(range(2,8)),[p[j] for p in samples]) for j in range(3)]
 common=math.lcm(*(v.denominator for c in cs for v in c))
 ints=[[int(common*v) for v in c] for c in cs]
 out['formulas'].append({'r':r,'denominator':common,'q_powers_k_coefficients':ints})
 for k in range(2,101):
  q=2*k+(2 if r else 1);h=Q(q,r,k);j=q+k+1
  if h[2]>h[1]*j:
   out['witnesses'].append({'q':q,'r':r,'k':k,'j':j,'Q1':h[1],'Q2':h[2],'bound':h[1]*j});break
(O/'quadratic-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
