import MarkovMiddleFirstAllM99A
/-! Machine-authored 99a0f3b8. Path/polygon transport and exact full-root
residual. Remaining rows, directions and source families are not asserted. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
attribute [local irreducible] threeRawM9E2

def MiddleClosedM99A (q : ℕ) (r : Bool) (c j : ℕ) : Prop :=
 j=sourceNME9C q r+2-(q+3) ∨
 ∃ k, k ≤ q ∧ 2*(q+3+k) ≤ sourceNME9C q r ∧
 j=sourceNME9C q r+2-(q+3+k) ∧
 (9 ≤ c ∧ k+1 < c ∧ 12*(q+3+k)+2 ≤ 4*sourceNME9C q r+3*c)

theorem source_middle_closedM99A (q c j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : MiddleClosedM99A q r c j) :
 threeRawM9E2 q r c j*threeRawM9E2 q r (c+2) j ≤ threeRawM9E2 q r (c+1) j^2 := by
 rcases h with rfl|⟨k,hk,hn,rfl,hc,hl,hw⟩
 · exact source_middle_first_allM99A q c r hq
 · exact source_middle_wideM99A q k c r hq hk hn hc hl hw

theorem source_middle_pathM99A (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ c j, MiddleClosedM99A q r c j →
 coeff (frame path).mid.p c j*coeff (frame path).mid.p (c+2) j ≤
 coeff (frame path).mid.p (c+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro c j h
 simp only [hp]
 exact source_middle_closedM99A q c j r hq h

theorem source_middle_wide_polygonM99A (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : 9 ≤ c)
 (hl : k+1 < c) (hw : 12*(q+3+k)+2 ≤ 4*sourceNME9C q r+3*c)
 (hct : c+2 ≤ q+3+k) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-(q+3+k)) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) <
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 :=
 ⟨middle_polygonM99A q k c r hq hk (by omega) (by omega),
 middle_polygonM99A q k (c+1) r hq hk (by omega) (by omega),
 middle_polygonM99A q k (c+2) r hq hk (by omega) hct,
 source_middle_wide_strictM99A q k c r hq hk hn hc hl hw hct⟩

def ThreeAfterMiddleM99A : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3 < j → sourceNME9C q r < 2*j+1 → j≠5 →
   ¬UpperClosedRegionM97B q r i j → ¬MiddleClosedM99A q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_after_middleM99A : Conjecture63 ↔ ThreeAfterMiddleM99A ∧ OtherFourM9E2 := by
 rw [root_iff_after_upperM97B]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 he _ => (h q hq r).1 i j h0 h1 h2 he,
     (h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he
   by_cases hm : MiddleClosedM99A q r i j
   · exact source_middle_closedM99A q i j r hq hm
   · exact (h q hq r).1 i j h0 h1 h2 he hm

end
end MathGKM.Markov
