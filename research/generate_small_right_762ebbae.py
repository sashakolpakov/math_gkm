"""Machine-authored literal source polynomials for the finite n=0 third-column cases."""
from pathlib import Path
from experiment_8833 import source,path_for
from math import gcd
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-762ebbae'
mods=[]
for a in range(4,7):
 for r in range(1,a):
  if gcd(a,r)!=1:continue
  b=a+r;path=path_for(a,b);aa,bb,p=source(path);assert (a,b)==(aa,bb)
  w='['+','.join('true' if x else 'false' for x in path)+']'
  expr=' +\n '.join('C ('+'+'.join(f'{c}*X^{j}' for (i,j),c in sorted(p.items()) if i==k)+f')*X^{k}' for k in sorted(set(i for i,j in p)))
  col='+'.join(f'{c}*X^{j}' for (i,j),c in sorted(p.items()) if i==3)
  name=f'MarkovThirdRight{a}_{b}M762';mods.append(name)
  s=f'''import MarkovVerticalSecondRightMDE6
/-! Machine-authored 762ebbae. Literal source expansion, third column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
theorem small_v3poly_{a}_{b}M762 : (frame {w}).mid.p=
 {expr} := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_v3col_{a}_{b}M762 : ((frame {w}).mid.p).coeff 3={col} := by
 rw [small_v3poly_{a}_{b}M762]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_v3lc_{a}_{b}M762 (j : ℕ) (hj : j ≤ {a+b-1}) :
 coeff (frame {w}).mid.p 3 j*coeff (frame {w}).mid.p 3 (j+2) ≤
 coeff (frame {w}).mid.p 3 (j+1)^2 := by
 simp only [coeff,small_v3col_{a}_{b}M762]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
'''
  (R/'research'/f'{name}.lean').write_text(s)
(O/'right-plan.json').write_text(json.dumps(mods,indent=2)+'\n')
print('Generated',len(mods),'finite source proofs')
