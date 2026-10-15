import MarkovRunCubicADB2
import MarkovSecondCompressed446
/-! Machine-authored request adb2c7b0. Explicit parameter-only third lower
slice polynomial for arbitrary run length n, with no trace/source-word input.
This is a coefficient identity, not a universal LC theorem. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def firstRunPolyADB2 (n c r : ℕ) : ℤ[X] :=
 (c:ℤ[X])*lowerH487 n+(r:ℤ[X])*(1+3*X+4*X*runSumA27 X n)-(1+X)
def thirdRunPolyADB2 (n c r : ℕ) : ℤ[X] :=
 let F := firstRunPolyADB2 n c r
 3*F*secondCompressed446 n c r-2*F^3-2*(1+X)^3+
 boolMomentADB2 (runLocalLADB2 n) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)

theorem source_first_run_polyADB2 (n : ℕ) (rest : List Bool) :
 cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 1=
 firstRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a := by
 have ht := source_first_cut_trace487 (List.replicate n true++false::rest)
 rw [source_run_substitutionBF] at ht
 have hl : 2≤(sourceWord28 rest).length := by
   rw [(source_word_counts28 rest).2]
   obtain ⟨ha,hab,_⟩ := frame_reduced rest
   omega
 rw [lower_trace_two_lengths487 n _ hl,(source_word_counts28 rest).1,
   (source_word_counts28 rest).2] at ht
 unfold firstRunPolyADB2
 linear_combination -ht

theorem source_third_run_polyADB2 (n : ℕ) (rest : List Bool) (hc : 4≤(frame rest).mid.b) :
 6*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 3=
 thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_run_cut3ADB2 n rest hc
 dsimp only at h
 have hs := source_second_sliceBF (List.replicate n true++false::rest)
   (sourceRunsBF n rest) (source_runs_exactBF n rest) (source_runs_lengthBF n rest)
 have h2 := source_second_compressed446 n rest
 rw [←hs] at h2
 rw [source_first_run_polyADB2] at h
 unfold thirdRunPolyADB2 sourceRunLADB2 at *
 linear_combination h+3*firstRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a*h2

/-- Literal unnormalized integer coefficients at every position on the slice;
the uniform factor six is independent of the coefficient index. -/
theorem source_third_run_rawADB2 (n : ℕ) (rest : List Bool) (hc : 4≤(frame rest).mid.b)
 (i j : ℕ) (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+3) :
 6*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff j := by
 rw [source_cut_coeffA27 _ i j 3 hij]
 have h := congrArg (fun P : ℤ[X] => P.coeff j) (source_third_run_polyADB2 n rest hc)
 simpa only [Polynomial.coeff_ofNat_mul] using h

theorem source_third_run_of_lcADB2 (n : ℕ) (rest : List Bool) (hc : 4≤(frame rest).mid.b)
 (hlc : ∀ j, (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff j*
   (thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+2)≤
   ((thirdRunPolyADB2 n (frame rest).mid.b (frame rest).mid.a).coeff (j+1))^2)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := hlc j
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms source_third_run_polyADB2
#print axioms source_third_run_rawADB2
#print axioms source_third_run_of_lcADB2
end
end MathGKM.Markov
