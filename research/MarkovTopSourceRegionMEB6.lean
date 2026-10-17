import MarkovTopFiniteStripMEB6
import MarkovTopRegionM55C
/-! Machine-authored eb6a9001. Direct source/path attachment and exact root
residual. Universal depths, both other directions and OtherFour remain open. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

theorem source_top_parameter_afterMEB6 (q t i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2)
 (hd : topRowThresholdMEB6 (t-3) ≤ sourceNME9C q r-2*t) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t i r hq htq,
   source_top_coeffMB3E q t (i+2) r hq htq,
   source_top_coeffMB3E q t (i+1) r hq htq]
 apply top_template_all_afterMEB6 _ t ht _ _ hd
 all_goals cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_polygon_iffMEB6 (q t i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) :
 InPolygon 3 (sourceNME9C q r) i (sourceNME9C q r+2-t) ↔ 1 ≤ i ∧ i ≤ t := by
 have hn : 3*q+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
 have hsub : sourceNME9C q r+2-t+t=sourceNME9C q r+2 := by omega
 unfold InPolygon
 constructor
 · rintro ⟨h0,h1⟩
   constructor
   · by_contra hi
     have hi0 : i=0 := by omega
     simp only [hi0,mul_zero,zero_add] at h0
     omega
   · omega
 · rintro ⟨hi0,hi1⟩
   constructor
   · have hp : sourceNME9C q r ≤ sourceNME9C q r*i := by
       simpa using Nat.mul_le_mul_left (sourceNME9C q r) hi0
     omega
   · omega

theorem source_top_path_eventualMEB6 (t : ℕ) (ht : 5 ≤ t) :
 ∃ B : ℕ, ∀ path : List Bool, (frame path).mid.a=3 → B ≤ (frame path).mid.b →
 ∀ i, coeff (frame path).mid.p i ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p (i+2) ((frame path).mid.b+2-t) ≤
 coeff (frame path).mid.p (i+1) ((frame path).mid.b+2-t)^2 := by
 refine ⟨3*topSourceThresholdMEB6 t+2,?_⟩
 intro path ha hb i
 obtain ⟨q,r,hq,he,hp⟩ := source_three_rawM9E2 path ha
 have he' : (frame path).mid.b=sourceNME9C q r := he
 have hQ : topSourceThresholdMEB6 t ≤ q := by
   rw [he'] at hb
   cases r <;> simp [sourceNME9C] at hb <;> omega
 rw [he',hp,hp,hp]
 exact source_top_all_afterMEB6 q t r ht hQ i

def TopFinishedRegionMEB6 (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopFinishedRegionM55C q r i j ∨ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧
 j=sourceNME9C q r+2-t ∧ topRowThresholdMEB6 (t-3) ≤ sourceNME9C q r-2*t

theorem source_top_finishedMEB6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopFinishedRegionMEB6 q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl,hd⟩
 · exact source_top_finished_regionM55C q i j r hq h
 · exact source_top_parameter_afterMEB6 q t i r hq ht htq hd

def ThreeRemainingMEB6 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopFinishedRegionMEB6 q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_remainingMEB6 : Conjecture63 ↔ ThreeRemainingMEB6 ∧ OtherFourM9E2 := by
 rw [root_iff_upper_residualM5BF]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 _ => (h q hq r).1 i j h0 h1 h2,(h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2
   by_cases he : TopFinishedRegionMEB6 q r i j
   · exact source_top_finishedMEB6 q i j r hq he
   · exact (h q hq r).1 i j h0 h1 h2 he

end
end MathGKM.Markov
