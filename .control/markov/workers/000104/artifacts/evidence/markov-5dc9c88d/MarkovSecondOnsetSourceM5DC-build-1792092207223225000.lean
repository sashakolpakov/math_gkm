import MarkovH2CorrectionM5DC
/-! Machine-authored request 5dc9c88d. Actual raw source values at all five starts and their neighbors. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleRawValueM722

def secondOnsetValueM5DC (n c r k : ℕ) : ℤ :=
 middleRawValueM722 n c r (2*n+k)+
 match k with
 | 1 => h2Corr1M5DC n c r ((2*r-c:ℕ):ℤ)
 | 2 => h2Corr2M5DC n c r ((2*r-c:ℕ):ℤ)
 | 3 => h2Corr3M5DC n c r ((2*r-c:ℕ):ℤ)
 | 4 => h2Corr4M5DC n c r ((2*r-c:ℕ):ℤ)
 | 5 => h2Corr5M5DC n c r ((2*r-c:ℕ):ℤ)
 | _ => 0

theorem source_fourth_second_onset_valueM5DC (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (i k : ℕ) (hk : 1≤k) (hku : k≤7)
 (hs : i+(2*n+k)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i (2*n+k)=
 secondOnsetValueM5DC n (frame rest).mid.b (frame rest).mid.a k := by
 have h := source_fourth_middle_correctedM5DC n rest hc i (2*n+k) (by omega) (by omega) hs
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
