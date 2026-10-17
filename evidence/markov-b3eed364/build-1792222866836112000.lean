import MarkovTopSumMB3E
/-! Machine-authored b3eed364. Positive binomial coefficients beyond the
three exceptional columns. Exterior zeros are explicitly retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem top_delta_coeffMB3E (n t i : ℕ) :
 (topDiagonalDeltaMB3E n t).coeff i=fibDeltaME9C n i (n+2-t) := by
 simp [topDiagonalDeltaMB3E,topDeltaMB3E,fibDeltaME9C,fib_rows_coeffMC3E]

theorem top_delta_oneMB3E (n : ℕ) :
 topDiagonalDeltaMB3E n 1= -2+C (n+2:ℤ)*X := by
 ext i
 rw [top_delta_coeffMB3E]
 rcases i with _|_|i
 · norm_num [fibDeltaME9C,fibRawM9E2,show n+2-1=n+1 by omega,coeff_C_mul]
 · simp [fibDeltaME9C,fibRawM9E2,show n+2-1=n+1 by omega,
     show 1+(n+1)=n+2 by omega,Nat.choose_succ_self_right,
     show n+2-(n+1)-1=0 by omega,show ¬1+(n+1) ≤ n+1 by omega,
     show ¬1+(n+1) ≤ n by omega,coeff_C_mul,Nat.choose_symm_add]
 · simp [fibDeltaME9C,fibRawM9E2,show n+2-1=n+1 by omega,
     show ¬i+2+(n+1) ≤ n+2 by omega,show ¬i+2+(n+1) ≤ n+1 by omega,
     show ¬i+2+(n+1) ≤ n by omega,coeff_C_mul,show i+2≠1 by omega]

theorem top_delta_twoMB3E (n : ℕ) :
 topDiagonalDeltaMB3E n 2=1-C (n+1:ℤ)*X+C ((n+2).choose 2:ℤ)*X^2 := by
 ext i
 rw [top_delta_coeffMB3E]
 rcases i with _|_|_|i
 · norm_num [fibDeltaME9C,fibRawM9E2,coeff_C_mul,coeff_one]
 · simp [fibDeltaME9C,fibRawM9E2,
     show 1+n=n+1 by omega,
     show n+2-n-1=1 by omega,show n+1-n-1=0 by omega,
     show ¬1+n ≤ n by omega,coeff_C_mul,coeff_one,Nat.choose_succ_self_right]
   push_cast
   ring
 · simp [fibDeltaME9C,fibRawM9E2,
     show n+2-n-1=1 by omega,show ¬2+n ≤ n+1 by omega,
     show ¬2+n ≤ n by omega,coeff_C_mul,coeff_one,Nat.choose_symm_add,
     show 2+n=n+2 by omega]
   exact Nat.choose_symm_add n 2
 · simp [fibDeltaME9C,fibRawM9E2,
     show ¬i+3+n ≤ n+2 by omega,show ¬i+3+n ≤ n+1 by omega,
     show ¬i+3+n ≤ n by omega,coeff_C_mul,coeff_one,
     show i+3≠1 by omega,show i+3≠2 by omega]

theorem top_delta_highMB3E (n t i : ℕ) (ht : t ≤ n+2) :
 (topDiagonalDeltaMB3E n t).coeff (i+3)=
 if 3 ≤ t then ((t-3).choose i:ℤ)*((n+5-t+i).choose (i+3):ℤ) else 0 := by
 by_cases h3 : 3 ≤ t
 · rw [if_pos h3,top_delta_coeffMB3E,fib_delta_highME9C n i (n+2-t) (by omega)]
   congr 2 <;> omega
 · have hcases : t=0 ∨ t=1 ∨ t=2 := by omega
   rcases hcases with rfl|rfl|rfl
   · simp [top_delta_zeroMB3E,coeff_one]
   · rw [top_delta_oneMB3E]; simp [coeff_C_mul,show i+3≠1 by omega]
   · rw [top_delta_twoMB3E]; simp [coeff_C_mul,coeff_one,
       show i+3≠1 by omega,show i+3≠2 by omega]

