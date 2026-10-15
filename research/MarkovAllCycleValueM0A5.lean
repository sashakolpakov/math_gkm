import MarkovPlainFourthNormM0A5
import MarkovFullCoefficientLCM06
/-! Machine-authored 0a5fcabe. Explicit corrected coefficient adapter for every cycle. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff plainFourthM0A5 fullFourthValueM06
  firstRunPolyADB2 plainSecondM0A5 fullNumeratorFA

def smallCycleCorrectionM0A5 (n c r : ℕ) : ℤ[X] :=
 if c=2 then
   12*(2*(firstRunPolyADB2 n c r)^2+4*firstRunPolyADB2 n c r*(1+X)+
       6*(1+X)^2-plainSecondM0A5 n c r)*X^(c*(n+1)+r)
 else if c=3 then
   -24*(firstRunPolyADB2 n c r+2*(1+X))*X^(c*(n+1)+r)
 else if c=4 then 24*X^(c*(n+1)+r) else 0

attribute [local irreducible] smallCycleCorrectionM0A5

theorem source_plain_allM0A5 (n : ℕ) (rest : List Bool) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 plainFourthM0A5 n (frame rest).mid.b (frame rest).mid.a+
 smallCycleCorrectionM0A5 n (frame rest).mid.b (frame rest).mid.a := by
 by_cases h2 : (frame rest).mid.b=2
 · have hr := (source_two_indicesM0A5 n rest h2).1
   rw [source_plain_twoM0A5 n rest h2,h2,hr]
   simp only [smallCycleCorrectionM0A5,if_true,show 2*(n+1)+1=2*n+3 by omega]
 by_cases h3 : (frame rest).mid.b=3
 · rw [source_plain_threeM0A5 n rest h3,h3]
   simp only [smallCycleCorrectionM0A5,show ¬(3:ℕ)=2 by decide,if_false,if_true]
   ring
 by_cases h4 : (frame rest).mid.b=4
 · rw [source_plain_fourM0A5 n rest h4,h4]
   simp only [smallCycleCorrectionM0A5,show ¬(4:ℕ)=2 by decide,
     show ¬(4:ℕ)=3 by decide,if_false,if_true]
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have hc : 5 ≤ (frame rest).mid.b := by omega
 rw [source_fourth_explicitBE n rest hc,explicit_plain_ge_fourM0A5 n _ _ (by omega)]
 simp only [smallCycleCorrectionM0A5,if_neg h2,if_neg h3,if_neg h4,add_zero]

theorem plain_fourth_coeffM0A5 (n c r j : ℕ) :
 (plainFourthM0A5 n c r).coeff j=fullFourthValueM06 n c r j := by
 unfold fullFourthValueM06
 apply coeff_of_one_sub_mul_rangeBC (plainFourthM0A5 n c r)
   (fullNumeratorFA (n:ℤ[X]) (X^n) X c r) 7 j
 rw [plain_fourth_clearedM0A5,fourthNumerator_fullFA]

def correctedFourthValueM0A5 (n c r j : ℕ) : ℤ :=
 fullFourthValueM06 n c r j+(smallCycleCorrectionM0A5 n c r).coeff j

theorem source_fourth_all_valueM0A5 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 correctedFourthValueM0A5 n (frame rest).mid.b (frame rest).mid.a j := by
 rw [source_cut_coeffA27 _ i j 4 hs]
 have h := congrArg (fun p : ℤ[X] => p.coeff j) (source_plain_allM0A5 n rest)
 simpa only [Polynomial.coeff_ofNat_mul,Polynomial.coeff_add,
   plain_fourth_coeffM0A5,correctedFourthValueM0A5] using h

theorem small_correction_belowM0A5 (n c r j : ℕ) (hj : j < c*(n+1)+r) :
 (smallCycleCorrectionM0A5 n c r).coeff j=0 := by
 have hd : (X:ℤ[X])^(c*(n+1)+r) ∣ smallCycleCorrectionM0A5 n c r := by
   unfold smallCycleCorrectionM0A5
   split_ifs
   · exact dvd_mul_left _ _
   · exact dvd_mul_left _ _
   · exact dvd_mul_left _ _
   · exact dvd_zero _
 exact (Polynomial.X_pow_dvd_iff.mp hd) j hj

theorem source_fourth_all_belowM0A5 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j < (frame (List.replicate n true++false::rest)).mid.b) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 fullFourthValueM06 n (frame rest).mid.b (frame rest).mid.a j := by
 rw [source_fourth_all_valueM0A5 n rest i j hs]
 unfold correctedFourthValueM0A5
 rw [small_correction_belowM0A5 n _ _ j (by rw [←(source_run_indicesBF n rest).2]; exact hj),add_zero]

theorem source_fourth_all_lc_iffM0A5 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 (coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
  coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
  coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2) ↔
 (correctedFourthValueM0A5 n (frame rest).mid.b (frame rest).mid.a j*
  correctedFourthValueM0A5 n (frame rest).mid.b (frame rest).mid.a (j+2) ≤
  correctedFourthValueM0A5 n (frame rest).mid.b (frame rest).mid.a (j+1)^2) := by
 rw [←source_fourth_all_valueM0A5 n rest (i+2) j (by omega),
   ←source_fourth_all_valueM0A5 n rest i (j+2) (by omega),
   ←source_fourth_all_valueM0A5 n rest (i+1) (j+1) (by omega)]
 constructor <;> intro h <;> nlinarith only [h]
end
end MathGKM.Markov
