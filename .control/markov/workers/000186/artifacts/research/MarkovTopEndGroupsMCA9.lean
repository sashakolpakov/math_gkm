import MarkovTopBetaGroupingMCA9
/-! Machine-authored ca9709f2. The last two antidiagonals are strictly
positive directly, independently of the linear parameter cutoff. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 7000000

theorem beta_scalar_equal_positiveMCA9 (a H k : ℤ)
 (ha : 1 ≤ a) (hH : 1 ≤ H) (hk : 1 ≤ k) :
 0 < betaScalarMCA9 a H k k := by
 have he : betaScalarMCA9 a H k k=
   2*(2*a+4)*k^2*(H+k)^2+2*a*(a+3)*(H+1)*k*(H+k) := by
   unfold betaScalarMCA9; ring
 rw [he]
 positivity

theorem beta_scalar_adjacent_positiveMCA9 (a H k : ℤ)
 (ha : 1 ≤ a) (hH : 1 ≤ H) (hk : 1 ≤ k) :
 0 < betaScalarMCA9 a H k (k+1) := by
 have he : betaScalarMCA9 a H k (k+1)=
   2*(2*a+4)*k*(H+k)*(k+1)*(H+k+1)+
   2*a*(a+3)*k*(H-1)*(H+k+1) := by
   unfold betaScalarMCA9; ring
 rw [he]
 have h0 : 0 ≤ H-1 := by omega
 positivity

theorem beta_likelihood_zeroMCA9 (d i r k : ℕ) (hk : r < k) :
 betaLikelihoodMDCB d i r k=0 := by
 simp [betaLikelihoodMDCB,betaWeightMDCB,show k≠r by omega,show ¬k<r by omega]

theorem beta_group_positive_of_scalarMCA9 (d i r m : ℕ) (hm : m ≤ 2*r)
 (hF : ∀ k, k ≤ r → m-k ≤ r → k ≤ m → 0 < betaGroupScalarMCA9 d i m k) :
 0 < betaGroupMCA9 d i r m := by
 unfold betaGroupMCA9
 apply sum_pos'
 · intro k hk
   by_cases hk0 : k ≤ r
   · by_cases hk1 : m-k ≤ r
     · have hP : 0 < betaPairLikelihoodMCA9 d i r m k := by
         unfold betaPairLikelihoodMCA9 betaLikelihoodMDCB
         exact mul_pos (mul_pos (beta_q_positiveMDCB d i k) (beta_weight_positiveMCA9 r k hk0))
           (mul_pos (beta_q_positiveMDCB d i (m-k)) (beta_weight_positiveMCA9 r (m-k) hk1))
       exact (mul_pos (mul_pos (beta_base_weight_positiveMCA9 i m k) hP)
         (hF k hk0 hk1 (by have := mem_range.mp hk; omega))).le
     · simp [betaPairLikelihoodMCA9,beta_likelihood_zeroMCA9 d i r (m-k) (by omega)]
   · simp [betaPairLikelihoodMCA9,beta_likelihood_zeroMCA9 d i r k (by omega)]
 · let k := min m r
   have hk0 : k ≤ r := by dsimp [k]; omega
   have hk1 : m-k ≤ r := by dsimp [k]; omega
   have hkm : k ≤ m := by dsimp [k]; omega
   refine ⟨k,mem_range.mpr (by omega),?_⟩
   have hP : 0 < betaPairLikelihoodMCA9 d i r m k := by
     unfold betaPairLikelihoodMCA9 betaLikelihoodMDCB
     exact mul_pos (mul_pos (beta_q_positiveMDCB d i k) (beta_weight_positiveMCA9 r k hk0))
       (mul_pos (beta_q_positiveMDCB d i (m-k)) (beta_weight_positiveMCA9 r (m-k) hk1))
   exact mul_pos (mul_pos (beta_base_weight_positiveMCA9 i m k) hP) (hF k hk0 hk1 hkm)

theorem beta_group_last_positiveMCA9 (d i r : ℕ) (hr : 1 ≤ r) :
 0 < betaGroupMCA9 d i r (2*r) := by
 apply beta_group_positive_of_scalarMCA9 d i r (2*r) le_rfl
 intro k hk hl hkm
 have he : k=r := by omega
 subst k
 unfold betaGroupScalarMCA9
 rw [show 2*r-r=r by omega]
 exact_mod_cast beta_scalar_equal_positiveMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) r
   (by omega) (by omega) (by exact_mod_cast hr)

theorem beta_group_penultimate_positiveMCA9 (d i r : ℕ) (hr : 2 ≤ r) :
 0 < betaGroupMCA9 d i r (2*r-1) := by
 apply beta_group_positive_of_scalarMCA9 d i r (2*r-1) (by omega)
 intro k hk hl hkm
 have hc : k=r-1 ∨ k=r := by omega
 rcases hc with he|he
 · subst k
   unfold betaGroupScalarMCA9
   rw [show 2*r-1-(r-1)=r by omega]
   have h := beta_scalar_adjacent_positiveMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) ((r:ℤ)-1)
     (by omega) (by omega) (by omega)
   have he : ((r:ℤ)-1)+1=r := by ring
   rw [he] at h
   rw [Nat.cast_sub (by omega : 1 ≤ r),Nat.cast_one]
   exact_mod_cast h
 · subst k
   unfold betaGroupScalarMCA9
   rw [show 2*r-1-r=r-1 by omega,beta_scalar_symmetricMCA9]
   have h := beta_scalar_adjacent_positiveMCA9 ((i:ℤ)+1) ((d:ℤ)+2*i+9) ((r:ℤ)-1)
     (by omega) (by omega) (by omega)
   have he : ((r:ℤ)-1)+1=r := by ring
   rw [he] at h
   rw [Nat.cast_sub (by omega : 1 ≤ r),Nat.cast_one]
   exact_mod_cast h

end
end MathGKM.Markov
