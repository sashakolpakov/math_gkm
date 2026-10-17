import MarkovTopFourthGapM731
import MarkovTopSteinResidualM208
/-! Machine-authored 73199834. Raw source and polygon transport for the
unbounded fourth-column inequality. Other directions are unchanged. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem top_template_fourth_strictM731 (n t : ℕ) (ht : 6 ≤ t) (hn : 2*t ≤ n) :
 (topTemplateMB3E n t).coeff 4*(topTemplateMB3E n t).coeff 6 <
 (topTemplateMB3E n t).coeff 5^2 := by
 have h := top_mass_fourth_strictM731 (n-2*t) (t-3) (by omega)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-3+3)+(n-2*t)=n by omega,show t-3+3=t by omega] at h
 exact h

theorem source_top_fourth_strictM731 (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 6 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r 4 (sourceNME9C q r+2-t)*threeRawM9E2 q r 6 (sourceNME9C q r+2-t) <
 threeRawM9E2 q r 5 (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t 4 r hq htq,source_top_coeffMB3E q t 6 r hq htq,
   source_top_coeffMB3E q t 5 r hq htq]
 apply top_template_fourth_strictM731 _ t ht
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_fourth_polygonM731 (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 6 ≤ t) (htq : t ≤ q+2) :
 (∀ i, 4 ≤ i → i ≤ 6 → InPolygon 3 (sourceNME9C q r) i (sourceNME9C q r+2-t)) ∧
 threeRawM9E2 q r 4 (sourceNME9C q r+2-t)*threeRawM9E2 q r 6 (sourceNME9C q r+2-t) <
 threeRawM9E2 q r 5 (sourceNME9C q r+2-t)^2 := by
 refine ⟨?_,source_top_fourth_strictM731 q t r hq ht htq⟩
 intro i h0 h1
 rw [source_top_polygon_iffMEB6 q t i r hq (by omega) htq]
 omega

theorem source_top_fourth_pathM731 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ t, 6 ≤ t → t ≤ q+2 →
 (∀ i, 4 ≤ i → i ≤ 6 → InPolygon (frame path).mid.a (frame path).mid.b i
   ((frame path).mid.b+2-t)) ∧
 coeff (frame path).mid.p 4 ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p 6 ((frame path).mid.b+2-t) <
 coeff (frame path).mid.p 5 ((frame path).mid.b+2-t)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro t ht htq
 rw [ha,hb,hp]
 exact source_top_fourth_polygonM731 q t r hq ht htq

theorem tail_gap_column_one_positiveM731 (d r : ℕ) (hr : 2 ≤ r) :
 0 < tailGapMDCB 1 d r := by
 exact (tail_strict_iffMDCB d 1 r).mp (top_mass_fourth_strictM731 d (1+r) (by omega))

end
end MathGKM.Markov
