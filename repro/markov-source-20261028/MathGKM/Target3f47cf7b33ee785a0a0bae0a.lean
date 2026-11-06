import MathGKM.Round88CellsA
import MathGKM.Markov
def MathGKM.Target3f47cf7b33ee785a0a0bae0a.Interface :=
  (
    True
  )
def MathGKM.Target3f47cf7b33ee785a0a0bae0a.Transport (StudyInterface : MathGKM.Target3f47cf7b33ee785a0a0bae0a.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target3f47cf7b33ee785a0a0bae0a.Goal (StudyInterface : MathGKM.Target3f47cf7b33ee785a0a0bae0a.Interface) : Prop :=
  (
    (∀ (P : MatchingProjectionR64.Four) (a i j : ℕ), (((SparseColorR88.reorder P).coeff a).coeff i).coeff j = ((P.coeff i).coeff j).coeff a) ∧ (∀ sigma : ℕ, SparseColorR88.A 0 0 sigma=1 ∧ SparseColorR88.A 0 1 sigma=SparseColorR88.T ∧ SparseColorR88.A 1 0 sigma=0 ∧ SparseColorR88.A 1 1 sigma=0) ∧ (∀ N sigma : ℕ, SparseColorR88.A 0 (N+2) sigma = SparseColorR88.T*SparseColorR88.A 0 (N+1) sigma + (if (N+sigma)%2=0 then 0 else SparseColorR88.z*SparseColorR88.v)*SparseColorR88.A 0 N sigma) ∧ (∀ N sigma : ℕ, SparseColorR88.A 1 (N+2) sigma = SparseColorR88.T*SparseColorR88.A 1 (N+1) sigma + (if (N+sigma)%2=0 then SparseColorR88.u*SparseColorR88.A 0 N sigma else SparseColorR88.z*SparseColorR88.v*SparseColorR88.A 1 N sigma)) ∧ (∀ n : ℕ, SparseColorR88.A 0 (2*n) 1=SparseColorR88.Ccell^n ∧ SparseColorR88.A 0 (2*n+1) 1=SparseColorR88.T*SparseColorR88.Ccell^n) ∧ (∀ n : ℕ, SparseColorR88.A 0 (2*n+1) 0=SparseColorR88.T*SparseColorR88.Ccell^n ∧ SparseColorR88.A 0 (2*n+2) 0=SparseColorR88.T^2*SparseColorR88.Ccell^n)
  )
