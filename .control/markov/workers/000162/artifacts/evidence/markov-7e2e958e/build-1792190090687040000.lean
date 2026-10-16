import MarkovQShapeM7E2
/-! Machine-authored 7e2e958e. Exact bridge between the positive Q polynomial
and every coefficient of the inherited lift kernel, with zeros retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem q_comp_liftM7E2 (j t m : ℕ) :
 ((qPolyM7E2 j t).comp (X+1)).coeff m=(liftTermMAE9 j t m:ℝ) := by
 simp only [qPolyM7E2,Polynomial.sum_comp,Polynomial.monomial_comp,
   Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul,Polynomial.coeff_X_add_one_pow]
 rw [sum_range_succ]
 have hlast : qCoeffM7E2 j t j*(j.choose m:ℝ)=
   ((t+m+3).choose m:ℝ)*((t+j+3).choose (t+m+3):ℝ) := by
   simp only [qCoeffM7E2,sub_self,qWeightM7E2,show ¬(0:ℤ)<0 by omega,
     if_false,if_true,one_mul,qBinM7E2]
   have h := binomial_product_liftMAE9 j t m
   have hr : (j.choose m:ℝ)*((t+j+3).choose j:ℝ)=
     ((t+m+3).choose m:ℝ)*((t+j+3).choose (t+m+3):ℝ) := by exact_mod_cast h
   nlinarith only [hr]
 rw [hlast]
 have hs : (∑ s ∈ range j, qCoeffM7E2 j t s*(s.choose m:ℝ))=
   4*((t+m+3).choose m:ℝ)*((t+j+4).choose (t+m+5):ℝ) := by
   have hw := weighted_chooseMDAB (t+3) (t+m+3) j (by omega)
   have hw' : (∑ s ∈ range j, ((j:ℝ)-s)*((s+(t+3)).choose (t+m+3):ℝ))=
     ((j+(t+3)+1).choose (t+m+3+2):ℝ) := by exact_mod_cast hw
   calc
    _ = 4*((t+m+3).choose m:ℝ)*
      ∑ s ∈ range j, ((j:ℝ)-s)*((s+(t+3)).choose (t+m+3):ℝ) := by
       rw [mul_sum]
       apply sum_congr rfl
       intro s hs
       have hsj := mem_range.mp hs
       have hh : qWeightM7E2 ((j:ℤ)-s)=4*((j:ℝ)-s) := by
         simp [qWeightM7E2,show ¬(j:ℤ)-s<0 by omega,show (j:ℤ)-s ≠ 0 by omega]
       have hb : (s.choose m:ℝ)*((t+s+3).choose s:ℝ)=
         ((t+m+3).choose m:ℝ)*((t+s+3).choose (t+m+3):ℝ) := by
           exact_mod_cast binomial_product_liftMAE9 s t m
       rw [qCoeffM7E2,hh,qBinM7E2,show s+(t+3)=t+s+3 by omega]
       linear_combination 4*((j:ℝ)-s)*hb
    _ = _ := by rw [hw']; congr 3 <;> omega
 rw [hs]
 unfold liftTermMAE9
 push_cast
 ring

theorem q_poly_degreeM7E2 (j t : ℕ) : (qPolyM7E2 j t).natDegree ≤ j := by
 apply Polynomial.natDegree_le_iff_coeff_eq_zero.mpr
 intro k hk
 rw [q_poly_coeffM7E2]
 simp [qCoeffM7E2,qWeightM7E2,show (j:ℤ)-k<0 by omega]

theorem q_comp_degreeM7E2 (j t : ℕ) : ((qPolyM7E2 j t).comp (X+1)).natDegree ≤ j := by
 have h := Polynomial.natDegree_comp_le (p:=qPolyM7E2 j t) (q:=X+1)
 have hx : (X+1:Polynomial ℝ).natDegree=1 := by compute_degree <;> norm_num
 rw [hx,mul_one] at h
 exact h.trans (q_poly_degreeM7E2 j t)

def ePolyM7E2 (j t : ℕ) : Polynomial ℝ :=
 Polynomial.reflect j ((qPolyM7E2 j t).comp (X+1))

theorem e_poly_coeffM7E2 (j t k : ℕ) (hk : k ≤ j) :
 (ePolyM7E2 j t).coeff k=(liftTermMAE9 j t (j-k):ℝ) := by
 rw [ePolyM7E2,Polynomial.coeff_reflect,Polynomial.revAt_le hk,q_comp_liftM7E2]

theorem e_poly_tailM7E2 (j t k : ℕ) (hk : j < k) : (ePolyM7E2 j t).coeff k=0 := by
 rw [ePolyM7E2,Polynomial.coeff_reflect,Polynomial.revAt_eq_self_of_lt hk]
 exact Polynomial.coeff_eq_zero_of_natDegree_lt ((q_comp_degreeM7E2 j t).trans_lt hk)

end
end MathGKM.Markov
