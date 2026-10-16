import MarkovWindowLC6d34
import MarkovBinomialLiftMAE9
/-! Machine-authored 7e2e958e. The negative-binomial kernel and the actual
positive weight sequence. No source log-concavity premise is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def qWeightM7E2 (k : ℤ) : ℝ := if k<0 then 0 else if k=0 then 1 else 4*k

theorem q_weight_nonnegM7E2 (k : ℤ) : 0 ≤ qWeightM7E2 k := by
 unfold qWeightM7E2
 split_ifs <;> first | positivity | (have : (0:ℝ) ≤ k := by exact_mod_cast (show 0 ≤ k by omega); positivity)

theorem q_weight_crossM7E2 : CrossLC qWeightM7E2 := by
 intro i j hij
 by_cases hi : i<0
 · rw [show qWeightM7E2 i=0 by simp [qWeightM7E2,hi],zero_mul]
   exact mul_nonneg (q_weight_nonnegM7E2 _) (q_weight_nonnegM7E2 _)
 by_cases hi0 : i=0
 · subst i
   by_cases hj0 : j=0
   · subst j; norm_num [qWeightM7E2]
   have hj : (1:ℝ) ≤ j := by exact_mod_cast (show 1 ≤ j by omega)
   simp only [qWeightM7E2,show ¬(0:ℤ)<0 by omega,show ¬j<0 by omega,
     show ¬j+1<0 by omega,show ¬(1:ℤ)<0 by omega,if_false,if_true,hj0,
     show j+1 ≠ 0 by omega,show (1:ℤ) ≠ 0 by omega,Int.cast_add,Int.cast_one]
   norm_num
   linarith
 have hi' : (1:ℝ) ≤ i := by exact_mod_cast (show 1 ≤ i by omega)
 have hij' : (i:ℝ) ≤ j := by exact_mod_cast hij
 simp only [qWeightM7E2,hi,hi0,show ¬j<0 by omega,show j ≠ 0 by omega,
   show ¬i+1<0 by omega,show i+1 ≠ 0 by omega,
   show ¬j+1<0 by omega,show j+1 ≠ 0 by omega,if_false,Int.cast_add,Int.cast_one]
 nlinarith

def qBinM7E2 (t s : ℕ) : ℝ := ((t+s+3).choose s:ℝ)
def qCoeffM7E2 (j t s : ℕ) : ℝ := qWeightM7E2 ((j:ℤ)-s)*qBinM7E2 t s
def qPolyM7E2 (j t : ℕ) : Polynomial ℝ :=
 ∑ s ∈ range (j+1), monomial s (qCoeffM7E2 j t s)

theorem q_poly_coeffM7E2 (j t s : ℕ) : (qPolyM7E2 j t).coeff s=qCoeffM7E2 j t s := by
 classical
 simp only [qPolyM7E2,Polynomial.finsetSum_coeff,Polynomial.coeff_monomial]
 rw [sum_ite_eq']
 by_cases hs : s ≤ j
 · simp [hs,show s<j+1 by omega]
 · simp [show ¬s<j+1 by omega,qCoeffM7E2,qWeightM7E2,show (j:ℤ)-s<0 by omega]

theorem q_bin_stepM7E2 (t s : ℕ) :
 qBinM7E2 (t+1) s*(t+4)=qBinM7E2 t s*(t+s+4) := by
 have h := Nat.choose_mul_succ_eq (t+s+3) s
 unfold qBinM7E2
 have he : t+s+3+1-s=t+4 := by omega
 rw [he] at h
 exact_mod_cast (by simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using h.symm)

theorem q_bin_minorM7E2 (t a b : ℕ) (hab : a ≤ b) :
 0 ≤ qBinM7E2 (t+1) b*qBinM7E2 t a-qBinM7E2 (t+1) a*qBinM7E2 t b := by
 have ha := q_bin_stepM7E2 t a
 have hb := q_bin_stepM7E2 t b
 have hp : 0 < (t:ℝ)+4 := by positivity
 have hn : 0 ≤ qBinM7E2 t a*qBinM7E2 t b*((b:ℝ)-a) := by
   unfold qBinM7E2
   have : (a:ℝ) ≤ b := by exact_mod_cast hab
   positivity
 have he : (qBinM7E2 (t+1) b*qBinM7E2 t a-qBinM7E2 (t+1) a*qBinM7E2 t b)*((t:ℝ)+4)=
   qBinM7E2 t a*qBinM7E2 t b*((b:ℝ)-a) := by
   linear_combination qBinM7E2 t a*hb-qBinM7E2 t b*ha
 exact nonneg_of_mul_nonneg_left (by rw [he]; exact hn) hp

theorem q_weight_minorM7E2 (n m a b : ℕ) (hmn : m ≤ n) (hab : a ≤ b) :
 0 ≤ qWeightM7E2 ((n:ℤ)-b)*qWeightM7E2 ((m:ℤ)-a)-
   qWeightM7E2 ((n:ℤ)-a)*qWeightM7E2 ((m:ℤ)-b) := by
 have h := crossLC_balanced6d34 q_weight_crossM7E2 ((m:ℤ)-b) (n-m) (b-a)
 rw [show (m:ℤ)-b+↑(n-m)+↑(b-a)=(n:ℤ)-a by omega,
   show (m:ℤ)-b+↑(n-m)=(n:ℤ)-b by omega,
   show (m:ℤ)-b+↑(b-a)=(m:ℤ)-a by omega] at h
 nlinarith only [h]

end
end MathGKM.Markov
