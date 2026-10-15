"""Machine-authored 75ad68f9. Generate explicit ring certificates, checked by Lean."""
from pathlib import Path
import json
from third_cert_75ad import P,coefficients,expr
R=Path('research')
base='''import MarkovCutRootA27
/-! Machine-authored 75ad68f9. A candidate third lower slice, scaled uniformly
by six. Its universal source identification remains an explicit hypothesis. -/
namespace MathGKM.Markov
noncomputable section
def thirdSeq75 (c r q t u : ℤ) : ℕ → ℤ
 | 0 => -6+11*(c+r)-6*(c+r)^2+(c+r)^3
 | 1 => -18-3*c+87*r+3*c*c-51*c*r-54*r*r+9*c*c*r+18*c*r*r+9*r^3
 | 2 => -18+6*c+33*r+3*c*r-114*r*r+27*c*r*r+27*r^3
 | 3 => -6+21*r-18*r*r+27*r^3+24*q*(c+r-7)
 | 4 => 24*((3*r-5)*q+t)
 | 5 => 24*u
 | _ => 0
end
end MathGKM.Markov
'''
(R/'MarkovThirdCandidate75.lean').write_text(base)
cases={
'Low':('3*(x+1)+y','x+1','0','0','0'),
'MidLow':('2*(x+1)+3*(y+1)','(x+1)+(y+1)','0','x+1','0'),
'MidHigh':('3*(x+1)+2*(y+1)','2*(x+1)+(y+1)','x+1','x+y+2','0'),
'High':('(x+1)+3*(y+1)','(x+1)+2*(y+1)','x+y+2','y+1','x+1')}
data=json.loads(Path('evidence/markov-75ad68f9/third-certificates.json').read_text())
for name,args in cases.items():
 s='''import MarkovThirdCandidate75
/-! Machine-authored 75ad68f9. Universal algebraic candidate inequalities;
not an assertion of the outstanding source formula. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
'''
 seq='thirdSeq75 '+' '.join('('+a+')' for a in args)
 for j in range(4):
  ex=next(d['expression'] for d in data if d['chamber']==name.lower() and d['j']==j)
  s+=f'''theorem third_{name.lower()}_{j}75 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 {seq} {j}*{seq} {j+2}≤({seq} {j+1})^2 := by
 have he : ({seq} {j+1})^2-({seq} {j})*({seq} {j+2}) =
   {ex} := by simp only [thirdSeq75]; ring
 have hp : 0≤{ex} := by positivity
 omega
'''
 s+=f'''theorem third_{name.lower()}_lc75 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 {seq} j*{seq} (j+2)≤({seq} (j+1))^2 := by
 by_cases hj : j<4
 · interval_cases j
'''
 for j in range(4):s+=f'   · exact third_{name.lower()}_{j}75 x y hx hy\n'
 s+=f''' · have hz : {seq} (j+2)=0 := by
     match j with
     | 0 | 1 | 2 | 3 => omega
     | n+4 => rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
#print axioms third_{name.lower()}_lc75
end
end MathGKM.Markov
'''
 (R/f'MarkovThird{name}75.lean').write_text(s)
print('generated five modules')
