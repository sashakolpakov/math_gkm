import MarkovFourCycleM0A5
/-! Machine-authored 0a5fcabe. Three-cycle determinant correction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
attribute [local irreducible] runBooleanGaugeADB2 localFour01F frame coeff

theorem cyclic_four_run_threeM0A5 (n : ℕ) (p : Bool)
 (hs : ∀ z∈runBooleanListADB2 n true [false,p,true],Projection6905 z) :
 cyclicFour01F (runBooleanListADB2 n true [false,p,true])=
 runLocalFourBE n true false p true+runLocalFourBE n false p true false+
 runLocalFourBE n p true false p := by
 rw [show runBooleanListADB2 n true [false,p,true]=
   runBooleanGaugeADB2 n true false::runBooleanListADB2 n false [p,true] by rfl]
 rw [cyclic_four_local01F _ _ hs]
 simp only [runBooleanListADB2,List.take,localFourScan01F,List.cons_append,List.nil_append,
   headRatioOne01F,headRatioTwo01F,headRatioThree01F,runBoolean_b1ADB2,runLocalFourBE]
 ring

theorem four_moment_31M0A5 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) :
 fourMomentBE f 3 1=f true false false true+f false false true false+
 f false true false false := by
 norm_num [fourMomentBE,boolMomentADB2,boolJetADB2,fourSourceMoment897,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 <;> ring

theorem four_moment_32M0A5 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) :
 fourMomentBE f 3 2=f true false true true+f false true true false+
 f true true false true := by
 norm_num [fourMomentBE,boolMomentADB2,boolJetADB2,fourSourceMoment897,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 <;> ring

theorem source_three_cycle_momentM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) :
 cyclicFour01F (runBooleanListADB2 n true (sourceWord28 rest))=
 fourMomentBE (runLocalFourBE n) 3 (frame rest).mid.a := by
 have hw := source_short_wordBE rest (by omega)
 rw [hc] at hw
 have hs := runBoolean_source_shapeADB2 n rest
 rw [hw] at hs ⊢
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [hc] at hrc
 have ha : (frame rest).mid.a=1 ∨ (frame rest).mid.a=2 := by omega
 rcases ha with ha | ha
 · rw [ha] at hs ⊢
   change cyclicFour01F (runBooleanListADB2 n true [false,false,true])=_
   rw [cyclic_four_run_threeM0A5 n false hs,four_moment_31M0A5]
 · rw [ha] at hs ⊢
   change cyclicFour01F (runBooleanListADB2 n true [false,true,true])=_
   rw [cyclic_four_run_threeM0A5 n true hs,four_moment_32M0A5]

theorem source_run_product_d1M0A5 (n : ℕ) (rest : List Bool) :
 (projProduct6905 (runBooleanListADB2 n true (sourceWord28 rest))).d.coeff 1=
 firstRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a+1+X := by
 have hs := runBoolean_source_shapeADB2 n rest
 have hl : 2 ≤ (runBooleanListADB2 n true (sourceWord28 rest)).length := by
   rw [runList_length01F,(source_word_counts28 rest).2]
   obtain ⟨ha,hab,_⟩ := frame_reduced rest
   omega
 obtain ⟨m,ms,hw⟩ := List.exists_cons_of_length_pos (by omega : 0 < (runBooleanListADB2 n true (sourceWord28 rest)).length)
 rw [hw] at hs hl
 obtain ⟨k,ks,hk⟩ := List.exists_cons_of_length_pos (show 0 < ms.length by simp only [List.length_cons] at hl; omega)
 rw [hk] at hs hw
 have ha := projProduct_a16905 m k ks hs
 rw [←hw] at ha
 have ht := source_first_cut_trace487 (List.replicate n true++false::rest)
 rw [source_first_run_polyADB2,←runBoolean_source_traceADB2] at ht
 simp only [tr16,Polynomial.coeff_add,ha,zero_add] at ht
 simpa only [add_assoc] using ht

theorem source_fourth_correction_threeM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 fourthExplicitRunBE n 3 (frame rest).mid.a-
   48*(firstRunPolyADB2 n 3 (frame rest).mid.a+1+X)*
   X^((frame (List.replicate n true++false::rest)).mid.b) := by
 rw [source_fourth_run_poly01F]
 unfold fourthRunPoly01F fourthExplicitRunBE sourceFourthTrace01F
 dsimp only
 rw [source_run_product_d1M0A5,hc,source_three_cycle_momentM0A5 n rest hc]
 norm_num [determinantFour01F]
 <;> ring
end
end MathGKM.Markov
