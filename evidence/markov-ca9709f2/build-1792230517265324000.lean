import MarkovTopLowerGroupsMCA9
import MarkovTopEndGroupsMCA9
/-! Machine-authored ca9709f2. A sufficient unresolved central-antidiagonal
condition; this is not asserted equivalent to the full root or scalar gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

def CentralBetaMCA9 : Prop := ∀ d i r m : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r →
 r ≤ m → m+2 ≤ 2*r → 0 ≤ betaGroupMCA9 d i r m

theorem upper_half_iff_centralMCA9 : UpperHalfBetaMCA9 ↔ CentralBetaMCA9 := by
 constructor
 · intro H d i r m hi hr hd _ hm hmr
   exact H d i r m hi hr hd hm (by omega)
 · intro H d i r m hi hr hd hm hmr
   by_cases hb : d+1 < i+4*r
   · by_cases hc : m+2 ≤ 2*r
     · exact H d i r m hi hr hd hb hm hc
     · have he : m=2*r ∨ m=2*r-1 := by omega
       rcases he with he|he
       · subst m
         exact (beta_group_last_positiveMCA9 d i r (by omega)).le
       · subst m
         exact (beta_group_penultimate_positiveMCA9 d i r (by omega)).le
   · exact (beta_group_positiveMCA9 d i r m (by omega) (by omega) hmr).le

theorem top_tail_of_centralMCA9 (H : CentralBetaMCA9) : TopTailResidualMDCB :=
 top_tail_of_upper_halfMCA9 (upper_half_iff_centralMCA9.mpr H)

theorem top_moment_of_centralMCA9 (H : CentralBetaMCA9) : TopMomentBoundM55C :=
 top_moment_of_upper_halfMCA9 (upper_half_iff_centralMCA9.mpr H)

theorem source_top_of_centralMCA9 (H : CentralBetaMCA9) (q t i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t i r hq htq,source_top_coeffMB3E q t (i+2) r hq htq,
   source_top_coeffMB3E q t (i+1) r hq htq]
 apply (top_sector_iff_momentM55C.mpr (top_moment_of_centralMCA9 H)) _ t _ ht _ i
 all_goals cases r <;> simp [sourceNME9C] <;> omega

end
end MathGKM.Markov
