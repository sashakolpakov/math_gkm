import MathGKM.Round47RecurrenceA
import MathGKM.Markov
def MathGKM.Target2169ea00ccea786278b7c17e.Interface :=
  (
    True
  )
def MathGKM.Target2169ea00ccea786278b7c17e.Transport (StudyInterface : MathGKM.Target2169ea00ccea786278b7c17e.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target2169ea00ccea786278b7c17e.Goal (StudyInterface : MathGKM.Target2169ea00ccea786278b7c17e.Interface) : Prop :=
  (
    (∀ (n h j q : ℕ) (hh : 0<h)
        (hqn : q+1 ≤ n-h) (hqj : q+1 ≤ j) (hj : j ≤ q+2*h),
        ((n-q : ℕ) : ℤ)*((q+1 : ℕ) : ℤ)*((2*h-(j-q)+1 : ℕ) : ℤ)*
          HorizontalR46.F n h j (q+1) =
        ((n-h-q : ℕ) : ℤ)*((h+q : ℕ) : ℤ)*((j-q : ℕ) : ℤ)*HorizontalR46.F n h j q) ∧ (∀ (n h j q : ℕ) (hqn : q+1 ≤ n-h)
        (hj : j ≤ q+2*h),
        0 < ((n-q : ℕ) : ℤ)*((q+1 : ℕ) : ℤ)*((2*h-(j-q)+1 : ℕ) : ℤ))
  )
