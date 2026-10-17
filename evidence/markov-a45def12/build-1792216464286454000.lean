import MarkovLowAdjacentMA45
/-! Machine-authored a45def12. Restores both exceptional endpoint weights exactly. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 6000000

theorem q_endpoint_coeffMA45 (j s : ℕ) :
 (qPolyM7E2 j s).coeff j = ((s+j+3).choose j:ℝ) := by
 simp [q_poly_coeffM7E2,qCoeffM7E2,qWeightM7E2,qBinM7E2]

theorem q_zero_coeffMA45 (j s : ℕ) (hj : 0 < j) :
 (qPolyM7E2 j s).coeff 0 = 4*(j:ℝ) := by
 rw [q_interior_coeffMA45 j s 0 hj,negBin_coeffMA45]
 simp

theorem q_product_cutoffMA45 (j s t : ℕ) (hj : 0 < j) :
 (qPolyM7E2 j s*qPolyM7E2 j t).coeff j =
 16*(s+4:ℝ)*(t+4)*PowerSeries.coeff j (negBinMA45 (s+t+9)*PowerSeries.X^2) +
 4*(j:ℝ)*(((s+j+3).choose j:ℝ)+((t+j+3).choose j:ℝ)) := by
 have H := binomial_momentMA45 j (s+3) (t+3) j
 rw [show s+3+(t+3)+3=s+t+9 by omega] at H
 simp only [sub_self,mul_zero,zero_mul,zero_add] at H
 push_cast at H
 have he (p : ℕ×ℕ) (hp : p ∈ antidiagonal j) :
   (qPolyM7E2 j s).coeff p.1*(qPolyM7E2 j t).coeff p.2 =
   16*(((j:ℝ)-p.1)*((j:ℝ)-p.2)*PowerSeries.coeff p.1 (negBinMA45 (s+3))*
     PowerSeries.coeff p.2 (negBinMA45 (t+3))) +
   (if p=(0,j) then 4*(j:ℝ)*((t+j+3).choose j:ℝ) else 0) +
   (if p=(j,0) then 4*(j:ℝ)*((s+j+3).choose j:ℝ) else 0) := by
   rcases p with ⟨a,b⟩
   have hab := mem_antidiagonal.mp hp
   by_cases ha : a=0
   · subst a
     have hb : b=j := by simpa using hab
     subst b
     simp [q_zero_coeffMA45 j s hj,q_endpoint_coeffMA45,show j≠0 by omega]
   by_cases hb : b=0
   · subst b
     have ha' : a=j := by simpa using hab
     subst a
     simp [q_zero_coeffMA45 j t hj,q_endpoint_coeffMA45,show j≠0 by omega,mul_comm]
   have ha' : a<j := by omega
   have hb' : b<j := by omega
   rw [q_interior_coeffMA45 j s a ha',q_interior_coeffMA45 j t b hb']
   simp only [Prod.mk.injEq,ha,hb,false_and,and_false,ite_false,add_zero]
   ring
 rw [Polynomial.coeff_mul]
 simp_rw [Finset.sum_congr rfl he,Finset.sum_add_distrib,← Finset.mul_sum]
 rw [H]
 simp only [Finset.sum_ite_eq']
 rw [if_pos (mem_antidiagonal.mpr (by omega : 0+j=j)),
   if_pos (mem_antidiagonal.mpr (by omega : j+0=j))]
 ring

theorem q_product_cutoff_succMA45 (k s t : ℕ) :
 (qPolyM7E2 (k+2) s*qPolyM7E2 (k+2) t).coeff (k+2) =
 16*(s+4:ℝ)*(t+4)*((s+t+k+9).choose k:ℝ) +
 4*(k+2:ℝ)*(((s+k+5).choose (k+2):ℝ)+((t+k+5).choose (k+2):ℝ)) := by
 rw [q_product_cutoffMA45 (k+2) s t (by omega),PowerSeries.coeff_mul_X_pow,negBin_coeffMA45]
 rw [show s+t+9+k=s+t+k+9 by omega,show s+(k+2)+3=s+k+5 by omega,
   show t+(k+2)+3=t+k+5 by omega]
 push_cast
 ring

end
end MathGKM.Markov
