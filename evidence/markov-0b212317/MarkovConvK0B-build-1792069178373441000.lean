import MarkovFourthTruncateK0B
/-! Machine-authored request 0b212317. Exact finite convolution, with zero terms retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def chooseShiftSevenK0B (j k : ℕ) : ℤ :=
  if k≤j then ((7+(j-k)).choose 7:ℤ) else 0

def convSevenK0B (P : ℤ[X]) (j : ℕ) : ℤ :=
  ∑ k ∈ Finset.range (j+1), P.coeff k * ((7+(j-k)).choose 7:ℤ)

theorem convSeven_addK0B (P Q : ℤ[X]) (j : ℕ) :
  convSevenK0B (P+Q) j=convSevenK0B P j+convSevenK0B Q j := by
  simp only [convSevenK0B,coeff_add,add_mul,Finset.sum_add_distrib]

theorem convSeven_monomialK0B (a : ℤ) (m j : ℕ) :
  convSevenK0B (C a*X^m) j=a*chooseShiftSevenK0B j m := by
  classical
  simp only [convSevenK0B,coeff_C_mul,coeff_X_pow]
  by_cases h : m≤j
  · rw [Finset.sum_eq_single m]
    · simp [chooseShiftSevenK0B,h]
    · intro b hb hbm
      simp [hbm]
    · intro hm
      exact (hm (Finset.mem_range.mpr (by omega))).elim
  · rw [Finset.sum_eq_zero]
    · simp [chooseShiftSevenK0B,h]
    · intro b hb
      have hb' := Finset.mem_range.mp hb
      have hm : m≠b := by omega
      simp [Ne.symm hm]

def fallingSevenK0B (x : ℤ) : ℤ :=
  x*(x-1)*(x-2)*(x-3)*(x-4)*(x-5)*(x-6)

theorem fallingSeven_natK0B (z : ℕ) :
  fallingSevenK0B z=5040*(z.choose 7:ℤ) := by
  by_cases hz : 6≤z
  · have h := congrArg (fun n : ℕ => (n:ℤ)) (Nat.descFactorial_eq_factorial_mul_choose z 7)
    norm_num [Nat.descFactorial_succ,Nat.descFactorial_zero,
      Nat.cast_sub (by omega : 6≤z),Nat.cast_sub (by omega : 5≤z),
      Nat.cast_sub (by omega : 4≤z),Nat.cast_sub (by omega : 3≤z),
      Nat.cast_sub (by omega : 2≤z),Nat.cast_sub (by omega : 1≤z)] at h
    unfold fallingSevenK0B
    linear_combination h
  · interval_cases z <;> norm_num [fallingSevenK0B]

theorem chooseShiftSeven_fallingK0B (j k : ℕ) (hk : k≤j+7) :
  5040*chooseShiftSevenK0B j k=fallingSevenK0B ((j:ℤ)+7-k) := by
  by_cases h : k≤j
  · simp only [chooseShiftSevenK0B,if_pos h]
    have he := fallingSeven_natK0B (7+(j-k))
    simpa only [Nat.cast_add,Nat.cast_ofNat,Nat.cast_sub h,show (7:ℤ)+(j-k)=j+7-k by ring] using he.symm
  · rw [chooseShiftSevenK0B,if_neg h,mul_zero]
    have hh : k=j+1 ∨ k=j+2 ∨ k=j+3 ∨ k=j+4 ∨ k=j+5 ∨ k=j+6 ∨ k=j+7 := by omega
    rcases hh with rfl|rfl|rfl|rfl|rfl|rfl|rfl <;> push_cast <;> unfold fallingSevenK0B <;> ring

end
end MathGKM.Markov
