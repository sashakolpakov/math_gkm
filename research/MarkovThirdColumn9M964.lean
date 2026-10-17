import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn9M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (7507500+x*((31918310821/1428)+x*((130109983438921/4324320)+x*((2005662889951517/82555200)+x*((286968308737388653/21794572800)+x*((332134326959731327/65383718400)+x*((296518325228143/205286400)+x*((1646582037047/5322240)+x*((52885212195367/1045094400)+x*((15532898324603/2438553600)+x*((1131297025687/1828915200)+x*((84496098539/1828915200)+x*((2158341281/821145600)+x*((1298249/11612160)+x*((18368803/5337446400)+x*((6311579/87178291200)+x*((194819/209227898880)+x*(98207/17784371404800)))))))))))))))))) else (1041040+x*((3920208122/1071)+x*((1386430505843/240240)+x*((2458851067580041/454053600)+x*((135124172579159/39916800)+x*((97771163751207523/65383718400)+x*((49618754629699/102643200)+x*((6222934126781/53222400)+x*((11214408034393/522547200)+x*((1470180318751/487710720)+x*((42463643923/130636800)+x*((49096390223/1828915200)+x*((690843719/410572800)+x*((7172201/91238400)+x*((49519363/18681062400)+x*((5313437/87178291200)+x*((983/1149603840)+x*(98207/17784371404800))))))))))))))))))
theorem source_third_column9M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 9 (thirdJM964 d r):ℚ)=thirdColumn9M964 d r := by
 have h := source_third_polynomialM964 d 6 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 6 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn9M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,binomial_poly_12M295,binomial_poly_13M295,binomial_poly_14M295,binomial_poly_15M295,binomial_poly_16M295,binomial_poly_17M295] <;> ring

end
end MathGKM.Markov
