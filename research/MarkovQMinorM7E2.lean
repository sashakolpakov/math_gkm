import MarkovQKernelM7E2
/-! Machine-authored 7e2e958e. Coefficientwise nonnegative adjacent-parameter
minors, proved by pairing every coefficient summand with its reflection. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def qMinorM7E2 (n m t : ℕ) : Polynomial ℝ :=
 qPolyM7E2 n (t+1)*qPolyM7E2 m t-qPolyM7E2 n t*qPolyM7E2 m (t+1)

def qMinorTermM7E2 (n m t a b : ℕ) : ℝ :=
 qWeightM7E2 ((n:ℤ)-a)*qWeightM7E2 ((m:ℤ)-b)*
 (qBinM7E2 (t+1) a*qBinM7E2 t b-qBinM7E2 t a*qBinM7E2 (t+1) b)

theorem q_minor_pairM7E2 (n m t a b : ℕ) (hmn : m ≤ n) :
 0 ≤ qMinorTermM7E2 n m t a b+qMinorTermM7E2 n m t b a := by
 have h (a b : ℕ) (hab : a ≤ b) :
   0 ≤ qMinorTermM7E2 n m t a b+qMinorTermM7E2 n m t b a := by
   have hp := mul_nonneg (q_weight_minorM7E2 n m a b hmn hab) (q_bin_minorM7E2 t a b hab)
   unfold qMinorTermM7E2
   nlinarith only [hp]
 rcases le_total a b with hab|hba
 · exact h a b hab
 · simpa only [add_comm] using h b a hba

theorem q_minor_coeffM7E2 (n m t k : ℕ) :
 (qMinorM7E2 n m t).coeff k=
 ∑ a ∈ range (k+1), qMinorTermM7E2 n m t a (k-a) := by
 rw [qMinorM7E2,Polynomial.coeff_sub,Polynomial.coeff_mul,Polynomial.coeff_mul]
 simp only [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,q_poly_coeffM7E2]
 rw [←sum_sub_distrib]
 apply sum_congr rfl
 intro a ha
 unfold qCoeffM7E2 qMinorTermM7E2
 ring

theorem q_minor_nonnegM7E2 (n m t k : ℕ) (hmn : m ≤ n) :
 0 ≤ (qMinorM7E2 n m t).coeff k := by
 rw [q_minor_coeffM7E2]
 have hreflect : (∑ a ∈ range (k+1), qMinorTermM7E2 n m t (k-a) a)=
   ∑ a ∈ range (k+1), qMinorTermM7E2 n m t a (k-a) := by
   rw [←sum_range_reflect (fun a => qMinorTermM7E2 n m t a (k-a)) (k+1)]
   apply sum_congr rfl
   intro a ha
   have hak : a ≤ k := by have := mem_range.mp ha; omega
   simp only [show k+1-1=k by omega,show k-(k-a)=a by omega]
 have hsum : 0 ≤ ∑ a ∈ range (k+1),
   (qMinorTermM7E2 n m t a (k-a)+qMinorTermM7E2 n m t (k-a) a) := by
   apply sum_nonneg
   intro a ha
   exact q_minor_pairM7E2 n m t a (k-a) hmn
 rw [sum_add_distrib,hreflect] at hsum
 linarith

end
end MathGKM.Markov
