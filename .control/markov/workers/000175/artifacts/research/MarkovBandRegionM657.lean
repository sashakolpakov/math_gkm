import MarkovBandColumn3M657
import MarkovBandColumn4M657
import MarkovBandColumn5M657
import MarkovThirdClosedM964
/-! Machine-authored 6576ccc5. Universal correction-band prefixes and tails,
and an exact root equivalence retaining all other rows and directions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2

theorem source_band_prefixM657 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hi : i ≤ 5) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 := by
 by_cases hlo : i ≤ 2
 · exact source_band_low_lcM657 q k i r hq hn hlo
 have he : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 have h3 := source_band_column3_parameterM657 (bandExponentM139 q k r) k r (by omega)
 have h4 := source_band_column4_parameterM657 (bandExponentM139 q k r) k r (by omega)
 have h5 := source_band_column5_parameterM657 (bandExponentM139 q k r) k r (by omega)
 rw [he] at h3 h4 h5
 interval_cases i <;> assumption

def BandClosedRegionM657 (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 2 ≤ q ∧ q<j ∧ 2*j+1 ≤ sourceNME9C q r ∧
 (i ≤ 5 ∨ sourceNME9C q r < i+j+q)

theorem source_band_regionM657 (q i j : ℕ) (r : Bool)
 (h : BandClosedRegionM657 q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with ⟨hq,hj,hn,hi⟩
 let k := j-q-1
 have he : q+k+1=j := by dsimp [k]; omega
 rw [←he] at hn ⊢
 rcases hi with hi|hi
 · exact source_band_prefixM657 q k i r hq hn hi
 · apply source_band_tail_lcM657 q k i r hq hn
   unfold bandExponentM139
   dsimp [k] at *
   omega

def ThreeBeyondBandM657 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q<j → j≠5 → j≠q+1 → j≠q+2 → j≠q+3 →
   ¬BandClosedRegionM657 q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_beyond_bandM657 : Conjecture63 ↔ ThreeBeyondBandM657 ∧ OtherFourM9E2 := by
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
   by_cases he : BandClosedRegionM657 q r i j
   · exact source_band_regionM657 q i j r he
   · exact (h q hq r).1 i j h0 h1 h2 h3 h4 he

theorem source_band_region_pathM657 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ i j, BandClosedRegionM657 q r i j →
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j hij
 simp only [hp]
 exact source_band_regionM657 q i j r hij

end
end MathGKM.Markov
