"""Machine-authored exact exploratory row-shape algebra; no universal proof by testing."""
from pathlib import Path
from fractions import Fraction as F
from math import factorial
import json,time
from lower_rows_1bb0aa1e import Hrows,add,mul,scale
O=Path('/Users/sasha/math_gkm/evidence/markov-ffd747f5')
def interp(vals):
 ans=[];basis=[F(1)];d=vals[:]
 for k in range(len(vals)):
  ans=add(ans,scale(basis,d[0]));d=[d[i+1]-d[i] for i in range(len(d)-1)]
  basis=scale(mul(basis,[F(-k),F(1)]),F(1,k+1))
 return ans
def main():
 t=time.monotonic();checks=0;fail=[]
 rows={n:Hrows(n,min((n-1)//2,25)) for n in range(1,101)}
 for n,h in rows.items():
  for j,a in h.items():
   if j<0:continue
   for k in range(len(a)-2):
    checks+=1
    if a[k]*a[k+2]>a[k+1]**2:fail.append([n,j,k,a])
 # Degree-five exact interpolation is only a candidate until the Lean identity is checked.
 coeff=[interp([F(Hrows(11+d,5)[5][k]) for d in range(6)]) for k in range(6)]
 gaps=[add(mul(coeff[k+1],coeff[k+1]),scale(mul(coeff[k],coeff[k+2]),-1)) for k in range(4)]
 out={'status':'finite exact exploration and candidate symbolic formulas, not proof',
      'domain':'2*j+1<=n<=100, j<=25','adjacent_checks':checks,'failures':fail,
      'H5_at_n_11_plus_d_coefficients':[[str(x) for x in a] for a in coeff],
      'H5_adjacent_gap_polynomials':[[str(x) for x in a] for a in gaps],
      'positive_coefficients':all(x>=0 for a in coeff+gaps for x in a),
      'seconds':time.monotonic()-t}
 (O/'row-shape-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
