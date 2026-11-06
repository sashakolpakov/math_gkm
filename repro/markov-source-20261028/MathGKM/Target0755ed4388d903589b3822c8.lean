import MathGKM.Round108SubmissionA
import MathGKM.Markov
def MathGKM.Target0755ed4388d903589b3822c8.Interface :=
  (
    True
  )
def MathGKM.Target0755ed4388d903589b3822c8.Transport (StudyInterface : MathGKM.Target0755ed4388d903589b3822c8.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target0755ed4388d903589b3822c8.Goal (StudyInterface : MathGKM.Target0755ed4388d903589b3822c8.Interface) : Prop :=
  (
    ColorForgettingSeparatorR108.z ∈ ColorForgettingSeparatorR108.C ∧
    (∀ w ∈ ColorForgettingSeparatorR108.C, ColorForgettingR108.fiber 10 1 5 2 w) ∧
    (∀ w ∈ ColorForgettingSeparatorR108.C, ∀ v,
      ColorForgettingR108.edge 10 1 5 2 w v → v∈ColorForgettingSeparatorR108.C) ∧
    (∀ w ∈ ColorForgettingSeparatorR108.C,
      Relation.ReflTransGen (ColorForgettingR108.edge 10 1 5 2) ColorForgettingSeparatorR108.z w) ∧
    (ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=0)).card=1 ∧
    (ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=1)).card=0 ∧
    (ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=2)).card=1 ∧
    ¬((ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=0)).card ≤
      (ColorForgettingSeparatorR108.C.filter (fun w => LocalRetilingR76.rank 1 w=1)).card)
  )
