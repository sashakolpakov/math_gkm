import MathGKM.Round31LayersA
import MathGKM.Markov
def MathGKM.Target917a32bc5b83b1525ff93f48.Interface :=
  (
    True
  )
def MathGKM.Target917a32bc5b83b1525ff93f48.Transport (StudyInterface : MathGKM.Target917a32bc5b83b1525ff93f48.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target917a32bc5b83b1525ff93f48.Goal (StudyInterface : MathGKM.Target917a32bc5b83b1525ff93f48.Interface) : Prop :=
  (
    (∀ k : ℕ, (MathGKM.Markov.frame (List.replicate k true)).mid.p = RightLiftR30.ev (RightLiftR30.H (RenewalR28.P (k+1)) (k+1))) ∧ (∀ (P : MathGKM.Markov.BiPoly) (m i j : ℕ), MathGKM.Markov.coeff ((RightLayersR31.grade P).coeff m) i j = if i+j=m then MathGKM.Markov.coeff P i j else 0) ∧ (∀ k : ℕ, (RightLayersR31.grade (RightR30.M k)).coeff (k+1) = MathGKM.Markov.U^(k+1)) ∧ (∀ k h : ℕ, 1 ≤ h → h ≤ k+1 → (RightLayersR31.grade (RightR30.M k)).coeff (k+1+h) = RightR30.T^(2*h)*RightExpansionR31.residual (k+1) h) ∧ (∀ k m : ℕ, m < k+1 ∨ 2*(k+1) < m → (RightLayersR31.grade (RightR30.M k)).coeff m = 0)
  )
