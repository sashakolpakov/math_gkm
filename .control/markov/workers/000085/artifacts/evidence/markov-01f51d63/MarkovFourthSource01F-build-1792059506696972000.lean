import MarkovFourthTrace01F
import MarkovThirdAllCycles8BBB
/-! Machine-authored live request 01f51d63. An unconditional local-statistic
formula for the fourth lower slice of every mixed source path. Determinant
corrections for predecessor denominators 2, 3 and 4 are explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem runList_length01F (n : ℕ) (p : Bool) (w : List Bool) :
 (runBooleanListADB2 n p w).length=w.length := by
 induction w generalizing p with
 | nil => rfl
 | cons q qs ih => simp [runBooleanListADB2,ih]

theorem runList_det01F (n : ℕ) (p : Bool) (w : List Bool) :
 det16 (projProduct6905 (runBooleanListADB2 n p w))=
 U^w.length*V^(w.length*(n+1)+w.count true) := by
 induction w generalizing p with
 | nil => simp [runBooleanListADB2,projProduct6905,det16]
 | cons q qs ih =>
   simp only [runBooleanListADB2,projProduct6905,det_mul16,runBoolean_det8BBB,ih]
   cases q <;> simp [List.count_cons,pow_add,pow_succ,Nat.add_mul] <;> ring

theorem source_runList_det01F (n : ℕ) (rest : List Bool) :
 det16 (projProduct6905 (runBooleanListADB2 n true (sourceWord28 rest)))=
 U^(frame rest).mid.b*V^((frame (List.replicate n true++false::rest)).mid.b) := by
 rw [runList_det01F,(source_word_counts28 rest).1,(source_word_counts28 rest).2,
   (source_run_indicesBF n rest).2]

theorem source_runList_det_coeff01F (n : ℕ) (rest : List Bool) (k : ℕ) :
 (det16 (projProduct6905 (runBooleanListADB2 n true (sourceWord28 rest)))).coeff k=
 if (frame rest).mid.b=k then X^((frame (List.replicate n true++false::rest)).mid.b) else 0 := by
 rw [source_runList_det01F]
 simp only [U,V,←Polynomial.C_pow,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 split_ifs <;> simp_all

def sourceFourthTrace01F (n : ℕ) (rest : List Bool) : ℤ[X] :=
 let w := runBooleanListADB2 n true (sourceWord28 rest)
 let p := projProduct6905 w
 let c := (frame rest).mid.b
 let b := (frame (List.replicate n true++false::rest)).mid.b
 cyclicFour01F w+determinantFour01F (p.d.coeff 1) (p.d.coeff 2)
   (headRatioOne01F w) (headRatioOne01F (w.reverse.map transpose01F))
   (if c=2 then X^b else 0) (if c=3 then X^b else 0) (if c=4 then X^b else 0)

theorem source_fourth_trace01F (n : ℕ) (rest : List Bool) :
 logFour01F (tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest))))=
 sourceFourthTrace01F n rest := by
 let w := runBooleanListADB2 n true (sourceWord28 rest)
 have hs := runBoolean_source_shapeADB2 n rest
 change ∀ z∈w,Projection6905 z at hs
 have hl : 2≤w.length := by
   dsimp only [w]
   rw [runList_length01F,(source_word_counts28 rest).2]
   obtain ⟨ha,hab,_⟩ := frame_reduced rest
   omega
 obtain ⟨m,ms,hw⟩ := List.exists_cons_of_length_pos (by omega : 0<w.length)
 have hlen : 0 < ms.length := by rw [hw] at hl; simp only [List.length_cons] at hl; omega
 obtain ⟨k,ks,hms⟩ := List.exists_cons_of_length_pos hlen
 have hh := product_trace_four01F m k ks (by simpa only [hw,hms] using hs)
 dsimp only at hh
 rw [←hms,←hw] at hh
 change logFour01F (tr16 (projProduct6905 w))=_ at hh
 simp only [w,source_runList_det_coeff01F] at hh
 rw [runBoolean_source_traceADB2] at hh
 exact hh

theorem source_fourth_trace_long01F (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 sourceFourthTrace01F n rest=cyclicFour01F (runBooleanListADB2 n true (sourceWord28 rest)) := by
 simp [sourceFourthTrace01F,show (frame rest).mid.b≠2 by omega,
   show (frame rest).mid.b≠3 by omega,show (frame rest).mid.b≠4 by omega,determinantFour01F]

theorem logFour_source_cut01F (path : List Bool) :
 logFour01F (tr16 (ambientWord5c U V (sourceWord28 path)))=
 let f1 := cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 1
 let f2 := cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 2
 let f3 := cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 3
 let f4 := cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 4
 24*f4-24*f1*f3-12*f2^2+24*f1^2*f2-6*f1^4-6*(1+X)^4 := by
 dsimp only
 unfold logFour01F
 rw [source_first_cut_trace487,source_cut_trace75 path 1,
   source_cut_trace75 path 2,source_cut_trace75 path 3]
 ring

def fourthRunPoly01F (n : ℕ) (rest : List Bool) : ℤ[X] :=
 let c := (frame rest).mid.b
 let r := (frame rest).mid.a
 let F := firstRunPolyADB2 n c r
 let S := secondCompressed446 n c r
 let T := correctedThirdRun8BBB n c r
 sourceFourthTrace01F n rest+6*(1+X)^4+4*F*T+3*S^2-12*F^2*S+6*F^4

theorem source_fourth_run_poly01F (n : ℕ) (rest : List Bool) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=fourthRunPoly01F n rest := by
 let path := List.replicate n true++false::rest
 have ht := logFour_source_cut01F path
 have h4 := source_fourth_trace01F n rest
 change logFour01F (tr16 (ambientWord5c U V (sourceWord28 path)))=_ at h4
 rw [h4] at ht
 dsimp only at ht
 have h1 := source_first_run_polyADB2 n rest
 have h2 := source_second_compressed446 n rest
 have hs := source_second_sliceBF path (sourceRunsBF n rest)
   (source_runs_exactBF n rest) (source_runs_lengthBF n rest)
 rw [←hs] at h2
 have h3 := source_third_all_cycles8BBB n rest
 unfold fourthRunPoly01F
 dsimp only
 rw [←h1,←h2,←h3]
 linear_combination -ht

theorem source_fourth_run_raw01F (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 (fourthRunPoly01F n rest).coeff j := by
 rw [source_cut_coeffA27 _ i j 4 hij]
 have h := congrArg (fun p : ℤ[X] => p.coeff j) (source_fourth_run_poly01F n rest)
 simpa only [Polynomial.coeff_ofNat_mul] using h

theorem source_fourth_of_lc01F (n : ℕ) (rest : List Bool)
 (hlc : ∀ j, (fourthRunPoly01F n rest).coeff j*(fourthRunPoly01F n rest).coeff (j+2)≤
   ((fourthRunPoly01F n rest).coeff (j+1))^2)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := hlc j
 rw [←source_fourth_run_raw01F n rest i (j+2) (by omega),
   ←source_fourth_run_raw01F n rest (i+2) j (by omega),
   ←source_fourth_run_raw01F n rest (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

end
end MathGKM.Markov
