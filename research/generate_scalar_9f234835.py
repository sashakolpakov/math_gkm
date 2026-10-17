"""Machine-authored exact ring certificates for ratio ordering."""
from pathlib import Path
from collections import defaultdict
class P(dict):
 def __add__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0):b}); c=P(a)
  for k,v in b.items():c[k]=c.get(k,0)+v
  return P({k:v for k,v in c.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0):b});c=defaultdict(int)
  for k,v in a.items():
   for l,w in b.items():c[tuple(x+y for x,y in zip(k,l))]+=v*w
  return P({k:v for k,v in c.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  z=P({(0,0,0):1})
  for _ in range(n):z=z*a
  return z
def lean(p,vs):
 assert all(v>=0 for v in p.values()),p
 out=[]
 for ex,c in sorted(p.items()):
  fs=[str(c)] if c!=1 or not any(ex) else []
  fs += [f'({v})'+(f'^{e}' if e!=1 else '') for v,e in zip(vs,ex) if e]
  out.append('*'.join(fs))
 return '+\n   '.join(out)
N=P({(1,0,0):1});B=P({(0,1,0):1});K=P({(0,0,1):1})
r=N+1;b=B+1
A=4*r*(r+b)-(3*r-b)*(r+b+1)
r=N+2
C=(3*r-b)*2*(r-1)*(r-1+b)-(r-1-b)*4*r*(r+b)
n=N+2;k=K+1
F=(n-b*k)*(k+2)*(n-1)*(n+b-1)-(n-1-b*(k+1))*(k+1)*n*(n+b)
F=F-N*(N-K)**2
exprs=[lean(A,['r-1','b-1','k-1']),lean(C,['r-2','b-1','k-1']),lean(F,['n-2','b-1','k-1'])+'+\n   (n-2)*((n-2)-(k-1))^2']
s='''import Mathlib
/-! Machine-authored 9f234835. Checked scalar polynomial positivity certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
'''
s+='''
theorem ramp_scalar_initialM9F23 (b r : ℝ) (hb : 1 ≤ b) (hr : 1 ≤ r) :
 (3*r-b)/(4*r*(r+b)) ≤ 1/(r+b+1) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hr0 : 0 ≤ r-1 := by linarith
 have hp : 0 ≤ 4*r*(r+b)-(3*r-b)*(r+b+1) := by
  have he : 4*r*(r+b)-(3*r-b)*(r+b+1) = '''+exprs[0]+''' := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < 4*r*(r+b)) (by positivity : 0 < r+b+1)).mpr
 nlinarith only [hp]
'''
s+='''
theorem ramp_scalar_firstM9F23 (b r : ℝ) (hb : 1 ≤ b) (hr : 2 ≤ r) :
 (r-1-b)/(2*(r-1)*(r-1+b)) ≤ (3*r-b)/(4*r*(r+b)) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hr0 : 0 ≤ r-2 := by linarith
 have hr1 : 0 < r-1 := by linarith
 have hp : 0 ≤ (3*r-b)*2*(r-1)*(r-1+b)-(r-1-b)*4*r*(r+b) := by
  have he : (3*r-b)*2*(r-1)*(r-1+b)-(r-1-b)*4*r*(r+b) = '''+exprs[1]+''' := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < 2*(r-1)*(r-1+b)) (by positivity : 0 < 4*r*(r+b))).mpr
 nlinarith only [hp]
'''
s+='''
theorem ramp_scalar_tailM9F23 (b n k : ℝ) (hb : 1 ≤ b) (hn : 2 ≤ n) (hk : 1 ≤ k) :
 (n-1-b*(k+1))/((k+2)*(n-1)*(n-1+b)) ≤
 (n-b*k)/((k+1)*n*(n+b)) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hn0 : 0 ≤ n-2 := by linarith
 have hk0 : 0 ≤ k-1 := by linarith
 have hn1 : 0 < n-1 := by linarith
 have hp : 0 ≤ (n-b*k)*(k+2)*(n-1)*(n-1+b)-
    (n-1-b*(k+1))*(k+1)*n*(n+b) := by
  have he : (n-b*k)*(k+2)*(n-1)*(n-1+b)-
    (n-1-b*(k+1))*(k+1)*n*(n+b) = '''+exprs[2]+''' := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < (k+2)*(n-1)*(n-1+b))
   (by positivity : 0 < (k+1)*n*(n+b))).mpr
 nlinarith only [hp]

end
end MathGKM.Markov
'''
Path('research/MarkovRampScalarM9F23.lean').write_text(s)
print('generated three exact scalar certificates')
