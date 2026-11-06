import MathGKM.Round96SubmissionA
import MathGKM.Markov
def MathGKM.Target721042a778172cac561dfef1.Interface :=
  (
    True
  )
def MathGKM.Target721042a778172cac561dfef1.Transport (StudyInterface : MathGKM.Target721042a778172cac561dfef1.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target721042a778172cac561dfef1.Goal (StudyInterface : MathGKM.Target721042a778172cac561dfef1.Interface) : Prop :=
  (
    (∀ N sigma j L a b r : ℕ,
      (FullFiberRankR80.rankPoly N sigma j L a b).coeff r =
        (Finset.range (a/2+1)).sum (fun c => ComplementaryAllocationR96.G N sigma j L a b c r)) ∧
      (∀ N sigma j L a b c r : ℕ, c≤a/2 → r≤L →
        ComplementaryAllocationR96.G N sigma j L a b c (L-r) =
          ComplementaryAllocationR96.G N sigma j L a b c r) ∧
      (∀ N sigma j L a b c r : ℕ, L<r → ComplementaryAllocationR96.G N sigma j L a b c r=0)
  )
