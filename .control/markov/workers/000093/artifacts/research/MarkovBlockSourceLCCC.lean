import MarkovBlockSourceCC
import MarkovBlockLCCC
/-! Machine-authored cc599cf1. Whole first-shift block of actual raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
theorem source_fourth_block_lcCC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i k : ℕ) (hk : 5≤k) (hkn : k+2<n)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have h0 := source_fourth_block_shapeCC n rest hc (i+2) k (by omega) hk (by omega)
 have h1 := source_fourth_block_shapeCC n rest hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_block_shapeCC n rest hc i (k+2) (by omega) (by omega) hkn
 simp only [←Nat.add_assoc] at h1 h2
 push_cast at h0 h1 h2
 have hg := blockValue_logConcaveCC (n:ℤ) (frame rest).mid.b (frame rest).mid.a k
   (by exact_mod_cast hc) (by exact_mod_cast (frame_reduced rest).1)
   (by exact_mod_cast (frame_reduced rest).2.1) (by exact_mod_cast hk)
   (by exact_mod_cast (show k≤n by omega))
 unfold blockValueCC at hg
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]
end
end MathGKM.Markov
