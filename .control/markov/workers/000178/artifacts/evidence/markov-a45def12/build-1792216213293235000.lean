import MarkovBinomialMomentsMA45
/-! Machine-authored a45def12. Exact unshifted convolution below the cutoff. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 6000000

theorem q_interior_coeffMA45 (j s n : ℕ) (hn : n < j) :
 (qPolyM7E2 j s).coeff n = 4*((j:ℝ)-n)*PowerSeries.coeff n (negBinMA45 (s+3)) := by
 rw [q_poly_coeffM7E2,qCoeffM7E2,qWeightM7E2,
   if_neg (by omega : ¬ (j:ℤ)-n<0),if_neg (by omega : (j:ℤ)-n≠0)]
 simp only [Int.cast_sub,Int.cast_natCast,qBinM7E2,negBin_coeffMA45]
 rw [show s+3+n=s+n+3 by omega]

theorem q_product_interiorMA45 (j s t n : ℕ) (hn : n < j) :
 (qPolyM7E2 j s*qPolyM7E2 j t).coeff n =
 16*((j:ℝ)*(j-n)*PowerSeries.coeff n (negBinMA45 (s+t+7)) +
 (s+4:ℝ)*(t+4)*PowerSeries.coeff n (negBinMA45 (s+t+9)*PowerSeries.X^2)) := by
 rw [Polynomial.coeff_mul]
 have H := binomial_momentMA45 j (s+3) (t+3) n
 rw [show s+3+(t+3)+1=s+t+7 by omega,
     show s+3+(t+3)+3=s+t+9 by omega] at H
 push_cast at H
 rw [show (s:ℝ)+3+1=s+4 by ring,show (t:ℝ)+3+1=t+4 by ring] at H
 rw [← H,Finset.mul_sum]
 apply sum_congr rfl
 intro p hp
 have hp' := mem_antidiagonal.mp hp
 rw [q_interior_coeffMA45 j s p.1 (by omega),q_interior_coeffMA45 j t p.2 (by omega)]
 ring

theorem second_moment_scaleMA45 (t n : ℕ) :
 (t+1:ℝ)*(t+2)*PowerSeries.coeff n (negBinMA45 (t+2)*PowerSeries.X^2) =
 (n:ℝ)*(n-1)*PowerSeries.coeff n (negBinMA45 t) := by
 cases n with
 | zero => simp [PowerSeries.coeff_mul_X_pow']
 | succ n =>
   cases n with
   | zero => norm_num [PowerSeries.coeff_mul_X_pow']
   | succ n =>
     rw [show n+1+1=n+2 by omega,PowerSeries.coeff_mul_X_pow,negBin_coeffMA45,negBin_coeffMA45]
     have h0 := Nat.choose_succ_right_eq (t+n+2) n
     have h1 := Nat.choose_succ_right_eq (t+n+2) (n+1)
     rw [show t+n+2-n=t+2 by omega] at h0
     rw [show t+n+2-(n+1)=t+1 by omega] at h1
     have h0' : ((t+n+2).choose (n+1):ℝ)*(n+1)=((t+n+2).choose n:ℝ)*(t+2) := by exact_mod_cast h0
     have h1' : ((t+n+2).choose (n+2):ℝ)*(n+2)=((t+n+2).choose (n+1):ℝ)*(t+1) := by exact_mod_cast h1
     rw [show t+2+n=t+n+2 by omega,show t+(n+2)=t+n+2 by omega]
     push_cast
     linear_combination -(t+1:ℝ)*h0'-(n+1:ℝ)*h1'

theorem q_product_scaledMA45 (j s t n : ℕ) (hn : n < j) :
 (s+t+8:ℝ)*(s+t+9)*(qPolyM7E2 j s*qPolyM7E2 j t).coeff n =
 16*((s+t+n+7).choose n:ℝ)*
   ((s+t+8:ℝ)*(s+t+9)*(j:ℝ)*(j-n)+(s+4:ℝ)*(t+4)*(n:ℝ)*(n-1)) := by
 rw [q_product_interiorMA45 j s t n hn]
 have H := second_moment_scaleMA45 (s+t+7) n
 rw [show s+t+7+2=s+t+9 by omega] at H
 simp only [negBin_coeffMA45] at H ⊢
 push_cast at H
 rw [show s+t+7+n=s+t+n+7 by omega] at H ⊢
 linear_combination 16*(s+4:ℝ)*(t+4)*H

end
end MathGKM.Markov
