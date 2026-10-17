import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn5M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (492492+x*((17133481/30)+x*((235596103/840)+x*((289661587/3780)+x*((3717949/288)+x*((403933/288)+x*((71131/720)+x*((1049/240)+x*((223/2016)+x*(37/30240)))))))))) else (204204+x*((3960191/15)+x*((5042468/35)+x*((164717131/3780)+x*((5831573/720)+x*((464959/480)+x*((3374/45)+x*((2621/720)+x*((509/5040)+x*(37/30240))))))))))
theorem source_third_column5M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 5 (thirdJM964 d r):ℚ)=thirdColumn5M964 d r := by
 have h := source_third_polynomialM964 d 2 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 2 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn5M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295] <;> ring

end
end MathGKM.Markov
