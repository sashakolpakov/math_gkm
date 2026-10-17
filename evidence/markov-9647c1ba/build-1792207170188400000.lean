import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn7M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (4583040+x*((1733810989/195)+x*((637029822581/83160)+x*((429566813651/110880)+x*((498507116801/388800)+x*((177416531699/604800)+x*((20823733759/435456)+x*((4093508029/725760)+x*((1752365113/3628800)+x*((35970859/1209600)+x*((399431/311040)+x*((8933/241920)+x*((76063/119750400)+x*(2567/518918400)))))))))))))) else (1189650+x*((510705248/195)+x*((42415123049/16632)+x*((14369638301/9900)+x*((26154825923/48600)+x*((124566418181/907200)+x*((27056984009/1088640)+x*((11767069751/3628800)+x*((555423601/1814400)+x*((1194049/57600)+x*((152753/155520)+x*((112237/3628800)+x*((34831/59875200)+x*(2567/518918400))))))))))))))
theorem source_third_column7M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 7 (thirdJM964 d r):ℚ)=thirdColumn7M964 d r := by
 have h := source_third_polynomialM964 d 4 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 4 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn7M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,binomial_poly_12M295,binomial_poly_13M295] <;> ring

end
end MathGKM.Markov
