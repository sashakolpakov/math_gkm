import MarkovMarkedOneCutC416
/-! Machine-authored c4169865. An unbounded actual-source obstruction to
arbitrary positive degree deformation, already at one selected cut. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

theorem smooth_pure_topC416 (k j : ℕ) :
 ((1+X)*purePolyFe01 k).coeff (j+2)=
 if k=j then 1 else if k=j+1 then 3 else if j+2≤k then 4 else 0 := by
 rw [smooth_coeff9c20]
 simp only [pure_coeff9c20]
 split_ifs <;> norm_num at * <;> omega

theorem smooth_reset_topC416 (k j : ℕ) :
 ((1+X)*resetPolyFe01 k).coeff (j+2)=
 if k=j+1 then 2 else if j+2≤k then 4 else 0 := by
 rw [smooth_coeff9c20]
 simp only [reset_coeff9c20]
 split_ifs <;> norm_num at * <;> omega

def oneADeformedC416 (n : ℕ) (z : ℝ) : ℝ[X] :=
 degreeCoeff07a7 X (C z) X 1 1 (central28 (oneAPath68 n)++[true]) 1

theorem oneA_top_coeffsC416 (m : ℕ) (z : ℝ) :
 (oneADeformedC416 (m+3) z).coeff (m+2)=3*z^(m+2)+7*z^(m+3)+10*z^(m+4) ∧
 (oneADeformedC416 (m+3) z).coeff (m+3)=3*z^(m+3)+9*z^(m+4) ∧
 (oneADeformedC416 (m+3) z).coeff (m+4)=4*z^(m+4) := by
 have hp (j : ℕ) (hj : m≤j) :
     (∑ k ∈ range m,z^(k+2)*((1+X)*purePolyFe01 k).coeff (j+2))=0 := by
   apply sum_eq_zero
   intro k hk
   have hk' : k < m := mem_range.mp hk
   simp [smooth_pure_topC416,show k≠j by omega,show k≠j+1 by omega,
     show ¬j+2≤k by omega]
 have hr (j : ℕ) (hj : m≤j) :
     (∑ k ∈ range m,z^(k+1)*((1+X)*resetPolyFe01 k).coeff (j+2))=0 := by
   apply sum_eq_zero
   intro k hk
   have hk' : k < m := mem_range.mp hk
   simp [smooth_reset_topC416,show k≠j+1 by omega,show ¬j+2≤k by omega]
 have he (j : ℕ) : (oneADeformedC416 (m+3) z).coeff j=
     (∑ k ∈ range (m+3),z^(k+2)*((1+X)*purePolyFe01 k).coeff j)+
     z^(m+4)*(purePolyFe01 (m+3)).coeff j+
     ∑ k ∈ range (m+4),z^(k+1)*((1+X)*resetPolyFe01 k).coeff j := by
   rw [oneADeformedC416,marked_oneA_formulaC416]
   simp only [Polynomial.coeff_add,Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul]
 constructor
 · rw [he]
   simp only [Finset.sum_range_succ]
   rw [hp m (by omega),hr m (by omega)]
   simp (disch := omega) [smooth_pure_topC416,smooth_reset_topC416,pure_coeff9c20]
   split_ifs <;> (first | omega | ring)
 constructor
 · rw [he]
   change _=3*z^((m+1)+2)+9*z^(m+4)
   simp only [Finset.sum_range_succ]
   rw [hp (m+1) (by omega),hr (m+1) (by omega)]
   simp (disch := omega) [smooth_pure_topC416,smooth_reset_topC416,pure_coeff9c20]
   split_ifs <;> (first | omega | ring)
 · rw [he]
   simp only [Finset.sum_range_succ]
   rw [hp (m+2) (by omega),hr (m+2) (by omega)]
   simp (disch := omega) [smooth_pure_topC416,smooth_reset_topC416,pure_coeff9c20]
   split_ifs <;> (first | omega | ring)

theorem oneA_marked_gapC416 (m : ℕ) (z : ℝ) :
 (oneADeformedC416 (m+3) z).coeff (m+3)^2-
 (oneADeformedC416 (m+3) z).coeff (m+2)*(oneADeformedC416 (m+3) z).coeff (m+4)=
 z^(2*(m+3))*(-3+26*z+41*z^2) := by
 obtain ⟨h0,h1,h2⟩ := oneA_top_coeffsC416 m z
 rw [h0,h1,h2]
 simp only [pow_add,pow_mul]
 ring

theorem oneA_marked_failureC416 (m : ℕ) :
 (oneADeformedC416 (m+3) (1/100)).coeff (m+3)^2 <
 (oneADeformedC416 (m+3) (1/100)).coeff (m+2)*
   (oneADeformedC416 (m+3) (1/100)).coeff (m+4) := by
 have h := oneA_marked_gapC416 m (1/100)
 have hn : (0:ℝ)<(1/100:ℝ)^(2*(m+3)) := pow_pos (by norm_num) _
 norm_num at h
 nlinarith

#print axioms oneA_top_coeffsC416
#print axioms oneA_marked_gapC416
#print axioms oneA_marked_failureC416
end
end MathGKM.Markov
