import MathGKM.ResearchSemantics
import MathGKM.Accepted3c5512444ed7f17d3a8e718f

/- Machine-authored round92. The committed boundary classes, unchanged.
This interface asserts no increasing-to-center inequality for either class. -/
namespace BoundaryPolarisationR92
open Polynomial SparseColorR88 SparseRankR89 SparseCoupledR90 FullFiberRankR80
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000

def P (m : ℕ) : Three := T^2*Ccell^(m+2)
def Qbulk (m : ℕ) : Three := u*T^4*Ccell^m
def Qend (m : ℕ) : Three := u*z*v*T^2*Ccell^m
def c (P : Three) (r j a : ℕ) : ℤ := (((P.coeff r).coeff j).coeff a)
def polar (P Q : Three) (j L b r : ℕ) : ℤ :=
  if r≤L then
    ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
      (c P r j q.1*c Q (L-r) j q.2+c Q r j q.1*c P (L-r) j q.2)
  else 0
def bulk (m j L b r : ℕ) : ℤ := polar (P m) (Qbulk m) j L b r
def endpoint (m j L b r : ℕ) : ℤ := polar (P m) (Qend m) j L b r

theorem P_coeff (m r j a : ℕ) : c (P m) r j a=count 2 (m+2) r j a :=
  cell_coeff _ _ _ _ _
theorem bulk_coeff (m r j a : ℕ) : c (Qbulk m) r j a=shifted 4 m r j a := by
  have he : Qbulk m=u*(T^4*Ccell^m) := by unfold Qbulk; ring
  rw [c,he,u_cell_coeff]
theorem end_coeff (m r j a : ℕ) : c (Qend m) r j a=punctured 2 m r j a := by
  have he : Qend m=z*v*(u*(T^2*Ccell^m)) := by unfold Qend; ring
  rw [c,he,zv_coeff]
  unfold punctured
  split_ifs <;> simp [u_cell_coeff]

theorem polar_symmetry (P Q : Three) (j L b r : ℕ) (hr : r≤L) :
    polar P Q j L b r=polar P Q j L b (L-r) := by
  classical
  simp only [polar,if_pos hr,if_pos (show L-r≤L by omega),show L-(L-r)=r by omega]
  rw [← Finset.Nat.sum_antidiagonal_swap]
  apply Finset.sum_congr rfl
  intro q hq
  dsimp only [Prod.swap]
  ring

theorem class_closed (m j L b r : ℕ) :
    bulk m j L b r = (if r≤L then
      ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
        (count 2 (m+2) r j q.1*shifted 4 m (L-r) j q.2+
         shifted 4 m r j q.1*count 2 (m+2) (L-r) j q.2) else 0) ∧
    endpoint m j L b r = (if r≤L then
      ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
        (count 2 (m+2) r j q.1*punctured 2 m (L-r) j q.2+
         punctured 2 m r j q.1*count 2 (m+2) (L-r) j q.2) else 0) := by
  constructor
  · simp only [bulk,polar,P_coeff,bulk_coeff]
  · simp only [endpoint,polar,P_coeff,end_coeff]

theorem actual_coeff (m j L b r : ℕ) :
    (rankPoly (2*(m+3)) 0 j L 1 b).coeff r =
      (m+3 : ℤ)*bulk m j L b r+2*endpoint m j L b r := by
  classical
  by_cases hr : r≤L
  · rw [rank_one_closed (m+3) 0 j L b r (by omega) hr,
      (class_closed m j L b r).1,(class_closed m j L b r).2,if_pos hr]
    have hzero : isolated (m+3) 0=2 ∧ cells (m+3) 0=m+2 := by
      simp [isolated,cells]
    simp only [hzero.1,hzero.2,oneCount,if_true,if_pos hr]
    rw [Finset.mul_sum,Finset.mul_sum,← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro q hq
    push_cast
    ring
  · rw [rank_tail _ _ _ _ _ _ _ (by omega)]
    simp [bulk,endpoint,polar,hr]

theorem actual_card (m j L b r : ℕ) :
    ((PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card : ℤ) =
      (m+3 : ℤ)*bulk m j L b r+2*endpoint m j L b r := by
  rw [← (Accepted0beeba7c6244e2295e3e804c.obligation.1 _ _ _ _ _ _ _).1]
  exact actual_coeff m j L b r

end
end BoundaryPolarisationR92
#print axioms BoundaryPolarisationR92.actual_coeff
#print axioms BoundaryPolarisationR92.actual_card
