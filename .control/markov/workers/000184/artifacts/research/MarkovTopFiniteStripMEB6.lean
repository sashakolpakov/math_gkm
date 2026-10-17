import MarkovTopGapPolynomialMEB6
/-! Machine-authored eb6a9001. Exact locally finite residual for the open
upper-sector moment bound. The residual remains universally quantified in T. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 5000000

def TopFiniteStripMEB6 : Prop := ∀ T i d : ℕ,
 2 ≤ T → i+2 ≤ T → T ≤ d+2 → d < topGapThresholdMEB6 T i →
 0 ≤ (topGapPolyMEB6 T i).eval (d:ℚ)

theorem top_moment_iff_finite_stripMEB6 : TopMomentBoundM55C ↔ TopFiniteStripMEB6 := by
 rw [top_moment_iff_interiorM55C]
 constructor
 · intro H T i d hT hi hd _
   have h := (top_lc_iff_driftM55C d T i).mpr (H d T i hT hd hi)
   rw [top_gap_poly_evalMEB6]
   exact_mod_cast sub_nonneg.mpr h
 · intro H d T i hT hd hi
   apply (top_lc_iff_driftM55C d T i).mp
   by_cases hb : d < topGapThresholdMEB6 T i
   · have h := H T i d hT hi hd hb
     rw [top_gap_poly_evalMEB6] at h
     exact sub_nonneg.mp (by exact_mod_cast h)
   · exact (top_mass_strict_afterMEB6 d T i (by omega) (by omega)).le

theorem top_template_all_afterMEB6 (n t : ℕ) (ht : 5 ≤ t)
 (hn : 2*t ≤ n) (hnt : 3*t ≤ n+5)
 (hd : topRowThresholdMEB6 (t-3) ≤ n-2*t) (i : ℕ) :
 (topTemplateMB3E n t).coeff i*(topTemplateMB3E n t).coeff (i+2) ≤
 (topTemplateMB3E n t).coeff (i+1)^2 := by
 rcases i with _|_|_|i
 · rw [(top_edge_coeffsMB3E n t hn (by omega)).1,zero_mul]
   exact sq_nonneg _
 · exact (top_template_first_strictMB3E n t hn (by omega) hnt).le
 · exact (top_template_second_strictM55C n t hn ht hnt).le
 · have h := top_mass_all_afterMEB6 (n-2*t) (t-3) hd i
   have he : 2*((t-3)+3)+(n-2*t)=n := by omega
   rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,he,
     show t-3+3=t by omega] at h
   simpa only [Nat.add_assoc,Nat.reduceAdd] using h

def topSourceThresholdMEB6 (t : ℕ) : ℕ := 2*t+topRowThresholdMEB6 (t-3)+1

theorem source_top_all_afterMEB6 (q t : ℕ) (r : Bool) (ht : 5 ≤ t)
 (hq : topSourceThresholdMEB6 t ≤ q) (i : ℕ) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 have hq1 : 1 ≤ q := by unfold topSourceThresholdMEB6 at hq; omega
 have htq : t ≤ q+2 := by unfold topSourceThresholdMEB6 at hq; omega
 rw [source_top_coeffMB3E q t i r hq1 htq,
   source_top_coeffMB3E q t (i+2) r hq1 htq,
   source_top_coeffMB3E q t (i+1) r hq1 htq]
 apply top_template_all_afterMEB6 _ t ht
 all_goals unfold topSourceThresholdMEB6 at hq
 all_goals cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_eventualMEB6 (t : ℕ) (ht : 5 ≤ t) :
 ∃ Q : ℕ, ∀ q, Q ≤ q → ∀ r i,
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 :=
 ⟨topSourceThresholdMEB6 t,fun q hq r i => source_top_all_afterMEB6 q t r ht hq i⟩

end
end MathGKM.Markov
