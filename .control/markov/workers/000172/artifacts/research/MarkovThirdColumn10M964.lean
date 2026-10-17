import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn10M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (4881448+x*((72190503103/3990)+x*((2252949591406721/74220300)+x*((98527658533159019/3216213000)+x*((170358296383223587/8172964800)+x*((1106853104019781667/108972864000)+x*((1351957291350829571/367783416000)+x*((1984063872506223163/1961511552000)+x*((1297311768561953/6035420160)+x*((14341225790400589/402361344000)+x*((127305267591961/27433728000)+x*((128845199687/270950400)+x*((866788987483/22632825600)+x*((1454112284539/603542016000)+x*((17648587837/150885504000)+x*((11226724291/2615348736000)+x*((45150607/392302310400)+x*((1235621/581188608000)+x*((4837661/200074178304000)+x*(646651/5068545850368000)))))))))))))))))))) else (427856+x*((3912021058/1995)+x*((7727985107355017/1929727800)+x*((13873339879805561/2858856000)+x*((64016245103663791/16345929600)+x*((69697137736675429/31135104000)+x*((4518471034609801/4803701760)+x*((233557394446584343/784604620800)+x*((1088174560376887/15088550400)+x*((3628286489440087/268240896000)+x*((86818268912777/43893964800)+x*((168900655999/746496000)+x*((1046786838773/51732172800)+x*((1698633073721/1207084032000)+x*((236119761077/3138418483200)+x*((440359291/145297152000)+x*((27914377/313841848320)+x*((2681183/1494484992000)+x*((1016707/45731240755200)+x*(646651/5068545850368000))))))))))))))))))))
theorem source_third_column10M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 10 (thirdJM964 d r):ℚ)=thirdColumn10M964 d r := by
 have h := source_third_polynomialM964 d 7 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 7 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn10M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,binomial_poly_12M295,binomial_poly_13M295,binomial_poly_14M295,binomial_poly_15M295,binomial_poly_16M295,binomial_poly_17M295,binomial_poly_18M295,binomial_poly_19M295] <;> ring

end
end MathGKM.Markov
