import MathGKM.Round41SeparatorA
import MathGKM.Markov
def MathGKM.Target85270fa8ffbb5eae202e763a.Interface :=
  (
    True
  )
def MathGKM.Target85270fa8ffbb5eae202e763a.Transport (StudyInterface : MathGKM.Target85270fa8ffbb5eae202e763a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target85270fa8ffbb5eae202e763a.Goal (StudyInterface : MathGKM.Target85270fa8ffbb5eae202e763a.Interface) : Prop :=
  (
    (MathGKM.Markov.InPolygon 10 11 10 0 ∧ MathGKM.Markov.InPolygon 10 11 10 1 ∧ MathGKM.Markov.InPolygon 10 11 10 2 ∧
        16 ≤ 2*(10 : ℕ) ∧
        GroupedR40.group 10 10 0 0 1 16 = -3 ∧
        GroupedR40.group 10 10 0 0 1 17 = 72 ∧
        GroupedR40.group 10 10 0 0 1 18 = 130 ∧
        (∀ s t : ℕ, s ≤ 10 → t ≤ 10 →
          (if s+t=16 then MidpointR36.W 10 10 1 s * MidpointR36.W 10 10 1 t -
            MidpointR36.W 10 10 0 s * MidpointR36.W 10 10 2 t else 0) =
          (if s=8 ∧ t=8 then 81 else if s=10 ∧ t=6 then -84 else 0)) ∧
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate 9 true)).mid.p 10 0 = 1 ∧
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate 9 true)).mid.p 10 1 = 29 ∧
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate 9 true)).mid.p 10 2 = 642 ∧
        MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate 9 true)).mid.p 10 1 ^ 2 -
          MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate 9 true)).mid.p 10 0 *
            MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate 9 true)).mid.p 10 2 = 199) ∧
    ((MathGKM.Markov.frame (List.replicate 9 true)).mid.a = 10 ∧
        (MathGKM.Markov.frame (List.replicate 9 true)).mid.b = 11) ∧
    (¬ (∀ n : ℕ, 1 ≤ n → ∀ i j : ℕ,
          MathGKM.Markov.InPolygon n (n+1) i j → MathGKM.Markov.InPolygon n (n+1) i (j+1) →
          MathGKM.Markov.InPolygon n (n+1) i (j+2) →
          ∀ l : ℕ, l ≤ 2*n → 0 ≤ GroupedR40.group n i j 0 1 l)) ∧
    (∀ (s : ℕ) (hs : s ≤ 10),
    MidpointR36.W 10 10 0 s = (if s=10 then 1 else 0) ∧
        MidpointR36.W 10 10 1 s = (if s=8 then 9 else if s=9 then 20 else 0) ∧
        MidpointR36.W 10 10 2 s = (if s=6 then 84 else if s=7 then 288 else if s=8 then 270 else 0))
  )