theorem top_delta_low_zeroMB3E (n t i : ℕ) (ht : t ≤ n+2) (h3 : 3 ≤ t)
 (hi : i ≤ 2) : (topDiagonalDeltaMB3E n t).coeff i=0 := by
 rw [top_delta_coeffMB3E]
 interval_cases i
 · exact fib_delta_axisME9C n _ (by omega)
 · exact fib_delta_oneME9C n _ (by omega)
 · exact fib_delta_twoME9C n _ (by omega)

def topPositiveMB3E (n t i : ℕ) : ℤ :=
 (if 3 ≤ t then ((t-3).choose i:ℤ)*((n+5-t+i).choose (i+3):ℤ) else 0)+
 4*∑ s ∈ range t, ((t:ℤ)-s)*
   (if 3 ≤ s then ((s-3).choose i:ℤ)*((n-2*t+s+i+5).choose (i+3):ℤ) else 0)

theorem top_positive_formulaMB3E (n t i : ℕ) (hn : 2*t ≤ n) :
 (topTemplateMB3E n t).coeff (i+3)=topPositiveMB3E n t i := by
 rw [top_template_sumMB3E n t hn]
 simp only [coeff_add,coeff_ofNat_mul,finsetSum_coeff,coeff_C_mul]
 rw [top_delta_highMB3E n t i (by omega)]
 unfold topPositiveMB3E
 congr 2
 apply sum_congr rfl
 intro s hs
 have hst : s<t := mem_range.mp hs
 rw [top_delta_highMB3E (n-2*t+2*s) s i (by omega)]
 rw [show n-2*t+2*s+5-s+i=n-2*t+s+i+5 by omega]

theorem top_positive_nonnegMB3E (n t i : ℕ) : 0 ≤ topPositiveMB3E n t i := by
 unfold topPositiveMB3E
 apply add_nonneg
 · split_ifs <;> positivity
 · apply mul_nonneg (by norm_num)
   apply sum_nonneg
   intro s hs
   have h : (s:ℤ) ≤ t := by have := mem_range.mp hs; omega
   apply mul_nonneg (sub_nonneg.mpr h)
   split_ifs <;> positivity

theorem top_positive_supportMB3E (n t i : ℕ) (hn : 2*t ≤ n) :
 0 < topPositiveMB3E n t i ↔ i+3 ≤ t := by
 constructor
 · intro hp
   by_contra hi
   have hz : topPositiveMB3E n t i=0 := by
     unfold topPositiveMB3E
     have he : (if 3 ≤ t then ((t-3).choose i:ℤ)*((n+5-t+i).choose (i+3):ℤ) else 0)=0 := by
       split_ifs with h
       · rw [Nat.choose_eq_zero_of_lt (by omega : t-3 < i)]; simp
       · rfl
     rw [he,zero_add]
     have hs : (∑ s ∈ range t, ((t:ℤ)-s)*
       (if 3 ≤ s then ((s-3).choose i:ℤ)*((n-2*t+s+i+5).choose (i+3):ℤ) else 0))=0 := by
       apply sum_eq_zero
       intro s hs
       have hst := mem_range.mp hs
       split_ifs with h
       · rw [Nat.choose_eq_zero_of_lt (by omega : s-3 < i)]; simp
       · simp
     rw [hs,mul_zero]
   rw [hz] at hp
   omega
 · intro hi
   unfold topPositiveMB3E
   rw [if_pos (by omega : 3 ≤ t)]
   apply add_pos_of_pos_of_nonneg
   · apply mul_pos
     · exact_mod_cast Nat.choose_pos (by omega : i ≤ t-3)
     · exact_mod_cast Nat.choose_pos (by omega : i+3 ≤ n+5-t+i)
   · apply mul_nonneg (by norm_num)
     apply sum_nonneg
     intro s hs
     have h : (s:ℤ) ≤ t := by have := mem_range.mp hs; omega
     apply mul_nonneg (sub_nonneg.mpr h)
     split_ifs <;> positivity

end
end MathGKM.Markov
