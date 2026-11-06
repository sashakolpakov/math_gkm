import MathGKM.Accepted3d0e4c4749b275fe22faf50e
/- Machine-authored round93. Exact compensation; no class-sign assumptions. -/
namespace BoundaryCompensationR93
open BoundaryPolarisationR92
noncomputable section

def increment (m j L b r : ℕ) : ℤ :=
  (m+3 : ℤ)*(bulk m j L b (r+1)-bulk m j L b r)+
    2*(endpoint m j L b (r+1)-endpoint m j L b r)

theorem card_increment (m j L b r : ℕ) :
    ((PairConvolutionR78.P (2*(m+3)) 0 j L 1 b (r+1)).card : ℤ)-
      ((PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card : ℤ)=
      increment m j L b r := by
  rw [Accepted3d0e4c4749b275fe22faf50e.obligation.2.2.2.2 m j L b (r+1),
      Accepted3d0e4c4749b275fe22faf50e.obligation.2.2.2.2 m j L b r]
  unfold increment
  ring

theorem comparison_iff (m j L b r : ℕ) :
    (0 ≤ increment m j L b r) ↔
    (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card ≤
      (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b (r+1)).card := by
  rw [← card_increment,sub_nonneg]
  exact_mod_cast (Iff.rfl :
    (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b r).card ≤
      (PairConvolutionR78.P (2*(m+3)) 0 j L 1 b (r+1)).card ↔ _)

theorem central_iff (m j i b : ℕ) :
    (0 ≤ (m+3 : ℤ)*(bulk m j (2*i+2) b (i+1)-bulk m j (2*i+2) b i)+
      2*(endpoint m j (2*i+2) b (i+1)-endpoint m j (2*i+2) b i)) ↔
    (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b i).card ≤
      (PairConvolutionR78.P (2*(m+3)) 0 j (2*i+2) 1 b (i+1)).card :=
  comparison_iff m j (2*i+2) b i
end
end BoundaryCompensationR93
#print axioms BoundaryCompensationR93.card_increment
#print axioms BoundaryCompensationR93.comparison_iff
#print axioms BoundaryCompensationR93.central_iff
