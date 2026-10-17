import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn6M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (1888068+x*((95331100/33)+x*((12141746231/6300)+x*((27935926493/37800)+x*((8214563069/45360)+x*((902986283/30240)+x*((36674213/10800)+x*((1925671/7200)+x*((108511/7560)+x*((15167/30240)+x*((146/14175)+x*(157/1663200)))))))))))) else (626808+x*((177723262/165)+x*((112603891/140)+x*((25999546681/75600)+x*((2122617671/22680)+x*((1032632887/60480)+x*((3700861/1728)+x*((668153/3600)+x*((330737/30240)+x*((25339/60480)+x*((1709/181440)+x*(157/1663200))))))))))))
theorem source_third_column6M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 6 (thirdJM964 d r):ℚ)=thirdColumn6M964 d r := by
 have h := source_third_polynomialM964 d 3 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 3 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn6M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295] <;> ring

end
end MathGKM.Markov
