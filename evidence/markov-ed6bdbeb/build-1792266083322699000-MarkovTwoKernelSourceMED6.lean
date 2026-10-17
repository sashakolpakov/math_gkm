import MarkovCorrectionExtractionMED6
import MarkovMasterSourceM3AE
/-! Machine-authored ed6bdbeb. Unconditional two-kernel source formula.
It retains the entire correction. No sum log-concavity is inferred here. -/
namespace MathGKM.Markov
noncomputable section

theorem source_two_kernelMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 (threeRawM9E2 q r i j:ℝ)=baseValueM13E q r i j+correctionValueM13E q r i j :=
 source_two_kernel_of_correctionM3AE correction_kernel_extractionMED6 q i j r hq hi

theorem source_path_two_kernelMED6 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
 ∀ i j, 3 ≤ i → (coeff (frame path).mid.p i j:ℝ)=
   baseValueM13E q r i j+correctionValueM13E q r i j := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j hi
 rw [hp]
 exact source_two_kernelMED6 q i j r hq hi

theorem correction_positive_iffMED6 (q i j : ℕ) (r : Bool) :
 0<correctionValueM13E q r i j ↔ q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r := by
 unfold correctionValueM13E
 split_ifs with h
 · exact ⟨fun _ => h,fun _ => mul_pos (by norm_num)
     (affine_kernel_positiveM13E _ (correction_epsilon_posM13E r) _ _ _ _)⟩
 · simp only [lt_self_iff_false,false_iff]
   exact h

theorem source_above_base_iffMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 baseValueM13E q r i j < (threeRawM9E2 q r i j:ℝ) ↔
   q+1 ≤ j ∧ i+j+q ≤ sourceNME9C q r := by
 rw [source_two_kernelMED6 q i j r hq hi,lt_add_iff_pos_right,correction_positive_iffMED6]

theorem source_excess_verticalMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 ((threeRawM9E2 q r i j:ℝ)-baseValueM13E q r i j)*
   ((threeRawM9E2 q r i (j+2):ℝ)-baseValueM13E q r i (j+2)) ≤
   ((threeRawM9E2 q r i (j+1):ℝ)-baseValueM13E q r i (j+1))^2 := by
 simp only [source_two_kernelMED6 q i _ r hq hi,add_sub_cancel_left]
 exact correction_verticalM13E q i j r

end
end MathGKM.Markov
