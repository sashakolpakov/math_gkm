import MarkovTopInwardGeneratorM97B
import MarkovTopSixthCertificateM97B
/-! Machine-authored 97b019af. Actual cut-weighted second generator sign. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

theorem sixth_generator_nonposM97B (d i r m : ℕ) :
 (∑ k ∈ range (m+1), steinPairM208 d i m k*steinCutM208 r m k*
   sixthLM97B ((i:ℝ)+1) m ((d:ℝ)+2*i+9) k) ≤ 0 := by
 let g : ℕ → ℝ := fun k => -((k:ℝ)-(m:ℝ)/2)^4
 have hs (k : ℕ) (hk : k ≤ m) : g (m-k)=g k := by
   dsimp [g]; rw [Nat.cast_sub hk]; ring
 have hi (k : ℕ) (hk : 2*k+1 ≤ m) : g k ≤ g (k+1) := by
   have hkR : 2*(k:ℝ)+1 ≤ m := by exact_mod_cast hk
   have hsq : ((k:ℝ)+1-(m:ℝ)/2)^2 ≤ ((k:ℝ)-(m:ℝ)/2)^2 := by nlinarith
   have h4 := (sq_le_sq₀ (sq_nonneg ((k:ℝ)+1-(m:ℝ)/2))
     (sq_nonneg ((k:ℝ)-(m:ℝ)/2))).mpr hsq
   dsimp [g]; push_cast; nlinarith only [h4]
 have h := stein_generator_inward_nonposM97B d i r m g hs hi
 convert h using 1
 apply sum_congr rfl; intro k hk
 dsimp [sixthLM97B,g]
 by_cases hk0 : k=0
 · subst k; simp [steinDM208]; ring
 · rw [Nat.cast_sub (by omega : 1 ≤ k)]
   push_cast; ring

end
end MathGKM.Markov
