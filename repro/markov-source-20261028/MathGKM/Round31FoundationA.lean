import MathGKM.Round30RightCoefficientsA

/-! Machine-authored unchanged foundation bundle, round31. -/
namespace RightFoundationR31
noncomputable section
def Statement : Prop :=
((∀ k : ℕ, (MathGKM.Markov.frame (List.replicate k true)).hi=⟨1,1,RightR30.T⟩ ∧ (MathGKM.Markov.frame (List.replicate k true)).mid.a=k+1 ∧ (MathGKM.Markov.frame (List.replicate k true)).mid.b=k+2) ∧ (∀ k : ℕ, (RightR30.M k,RightR30.G k)=RenewalR28.state (RightR30.T^2) MathGKM.Markov.U MathGKM.Markov.V (RightR30.T^2+MathGKM.Markov.U) (RightR30.T^2) k) ∧ ((1-PowerSeries.C (RightR30.T*(RightR30.T+1))*PowerSeries.X+PowerSeries.C (MathGKM.Markov.U*MathGKM.Markov.V)*PowerSeries.X^2)*PowerSeries.mk RightR30.M=PowerSeries.C (RightR30.T^2+MathGKM.Markov.U)-PowerSeries.C (MathGKM.Markov.U*MathGKM.Markov.V)*PowerSeries.X) ∧ (∀ k : ℕ, RightR30.M (k+2)=RightR30.T*(RightR30.T+1)*RightR30.M (k+1)-MathGKM.Markov.U*MathGKM.Markov.V*RightR30.M k)) ∧ ((∀ k : ℕ, (∀ i j : ℕ, MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate k true)).mid.p i j=(RightR30.array k).1 i j) ∧ (∀ i j : ℕ, MathGKM.Markov.coeff (RightR30.G k) i j=(RightR30.array k).2 i j)) ∧ (∀ k i j : ℕ, 0≤MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate k true)).mid.p i j ∧ 0≤MathGKM.Markov.coeff (RightR30.G k) i j))
theorem candidate : Statement :=
⟨⟨RightR30.right_labels,RightR30.right_state,RightR30.right_series,RightR30.right_recurrence⟩,⟨RightR30.coefficient_recovery,RightR30.right_nonnegative⟩⟩
#print axioms candidate
end
end RightFoundationR31
