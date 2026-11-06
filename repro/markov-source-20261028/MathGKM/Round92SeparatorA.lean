import MathGKM.Round92PolarisationA

/- Machine-authored round92. Only the first committed separator and its
unchanged fixed weighted comparison are certified here. -/
namespace BoundaryPolarisationR92
open SparseRankR89 SparseCoupledR90 FullFiberRankR80
noncomputable section
set_option maxHeartbeats 2000000

theorem class_values (r : ℕ) :
    bulk 0 1 8 1 r=(if r=4 then 16 else 0) ∧
    endpoint 0 1 8 1 r=(if r=3 then 6 else if r=5 then 6 else 0) := by
  rw [(class_closed 0 1 8 1 r).1,(class_closed 0 1 8 1 r).2]
  by_cases hr : r≤8
  · interval_cases r <;> norm_num [count,shifted,punctured,Finset.Nat.antidiagonal_succ]
  · have h3 : r≠3 := by omega
    have h4 : r≠4 := by omega
    have h5 : r≠5 := by omega
    simp [hr,h3,h4,h5]

theorem actual_values (r : ℕ) :
    (rankPoly 6 0 1 8 1 1).coeff r=
      if r=3 then 12 else if r=4 then 48 else if r=5 then 12 else 0 := by
  have hh := actual_coeff 0 1 8 1 r
  norm_num only at hh
  rw [hh,(class_values r).1,(class_values r).2]
  split_ifs <;> omega

theorem card_values (r : ℕ) :
    (PairConvolutionR78.P 6 0 1 8 1 1 r).card=
      if r=3 then 12 else if r=4 then 48 else if r=5 then 12 else 0 := by
  have hh := (Accepted0beeba7c6244e2295e3e804c.obligation.1 6 0 1 8 1 1 r).1
  rw [actual_values] at hh
  split_ifs at * <;> exact_mod_cast hh.symm

theorem separator :
    2*(3:ℕ)<8 ∧ 8=2*(3:ℕ)+2 ∧
    bulk 0 1 8 1 3=0 ∧ bulk 0 1 8 1 4=16 ∧
    endpoint 0 1 8 1 3=6 ∧ endpoint 0 1 8 1 4=0 ∧
    endpoint 0 1 8 1 4<endpoint 0 1 8 1 3 ∧
    (PairConvolutionR78.P 6 0 1 8 1 1 3).card=12 ∧
    (PairConvolutionR78.P 6 0 1 8 1 1 4).card=48 ∧
    (PairConvolutionR78.P 6 0 1 8 1 1 3).card<
      (PairConvolutionR78.P 6 0 1 8 1 1 4).card ∧
    ((PairConvolutionR78.P 6 0 1 8 1 1 4).card : ℤ)-
      ((PairConvolutionR78.P 6 0 1 8 1 1 3).card : ℤ)=36 ∧
    ¬(∀ m j L b r : ℕ, 2*r<L → endpoint m j L b r≤endpoint m j L b (r+1)) := by
  refine ⟨by omega,by omega,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
  · norm_num [(class_values 3).1]
  · norm_num [(class_values 4).1]
  · norm_num [(class_values 3).2]
  · norm_num [(class_values 4).2]
  · norm_num [(class_values 3).2,(class_values 4).2]
  · norm_num [card_values]
  · norm_num [card_values]
  · norm_num [card_values]
  · norm_num [card_values]
  · intro h
    have hh := h 0 1 8 1 3 (by omega)
    norm_num [(class_values 3).2,(class_values 4).2] at hh

end
end BoundaryPolarisationR92
#print axioms BoundaryPolarisationR92.class_values
#print axioms BoundaryPolarisationR92.separator
