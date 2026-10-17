import MarkovMiddleIntegerPolyM9DB
import MarkovMiddleAfterThirdM9DB
/-! Machine-authored 9db2326d. Uniform integer polynomial sign candidate
and its exact source implication. The sign candidate remains unproved. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def IntegerSignsM9DB : Prop := ∀ k c r,
 5 ≤ c → 3 ≤ k → c < middleConeBoundM6C0 k r →
 ∀ i, 0 ≤ (integerGapPolyM9DB k c r).coeff i

theorem middle_after_third_of_integer_signsM9DB (h : IntegerSignsM9DB) :
 MiddleAfterThirdM9DB := by
 intro r c x k hc hk hb
 exact integer_gap_transferM9DB k c r (h k c r hc hk hb) x

theorem root_of_integer_signsM9DB (hs : IntegerSignsM9DB)
 (ht : ThreeOutsideMiddleMD02) (ho : OtherFourM9E2) : Conjecture63 := by
 exact root_iff_after_thirdM9DB.mpr ⟨middle_after_third_of_integer_signsM9DB hs,ht,ho⟩

end
end MathGKM.Markov
