import MathGKM.Round72ParityKernelA
import MathGKM.Markov
def MathGKM.Targetf1d8115e633c64861033e766.Interface :=
  (
    True
  )
def MathGKM.Targetf1d8115e633c64861033e766.Transport (StudyInterface : MathGKM.Targetf1d8115e633c64861033e766.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetf1d8115e633c64861033e766.Goal (StudyInterface : MathGKM.Targetf1d8115e633c64861033e766.Interface) : Prop :=
  (
    (ParityKernelR72.K 10 1 0 5 0 = 1 ∧ ParityKernelR72.K 10 1 2 5 1 = 48 ∧
        ParityKernelR72.K 10 1 1 5 0 = 10 ∧ ParityKernelR72.K 10 1 1 5 1 = 4 ∧
        ((0+1 : ℤ)/2 = 0) ∧ ((0+1+1 : ℤ)/2 = 1) ∧
        ParityKernelR72.K 10 1 0 5 0 * ParityKernelR72.K 10 1 2 5 1 >
          ParityKernelR72.K 10 1 1 5 ((0+1)/2) * ParityKernelR72.K 10 1 1 5 ((0+1+1)/2) ∧
        (Finset.sum (Finset.range 11) (fun p => ParityKernelR72.K 10 1 0 5 (p : ℤ))) = 1 ∧
        (Finset.sum (Finset.range 11) (fun p => ParityKernelR72.K 10 1 1 5 (p : ℤ))) = 14 ∧
        (Finset.sum (Finset.range 11) (fun p => ParityKernelR72.K 10 1 2 5 (p : ℤ))) = 117 ∧
        (14 : ℤ)^2-1*117 = 79) ∧ ¬ ParityKernelR72.MidpointPrediction
  )
