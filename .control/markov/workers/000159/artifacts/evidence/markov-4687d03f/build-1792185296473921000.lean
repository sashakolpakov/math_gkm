import MarkovFiveDirectionsM468
import MarkovResidualMFFD
/-! Machine-authored 4687d03f. Exact residual; unresolved clauses retained. -/
namespace MathGKM.Markov
noncomputable section

def ThreeRemainingM468 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, ¬(j=5 ∨ (i=3 ∧ j ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (i=5 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(i=3 ∧ j+2 ≤ q) → threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem three_remaining_iffM468 : ThreeRemainingMFFD ↔ ThreeRemainingM468 := by
 constructor
 · intro h q hq r
   exact ⟨fun i j hj => (h q hq r).1 i j (by tauto),
     fun i j hj => (h q hq r).2.1 i j (by tauto),fun i j _ => (h q hq r).2.2 i j⟩
 · intro h q hq r
   refine ⟨?_,?_,?_⟩
   · intro i j hj
     by_cases hi : i=3 ∧ j ≤ q
     · rcases hi with ⟨rfl,hj⟩
       exact source_first_horizontalM468 q j r hq hj
     · exact (h q hq r).1 i j (by tauto)
   · intro i j hj
     by_cases hi : i=5 ∧ j+2 ≤ q
     · rcases hi with ⟨rfl,hj⟩
       exact (source_five_verticalM468 q j r hj).le
     · exact (h q hq r).2.1 i j (by tauto)
   · intro i j
     by_cases hi : i=3 ∧ j+2 ≤ q
     · rcases hi with ⟨rfl,hj⟩
       exact (source_first_diagonalM468 q j r hj).le
     · exact (h q hq r).2.2 i j hi

theorem root_iff_remainingM468 : Conjecture63 ↔ ThreeRemainingM468 ∧ OtherFourM9E2 := by
 rw [root_iff_remainingMFFD,three_remaining_iffM468]

theorem first_horizontal_polygonM468 (q j : ℕ) (r : Bool) (hq : 1 ≤ q) (hj : j ≤ q) :
 InPolygon 3 (sourceNME9C q r) 3 j ∧ InPolygon 3 (sourceNME9C q r) 4 j ∧
 InPolygon 3 (sourceNME9C q r) 5 j := by
 unfold InPolygon sourceNME9C
 split_ifs <;> omega

theorem five_vertical_polygonM468 (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 InPolygon 3 (sourceNME9C q r) 5 j ∧ InPolygon 3 (sourceNME9C q r) 5 (j+1) ∧
 InPolygon 3 (sourceNME9C q r) 5 (j+2) := by
 unfold InPolygon sourceNME9C
 split_ifs <;> omega

theorem first_diagonal_polygonM468 (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 InPolygon 3 (sourceNME9C q r) 3 (j+2) ∧ InPolygon 3 (sourceNME9C q r) 4 (j+1) ∧
 InPolygon 3 (sourceNME9C q r) 5 j := by
 unfold InPolygon sourceNME9C
 split_ifs <;> omega

theorem source_first_horizontal_pathM468 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
   ∀ j, j ≤ q → coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 5 j ≤
     coeff (frame path).mid.p 4 j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro j hj
 rw [hp,hp,hp]
 exact source_first_horizontalM468 q j r hq hj

end
end MathGKM.Markov
