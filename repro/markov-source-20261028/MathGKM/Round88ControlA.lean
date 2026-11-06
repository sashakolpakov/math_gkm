import MathGKM.ResearchSemantics
import Mathlib
/- Machine-authored round88. Auxiliary only; no reachability assertion. -/
namespace SparseSumControlR88
open Polynomial
noncomputable section
def P : Polynomial ℤ := 1+X+X^2+X^3+X^4
def Q : Polynomial ℤ := 10*X^2
def Good (H : Polynomial ℤ) : Prop :=
  (∀ r, 0≤H.coeff r) ∧
  (∀ r, r≤4 → H.coeff r=H.coeff (4-r)) ∧
  (∀ i j k, i<j → j<k → 0<H.coeff i → 0<H.coeff k → 0<H.coeff j) ∧
  (∀ r, H.coeff r*H.coeff (r+2)≤H.coeff (r+1)^2)
theorem coeff_P (r : ℕ) : P.coeff r=if r≤4 then 1 else 0 := by
  by_cases h : r≤4
  · interval_cases r <;> norm_num [P,coeff_add,coeff_one,coeff_X,coeff_X_pow]
  · have h0 : r≠0 := by omega
    have h1 : r≠1 := by omega
    have h2 : r≠2 := by omega
    have h3 : r≠3 := by omega
    have h4 : r≠4 := by omega
    simp [P,coeff_add,coeff_one,coeff_X,coeff_X_pow,h,h0,h1,h2,h3,h4,eq_comm]
theorem coeff_Q (r : ℕ) : Q.coeff r=if r=2 then 10 else 0 := by
  simp [Q,coeff_C_mul,coeff_X_pow]
theorem control : Good P ∧ Good Q ∧
    (P+Q).coeff 0=1 ∧ (P+Q).coeff 1=1 ∧ (P+Q).coeff 2=11 ∧
    (P+Q).coeff 0*(P+Q).coeff 2>(P+Q).coeff 1^2 := by
  have hp : Good P := by
    unfold Good
    simp only [coeff_P]
    refine ⟨?_,?_,?_,?_⟩
    · intro r; split_ifs <;> norm_num
    · intro r hr; rw [if_pos hr,if_pos (by omega)]
    · intro i j k hij hjk hi hk
      split_ifs at hi hk ⊢ <;> norm_num at * <;> omega
    · intro r
      split_ifs <;> norm_num <;> omega
  have hq : Good Q := by
    unfold Good
    simp only [coeff_Q]
    refine ⟨?_,?_,?_,?_⟩
    · intro r; split_ifs <;> norm_num
    · intro r hr; have h : r=2 ↔ 4-r=2 := by omega
      simp only [h]
    · intro i j k hij hjk hi hk
      split_ifs at hi hk ⊢ <;> norm_num at * <;> omega
    · intro r
      split_ifs <;> norm_num <;> omega
  refine ⟨hp,hq,?_,?_,?_,?_⟩ <;> norm_num [coeff_add,coeff_P,coeff_Q]
end
end SparseSumControlR88
#print axioms SparseSumControlR88.control
