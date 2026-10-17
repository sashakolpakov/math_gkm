import MarkovDriftClosedM5BF
/-! Machine-authored 5bf6837d. Entire numerator-three horizontal correction
band, with exact root equivalence retaining every other direction and family. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2

def FullBandRegionM5BF (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 2 ≤ q ∧ q<j ∧ 2*j+1 ≤ sourceNME9C q r

theorem source_full_band_regionM5BF (q i j : ℕ) (r : Bool)
 (h : FullBandRegionM5BF q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with ⟨hq,hj,hn⟩
 let k := j-q-1
 have he : q+k+1=j := by dsimp [k]; omega
 rw [←he] at hn ⊢
 exact source_band_allM5BF q k i r hq hn

def ThreeBeyondFullBandM5BF : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q<j → j≠5 → j≠q+1 → j≠q+2 → j≠q+3 →
   ¬FullBandRegionM5BF q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤ 
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_beyond_full_bandM5BF :
 Conjecture63 ↔ ThreeBeyondFullBandM5BF ∧ OtherFourM9E2 := by
 rw [root_iff_beyond_thirdM964]
 constructor
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   exact ⟨fun i j h0 h1 h2 h3 h4 _ => (h q hq r).1 i j h0 h1 h2 h3 h4,(h q hq r).2⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 h3 h4
   by_cases he : FullBandRegionM5BF q r i j
   · exact source_full_band_regionM5BF q i j r he
   · exact (h q hq r).1 i j h0 h1 h2 h3 h4 he

theorem source_full_band_pathM5BF (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ i j, FullBandRegionM5BF q r i j →
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤ 
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j hij
 simp only [hp]
 exact source_full_band_regionM5BF q i j r hij

end
end MathGKM.Markov
