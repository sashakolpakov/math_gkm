import MarkovQMinorM7E2
/-! Machine-authored 7e2e958e. Uniform coefficientwise log-concavity in the
parameter of the negative-binomial auxiliary polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem q_poly_zeroM7E2 (t : ℕ) : qPolyM7E2 0 t=1 := by
 simp [qPolyM7E2,qCoeffM7E2,qWeightM7E2,qBinM7E2]

theorem q_poly_pascalM7E2 (j t : ℕ) :
 qPolyM7E2 (j+1) (t+1)=qPolyM7E2 (j+1) t+X*qPolyM7E2 j (t+1) := by
 ext k
 cases k with
 | zero => simp [q_poly_coeffM7E2,qCoeffM7E2,qBinM7E2]
 | succ k =>
   simp only [Polynomial.coeff_add,Polynomial.coeff_X_mul,q_poly_coeffM7E2,qCoeffM7E2]
   rw [show ((j+1:ℕ):ℤ)-(k+1)=(j:ℤ)-k by omega]
   have h : qBinM7E2 (t+1) (k+1)=qBinM7E2 t (k+1)+qBinM7E2 (t+1) k := by
     unfold qBinM7E2
     rw [show t+1+(k+1)+3=(t+k+4)+1 by omega,
       show t+(k+1)+3=t+k+4 by omega,show t+1+k+3=t+k+4 by omega]
     exact_mod_cast (Nat.add_comm _ _).trans (Nat.choose_succ_succ (t+k+4) k).symm |>.symm
   rw [h]
   ring

theorem q_poly_prefixM7E2 (j t : ℕ) :
 qPolyM7E2 j (t+1)=∑ k ∈ range (j+1), X^k*qPolyM7E2 (j-k) t := by
 induction j with
 | zero => simp [q_poly_zeroM7E2]
 | succ j ih =>
   rw [q_poly_pascalM7E2,ih,sum_range_succ']
   simp only [Nat.sub_zero,pow_zero,one_mul]
   have he : (∑ k ∈ range (j+1), X^(k+1)*qPolyM7E2 (j+1-(k+1)) t)=
     X*∑ k ∈ range (j+1), X^k*qPolyM7E2 (j-k) t := by
     rw [mul_sum]
     apply sum_congr rfl
     intro k hk
     rw [show j+1-(k+1)=j-k by omega,pow_succ']
     ring
   rw [he]
   ring

theorem q_gap_sumM7E2 (j t : ℕ) :
 qPolyM7E2 j (t+1)^2-qPolyM7E2 j t*qPolyM7E2 j (t+2)=
 ∑ k ∈ range (j+1), X^k*qMinorM7E2 j (j-k) t := by
 have h0 := q_poly_prefixM7E2 j t
 have h1 := q_poly_prefixM7E2 j (t+1)
 rw [show t+1+1=t+2 by omega] at h1
 calc
  _ = qPolyM7E2 j (t+1)*(∑ k ∈ range (j+1),X^k*qPolyM7E2 (j-k) t)-
    qPolyM7E2 j t*(∑ k ∈ range (j+1),X^k*qPolyM7E2 (j-k) (t+1)) := by
      rw [←h0,←h1]; ring
  _ = _ := by
    rw [mul_sum,mul_sum,←sum_sub_distrib]
    apply sum_congr rfl
    intro k hk
    unfold qMinorM7E2
    ring

theorem q_gap_nonnegM7E2 (j t k : ℕ) :
 0 ≤ (qPolyM7E2 j (t+1)^2-qPolyM7E2 j t*qPolyM7E2 j (t+2)).coeff k := by
 rw [q_gap_sumM7E2,Polynomial.finsetSum_coeff]
 apply sum_nonneg
 intro s hs
 rw [Polynomial.coeff_X_pow_mul']
 split_ifs
 · exact q_minor_nonnegM7E2 j (j-s) t _ (by omega)
 · exact le_rfl

end
end MathGKM.Markov
