import MarkovAugmentedSourceM7A3
import MarkovColumn0MAE9
import MarkovColumn1MAE9
import MarkovColumn2MAE9
import MarkovColumn3MAE9
import MarkovColumn4MAE9
import MarkovColumn5MAE9
/-! Machine-authored request 418bcc64. Exact raw first-correction columns.
Python supplies proposed rational coefficients; every identity is checked by ring. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2

def correctionColumn2M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then 8 else 4
theorem source_correction_column2M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r 2 (q+3):ℚ)=correctionColumn2M418 q r := by
 have h := source_correction_outputM7A3 (q+2) 0 r (by omega)
 norm_num only [Nat.zero_add,augmentedOutputM7A3,show q+2+1=q+3 by omega] at h
 rw [h]
 cases r <;> norm_num [correctionColumn2M418,correctionConstantMDB2]

def correctionColumn3M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (104+x*((1682/15)+x*((125/3)+x*((25/3)+x*((5/6)+x*(1/30)))))) else (108+x*((1622/15)+x*((125/3)+x*((25/3)+x*((5/6)+x*(1/30))))))
theorem source_correction_column3M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r 3 (q+3):ℚ)=correctionColumn3M418 q r := by
 have h := source_first_correction_polynomialMAE9 (q+2) 0 r (by omega)
 norm_num only [Nat.reduceAdd,show q+2+1=q+3 by omega] at h
 rw [h,column_explicit0MAE9]
 cases r <;> simp only [sourceNME9C, Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column0MAE9,correctionColumn3M418,
   binomial_poly_0M295,binomial_poly_1M295] <;> ring

def correctionColumn4M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (265+x*((14913/28)+x*((147539/360)+x*((1583/10)+x*((2545/72)+x*((55/12)+x*((29/90)+x*(1/105)))))))) else (412+x*((73667/105)+x*((43453/90)+x*((5299/30)+x*((1363/36)+x*((143/30)+x*((59/180)+x*(1/105))))))))
theorem source_correction_column4M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r 4 (q+3):ℚ)=correctionColumn4M418 q r := by
 have h := source_first_correction_polynomialMAE9 (q+2) 1 r (by omega)
 norm_num only [Nat.reduceAdd,show q+2+1=q+3 by omega] at h
 rw [h,column_explicit1MAE9]
 cases r <;> simp only [sourceNME9C, Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column1MAE9,correctionColumn4M418,
   binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295] <;> ring

def correctionColumn5M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (252+x*((8129/10)+x*((294069/280)+x*((5356697/7560)+x*((399311/1440)+x*((97277/1440)+x*((7489/720)+x*((79/80)+x*((533/10080)+x*(37/30240)))))))))) else (636+x*((337937/210)+x*((1427507/840)+x*((3724621/3780)+x*((501889/1440)+x*((22717/288)+x*((8279/720)+x*((1759/1680)+x*((547/10080)+x*(37/30240))))))))))
theorem source_correction_column5M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r 5 (q+3):ℚ)=correctionColumn5M418 q r := by
 have h := source_first_correction_polynomialMAE9 (q+2) 2 r (by omega)
 norm_num only [Nat.reduceAdd,show q+2+1=q+3 by omega] at h
 rw [h,column_explicit2MAE9]
 cases r <;> simp only [sourceNME9C, Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column2MAE9,correctionColumn5M418,
   binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295] <;> ring

def correctionColumn6M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (84+x*((149219/330)+x*((269821/280)+x*((11660833/10800)+x*((573607/810)+x*((2180849/7560)+x*((330971/4320)+x*((97381/7200)+x*((23861/15120)+x*((253/2160)+x*((13/2592)+x*(157/1663200)))))))))))) else (448+x*((813511/495)+x*((1780453/700)+x*((497815313/226800)+x*((6676589/5670)+x*((8372387/20160)+x*((4284889/43200)+x*((87307/5400)+x*((53657/30240)+x*((4555/36288)+x*((4693/907200)+x*(157/1663200))))))))))))
theorem source_correction_column6M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r 6 (q+3):ℚ)=correctionColumn6M418 q r := by
 have h := source_first_correction_polynomialMAE9 (q+2) 3 r (by omega)
 norm_num only [Nat.reduceAdd,show q+2+1=q+3 by omega] at h
 rw [h,column_explicit3MAE9]
 cases r <;> simp only [sourceNME9C, Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column3MAE9,correctionColumn6M418,
   binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295] <;> ring

def correctionColumn7M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (0+x*((8477/195)+x*((19802171/83160)+x*((125043889/237600)+x*((1692085313/2721600)+x*((264126469/604800)+x*((84296161/435456)+x*((206655221/3628800)+x*((41461087/3628800)+x*((30233/19200)+x*((319967/2177280)+x*((3583/403200)+x*((37657/119750400)+x*(2567/518918400)))))))))))))) else (120+x*((315989/455)+x*((136550629/83160)+x*((47280481/22176)+x*((4661870593/2721600)+x*((1645576307/1814400)+x*((143201309/435456)+x*((12133517/145152)+x*((54579947/3628800)+x*((2307359/1209600)+x*((363283/2177280)+x*((1391/145152)+x*((38957/119750400)+x*(2567/518918400))))))))))))))
theorem source_correction_column7M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r 7 (q+3):ℚ)=correctionColumn7M418 q r := by
 have h := source_first_correction_polynomialMAE9 (q+2) 4 r (by omega)
 norm_num only [Nat.reduceAdd,show q+2+1=q+3 by omega] at h
 rw [h,column_explicit4MAE9]
 cases r <;> simp only [sourceNME9C, Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column4MAE9,correctionColumn7M418,
   binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295] <;> ring

def correctionColumn8M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (0+x*((-389/42)+x*((-164243609/5045040)+x*((-1405570499/100900800)+x*((147164761/1663200)+x*((2383459271/13305600)+x*((1760994401/10886400)+x*((923274529/10886400)+x*((2189798587/76204800)+x*((252606967/38102400)+x*((1935263/1814400)+x*((435551/3628800)+x*((1111307/119750400)+x*((8047/17107200)+x*((153511/10897286400)+x*(103/544864320)))))))))))))))) else (0+x*((10106/195)+x*((2750404/9009)+x*((18673112261/25225200)+x*((472243039/475200)+x*((5541925601/6652800)+x*((723110521/1555200)+x*((559567661/3110400)+x*((1078534603/21772800)+x*((1500834421/152409600)+x*((1470067/1036800)+x*((1063483/7257600)+x*((362573/34214400)+x*((226469/444787200)+x*((45457/3113510400)+x*(103/544864320))))))))))))))))
theorem source_correction_column8M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r 8 (q+3):ℚ)=correctionColumn8M418 q r := by
 have h := source_first_correction_polynomialMAE9 (q+2) 5 r (by omega)
 norm_num only [Nat.reduceAdd,show q+2+1=q+3 by omega] at h
 rw [h,column_explicit5MAE9]
 cases r <;> simp only [sourceNME9C, Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column5MAE9,correctionColumn8M418,
   binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295] <;> ring

end
end MathGKM.Markov
