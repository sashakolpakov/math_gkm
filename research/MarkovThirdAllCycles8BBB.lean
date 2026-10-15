import MarkovTwoRunCorrection8BBB
/-! Machine-authored request 8bbb934e. All cycle lengths and all run lengths.
Parameter-only source identity; universal coefficient LC remains unproved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def correctedThirdRun8BBB (n c r : ℕ) : ℤ[X] :=
 thirdRunPolyADB2 n c r+
 if c=2 then -12*X^(c*(n+1)+r)*(firstRunPolyADB2 n c r+1+X)
 else if c=3 then 6*X^(c*(n+1)+r) else 0

theorem source_third_all_cycles8BBB (n : ℕ) (rest : List Bool) :
 6*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 3=
 correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a := by
 unfold correctedThirdRun8BBB
 have hb := (source_run_indicesBF n rest).2
 split_ifs with h2 h3
 · have h := source_third_run_poly_two8BBB n rest h2
   dsimp only at h
   rw [hb] at h
   linear_combination h
 · have h := source_third_run_poly_threeADB2 n rest h3
   dsimp only at h
   rw [hb] at h
   exact h
 · obtain ⟨hr,hrc,_⟩ := frame_reduced rest
   simpa using source_third_run_polyADB2 n rest (by omega)

theorem source_third_all_cycles_raw8BBB (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+3) :
 6*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 (correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a).coeff j := by
 rw [source_cut_coeffA27 _ i j 3 hij]
 have h := congrArg (fun P : ℤ[X] => P.coeff j) (source_third_all_cycles8BBB n rest)
 simpa only [Polynomial.coeff_ofNat_mul] using h

theorem source_third_all_cycles_of_lc8BBB (n : ℕ) (rest : List Bool)
 (hlc : ∀ j, (correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a).coeff j*
   (correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a).coeff (j+2)≤
   ((correctedThirdRun8BBB n (frame rest).mid.b (frame rest).mid.a).coeff (j+1))^2)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := hlc j
 rw [←source_third_all_cycles_raw8BBB n rest i (j+2) (by omega),
   ←source_third_all_cycles_raw8BBB n rest (i+2) j (by omega),
   ←source_third_all_cycles_raw8BBB n rest (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms source_third_all_cycles8BBB
#print axioms source_third_all_cycles_raw8BBB
end
end MathGKM.Markov
