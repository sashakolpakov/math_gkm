import MathGKM.Round32TransportA
import MathGKM.Markov
def MathGKM.Target787de56168027ddcd926626c.Interface :=
  (
    True
  )
def MathGKM.Target787de56168027ddcd926626c.Transport (StudyInterface : MathGKM.Target787de56168027ddcd926626c.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target787de56168027ddcd926626c.Goal (StudyInterface : MathGKM.Target787de56168027ddcd926626c.Interface) : Prop :=
  (
    ∀ n h : ℕ, 1≤h → h≤n →
      (∀ s, (SmoothingR32.spec (RightExpansionR31.residual n h)).coeff s=SmoothingR32.a n h s) ∧
      ConvolutionR19.Good (SmoothingR32.spec (RightExpansionR31.residual n h)).coeff ∧
      (∀ s : ℤ, ConvolutionR19.zcoeff (SmoothingR32.spec (RightExpansionR31.residual n h)) s=SmoothingR32.az n h s) ∧
      (∀ s : ℤ, 0≤SmoothingR32.az n h s) ∧
      (∀ s : ℤ, 0<SmoothingR32.az n h s ↔ 0 ≤ s ∧ s ≤ (n-h : ℕ)) ∧
      (∀ i j k : ℤ, i<j → j<k → 0<SmoothingR32.az n h i → 0<SmoothingR32.az n h k → 0<SmoothingR32.az n h j) ∧
      (∀ s : ℤ, SmoothingR32.az n h s*SmoothingR32.az n h (s+2)≤SmoothingR32.az n h (s+1)^2)
  )
