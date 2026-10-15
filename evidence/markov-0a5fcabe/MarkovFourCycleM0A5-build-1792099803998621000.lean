import MarkovFourthAllCyclesBE
/-! Machine-authored request 0a5fcabe. Exact four-cycle correction, all run lengths. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

theorem cyclic_four_run_fourM0A5 (n : ℕ) (p q : Bool)
 (hs : ∀ z∈runBooleanListADB2 n true [false,p,q,true],Projection6905 z) :
 cyclicFour01F (runBooleanListADB2 n true [false,p,q,true])=
 runLocalFourBE n true false p q+runLocalFourBE n false p q true+
 runLocalFourBE n p q true false+runLocalFourBE n q true false p := by
 rw [show runBooleanListADB2 n true [false,p,q,true]=
   runBooleanGaugeADB2 n true false::runBooleanListADB2 n false [p,q,true] by rfl]
 rw [cyclic_four_local01F _ _ hs]
 simp only [runBooleanListADB2,List.take,localFourScan01F,List.cons_append,List.nil_append,
   headRatioOne01F,headRatioTwo01F,headRatioThree01F,runBoolean_b1ADB2,runLocalFourBE]
 ring

theorem four_moment_41M0A5 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) :
 fourMomentBE f 4 1=
 f true false false false+f false false false true+
 f false false true false+f false true false false := by
 norm_num [fourMomentBE,boolMomentADB2,fourSourceMoment897,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 <;> ring

theorem four_moment_43M0A5 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) :
 fourMomentBE f 4 3=
 f true false true true+f false true true true+
 f true true true false+f true true false true := by
 norm_num [fourMomentBE,boolMomentADB2,fourSourceMoment897,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 <;> ring

theorem source_four_cycle_momentM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) :
 cyclicFour01F (runBooleanListADB2 n true (sourceWord28 rest))=
 fourMomentBE (runLocalFourBE n) 4 (frame rest).mid.a := by
 have hw := source_short_wordBE rest (by omega)
 rw [hc] at hw
 have hs := runBoolean_source_shapeADB2 n rest
 rw [hw] at hs ⊢
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 rw [hc] at hrc hcop
 have hbad : (frame rest).mid.a≠2 := by
   intro ha
   rw [ha] at hcop
   norm_num at hcop
 have ha : (frame rest).mid.a=1 ∨ (frame rest).mid.a=3 := by omega
 rcases ha with ha | ha
 · rw [ha] at hs ⊢
   change cyclicFour01F (runBooleanListADB2 n true [false,false,false,true])=_
   rw [cyclic_four_run_fourM0A5 n false false hs,four_moment_41M0A5]
 · rw [ha] at hs ⊢
   change cyclicFour01F (runBooleanListADB2 n true [false,true,true,true])=_
   rw [cyclic_four_run_fourM0A5 n true true hs,four_moment_43M0A5]

theorem source_fourth_correction_fourM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 fourthExplicitRunBE n 4 (frame rest).mid.a+
   24*X^((frame (List.replicate n true++false::rest)).mid.b) := by
 rw [source_fourth_run_poly01F]
 unfold fourthRunPoly01F fourthExplicitRunBE sourceFourthTrace01F
 dsimp only
 rw [hc,source_four_cycle_momentM0A5 n rest hc]
 norm_num [determinantFour01F]
 <;> ring

theorem source_fourth_correction_four_rawM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 (fourthExplicitRunBE n 4 (frame rest).mid.a).coeff j+
   if (frame (List.replicate n true++false::rest)).mid.b=j then 24 else 0 := by
 rw [source_cut_coeffA27 _ i j 4 hs]
 have h := congrArg (fun p : ℤ[X] => p.coeff j)
   (source_fourth_correction_fourM0A5 n rest hc)
 simpa only [Polynomial.coeff_ofNat_mul,Polynomial.coeff_add,Polynomial.coeff_X_pow,
   mul_ite,mul_one,mul_zero] using h
end
end MathGKM.Markov
