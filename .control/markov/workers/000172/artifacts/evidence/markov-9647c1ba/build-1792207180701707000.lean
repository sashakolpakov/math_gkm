import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn8M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (7263828+x*((2451766943/140)+x*((13290564874539/700700)+x*((1233415071798941/100900800)+x*((17418917255123/3326400)+x*((63016389725417/39916800)+x*((3768390384149/10886400)+x*((153207938791/2721600)+x*((261427128959/38102400)+x*((47891051951/76204800)+x*((156141331/3628800)+x*((3934733/1814400)+x*((1168801/14968800)+x*((56899/29937600)+x*((15269/544864320)+x*(103/544864320)))))))))))))))) else (1420848+x*((138149187/35)+x*((30898358919041/6306300)+x*((272389731032647/75675600)+x*((17443939509391/9979200)+x*((35572637525617/59875200)+x*((318017927687/2177280)+x*((192299040361/7257600)+x*((546515749159/152409600)+x*((55361736733/152409600)+x*((66314533/2419200)+x*((33058561/21772800)+x*((14354609/239500800)+x*((18203/11404800)+x*((560137/21794572800)+x*(103/544864320))))))))))))))))
theorem source_third_column8M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 8 (thirdJM964 d r):ℚ)=thirdColumn8M964 d r := by
 have h := source_third_polynomialM964 d 5 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 5 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn8M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,binomial_poly_12M295,binomial_poly_13M295,binomial_poly_14M295,binomial_poly_15M295] <;> ring

end
end MathGKM.Markov
