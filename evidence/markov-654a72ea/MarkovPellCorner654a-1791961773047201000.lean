import MarkovPellLowerSmall654a
/-! Machine-authored 654a72ea. Raw first lower-band horizontal corner. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem lower_corner_large654a (k : ℕ) :
 coeff (rightP650 (k+4)) 0 (k+6)*coeff (rightP650 (k+4)) 2 (k+6) ≤
 coeff (rightP650 (k+4)) 1 (k+6)^2 := by
 obtain ⟨h0,h1,h2⟩ := right_jets650 k
 have e0 : coeff (rightP650 (k+4)) 0 (k+6)=1 := by
   unfold coeff
   rw [h0]
   simp [Polynomial.coeff_X_pow_mul',add_comm X 1,Polynomial.coeff_one_add_X_pow]
 have e1 : coeff (rightP650 (k+4)) 1 (k+6)=7*(k:ℤ)+25 := by
   unfold coeff
   rw [h1,mul_assoc,Polynomial.coeff_X_pow_mul']
   simp only [show k+5 ≤ k+6 by omega,if_true,show k+6-(k+5)=1 by omega]
   norm_num [Polynomial.coeff_mul,Finset.Nat.antidiagonal_succ,Finset.Nat.antidiagonal_zero,
     add_comm X 1,Polynomial.coeff_one_add_X_pow,
     Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_succ]
   ring
 have e2 : 2*coeff (rightP650 (k+4)) 2 (k+6)=49*(k:ℤ)^2+255*k+344 := by
   have hh := congrArg (fun p : Polynomial ℤ => p.coeff (k+6)) h2
   rw [mul_assoc,Polynomial.coeff_X_pow_mul'] at hh
   simp only [show k+4 ≤ k+6 by omega,if_true,show k+6-(k+4)=2 by omega] at hh
   norm_num [rightR650,Polynomial.coeff_ofNat_mul,Polynomial.coeff_mul,
     Finset.Nat.antidiagonal_succ,Finset.Nat.antidiagonal_zero,
     add_comm X 1,Polynomial.coeff_one_add_X_pow,
     Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_X_pow,
     Polynomial.coeff_ofNat_succ] at hh
   have hc := choose_two_rat26ca k
   have hhq := congrArg (fun z : ℤ => (z:ℚ)) hh
   push_cast at hhq
   rw [hc] at hhq
   have he : (2*coeff (rightP650 (k+4)) 2 (k+6) : ℚ)=
       49*(k:ℚ)^2+255*k+344 := by
     unfold coeff
     linear_combination hhq
   exact_mod_cast he
 rw [e0,e1,one_mul]
 nlinarith [sq_nonneg (k:ℤ),show (0:ℤ) ≤ k by positivity]

#print axioms lower_corner_large654a
end
end MathGKM.Markov
