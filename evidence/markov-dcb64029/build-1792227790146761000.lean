import MarkovTopTail3MDCB
import MarkovTopTail4MDCB
import MarkovTopFrontierMEB6
/-! Machine-authored dcb64029. Exact remaining scalar tail condition and
new source horizontal strips. Vertical/diagonal and other families unchanged. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

def TopTailResidualMDCB : Prop := ∀ d i r : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → 0 ≤ tailGapMDCB i d r

theorem top_moment_iff_tail_residualMDCB : TopMomentBoundM55C ↔ TopTailResidualMDCB := by
 rw [top_moment_iff_interiorM55C]
 constructor
 · intro H d i r hi hr hd
   exact (tail_lc_iffMDCB d i r).mp
     ((top_lc_iff_driftM55C d (i+r) i).mpr (H d (i+r) i (by omega) hd (by omega)))
 · intro H d T i hT hd hi
   apply (top_lc_iff_driftM55C d T i).mp
   obtain ⟨r,hr⟩ := Nat.exists_eq_add_of_le (show i ≤ T by omega)
   subst T
   by_cases hz : i=0
   · subst i
     exact (top_mass_first_strictMEB6 d (0+r) hT).le
   · by_cases h2 : r=2
     · subst r
       exact (top_mass_last_strictMEB6 d i).le
     · by_cases h3 : r=3
       · subst r
         exact (top_mass_tail_3_strictMDCB d i).le
       · by_cases h4 : r=4
         · subst r
           exact (top_mass_tail_4_strictMDCB d i).le
         · exact (tail_lc_iffMDCB d i r).mpr (H d i r (by omega) (by omega) hd)

theorem top_template_tail_3_strictMDCB (n t : ℕ) (ht : 6 ≤ t) (hn : 2*t ≤ n) :
 (topTemplateMB3E n t).coeff (t-3)*(topTemplateMB3E n t).coeff (t-1) <
 (topTemplateMB3E n t).coeff (t-2)^2 := by
 have h := top_mass_tail_3_strictMDCB (n-2*t) (t-6)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-6+3+3)+(n-2*t)=n by omega,show t-6+3+3=t by omega,
   show t-6+3=t-3 by omega,show t-6+1+3=t-2 by omega,
   show t-6+2+3=t-1 by omega] at h
 exact h

theorem top_template_tail_4_strictMDCB (n t : ℕ) (ht : 7 ≤ t) (hn : 2*t ≤ n) :
 (topTemplateMB3E n t).coeff (t-4)*(topTemplateMB3E n t).coeff (t-2) <
 (topTemplateMB3E n t).coeff (t-3)^2 := by
 have h := top_mass_tail_4_strictMDCB (n-2*t) (t-7)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(t-7+4+3)+(n-2*t)=n by omega,show t-7+4+3=t by omega,
   show t-7+3=t-4 by omega,show t-7+1+3=t-3 by omega,
   show t-7+2+3=t-2 by omega] at h
 exact h

theorem source_top_tail_3_strictMDCB (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 6 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r (t-3) (sourceNME9C q r+2-t)*threeRawM9E2 q r (t-1) (sourceNME9C q r+2-t) <
 threeRawM9E2 q r (t-2) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t (t-3) r hq htq,source_top_coeffMB3E q t (t-1) r hq htq,
   source_top_coeffMB3E q t (t-2) r hq htq]
 apply top_template_tail_3_strictMDCB _ t ht
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_tail_4_strictMDCB (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 7 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r (t-4) (sourceNME9C q r+2-t)*threeRawM9E2 q r (t-2) (sourceNME9C q r+2-t) <
 threeRawM9E2 q r (t-3) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t (t-4) r hq htq,source_top_coeffMB3E q t (t-2) r hq htq,
   source_top_coeffMB3E q t (t-3) r hq htq]
 apply top_template_tail_4_strictMDCB _ t ht
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_new_tail_polygonMDCB (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 7 ≤ t) (htq : t ≤ q+2) :
 ∀ i, t-4 ≤ i → i ≤ t-1 → InPolygon 3 (sourceNME9C q r) i (sourceNME9C q r+2-t) := by
 intro i hi hj
 rw [source_top_polygon_iffMEB6 q t i r hq (by omega) htq]
 omega

def TopClosedRegionMDCB (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopClosedRegionMEB6 q r i j ∨ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧
 j=sourceNME9C q r+2-t ∧ ((6 ≤ t ∧ i+3=t) ∨ (7 ≤ t ∧ i+4=t))

theorem source_top_closedMDCB (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopClosedRegionMDCB q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl,hi⟩
 · exact source_top_closedMEB6 q i j r hq h
 · rcases hi with ⟨h6,h3⟩|⟨h7,h4⟩
   · have h := (source_top_tail_3_strictMDCB q t r hq h6 htq).le
     rw [show t-3=i by omega,show t-2=i+1 by omega,show t-1=i+2 by omega] at h
     exact h
   · have h := (source_top_tail_4_strictMDCB q t r hq h7 htq).le
     rw [show t-4=i by omega,show t-3=i+1 by omega,show t-2=i+2 by omega] at h
     exact h

theorem source_top_depths_through_eightMDCB (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht1 : t ≤ 8) (htq : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 apply source_top_closedMDCB q i _ r hq
 by_cases hi : i ≤ 2 ∨ t < i+2
 · exact Or.inl (Or.inl (Or.inl ⟨t,ht0,htq,rfl,hi⟩))
 · by_cases he : i=3 ∨ i+2=t
   · exact Or.inl (Or.inr ⟨t,ht0,htq,rfl,he⟩)
   · exact Or.inr ⟨t,ht0,htq,rfl,by omega⟩

def ThreeFrontierMDCB : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopClosedRegionMDCB q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_frontierMDCB : Conjecture63 ↔ ThreeFrontierMDCB ∧ OtherFourM9E2 := by
 rw [root_iff_frontierMEB6]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 he =>
     (h q hq r).1 i j h0 h1 h2 (fun hh => he (Or.inl hh)),(h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he
   by_cases hc : TopClosedRegionMDCB q r i j
   · exact source_top_closedMDCB q i j r hq hc
   · exact (h q hq r).1 i j h0 h1 h2 hc

end
end MathGKM.Markov
