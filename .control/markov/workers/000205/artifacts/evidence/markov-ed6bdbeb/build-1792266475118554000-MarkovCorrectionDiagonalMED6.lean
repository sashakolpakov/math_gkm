import MarkovAffineShapeMED6
import MarkovTwoKernelSourceMED6
/-! Machine-authored ed6bdbeb. Complete diagonal shape of the correction,
including zero boundaries, attached to the actual source excess. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem correction_diagonalMED6 (q i j : ℕ) (r : Bool) (hi : 3 ≤ i) :
 correctionValueM13E q r i (j+2)*correctionValueM13E q r (i+2) j  ≤ 
 correctionValueM13E q r (i+1) (j+1)^2 := by
 by_cases h0 : q+1 ≤ j+2 ∧ i+(j+2)+q ≤ sourceNME9C q r
 · by_cases h2 : q+1 ≤ j ∧ i+2+j+q ≤ sourceNME9C q r
   · have h1 : q+1 ≤ j+1 ∧ i+1+(j+1)+q ≤ sourceNME9C q r := by omega
     simp only [correctionValueM13E,if_pos h0,if_pos h1,if_pos h2]
     have he : 1 ≤ correctionEpsilonM13E r := by cases r  < ;> norm_num [correctionEpsilonM13E]
     have h := affine_parameter_diagonalMED6 (correctionEpsilonM13E r) he
       (i-1) (i-2) (j-q-1) (sourceNME9C q r-q-i-j-2) (by omega) (by omega)
     have hj0 : j-q-1+2=j+2-q-1 := by omega
     have hj1 : j-q-1+1=j+1-q-1 := by omega
     have hk0 : sourceNME9C q r-q-i-j-2=sourceNME9C q r-q-i-(j+2) := by omega
     have hk1 : sourceNME9C q r-q-i-j-2=sourceNME9C q r-q-(i+1)-(j+1) := by omega
     have hk2 : sourceNME9C q r-q-i-j-2=sourceNME9C q r-q-(i+2)-j := by omega
     rw [show i-1+2=i+2-1 by omega,show i-2+2=i+2-2 by omega,
       show i-1+1=i+1-1 by omega,show i-2+1=i+1-2 by omega,hj0,hj1] at h
     simp only [←hk0,←hk1,←hk2]
     nlinarith only [h]
   · have hz : correctionValueM13E q r (i+2) j=0 := by simp only [correctionValueM13E,if_neg h2]
     rw [hz,mul_zero]
     exact sq_nonneg _
 · have hz : correctionValueM13E q r i (j+2)=0 := by simp only [correctionValueM13E,if_neg h0]
   rw [hz,zero_mul]
   exact sq_nonneg _

theorem source_excess_diagonalMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 ((threeRawM9E2 q r i (j+2):ℝ)-baseValueM13E q r i (j+2))*
   ((threeRawM9E2 q r (i+2) j:ℝ)-baseValueM13E q r (i+2) j)  ≤ 
   ((threeRawM9E2 q r (i+1) (j+1):ℝ)-baseValueM13E q r (i+1) (j+1))^2 := by
 rw [source_two_kernelMED6 q i (j+2) r hq hi,
   source_two_kernelMED6 q (i+2) j r hq (by omega),
   source_two_kernelMED6 q (i+1) (j+1) r hq (by omega)]
 simp only [add_sub_cancel_left]
 exact correction_diagonalMED6 q i j r hi

end
end MathGKM.Markov
