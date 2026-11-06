import MathGKM.Round47BoundaryA
import MathGKM.Markov
def MathGKM.Target954fece628b86ad6a4fae710.Interface :=
  (
    True
  )
def MathGKM.Target954fece628b86ad6a4fae710.Transport (StudyInterface : MathGKM.Target954fece628b86ad6a4fae710.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target954fece628b86ad6a4fae710.Goal (StudyInterface : MathGKM.Target954fece628b86ad6a4fae710.Interface) : Prop :=
  (
    (∀ (n h l : ℕ),
        HorizontalR46.complete n h 0 l = if l=2*(n-h)-2 then
          (n.choose (h+1) : ℤ)^2 - (n.choose h : ℤ)*(n.choose (h+2) : ℤ) else 0) ∧ (∀ (n i j l : ℕ) (hn : 1 ≤ n)
        (hp0 : MathGKM.Markov.InPolygon n (n+1) i j)
        (_hp1 : MathGKM.Markov.InPolygon n (n+1) (i+1) j)
        (_hp2 : MathGKM.Markov.InPolygon n (n+1) (i+2) j)
        (hb : i+j-n=0 ∨ j=0 ∨ 2*(n-(i+j-n))-2<l),
        0 ≤ HorizontalR46.complete n (i+j-n) j l) ∧ (∀ (n h j l : ℕ) (hl : 2*(n-h)-2 < l),
        HorizontalR46.complete n h j l = 0)
  )
