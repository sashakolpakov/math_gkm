"""Machine-authored exact coefficient calculation and Lean certificate generation."""
from pathlib import Path
import json
O=Path('/Users/sasha/math_gkm/evidence/markov-96ada19b')
def add(a,b):
 z=dict(a)
 for e,c in b.items():z[e]=z.get(e,0)+c
 return {e:c for e,c in z.items() if c}
def mul(a,b):
 z={}
 for e,c in a.items():
  for f,d in b.items():
   g=tuple(x+y for x,y in zip(e,f));z[g]=z.get(g,0)+c*d
 return {e:c for e,c in z.items() if c}
def C(n):return {(0,0,0):n} if n else {}
def scale(a,n):return {e:c*n for e,c in a.items() if c*n}
def powp(a,n):
 z=C(1)
 for _ in range(n):z=mul(z,a)
 return z
x={(1,0,0):1};d={(0,1,0):1};c={(0,0,1):1}
q=add(add(x,d),C(2))
def B(z):return add(mul(scale(add(scale(q,3),c),7),add(add(scale(powp(z,2),2),scale(z,10)),C(15))),scale(mul(z,add(add(scale(powp(z,2),18),scale(z,100)),C(155))),-1))
b0=B(x);b1=B(add(x,C(1)));b2=B(add(x,C(2)))
gap=add(mul(mul(add(x,C(2)),add(x,C(5))),powp(b1,2)),scale(mul(mul(add(x,C(1)),add(x,C(6))),mul(b0,b2)),-1))
(O/'lower-certificate.json').write_text(json.dumps({'status':'exact symbolic certificate, source bridge unproved','terms':[[*e,v] for e,v in sorted(gap.items())],'nonnegative':all(v>=0 for v in gap.values())},indent=2)+'\n')
print('terms',len(gap),'minimum',min(gap.values()))
assert all(v>=0 for v in gap.values())
def term(e,v):return str(v)+''.join('*'+n+('^'+str(k) if k!=1 else '') for n,k in zip(['x','d','c'],e) if k)
expr='+\n '.join(term(e,v) for e,v in sorted(gap.items()))
src='''import MarkovThreeForceM96A
/-! Machine-authored 96ada19b. Lower-column candidate inequality.
The identification with source coefficients remains unproved in Lean. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
def lowerCoreM96A (q x c : ℚ) : ℚ :=
 7*(3*q+c)*(2*x^2+10*x+15)-x*(18*x^2+100*x+155)
def lowerCandidateM96A (q x c : ℚ) : ℚ :=
 (x+1)*(x+2)*(x+3)*(x+4)*lowerCoreM96A q x c/2520
def lowerGapM96A (x d c : ℚ) : ℚ :=
 '''+expr+'''
theorem lower_gap_identityM96A (x d c : ℚ) :
 (x+2)*(x+5)*lowerCoreM96A (x+d+2) (x+1) c^2-
 (x+1)*(x+6)*lowerCoreM96A (x+d+2) x c*lowerCoreM96A (x+d+2) (x+2) c=
 lowerGapM96A x d c := by unfold lowerCoreM96A lowerGapM96A; ring
theorem lower_gap_nonnegM96A (x d c : ℚ) (hx : 0 ≤ x) (hd : 0 ≤ d) (hc : 0 ≤ c) :
 0 ≤ lowerGapM96A x d c := by unfold lowerGapM96A; positivity
theorem lower_candidate_lcM96A (q x c : ℚ) (hx : 0 ≤ x) (hq : x+2 ≤ q) (hc : 0 ≤ c) :
 lowerCandidateM96A q x c*lowerCandidateM96A q (x+2) c ≤ lowerCandidateM96A q (x+1) c^2 := by
 have hg := lower_gap_nonnegM96A x (q-x-2) c hx (by linarith) hc
 have hi := lower_gap_identityM96A x (q-x-2) c
 have he : x+(q-x-2)+2=q := by ring
 rw [he] at hi
 have hf : 0 ≤ (x+2)*(x+3)^2*(x+4)^2*(x+5) := by positivity
 have hmul := mul_nonneg hf hg
 rw [←hi] at hmul
 unfold lowerCandidateM96A
 nlinarith only [hmul]
end
end MathGKM.Markov
'''
Path('/Users/sasha/math_gkm/research/MarkovLowerCandidateM96A.lean').write_text(src)
