import MarkovTwoKernelSourceMED6
/-! Machine-authored ed6bdbeb. Global shape of the guarded base kernel. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem base_verticalMED6 (q i j : ℕ) (r : Bool) :
 baseValueM13E q r i j*baseValueM13E q r i (j+2) ≤ baseValueM13E q r i (j+1)^2 := by
 by_cases hd : i+j ≤ sourceNME9C q r
 · have h := lower_model_antidiagonalM9F23 (i-3) j (sourceNME9C q r-i-j)
   simp only [baseValueM13E,if_pos (show i+j ≤ sourceNME9C q r+2 by omega),
     if_pos (show i+(j+1) ≤ sourceNME9C q r+2 by omega),
     if_pos (show i+(j+2) ≤ sourceNME9C q r+2 by omega)]
   rw [show sourceNME9C q r+2-i-j=sourceNME9C q r-i-j+2 by omega,
     show sourceNME9C q r+2-i-(j+1)=sourceNME9C q r-i-j+1 by omega,
     show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega]
   exact h
 · have hz : baseValueM13E q r i (j+2)=0 := by
     simp only [baseValueM13E,if_neg (show ¬i+(j+2) ≤ sourceNME9C q r+2 by omega)]
   rw [hz,mul_zero]
   exact sq_nonneg _

theorem base_diagonalMED6 (q i j : ℕ) (r : Bool) (hi : 4 ≤ i) :
 baseValueM13E q r i (j+2)*baseValueM13E q r (i+2) j ≤
 baseValueM13E q r (i+1) (j+1)^2 := by
 by_cases hd : i+j ≤ sourceNME9C q r
 · have h := lower_parameter_diagonalM9F23 (i-3) j (sourceNME9C q r-i-j) (by omega)
   simp only [baseValueM13E,if_pos (show i+(j+2) ≤ sourceNME9C q r+2 by omega),
     if_pos (show i+1+(j+1) ≤ sourceNME9C q r+2 by omega),
     if_pos (show i+2+j ≤ sourceNME9C q r+2 by omega)]
   rw [show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega,
     show sourceNME9C q r+2-(i+1)-(j+1)=sourceNME9C q r-i-j by omega,
     show sourceNME9C q r+2-(i+2)-j=sourceNME9C q r-i-j by omega,
     show i+1-3=i-3+1 by omega,show i+2-3=i-3+2 by omega]
   exact h
 · have hz : baseValueM13E q r i (j+2)=0 := by
     simp only [baseValueM13E,if_neg (show ¬i+(j+2) ≤ sourceNME9C q r+2 by omega)]
   rw [hz,zero_mul]
   exact sq_nonneg _

theorem correction_zero_aboveMED6 (q i j : ℕ) (r : Bool)
 (h : sourceNME9C q r < i+j+q) : correctionValueM13E q r i j=0 := by
 simp only [correctionValueM13E,if_neg (show ¬(q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r) by omega)]

theorem correction_zero_columnMED6 (q i j : ℕ) (r : Bool)
 (h : q+(if r then 1 else 2) ≤ i) : correctionValueM13E q r i j=0 := by
 unfold correctionValueM13E
 apply if_neg
 cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at * <;> omega

end
end MathGKM.Markov
