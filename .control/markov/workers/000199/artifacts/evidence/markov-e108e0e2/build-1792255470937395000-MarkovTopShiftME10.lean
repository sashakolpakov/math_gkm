import MarkovTopParameterME10
import MarkovCorrectionPositiveSumM80F
import MarkovTopVandermondeMEB6
/-! Machine-authored e108e0e2. Shifted positive template kernel, allowing
the signed offsets -4,-3,-2,-1 without natural subtraction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset Finset.Nat
set_option maxHeartbeats 8000000

def topKernelME10 (h i s : ℕ) : ℤ :=
 (s.choose i:ℤ)*((h+s+i+4).choose (i+3):ℤ)
def topMassME10 (h T i : ℕ) : ℤ := topLinearM55C T (topKernelME10 h i)
def topShortME10 (h T i : ℕ) : ℤ :=
 ∑ l ∈ range (i+4), ((i+l).choose i:ℤ)*((h+2*i+4).choose (i+3-l):ℤ)*
 ((T.choose (i+l):ℤ)+4*((T+1).choose (i+l+2):ℤ))

theorem top_linear_secondME10 (f : ℕ → ℤ) (T : ℕ) :
 topLinearM55C (T+2) f-2*topLinearM55C (T+1) f+topLinearM55C T f=
 f (T+2)+2*f (T+1)+f T := by
 have hw (n : ℕ) : topLinearM55C n f=f n+
     4*(weightedCorrectionM80F (fun s => C (f s)) (n+1)).coeff 0 := by
   simp only [topLinearM55C,weightedCorrectionM80F,finsetSum_coeff,coeff_C_mul,coeff_C_zero]
   rw [sum_range_succ]
   simp only [Nat.cast_add,Nat.cast_one]
   have he : ((n:ℤ)+1-1-n)=0 := by ring
   rw [he,zero_mul,add_zero]
   congr 2
   apply sum_congr rfl
   intro s hs
   ring
 have hs := congrArg (fun p : Polynomial ℤ => p.coeff 0)
   (weighted_correction_stepM80F (fun s => C (f s)) (T+1))
 simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_C_zero] at hs
 rw [hw (T+2),hw (T+1),hw T]
 rw [show T+1+2=T+2+1 by omega] at hs
 linear_combination 4*hs

theorem top_shift_deltaME10 (h T i : ℕ) :
 (topDiagonalDeltaMB3E (2*T+h+2) (T+3)).coeff (i+3)=topKernelME10 h i T := by
 rw [top_delta_highMB3E _ _ _ (by omega),if_pos (by omega : 3 ≤ T+3)]
 simp only [topKernelME10,show T+3-3=T by omega,
   show 2*T+h+2+5-(T+3)+i=h+T+i+4 by omega]

theorem top_shift_massME10 (h T i : ℕ) :
 (topTemplateMB3E (2*T+h+2) (T+3)).coeff (i+3)=topMassME10 h T i := by
 induction T using Nat.twoStepInduction with
 | zero =>
   have he := (top_five_formulaME87 (h+2) (by omega)).2.2.2.1
   simp only [Nat.mul_zero,zero_add,Nat.zero_add] at *
   rw [he]
   cases i <;> simp [topMassME10,topLinearM55C,topKernelME10,coeff_C_mul,
     show ∀ i : ℕ, i+1+3≠1 by omega,show ∀ i : ℕ, i+1+3≠2 by omega]
 | one =>
   have he := (top_five_formulaME87 (h+4) (by omega)).2.2.2.2
   rw [show 2*1+h+2=h+4 by omega,show 1+3=4 by rfl,he]
   rcases i with _|_|i
   all_goals simp [topMassME10,topLinearM55C,topKernelME10,sum_range_succ,coeff_C_mul,
     show ∀ i : ℕ, i+2+3≠1 by omega,show ∀ i : ℕ, i+2+3≠2 by omega,
     show ∀ i : ℕ, i+2+3≠3 by omega,show ∀ i : ℕ, i+2+3≠4 by omega,
     Nat.choose_eq_zero_of_lt (show ∀ i : ℕ, 1<i+2 by omega)]
 | more T h0 h1 =>
   have he := congrArg (fun p : Polynomial ℤ => p.coeff (i+3))
     (top_diagonal_equationME10 (2*T+h+2) (T+3) (by omega))
   simp only [coeff_sub,coeff_add,coeff_ofNat_mul] at he
   rw [show 2*T+h+2+4=2*(T+2)+h+2 by omega,
     show 2*T+h+2+2=2*(T+1)+h+2 by omega,
     show T+3+2=(T+2)+3 by omega,show T+3+1=(T+1)+3 by omega,
     h0,h1,top_shift_deltaME10,top_shift_deltaME10,top_shift_deltaME10] at he
   have hs := top_linear_secondME10 (topKernelME10 h i) T
   change topMassME10 h (T+2) i-2*topMassME10 h (T+1) i+topMassME10 h T i=_ at hs
   linear_combination he-hs

theorem top_shift_vandermondeME10 (h i s : ℕ) :
 topKernelME10 h i s=∑ l ∈ range (i+4),
 ((i+l).choose i:ℤ)*((h+2*i+4).choose (i+3-l):ℤ)*(s.choose (i+l):ℤ) := by
 by_cases hi : i ≤ s
 · have hv := Nat.add_choose_eq (s-i) (h+2*i+4) (i+3)
   rw [sum_antidiagonal_eq_sum_range_succ_mk] at hv
   have hv' := congrArg (fun z : ℕ => (z:ℤ)) hv
   push_cast at hv'
   rw [show s-i+(h+2*i+4)=h+s+i+4 by omega] at hv'
   unfold topKernelME10
   rw [hv',mul_sum]
   apply sum_congr rfl
   intro l hl
   have hz := congrArg (fun z : ℕ => (z:ℤ))
     (Nat.choose_mul (n:=s) (k:=i+l) (s:=i) (by omega))
   rw [show i+l-i=l by omega] at hz
   push_cast at hz
   linear_combination -((h+2*i+4).choose (i+3-l):ℤ)*hz
 · unfold topKernelME10
   rw [Nat.choose_eq_zero_of_lt (by omega : s<i)]
   simp only [Nat.cast_zero,zero_mul]
   symm
   apply sum_eq_zero
   intro l hl
   rw [Nat.choose_eq_zero_of_lt (by omega : s<i+l)]
   simp

theorem top_shift_shortME10 (h T i : ℕ) : topMassME10 h T i=topShortME10 h T i := by
 unfold topMassME10
 have he : topKernelME10 h i=fun s => ∑ l ∈ range (i+4),
   ((i+l).choose i:ℤ)*((h+2*i+4).choose (i+3-l):ℤ)*(s.choose (i+l):ℤ) := by
   funext s; exact top_shift_vandermondeME10 h i s
 rw [he,top_linear_sumMEB6]
 unfold topShortME10
 apply sum_congr rfl
 intro l hl
 rw [top_linear_smulM55C,top_linear_chooseMEB6]

theorem top_shift_nonnegME10 (h T i : ℕ) : 0 ≤ topMassME10 h T i := by
 rw [top_shift_shortME10]
 unfold topShortME10
 positivity

end
end MathGKM.Markov
