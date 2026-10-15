import MarkovSecondOnsetSourceM5DC
/-! Machine-authored request 8b851864. Explicit validity window for onset values. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleRawValueM722
theorem source_fourth_onset_window_valueM8B8 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i k : ℕ) (hk : 1≤k) (hku : k≤7)
 (hlo : n+5≤2*n+k) (hhi : 2*n+k≤3*n+3)
 (hs : i+(2*n+k)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i (2*n+k)=
 secondOnsetValueM5DC n (frame rest).mid.b (frame rest).mid.a k := by
 have h := source_fourth_middle_correctedM5DC n rest hc i (2*n+k) hlo hhi hs
 interval_cases k
 · rw [middleCorrection_onset1M5DC] at h
   exact h
 · rw [middleCorrection_onset2M5DC] at h
   exact h
 · rw [middleCorrection_onset3M5DC] at h
   exact h
 · rw [middleCorrection_onset4M5DC] at h
   exact h
 · rw [middleCorrection_onset5M5DC] at h
   exact h
 · rw [middleCorrection_zeroM5DC n _ _ _ (by omega)] at h
   exact h
 · rw [middleCorrection_zeroM5DC n _ _ _ (by omega)] at h
   exact h
end
end MathGKM.Markov
