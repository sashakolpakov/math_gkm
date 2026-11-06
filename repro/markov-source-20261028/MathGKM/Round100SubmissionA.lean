import MathGKM.Round100OriginalA
import MathGKM.Round100CornerModelA

/- Machine-authored r100. Three closed propositions offered for independent
checking; none asserts actual-family universal flow existence or root closure. -/
namespace NeighborFlowSubmissionR100
open scoped BigOperators
open NeighborFlowR100 NeighborSupportR100 MathGKM.Markov
noncomputable section

def CertificateLaws : Prop :=
  (∀ K d T, Feasible K d T → 0≤∑ a ∈ Finset.range (K+1), d a) ∧
  (Feasible 2 near nearT ∧ (¬∃ T, Feasible 2 far T) ∧
    (∑ a ∈ Finset.range 3, near a)=1 ∧ (∑ a ∈ Finset.range 3, far a)=1) ∧
  (∀ (n : ℤ) (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ),
    2≤n → 3≤K → Feasible K d T → d 1=8*(n-1) →
    2*d 2= -n^2+11*n-16 → d 3=0 → n^2≤27*n-32)

theorem certificate_claim : CertificateLaws :=
  ⟨feasible_total,controls,corner_model_necessary⟩

def SupportSpecialization : Prop :=
  (∀ N sigma t L a b r, (PairConvolutionR78.P N sigma t L a b r).Nonempty →
    L+2*t+a+b=2*N) ∧
  (∀ N sigma t r K, (2*r+2)+2*t+K=2*N →
    MatchingProjectionR64.unit (MatchingProjectionR64.defect N sigma r t) =
    ∑ a ∈ Finset.range (K+1), pooledDelta N sigma t r K a)

theorem support_claim : SupportSpecialization := support_and_specialization

def OriginalBridge : Prop :=
  (∀ (n t r K : ℕ), 1≤n → (2*r+2)+2*t+K=2*(2*n) →
    let E := (frame (List.replicate (n-1) true)).mid
    (∑ a ∈ Finset.range (K+1), pooledDelta (2*n) 0 t r K a) =
      coeff E.p (r+1) t^2-coeff E.p r t*coeff E.p (r+2) t ∧
    (∑ a ∈ Finset.range (K+1), pooledDelta (2*n) 1 t r K a) =
      coeff E.p t (r+1)^2-coeff E.p t r*coeff E.p t (r+2)) ∧
  (∀ (n t r K : ℕ), 1≤n → (2*r+2)+2*t+K=2*(2*n) →
    ∀ T : ℕ → ℕ → ℤ, Feasible K (pooledDelta (2*n) 0 t r K) T →
    let E := (frame (List.replicate (n-1) true)).mid
    coeff E.p r t*coeff E.p (r+2) t ≤ coeff E.p (r+1) t^2) ∧
  (∀ (n t r K : ℕ), 1≤n → (2*r+2)+2*t+K=2*(2*n) →
    ∀ T : ℕ → ℕ → ℤ, Feasible K (pooledDelta (2*n) 1 t r K) T →
    let E := (frame (List.replicate (n-1) true)).mid
    coeff E.p t r*coeff E.p t (r+2) ≤ coeff E.p t (r+1)^2) ∧
  (∀ (n r t : ℕ),
    InPolygon n (n+1) (r+2) t ∨ InPolygon n (n+1) t (r+2) →
    (2*r+2)+2*t+(2*(2*n)-(2*r+2)-2*t)=2*(2*n))

theorem original_claim : OriginalBridge :=
  ⟨NeighborOriginalR100.original_margins,NeighborOriginalR100.horizontal_from_flow,
    NeighborOriginalR100.vertical_from_flow,NeighborOriginalR100.polygon_degree_guard⟩

end
end NeighborFlowSubmissionR100
#print axioms NeighborFlowSubmissionR100.certificate_claim
#print axioms NeighborFlowSubmissionR100.support_claim
#print axioms NeighborFlowSubmissionR100.original_claim
