import MarkovCyclicTrace487
/-! Machine-authored 487ae883. Elementary truncated-ramp inequalities. -/
namespace MathGKM.Markov
noncomputable section

def lowerSeq487 (a c : ℤ) : ℕ → ℤ
 | 0 => a+c-1
 | 1 => 3*a-1
 | j+2 => max (4*(a-c*(j+1))) 0

theorem lowerSeq_nonneg487 (a c : ℤ) (ha : 1≤a) (hc : 1≤c) (j : ℕ) :
 0≤lowerSeq487 a c j := by
 cases j with
 | zero => simp [lowerSeq487]; omega
 | succ j => cases j with
   | zero => simp [lowerSeq487]; omega
   | succ j => exact le_max_right _ _

theorem lowerSeq_lc487 (a c : ℤ) (ha : 1≤a) (hc : 1≤c) (j : ℕ) :
 lowerSeq487 a c j*lowerSeq487 a c (j+2)≤lowerSeq487 a c (j+1)^2 := by
 cases j with
 | zero =>
   simp only [lowerSeq487,Nat.cast_zero,zero_add,mul_one]
   by_cases h : a≤c
   · rw [max_eq_right (by omega),mul_zero]; exact sq_nonneg _
   · rw [max_eq_left (by omega)]
     nlinarith [sq_nonneg (a-1),mul_nonneg (by omega : 0≤c) (by omega : 0≤c-1)]
 | succ j =>
   cases j with
   | zero =>
     norm_num only [lowerSeq487,Nat.cast_zero,Nat.cast_one,zero_add,mul_one]
     by_cases h : a≤2*c
     · rw [max_eq_right (by omega : 4*(a-c*2)≤0),mul_zero]
       exact sq_nonneg _
     · rw [max_eq_left (by omega : 0≤4*(a-c*2)),
         max_eq_left (by omega : 0≤4*(a-c))]
       nlinarith [sq_nonneg (a-c),sq_nonneg c]
   | succ j =>
     change max (4*(a-c*(j+1))) 0 * max (4*(a-c*(j+2+1))) 0 ≤
       (max (4*(a-c*(j+1+1))) 0)^2
     push_cast
     by_cases h : a≤c*((j:ℤ)+2+1)
     · rw [max_eq_right (by nlinarith : 4*(a-c*((j:ℤ)+2+1))≤0)]
       simp
     · rw [max_eq_left (by nlinarith : 0≤4*(a-c*((j:ℤ)+2+1))),
         max_eq_left (by nlinarith : 0≤4*(a-c*((j:ℤ)+1))),
         max_eq_left (by nlinarith : 0≤4*(a-c*((j:ℤ)+1+1)))]
       nlinarith [sq_nonneg c]

#print axioms lowerSeq_lc487
end
end MathGKM.Markov
