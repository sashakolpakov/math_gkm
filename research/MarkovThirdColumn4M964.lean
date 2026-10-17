import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn4M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (75155+x*((5128979/84)+x*((7197677/360)+x*((104059/30)+x*((25399/72)+x*((253/12)+x*((31/45)+x*(1/105)))))))) else (38320+x*((724840/21)+x*((561683/45)+x*((23833/10)+x*((9595/36)+x*((35/2)+x*((113/180)+x*(1/105))))))))
theorem source_third_column4M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 4 (thirdJM964 d r):ℚ)=thirdColumn4M964 d r := by
 have h := source_third_polynomialM964 d 1 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 1 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn4M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295] <;> ring

end
end MathGKM.Markov
