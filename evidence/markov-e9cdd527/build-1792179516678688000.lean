import MarkovLowLCME9C
/-! Machine-authored e9cdd527. Exact root residual, deliberately unproved.
Only the newly proved lower fourth-column inequalities are removed. -/
namespace MathGKM.Markov
noncomputable section

def ThreeRemainingME9C : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, (i≠4 ∨ q<j+2) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem three_remaining_iffME9C : ThreeRawLCM9E2 ↔ ThreeRemainingME9C := by
 constructor
 · intro h q hq r
   exact ⟨(h q hq r).1,fun i j _ => (h q hq r).2.1 i j,(h q hq r).2.2⟩
 · intro h q hq r
   refine ⟨(h q hq r).1,?_,(h q hq r).2.2⟩
   intro i j
   by_cases hi : i=4
   · subst i
     by_cases hj : j+2 ≤ q
     · exact (three_low_four_strictME9C q j r hj).le
     · exact (h q hq r).2.1 4 j (Or.inr (by omega))
   · exact (h q hq r).2.1 i j (Or.inl hi)

theorem root_iff_remainingME9C : Conjecture63 ↔ ThreeRemainingME9C ∧ OtherFourM9E2 := by
 rw [root_iff_three_arithmeticM9E2,three_remaining_iffME9C]

theorem low_gain_unboundedME9C (j : ℕ) (r : Bool) :
 let path := threePathM9E2 (j+1) r
 (frame path).mid.a=3 ∧
 (frame path).mid.b=sourceNME9C (j+2) r ∧
 InPolygon (frame path).mid.a (frame path).mid.b 4 j ∧
 InPolygon (frame path).mid.a (frame path).mid.b 4 (j+1) ∧
 InPolygon (frame path).mid.a (frame path).mid.b 4 (j+2) ∧
 coeff (frame path).mid.p 4 j*coeff (frame path).mid.p 4 (j+2) <
 coeff (frame path).mid.p 4 (j+1)^2 := by
 dsimp only
 have he : j+1+1=j+2 := by omega
 rw [(three_path_labelsM9E2 (j+1) r).1,(three_path_labelsM9E2 (j+1) r).2,
   three_path_polynomialM9E2,he]
 simp only [three_raw_formulaM9E2]
 have hp (k : ℕ) (hk : k ≤ j+2) : InPolygon 3 (3*(j+2)+(if r then 1 else 2)) 4 k := by
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,InPolygon] <;> omega
 exact ⟨rfl,rfl,hp j (by omega),hp (j+1) (by omega),hp (j+2) (by omega),
   three_low_four_strictME9C (j+2) j r (by omega)⟩

end
end MathGKM.Markov
