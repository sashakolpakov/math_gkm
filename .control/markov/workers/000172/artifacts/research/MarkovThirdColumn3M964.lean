import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn3M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (5524+x*((38702/15)+x*((1331/3)+x*((121/3)+x*((11/6)+x*(1/30)))))) else (3429+x*((52999/30)+x*((1000/3)+x*((100/3)+x*((5/3)+x*(1/30))))))
theorem source_third_column3M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 3 (thirdJM964 d r):ℚ)=thirdColumn3M964 d r := by
 have h := source_third_polynomialM964 d 0 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show ¬(1:ℕ) ≤ 0 by omega,if_false] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn3M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295] <;> ring

end
end MathGKM.Markov
