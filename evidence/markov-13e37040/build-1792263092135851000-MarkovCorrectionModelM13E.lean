import MarkovAffineKernelM13E
import MarkovMiddleTriangleResidualM50C
/-! Machine-authored 13e37040. Guarded correction model, including zeros,
its complete vertical LC, and an actual-source first-row attachment. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2

def correctionEpsilonM13E (r : Bool) : ℝ := if r then 2 else 1
def correctionValueM13E (q : ℕ) (r : Bool) (i j : ℕ) : ℝ :=
 if q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r then
   4*affineKernelM13E (correctionEpsilonM13E r) (i-1) (i-2)
     (j-q-1) (sourceNME9C q r-q-i-j)
 else 0
def baseValueM13E (q : ℕ) (r : Bool) (i j : ℕ) : ℝ :=
 if i+j ≤ sourceNME9C q r+2 then
   lowerDiagMF88 (i-3) j (sourceNME9C q r+2-i-j)
 else 0

theorem correction_epsilon_posM13E (r : Bool) : 0 < correctionEpsilonM13E r := by
 cases r <;> norm_num [correctionEpsilonM13E]

theorem correction_value_nonnegM13E (q i j : ℕ) (r : Bool) :
 0 ≤ correctionValueM13E q r i j := by
 unfold correctionValueM13E
 split_ifs
 · exact mul_nonneg (by norm_num) (affine_kernel_nonnegM13E _ (correction_epsilon_posM13E r).le _ _ _ _)
 · exact le_rfl

theorem correction_verticalM13E (q i j : ℕ) (r : Bool) :
 correctionValueM13E q r i j*correctionValueM13E q r i (j+2) ≤
 correctionValueM13E q r i (j+1)^2 := by
 by_cases h0 : q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r
 · by_cases h2 : q+1 ≤ j+2 ∧ i+(j+2)+q ≤ sourceNME9C q r
   · have h1 : q+1 ≤ j+1 ∧ i+(j+1)+q ≤ sourceNME9C q r := by omega
     simp only [correctionValueM13E,if_pos h0,if_pos h1,if_pos h2]
     have h := affine_kernel_antidiagonalM13E (correctionEpsilonM13E r)
       (correction_epsilon_posM13E r) (i-1) (i-2) (j-q-1) (sourceNME9C q r-q-i-j-2)
     have he0 : sourceNME9C q r-q-i-j-2+2=sourceNME9C q r-q-i-j := by omega
     have he1 : sourceNME9C q r-q-i-j-2+1=sourceNME9C q r-q-i-(j+1) := by omega
     have he2 : sourceNME9C q r-q-i-j-2=sourceNME9C q r-q-i-(j+2) := by omega
     rw [he0,he1,he2,show j-q-1+1=j+1-q-1 by omega,
       show j-q-1+2=j+2-q-1 by omega] at h
     nlinarith only [h]
   · have hz : correctionValueM13E q r i (j+2)=0 := by simp only [correctionValueM13E,if_neg h2]
     rw [hz,mul_zero]
     exact sq_nonneg _
 · have hz : correctionValueM13E q r i j=0 := by simp only [correctionValueM13E,if_neg h0]
   rw [hz,zero_mul]
   exact sq_nonneg _

theorem correction_firstM13E (q i : ℕ) (r : Bool) (hq : 2 ≤ q) (hi : 3 ≤ i) :
 correctionValueM13E q r i (q+1)=(firstCorrectionM1BB q r i:ℝ) := by
 have hq1 : q≠1 := by omega
 have hi2 : 2 ≤ i := by omega
 unfold correctionValueM13E
 simp only [show q+1 ≤ q+1 by omega,true_and,show q+1-q-1=0 by omega]
 by_cases hc : i+(q+1)+q ≤ sourceNME9C q r
 · rw [if_pos hc,affine_kernel_axisM13E]
   cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at hc ⊢
   · have he : 3*q+2-q-i-(q+1)+(i-2)=q-1 := by omega
     simp [he,correctionEpsilonM13E,firstCorrectionM1BB,hi2,hq1]
   · have he : 3*q+1-q-i-(q+1)+(i-2)=q-2 := by omega
     simp [he,correctionEpsilonM13E,firstCorrectionM1BB,hi2,hq1]
     ring
 · rw [if_neg hc]
   cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at hc ⊢
   · simp only [firstCorrectionM1BB,if_pos hi2,Bool.false_eq_true,if_false]
     rw [Nat.choose_eq_zero_of_lt (by omega : q-1<i-2)]
     norm_num
   · simp only [firstCorrectionM1BB,if_pos hi2,if_true,if_neg hq1]
     rw [Nat.choose_eq_zero_of_lt (by omega : q-2<i-2)]
     norm_num

theorem source_first_modelM13E (q i : ℕ) (r : Bool) (hq : 2 ≤ q) (hi : 3 ≤ i) :
 (threeRawM9E2 q r i (q+1):ℝ)=baseValueM13E q r i (q+1)+correctionValueM13E q r i (q+1) := by
 have hn : 2*(q+1)+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
 by_cases hd : i+(q+1) ≤ sourceNME9C q r+2
 · rw [correction_firstM13E q i r hq hi,baseValueM13E,if_pos hd,first_row_sourceM1BB q i r (by omega),Int.cast_add,
     ←lower_row_formulaMFFD (sourceNME9C q r) (q+1) hn i (q+1) (by omega)]
   congr 1
   have h := lower_row_diagonalMF88 (sourceNME9C q r) (q+1) (i-3) hn (by omega)
   simpa only [show i-3+3=i by omega,show sourceNME9C q r-(q+1)-(i-3)-1=sourceNME9C q r+2-i-(q+1) by omega] using h
 · rw [three_raw_degreeME9C q i (q+1) r (by omega) (by omega),Int.cast_zero,
     baseValueM13E,if_neg hd,zero_add,correctionValueM13E,if_neg (by omega)]

end
end MathGKM.Markov
