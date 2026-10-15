import MarkovFourLinear0CC
import MarkovFourLinear1CC
import MarkovFourLinear2CC
import MarkovFourLinear3CC
/-! Machine-authored cc599cf1. Assembly of split local identities. -/
namespace MathGKM.Markov
noncomputable section
theorem localFour_linearCC {A : Type*} [CommRing A] (N Z x : A) (p q r s : Bool) (hz : Z^2=0) :
 localFourNumBC N Z x p q r s=linearFourCC N Z x p q r := by
 cases p <;> cases q
 · exact localFour_linear0CC N Z x r s hz
 · exact localFour_linear1CC N Z x r s hz
 · exact localFour_linear2CC N Z x r s hz
 · exact localFour_linear3CC N Z x r s hz
end
end MathGKM.Markov
