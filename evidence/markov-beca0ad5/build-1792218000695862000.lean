import MarkovUpperReductionMA45
/-! Machine-authored beca0ad5. Next-to-final adjacent ratio, all parameters. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem second_top_scalarMBEC (x j : ℝ) (hx : 1<x) (hj : 1≤j) :
 (16*j*(j-1)/(x*(x+1))+16*j^2/(x+1)^2)*(4*j*(1/x+1/(x+2))) ≤
 (8*j/(x+1))*(8*j*(j-1)*(1/(x*(x-1))+1/((x+2)*(x+1)))+16*j^2/(x*(x+2))) := by
 have h0 : x≠0 := by linarith
 have h1 : x-1≠0 := by linarith
 have h2 : x+1≠0 := by linarith
 have h3 : x+2≠0 := by linarith
 have he :
 (8*j/(x+1))*(8*j*(j-1)*(1/(x*(x-1))+1/((x+2)*(x+1)))+16*j^2/(x*(x+2)))-
 (16*j*(j-1)/(x*(x+1))+16*j^2/(x+1)^2)*(4*j*(1/x+1/(x+2))) =
 128*j^2*(j-1)*(2*x+1)/(x^2*(x-1)*(x+1)^2*(x+2)) := by
   field_simp
   <;> ring
 have hz : 0 ≤ 128*j^2*(j-1)*(2*x+1)/(x^2*(x-1)*(x+1)^2*(x+2)) := by
   apply div_nonneg
   · have : 0≤j-1 := by linarith
     positivity
   · have : 0<x-1 := by linarith
     positivity
 linarith

theorem q_second_top_coeffMBEC (k s : ℕ) :
 (qPolyM7E2 (k+2) s).coeff k=8*((s+k+3).choose k:ℝ) := by
 rw [q_interior_coeffMA45 (k+2) s k (by omega),negBin_coeffMA45]
 rw [show s+3+k=s+k+3 by omega]
 push_cast
 ring

theorem q_product_second_topMBEC (k s t : ℕ) :
 (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) t).coeff (2*k+2) =
 8*((s+k+5).choose (k+2):ℝ)*((t+k+3).choose k:ℝ)+
 16*((s+k+4).choose (k+1):ℝ)*((t+k+4).choose (k+1):ℝ)+
 8*((s+k+3).choose k:ℝ)*((t+k+5).choose (k+2):ℝ) := by
 have h := congrArg (fun P : ℝ[X] => P.coeff 2)
   (reflect_mul (qPolyM7E2 (k+2) s) (qPolyM7E2 (k+2) t)
     (q_poly_degreeM7E2 _ _) (q_poly_degreeM7E2 _ _))
 rw [coeff_reflect,Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at h
 simp only [Finset.sum_range_succ,Finset.sum_range_zero,zero_add] at h
 norm_num only [Nat.reduceSub,coeff_reflect,revAt_le (by omega : 2≤k+2+k+2),
   revAt_le (by omega : 0≤k+2),revAt_le (by omega : 1≤k+2),revAt_le (by omega : 2≤k+2)] at h
 rw [show k+2+(k+2)-2=2*k+2 by omega,show k+2-0=k+2 by omega,
   show k+2-1=k+1 by omega,show k+2-2=k by omega] at h
 simp only [q_second_top_coeffMBEC,
   show k+2=(k+1)+1 by omega,q_top_coeffMA45,q_pretop_coeffMA45] at h
 convert h using 1 <;> ring

end
end MathGKM.Markov
