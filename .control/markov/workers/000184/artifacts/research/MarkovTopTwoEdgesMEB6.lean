import MarkovTopThirdGapMEB6
import MarkovTopTailClosedMEB6
import MarkovTopSourceRegionMEB6
/-! Machine-authored eb6a9001. First remaining and last nonzero upper
triples attached to the exact source, with no coefficient normalization. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem top_template_third_strictMEB6 (n t : ℕ) (ht : 5 ≤ t) (hn : 2*t ≤ n) :
 (topTemplateMB3E n t).coeff 3*(topTemplateMB3E n t).coeff 5 <
 (topTemplateMB3E n t).coeff 4^2 := by
 have h := top_mass_first_strictMEB6 (n-2*t) (t-3) (by omega)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-3+3)+(n-2*t)=n by omega,show t-3+3=t by omega] at h
 exact h

theorem top_template_last_strictMEB6 (n t : ℕ) (ht : 5 ≤ t) (hn : 2*t ≤ n) :
 (topTemplateMB3E n t).coeff (t-2)*(topTemplateMB3E n t).coeff t <
 (topTemplateMB3E n t).coeff (t-1)^2 := by
 have h := top_mass_last_strictMEB6 (n-2*t) (t-5)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-5+2+3)+(n-2*t)=n by omega,show t-5+2+3=t by omega,
   show t-5+3=t-2 by omega,show t-5+1+3=t-1 by omega] at h
 exact h

theorem source_top_third_strictMEB6 (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r 3 (sourceNME9C q r+2-t)*threeRawM9E2 q r 5 (sourceNME9C q r+2-t) <
 threeRawM9E2 q r 4 (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t 3 r hq htq,source_top_coeffMB3E q t 5 r hq htq,
   source_top_coeffMB3E q t 4 r hq htq]
 apply top_template_third_strictMEB6 _ t ht
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_last_strictMEB6 (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r (t-2) (sourceNME9C q r+2-t)*threeRawM9E2 q r t (sourceNME9C q r+2-t) <
 threeRawM9E2 q r (t-1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t (t-2) r hq htq,source_top_coeffMB3E q t t r hq htq,
   source_top_coeffMB3E q t (t-1) r hq htq]
 apply top_template_last_strictMEB6 _ t ht
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_two_edges_polygonMEB6 (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) :
 (∀ i, 3 ≤ i → i ≤ 5 → InPolygon 3 (sourceNME9C q r) i (sourceNME9C q r+2-t)) ∧
 (∀ i, t-2 ≤ i → i ≤ t → InPolygon 3 (sourceNME9C q r) i (sourceNME9C q r+2-t)) := by
 constructor <;> intro i h0 h1 <;> rw [source_top_polygon_iffMEB6 q t i r hq ht htq] <;> omega

def TopInnerFiniteStripMEB6 : Prop := ∀ T i d : ℕ,
 1 ≤ i → i+3 ≤ T → T ≤ d+2 → d < topGapThresholdMEB6 T i →
 0 ≤ (topGapPolyMEB6 T i).eval (d:ℚ)

theorem top_moment_iff_inner_stripMEB6 : TopMomentBoundM55C ↔ TopInnerFiniteStripMEB6 := by
 rw [top_moment_iff_finite_stripMEB6]
 constructor
 · intro H T i d hi hiT hd hb
   exact H T i d (by omega) (by omega) hd hb
 · intro H T i d hT hiT hd hb
   by_cases hi : i=0
   · subst i
     rw [top_gap_poly_evalMEB6]
     exact_mod_cast (sub_pos.mpr (top_mass_first_strictMEB6 d T hT)).le
   · by_cases he : T=i+2
     · subst T
       rw [top_gap_poly_evalMEB6]
       exact_mod_cast (sub_pos.mpr (top_mass_last_strictMEB6 d i)).le
     · exact H T i d (by omega) (by omega) hd hb

end
end MathGKM.Markov
