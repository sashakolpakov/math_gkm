import MathGKM.Round41SupportA
import MathGKM.Markov
def MathGKM.Target5c63f9f4f66a8bd0e10f3315.Interface :=
  (
    True
  )
def MathGKM.Target5c63f9f4f66a8bd0e10f3315.Transport (StudyInterface : MathGKM.Target5c63f9f4f66a8bd0e10f3315.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target5c63f9f4f66a8bd0e10f3315.Goal (StudyInterface : MathGKM.Target5c63f9f4f66a8bd0e10f3315.Interface) : Prop :=
  (
    (∀ (n i j s : ℕ) (hn : 1 ≤ n) (hij : i + j = n),
    MidpointR36.W n i j s = if i = n ∧ j = 0 ∧ s = n then 1 else 0) ∧
    (∀ (n i j s h : ℕ) (hh : 0 < h) (hhn : h ≤ n)
        (hij : i + j = n + h),
    0 < MidpointR36.W n i j s ↔ s ≤ i ∧ h + s ≤ n ∧ i ≤ s + 2*h) ∧
    (∀ (n i j s : ℕ) (hout : i + j < n ∨ 2*n < i + j),
    MidpointR36.W n i j s = 0) ∧
    (∀ (n i j s h r dx dy : ℕ)
        (hd : (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1))
        (hh : 0 < h+r) (hhn : h+r ≤ n) (hij : i+j=n+h),
    (0 < MidpointR36.W n (i+r*dx) (j+r*dy) s) ↔
          (i+r*dx)-2*(h+r) ≤ s ∧ s ≤ min (i+r*dx) (n-(h+r)))
  )
