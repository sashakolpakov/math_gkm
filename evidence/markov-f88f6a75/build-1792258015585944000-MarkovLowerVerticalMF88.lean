import MarkovLowerDiagonalMF88
import MarkovLowerReductionME9C
/-! Machine-authored f88f6a75. Uniform lower vertical source inequalities,
derived from the complete diagonal convolution, not termwise pair positivity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem lower_kernel_diagonalMF88 (i j k : ℕ) (hi : 3 ≤ i) (hw : 2*j+3 ≤ i+k) :
 (lowerKernelME9C i j k:ℝ)=lowerDiagMF88 (i-3) j k := by
 have hn : 2*j+1 ≤ i+j+k-2 := by omega
 rw [lowerKernelME9C,←lower_row_formulaMFFD (i+j+k-2) j hn i j (by omega)]
 rw [show i=i-3+3 by omega,lower_row_diagonalMF88 _ j (i-3) (by omega) (by omega)]
 congr 1
 omega

theorem lower_shape_closedMF88 (i : ℕ) (hi : 3 ≤ i) : LowerShapeME9C i := by
 refine ⟨fun j k hw => lower_kernel_wedge_positiveMF88 i j k hi hw,?_,?_,?_⟩
 · intro j k hw
   have h := lower_diag_rowMF88 (i-3) j k
   rw [←lower_kernel_diagonalMF88 i j k hi (by omega),
     ←lower_kernel_diagonalMF88 i (j+2) k hi (by omega),
     ←lower_kernel_diagonalMF88 i (j+1) k hi (by omega)] at h
   exact_mod_cast h
 · intro j k hw
   have h := lower_diag_columnMF88 (i-3) j k
   rw [←lower_kernel_diagonalMF88 i j k hi (by omega),
     ←lower_kernel_diagonalMF88 i j (k+2) hi (by omega),
     ←lower_kernel_diagonalMF88 i j (k+1) hi (by omega)] at h
   exact_mod_cast h
 · intro j k hw
   have h := lower_diag_minorMF88 (i-3) j k
   rw [←lower_kernel_diagonalMF88 i (j+1) k hi (by omega),
     ←lower_kernel_diagonalMF88 i j (k+1) hi (by omega),
     ←lower_kernel_diagonalMF88 i j k hi (by omega),
     ←lower_kernel_diagonalMF88 i (j+1) (k+1) hi (by omega)] at h
   exact_mod_cast h

theorem source_lower_verticalMF88 (q i j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 :=
 source_lower_vertical_of_shapeME9C lower_shape_closedMF88 q i j r hj

theorem lower_vertical_closedMF88 : LowerVerticalThreeME9C := by
 intro q _ r i j hj
 exact source_lower_verticalMF88 q i j r hj

theorem path_lower_verticalMF88 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 3*(j+2) ≤ (frame path).mid.b) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : j+2 ≤ q := by
   rw [hb] at hj
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at hj <;> omega
 simp only [hp]
 exact source_lower_verticalMF88 q i j r hjq

end
end MathGKM.Markov
