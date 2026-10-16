import MarkovLiftTransportMFEE
import MarkovCutOuterMFEE
import MarkovResidualMAE9
/-! Machine-authored fee405c8. Exact residual bookkeeping, conditional only
where explicitly stated. All other directions and source families remain. -/
namespace MathGKM.Markov
noncomputable section

def LowerHorizontalMFEE : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r i j, j ≤ q →
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2

def ThreeOutsideLowerMFEE : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q<j → j≠5 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_lower_horizontalMFEE :
 Conjecture63 ↔ LowerHorizontalMFEE ∧ ThreeOutsideLowerMFEE ∧ OtherFourM9E2 := by
 constructor
 · intro H
   have hall := (root_iff_three_arithmeticM9E2.mp H).1
   have hrest := root_iff_remainingMAE9.mp H
   refine ⟨?_,?_,hrest.2⟩
   · intro q hq r i j _
     exact (hall q hq r).1 i j
   · intro q hq r
     exact ⟨fun i j _ _ => (hall q hq r).1 i j,
       (hrest.1 q hq r).2.1,(hrest.1 q hq r).2.2⟩
 · rintro ⟨hl,ho,h4⟩
   apply root_iff_remainingMAE9.mpr
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(ho q hq r).2.1,(ho q hq r).2.2⟩
   intro i j hj
   by_cases hlow : j ≤ q
   · exact hl q hq r i j hlow
   · exact (ho q hq r).1 i j (by omega) (by omega)

theorem lower_horizontal_of_middleMFEE (H : LiftMiddleMFEE) : LowerHorizontalMFEE := by
 have hb := lift_positive_iff_boundaryM7E2.mp (lift_positive_iff_middleMFEE.mpr H)
 intro q hq r i j hj
 exact source_lower_horizontal_of_boundaryMFEE hb q i j r hj

theorem root_of_middle_and_remainingMFEE (H : LiftMiddleMFEE)
 (ho : ThreeOutsideLowerMFEE) (h4 : OtherFourM9E2) : Conjecture63 := by
 exact root_iff_lower_horizontalMFEE.mpr ⟨lower_horizontal_of_middleMFEE H,ho,h4⟩

theorem lower_horizontal_paths_of_middleMFEE (H : LiftMiddleMFEE)
 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ i j, j ≤ q → coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j hj
 simp only [hp]
 exact lower_horizontal_of_middleMFEE H q hq r i j hj

end
end MathGKM.Markov
