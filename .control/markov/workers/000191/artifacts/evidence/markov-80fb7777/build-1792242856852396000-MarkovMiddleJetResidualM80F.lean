import MarkovMiddleThreeGapsM80F
import MarkovMiddleLocalColumnsM80F
import MarkovMiddleRegionM99A
/-! Machine-authored 80fb7777. Exact residual of the unchanged full root. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

def MiddleJetClosedM80F (q : ℕ) (r : Bool) (c j : ℕ) : Prop :=
 ∃ k, k ≤ q ∧ 2*(q+3+k) ≤ sourceNME9C q r ∧
 j=sourceNME9C q r+2-(q+3+k) ∧ (c ≤ 4 ∨ (5 ≤ c ∧ c ≤ 8 ∧ k+1<c))

theorem source_middle_jet_closedM80F (q c j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : MiddleJetClosedM80F q r c j) :
 threeRawM9E2 q r c j*threeRawM9E2 q r (c+2) j ≤ threeRawM9E2 q r (c+1) j^2 := by
 obtain ⟨k,hk,hn,rfl,hc⟩ := h
 rcases hc with hc|⟨hc,hc8,hl⟩
 · by_cases h2 : 2 ≤ c
   · exact (source_middle_jets_strictM80F q k c r hq hk hn h2 hc).le
   · exact source_middle_lowM80F q k c r hq hk hn (by omega)
 · exact source_middle_local_smallM80F q k c r hq hk hn (by omega) hc8 hl

theorem source_middle_jet_pathM80F (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ c j, MiddleJetClosedM80F q r c j →
 coeff (frame path).mid.p c j*coeff (frame path).mid.p (c+2) j ≤
 coeff (frame path).mid.p (c+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro c j h
 simp only [hp]
 exact source_middle_jet_closedM80F q c j r hq h

theorem source_middle_jet_polygonM80F (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : 2 ≤ c) (hc4 : c ≤ 4) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-(q+3+k)) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k))<
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 have hq4 : 4 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 have hp : InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+3+k)) := by
   by_cases h2 : c=2
   · subst c; exact (source_middle_second_polygonM80F q k r hq hk hn).1
   · exact middle_polygonM99A q k c r hq hk (by omega) (by omega)
 exact ⟨hp,middle_polygonM99A q k (c+1) r hq hk (by omega) (by omega),
   middle_polygonM99A q k (c+2) r hq hk (by omega) (by omega),
   source_middle_jets_strictM80F q k c r hq hk hn hc hc4⟩

def ThreeAfterJetsM80F : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3 < j → sourceNME9C q r < 2*j+1 → j≠5 →
   ¬UpperClosedRegionM97B q r i j → ¬MiddleClosedM99A q r i j →
   ¬MiddleJetClosedM80F q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_after_jetsM80F : Conjecture63 ↔ ThreeAfterJetsM80F ∧ OtherFourM9E2 := by
 rw [root_iff_after_middleM99A]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 he hm _ => (h q hq r).1 i j h0 h1 h2 he hm,
     (h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he hm
   by_cases hj : MiddleJetClosedM80F q r i j
   · exact source_middle_jet_closedM80F q i j r hq hj
   · exact (h q hq r).1 i j h0 h1 h2 he hm hj

end
end MathGKM.Markov
