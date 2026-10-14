"""Historical initial candidate generator, later repaired in Lean.
Do not rerun over the final module; final sources and immutable build snapshots
are the reproducible proof artifacts. This initial generator is preserved.
"""
import pathlib,sys
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import generate
path,(a,b,p)=next(x for x in generate(5) if x[1][:2]==(2,5))
rows=[]
for j in sorted(set(j for i,j in p)):
 row='+'.join(f'{p[i,j]}*X^{i}' for i in sorted(i for i,k in p if k==j))
 rows.append(f'C ({row})*X^{j}')
rhs=' +\n    '.join(rows)
text='''import MarkovHorizontalB46

/-! Machine-authored worker b46c0efc. Actual source horizontal quadratic
obstruction to a real-rootedness strategy; NOT a raw LC counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem two_fifths_horizontal46 :
    (Bivariate.swap (frame [false,true]).mid.p).coeff 2 =
      X^2*(14+28*X+15*X^2) := by
  have he : Bivariate.swap (frame [false,true]).mid.p =
    RHS := by
    simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
      Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
      map_one,Bivariate.swap_X,Bivariate.swap_Y]
    ring
  rw [he]
  simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
  norm_num
  ring

theorem horizontal_quadratic_obstruction46 :
    (28:ℝ)^2-4*15*14 < 0 ∧
    (∀ x : ℝ, 0 < 14+28*x+15*x^2) ∧
    (14:ℤ)*15 ≤ 28^2 := by
  refine ⟨by norm_num,?_,by norm_num⟩
  intro x
  nlinarith [sq_nonneg (15*x+14)]

/-- Literal discrepancy with the displayed j=1 coefficient expression in
the hosted Theorem 4.2. The recurrence and Theorem 4.1 give 4 here.
This concerns an auxiliary source formula, not Conjecture 6.3. -/
theorem printed_row_formula_mismatch46 :
    coeff (frame [true]).mid.p 3 1=4 ∧
    (3*2-1:ℕ)*(3-2).choose (3-2)+(3-2)*(3-3).choose (3-2-1)=6 := by
  have he : (frame [true]).mid.p =
      (U+V)^4+2*U^3+5*U^2*V+4*U*V^2+V^3+U^2 := by
    simp [frame,advance,initial,S]
    ring
  constructor
  · rw [he]
    norm_num [coeff,U,V,Polynomial.coeff_add,Polynomial.coeff_mul,
      Nat.antidiagonal_eq_map,Finset.sum_range_succ]
  · norm_num

#print axioms two_fifths_horizontal46
#print axioms horizontal_quadratic_obstruction46
#print axioms printed_row_formula_mismatch46
end
end MathGKM.Markov
'''.replace('RHS',rhs)
pathlib.Path('research/MarkovHorizontalExampleB46.lean').write_text(text)
print(text)
