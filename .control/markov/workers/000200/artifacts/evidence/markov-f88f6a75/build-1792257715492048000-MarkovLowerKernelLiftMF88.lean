import MarkovLowerShapeME9C
import MarkovLiftSupportMAE9
/-! Machine-authored f88f6a75. Exact positive binomial representation of
the auxiliary lower kernel on its valid wedge. No sign extension outside it. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem lower_kernel_liftMF88 (i j k : ℕ) (hi : 3 ≤ i) (hw : 2*j+3 ≤ i+k) :
 lowerKernelME9C i j k=liftOutputMAE9 (i+k-j-3) j (i-3) := by
 have hn : 2*j+1 ≤ i+j+k-2 := by omega
 rw [lowerKernelME9C,←lower_row_formulaMFFD (i+j+k-2) j hn i j (by omega)]
 have he : i+j+k-2=2*j+1+(i+k-j-3) := by omega
 rw [he,show i=i-3+3 by omega,lower_row_liftMAE9]
 rfl

theorem lower_kernel_wedge_positiveMF88 (i j k : ℕ) (hi : 3 ≤ i)
 (hw : 2*j+3 ≤ i+k) : 0 < lowerKernelME9C i j k := by
 rw [lower_kernel_liftMF88 i j k hi hw]
 apply lift_output_positiveMAE9
 omega

def LowerShapeSignsMF88 (i : ℕ) : Prop :=
 (∀ j k, 2*j+7 ≤ i+k → lowerKernelME9C i j k*lowerKernelME9C i (j+2) k ≤
   lowerKernelME9C i (j+1) k^2) ∧
 (∀ j k, 2*j+3 ≤ i+k → lowerKernelME9C i j k*lowerKernelME9C i j (k+2) ≤
   lowerKernelME9C i j (k+1)^2) ∧
 (∀ j k, 2*j+5 ≤ i+k → lowerKernelME9C i (j+1) k*lowerKernelME9C i j (k+1) ≤
   lowerKernelME9C i j k*lowerKernelME9C i (j+1) (k+1))

theorem lower_shape_iff_signsMF88 (i : ℕ) (hi : 3 ≤ i) :
 LowerShapeME9C i ↔ LowerShapeSignsMF88 i := by
 constructor
 · intro h; exact h.2
 · intro h; exact ⟨fun j k hw => lower_kernel_wedge_positiveMF88 i j k hi hw,h⟩

end
end MathGKM.Markov
