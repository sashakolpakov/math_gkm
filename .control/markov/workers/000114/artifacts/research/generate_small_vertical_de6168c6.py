"""Machine-authored finite source expansion generator, q=1 exceptions only."""
from pathlib import Path
from experiment_8833 import source,path_for
R=Path('/Users/sasha/math_gkm')
for a,b in [(2,3),(3,4),(3,5),(4,5),(4,7)]:
 path=path_for(a,b);aa,bb,p=source(path);assert (a,b)==(aa,bb)
 w='['+','.join('true' if x else 'false' for x in path)+']'
 expr=' +\n '.join('C ('+'+'.join(f'{c}*X^{j}' for (i,j),c in sorted(p.items()) if i==k)+f')*X^{k}' for k in sorted(set(i for i,j in p)))
 col='+'.join(f'{c}*X^{j}' for (i,j),c in sorted(p.items()) if i==2)
 name=f'MarkovSmallVertical{a}_{b}MDE6'
 s=f'''import MarkovHorizontalB46
/-! Machine-authored de6168c6. Literal source expansion, second column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 12000
theorem small_vpoly_{a}_{b}MDE6 : (frame {w}).mid.p=
 {expr} := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_vcol_{a}_{b}MDE6 : ((frame {w}).mid.p).coeff 2={col} := by
 rw [small_vpoly_{a}_{b}MDE6]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_vlc_{a}_{b}MDE6 (j : ℕ) (hj : j ≤ {a+b-1}) :
 coeff (frame {w}).mid.p 2 j*coeff (frame {w}).mid.p 2 (j+2) ≤
 coeff (frame {w}).mid.p 2 (j+1)^2 := by
 simp only [coeff,small_vcol_{a}_{b}MDE6]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
'''
 (R/'research'/f'{name}.lean').write_text(s)
print('Generated five literal finite source modules; requires Lean compilation.')
