import MarkovTopFirstCentralM731
import MarkovTopCentralGroupsMCA9
import MarkovTopIntegerResidualM731
/-! Machine-authored 73199834. The first central group is removed from
the stronger sufficient groupwise condition. This is not a root equivalence. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000

def CentralInteriorM731 : Prop := ∀ d i r m : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → i+1 < 4*r →
 r < m → m+2 ≤ 2*r → 0 ≤ betaGroupMCA9 d i r m

theorem central_iff_interiorM731 : CentralBetaMCA9 ↔ CentralInteriorM731 := by
 constructor
 · intro H d i r m hi hr hd hb _ hm hmr
   exact H d i r m hi hr hd hb (by omega) hmr
 · intro H d i r m hi hr hd hb hm hmr
   by_cases he : m=r
   · subst m
     exact (beta_first_central_positiveM731 d i r hi hr hd).le
   · by_cases hw : i+1 < 4*r
     · exact H d i r m hi hr hd hb hw (by omega) hmr
     · exact (stein_group_wedgeM208 d i r m hd (by omega) (by omega) (by omega)).le

def CentralIntegerInteriorM731 : Prop := ∀ d i r m : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → i+1 < 4*r →
 r < m → m+2 ≤ 2*r → 0 ≤ betaIntegerGroupM731 d i r m

theorem central_interior_iff_integerM731 : CentralInteriorM731 ↔ CentralIntegerInteriorM731 := by
 constructor
 · intro H d i r m hi hr hd hb hw hm hmr
   exact (beta_integer_group_nonneg_iffM731 d i r m).mpr (H d i r m hi hr hd hb hw hm hmr)
 · intro H d i r m hi hr hd hb hw hm hmr
   exact (beta_integer_group_nonneg_iffM731 d i r m).mp (H d i r m hi hr hd hb hw hm hmr)

theorem top_moment_of_central_integerM731 (H : CentralIntegerInteriorM731) : TopMomentBoundM55C :=
 top_moment_of_centralMCA9 (central_iff_interiorM731.mpr (central_interior_iff_integerM731.mpr H))

theorem source_top_of_central_integerM731 (H : CentralIntegerInteriorM731)
 (q t i : ℕ) (r : Bool) (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 :=
 source_top_of_centralMCA9 (central_iff_interiorM731.mpr (central_interior_iff_integerM731.mpr H))
 q t i r hq ht htq

end
end MathGKM.Markov
