import MarkovIncreasingOne320f
import MarkovWeightedSupport320f
/-! Machine-authored 320fe46f. All indices, exact mask weights and raw bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source_weighted_all_lc320 (w : ℕ → ℝ) (hw : ∀ k,0≤w k)
 (hm : Monotone w) (n : ℕ) (rest : List Bool) (j : ℕ) :
 let p := weightedOne320 (fun k => C (w k)) X X 1
   (central28 (List.replicate n true++false::rest)++[true])
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 by_cases hj : j<n
 · exact source_weighted_interior_lc320 w hw hm n rest j hj
 · dsimp only
   rw [source_weighted_zero320 w n rest (j+2) (by omega),mul_zero]
   exact sq_nonneg _

theorem source_mask_weighted_all_lc320 (w : ℕ → ℝ) (hw : ∀ k,0≤w k)
 (hm : Monotone w) (n : ℕ) (rest : List Bool) (j : ℕ) :
 let p := ((cutMasksFe01 (central28 (List.replicate n true++false::rest)++[true]) 1).map
   (fun m => C (w (maskDegree07a7 1 m))*maskWeight340 (X:ℝ[X]) X 1 m)).sum
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 simpa only [weightedOne_masks320] using source_weighted_all_lc320 w hw hm n rest j

theorem source_onecut_geometric_lc320 (z : ℝ) (hz : 1≤z)
 (n : ℕ) (rest : List Bool) (j : ℕ) :
 let p := degreeCoeff07a7 X (C z) X 1 1
   (central28 (List.replicate n true++false::rest)++[true]) 1
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 have hm : Monotone (fun d : ℕ => z^d) := by
   apply monotone_nat_of_le_succ
   intro d
   rw [pow_succ]
   nlinarith [pow_nonneg (show 0≤z by linarith) d]
 have h := source_weighted_all_lc320 (fun d => z^d)
   (fun d => pow_nonneg (by linarith) d) hm n rest j
 simpa only [map_pow,weightedOne_degree320] using h

theorem source_onecut_raw_lc320 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+1) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := source_onecut_geometric_lc320 1 le_rfl n rest j
 dsimp only at h
 simp only [map_one,degreeCoeff_forget07a7] at h
 have hc (u v : ℕ) (huv : u+v=(frame (List.replicate n true++false::rest)).mid.a+1) :
     (coeff (frame (List.replicate n true++false::rest)).mid.p u v:ℝ)=
     (cutCoeffA27 (X:ℝ[X]) X 1
       (central28 (List.replicate n true++false::rest)++[true]) 1).coeff v := by
   simpa [sourceTermsFe01,cutMasks_sumFe01] using sourceTerms_coeffFe01 _ u v 1 huv
 rw [←hc (i+2) j (by omega),←hc i (j+2) (by omega),
   ←hc (i+1) (j+1) (by omega)] at h
 exact_mod_cast (show (coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2):ℝ)*
   coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
   (coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1):ℝ)^2 by
     simpa [sourceTermsFe01,cutMasks_sumFe01,mul_comm] using h)

#print axioms source_mask_weighted_all_lc320
#print axioms source_onecut_geometric_lc320
#print axioms source_onecut_raw_lc320
end
end MathGKM.Markov
