import MarkovOnsetAllSmallM8B8
import MarkovOnsetWindowSourceM8B8
/-! Machine-authored request 8b851864. Raw onset inequalities within the exact window. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_onset_windowM8B8 (n : ℕ) (rest : List Bool)
 (hn : 3≤n) (hc : 5≤(frame rest).mid.b)
 (i j : ℕ) (hj : 2*n<j) (hju : j≤2*n+5)
 (hlo : n+5≤j) (hhi : j≤3*n+1)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have hne := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 let k := j-2*n
 have hk : 1≤k := by dsimp [k]; omega
 have hku : k≤5 := by dsimp [k]; omega
 have ej : 2*n+k=j := by dsimp [k]; omega
 have ej1 : 2*n+(k+1)=j+1 := by omega
 have ej2 : 2*n+(k+2)=j+2 := by omega
 have h0 := source_fourth_onset_window_valueM8B8 n rest hc (i+2) k hk
   (by omega) (by omega) (by omega) (by omega)
 have h1 := source_fourth_onset_window_valueM8B8 n rest hc (i+1) (k+1)
   (by omega) (by omega) (by omega) (by omega) (by omega)
 have h2 := source_fourth_onset_window_valueM8B8 n rest hc i (k+2)
   (by omega) (by omega) (by omega) (by omega) (by omega)
 rw [ej] at h0
 rw [ej1] at h1
 rw [ej2] at h2
 have h := secondOnset_lcM8B8 n (frame rest).mid.b (frame rest).mid.a k hn hc
   (by omega) hrc (by omega) hk hku
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
