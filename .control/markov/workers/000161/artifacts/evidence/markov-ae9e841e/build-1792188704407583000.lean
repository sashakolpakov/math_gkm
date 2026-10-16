import MarkovSourceStrips1MAE9
import MarkovSourceStrips2MAE9
import MarkovSourceStrips3MAE9
import MarkovResidualM468
/-! Machine-authored ae9e841e. Exact residual after additional lower-region
strips. All correction bands, zeros, other directions and larger numerators
are retained. The two residual propositions remain unproved. -/
namespace MathGKM.Markov
noncomputable section

theorem source_horizontal_bandMAE9 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : 4 ≤ i ∧ i ≤ 6) (hj : j ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases hi with ⟨hi0,hi1⟩
 interval_cases i
 · exact source_horizontal1MAE9 q j r hq hj
 · exact source_horizontal2MAE9 q j r hq hj
 · exact source_horizontal3MAE9 q j r hq hj

theorem source_vertical_bandMAE9 (q i j : ℕ) (r : Bool)
 (hi : 6 ≤ i ∧ i ≤ 8) (hj : j+2 ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 rcases hi with ⟨hi0,hi1⟩
 interval_cases i
 · exact source_vertical1MAE9 q j r hj
 · exact source_vertical2MAE9 q j r hj
 · exact source_vertical3MAE9 q j r hj

theorem source_diagonal_bandMAE9 (q i j : ℕ) (r : Bool)
 (hi : 4 ≤ i ∧ i ≤ 6) (hj : j+2 ≤ q) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2 := by
 rcases hi with ⟨hi0,hi1⟩
 interval_cases i
 · exact source_diagonal1MAE9 q j r hj
 · exact source_diagonal2MAE9 q j r hj
 · exact source_diagonal3MAE9 q j r hj

def ThreeRemainingMAE9 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, ¬(j=5 ∨ (3 ≤ i ∧ i ≤ 6 ∧ j ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem three_remaining_iffMAE9 : ThreeRemainingM468 ↔ ThreeRemainingMAE9 := by
 constructor
 · intro h q hq r
   exact ⟨fun i j hj => (h q hq r).1 i j (by omega),
     fun i j hj => (h q hq r).2.1 i j (by omega),
     fun i j hj => (h q hq r).2.2 i j (by omega)⟩
 · intro h q hq r
   refine ⟨?_,?_,?_⟩
   · intro i j hj
     by_cases hh : 4 ≤ i ∧ i ≤ 6 ∧ j ≤ q
     · exact source_horizontal_bandMAE9 q i j r hq ⟨hh.1,hh.2.1⟩ hh.2.2
     · exact (h q hq r).1 i j (by omega)
   · intro i j hj
     by_cases hh : 6 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q
     · exact source_vertical_bandMAE9 q i j r ⟨hh.1,hh.2.1⟩ hh.2.2
     · exact (h q hq r).2.1 i j (by omega)
   · intro i j hj
     by_cases hh : 4 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q
     · exact source_diagonal_bandMAE9 q i j r ⟨hh.1,hh.2.1⟩ hh.2.2
     · exact (h q hq r).2.2 i j (by omega)

theorem root_iff_remainingMAE9 : Conjecture63 ↔ ThreeRemainingMAE9 ∧ OtherFourM9E2 := by
 rw [root_iff_remainingM468,three_remaining_iffMAE9]

theorem lower_band_polygonMAE9 (q i j : ℕ) (r : Bool) (hq : 3 ≤ q)
 (hi : 3 ≤ i ∧ i ≤ 8) (hj : j ≤ q) : InPolygon 3 (sourceNME9C q r) i j := by
 rcases hi with ⟨hi0,hi1⟩
 interval_cases i <;> unfold InPolygon sourceNME9C
   <;> split_ifs <;> omega

theorem source_bands_pathMAE9 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 (∀ i j, 4 ≤ i ∧ i ≤ 6 → j ≤ q →
   coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
     coeff (frame path).mid.p (i+1) j^2) ∧
 (∀ i j, 6 ≤ i ∧ i ≤ 8 → j+2 ≤ q →
   coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
     coeff (frame path).mid.p i (j+1)^2) ∧
 (∀ i j, 4 ≤ i ∧ i ≤ 6 → j+2 ≤ q →
   coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
     coeff (frame path).mid.p (i+1) (j+1)^2) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_,?_,?_⟩
 · intro i j hi hj
   simp only [hp]
   exact source_horizontal_bandMAE9 q i j r hq hi hj
 · intro i j hi hj
   simp only [hp]
   exact source_vertical_bandMAE9 q i j r hi hj
 · intro i j hi hj
   simp only [hp]
   exact source_diagonal_bandMAE9 q i j r hi hj

end
end MathGKM.Markov
