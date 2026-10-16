import MarkovCrossingLCM1BB
/-! Machine-authored 1bb0aa1e. Exact root residual; the residual is unproved. -/
namespace MathGKM.Markov
noncomputable section

def ThreeRemainingM1BB : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬((i=3 ∨ i=4) ∧ j+1 ≤ q) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) (j+1)^2)

theorem three_remaining_iffM1BB : ThreeRawLCM9E2 ↔ ThreeRemainingM1BB := by
 constructor
 · intro h q hq r
   exact ⟨(h q hq r).1,fun i j _ => (h q hq r).2.1 i j,(h q hq r).2.2⟩
 · intro h q hq r
   refine ⟨(h q hq r).1,?_,(h q hq r).2.2⟩
   intro i j
   by_cases hh : (i=3 ∨ i=4) ∧ j+1 ≤ q
   · exact (three_low_tail_verticalM1BB q i j r hh.1 hh.2).le
   · exact (h q hq r).2.1 i j hh

theorem root_iff_remainingM1BB : Conjecture63 ↔ ThreeRemainingM1BB ∧ OtherFourM9E2 := by
 rw [root_iff_three_arithmeticM9E2,three_remaining_iffM1BB]

theorem crossing_gain_unboundedM1BB (j i : ℕ) (r : Bool) (hi : i=3 ∨ i=4) :
 let path := threePathM9E2 j r
 (frame path).mid.a=3 ∧
 (frame path).mid.b=sourceNME9C (j+1) r ∧
 InPolygon (frame path).mid.a (frame path).mid.b i j ∧
 InPolygon (frame path).mid.a (frame path).mid.b i (j+1) ∧
 InPolygon (frame path).mid.a (frame path).mid.b i (j+2) ∧
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2)<
 coeff (frame path).mid.p i (j+1)^2 := by
 dsimp only
 rw [(three_path_labelsM9E2 j r).1,(three_path_labelsM9E2 j r).2,three_path_polynomialM9E2]
 simp only [three_raw_formulaM9E2]
 have hp (k : ℕ) (hk : k ≤ j+2) : InPolygon 3 (3*(j+1)+(if r then 1 else 2)) i k := by
   rcases hi with rfl|rfl <;> cases r <;> simp only [Bool.false_eq_true,if_false,if_true,InPolygon] <;> omega
 exact ⟨trivial,rfl,hp j (by omega),hp (j+1) (by omega),hp (j+2) (by omega),
   three_low_tail_verticalM1BB (j+1) i j r hi (by omega)⟩

end
end MathGKM.Markov
