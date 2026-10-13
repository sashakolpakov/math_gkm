/- This isolated test is not the project Markov conjecture. -/
namespace MathGKM.Markov
def ToyTruth : Prop := True
def ToyFalsehood : Prop := False
theorem toy_refutation : ¬ ToyFalsehood := by
  intro h
  exact h
end MathGKM.Markov
