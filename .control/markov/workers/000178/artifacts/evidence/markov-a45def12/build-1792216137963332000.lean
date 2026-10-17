import MarkovAdjacentConvolutionM09F
import Mathlib.RingTheory.PowerSeries.WellKnown
/-! Machine-authored a45def12. Exact convolution moments; no source LC assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 6000000

def geomMA45 : PowerSeries ℝ := PowerSeries.mk 1
def negBinMA45 (t : ℕ) : PowerSeries ℝ := geomMA45^(t+1)

theorem negBin_coeffMA45 (t n : ℕ) :
 PowerSeries.coeff n (negBinMA45 t) = ((t+n).choose n : ℝ) := by
 rw [negBinMA45,geomMA45,PowerSeries.mk_one_pow_eq_mk_choose_add,PowerSeries.coeff_mk]
 rw [Nat.choose_symm_add]

theorem negBin_mulMA45 (t u : ℕ) :
 negBinMA45 t*negBinMA45 u = negBinMA45 (t+u+1) := by
 unfold negBinMA45
 rw [← pow_add]
 congr 1 <;> omega

theorem negBin_weightMA45 (t : ℕ) :
 PowerSeries.mk (fun n => (n:ℝ)*PowerSeries.coeff n (negBinMA45 t)) =
 PowerSeries.C (t+1:ℝ)* (negBinMA45 (t+1)*PowerSeries.X) := by
 ext n
 cases n with
 | zero => simp
 | succ n =>
   have hx := PowerSeries.coeff_mul_X_pow (negBinMA45 (t+1)) 1 n
   simp only [pow_one] at hx
   simp only [PowerSeries.coeff_mk,PowerSeries.coeff_C_mul,hx,negBin_coeffMA45]
   have h := Nat.choose_succ_right_eq (t+n+1) n
   rw [show t+n+1-n=t+1 by omega] at h
   have h' : ((t+n+1).choose (n+1):ℝ)*(n+1)=((t+n+1).choose n:ℝ)*(t+1) := by exact_mod_cast h
   convert h' using 1 <;> push_cast <;> ring_nf

theorem binomial_momentMA45 (j t u n : ℕ) :
 (∑ p ∈ antidiagonal n, ((j:ℝ)-p.1)*((j:ℝ)-p.2)*
   PowerSeries.coeff p.1 (negBinMA45 t)*PowerSeries.coeff p.2 (negBinMA45 u)) =
 (j:ℝ)*(j-n)*PowerSeries.coeff n (negBinMA45 (t+u+1)) +
 (t+1:ℝ)*(u+1)*PowerSeries.coeff n (negBinMA45 (t+u+3)*PowerSeries.X^2) := by
 let A := PowerSeries.mk (fun i => (i:ℝ)*PowerSeries.coeff i (negBinMA45 t))
 let B := PowerSeries.mk (fun i => (i:ℝ)*PowerSeries.coeff i (negBinMA45 u))
 have hm : A*B = PowerSeries.C ((t+1:ℝ)*(u+1)) *
     (negBinMA45 (t+u+3)*PowerSeries.X^2) := by
   dsimp [A,B]
   rw [negBin_weightMA45,negBin_weightMA45]
   rw [show t+u+3=(t+1)+(u+1)+1 by omega,← negBin_mulMA45,map_mul]
   ring
 calc
  _ = (j:ℝ)*(j-n)*(∑ p ∈ antidiagonal n,
        PowerSeries.coeff p.1 (negBinMA45 t)*PowerSeries.coeff p.2 (negBinMA45 u)) +
      PowerSeries.coeff n (A*B) := by
    rw [PowerSeries.coeff_mul,Finset.mul_sum,← Finset.sum_add_distrib]
    apply sum_congr rfl
    intro p hp
    have hp' : (p.1:ℝ)+p.2=n := by exact_mod_cast (mem_antidiagonal.mp hp)
    simp only [A,B,PowerSeries.coeff_mk]
    linear_combination -(j:ℝ)*PowerSeries.coeff p.1 (negBinMA45 t)*
      PowerSeries.coeff p.2 (negBinMA45 u)*hp'
  _ = _ := by
    rw [← PowerSeries.coeff_mul,negBin_mulMA45,hm,PowerSeries.coeff_C_mul]

end
end MathGKM.Markov
