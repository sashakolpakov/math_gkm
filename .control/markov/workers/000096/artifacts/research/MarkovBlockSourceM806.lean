import MarkovBlockLCM806
import MarkovBlockSourceExtendedCC
/-! Machine-authored 8067e0c5; adapted from 04290504. Raw coefficients, no discarded zeros. -/
namespace MathGKM.Markov
noncomputable section
theorem source_fourth_blockM806 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i k : ℕ) (hk : 5≤k) (hkn : k≤n)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have h0 := source_fourth_block_shape_extendedCC n rest hc (i+2) k
   (by omega) hk (by omega)
 have h1 := source_fourth_block_shape_extendedCC n rest hc (i+1) (k+1)
   (by omega) (by omega) (by omega)
 have h2 := source_fourth_block_shape_extendedCC n rest hc i (k+2)
   (by omega) (by omega) (by omega)
 simp only [←Nat.add_assoc] at h1 h2
 push_cast at h0 h1 h2
 have hg := blockValue_logConcaveM806 (n:ℤ) (frame rest).mid.b (frame rest).mid.a k
   (by exact_mod_cast hc) (by exact_mod_cast (frame_reduced rest).1)
   (by exact_mod_cast (frame_reduced rest).2.1)
   (by exact_mod_cast hk) (by exact_mod_cast hkn)
 unfold blockValueM806 at hg
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]
end
end MathGKM.Markov
