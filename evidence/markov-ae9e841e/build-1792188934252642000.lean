import MarkovLiftSupportMAE9
import MarkovMinimalShapeMDAB
/-! Machine-authored ae9e841e. A scaled rational kernel identity for the
unproved uniform transform route. No LC-preservation claim is made. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def liftDenMAE9 (t m : ℚ) : ℚ := (t+m+4)*(t+m+5)
def liftWeightMAE9 (j t m : ℚ) : ℚ :=
 liftDenMAE9 t m+4*(j-m)*(t+j+4)

theorem lift_scaledMAE9 (j t m : ℕ) (hm : m ≤ j) :
 (liftTermMAE9 j t m:ℚ)*liftDenMAE9 t m=
 (j.choose m:ℚ)*((t+j+3).choose j:ℚ)*liftWeightMAE9 j t m := by
 have hc := choose_raise_twoMDAB (t+j+3) (t+m+3) (by omega)
 have hb := binomial_product_liftMAE9 j t m
 have hbq : (j.choose m:ℚ)*((t+j+3).choose j:ℚ)=
   ((t+m+3).choose m:ℚ)*((t+j+3).choose (t+m+3):ℚ) := by exact_mod_cast hb
 rw [show t+j+3+1=t+j+4 by omega,show t+m+3+2=t+m+5 by omega] at hc
 push_cast at hc
 unfold liftTermMAE9 liftDenMAE9 liftWeightMAE9
 push_cast
 rw [hbq]
 unfold liftDenMAE9
 linear_combination 4*((t+m+3).choose m:ℚ)*hc

theorem lift_weight_positiveMAE9 (j t m : ℚ) (ht : 0 ≤ t) (hm : 0 ≤ m)
 (hjm : m ≤ j) : 0 < liftWeightMAE9 j t m := by
 have hj : 0 ≤ j := hm.trans hjm
 unfold liftWeightMAE9 liftDenMAE9
 apply add_pos_of_pos_of_nonneg (by positivity)
 exact mul_nonneg (mul_nonneg (by norm_num) (sub_nonneg.mpr hjm)) (by positivity)

theorem lift_column_stepMAE9 (j t m : ℕ) (hm : m+1 ≤ j) :
 (liftTermMAE9 j t (m+1):ℚ)*(m+1)*liftDenMAE9 t (m+1)*liftWeightMAE9 j t m=
 (liftTermMAE9 j t m:ℚ)*(j-m)*liftDenMAE9 t m*liftWeightMAE9 j t (m+1) := by
 have h0 := lift_scaledMAE9 j t m (by omega)
 have h1 := lift_scaledMAE9 j t (m+1) hm
 have hb := choose_lower_step67 j m (by omega)
 push_cast at h1
 linear_combination (m+1:ℚ)*liftWeightMAE9 j t m*h1-
   (j-m:ℚ)*liftWeightMAE9 j t (m+1)*h0+
   ((t+j+3).choose j:ℚ)*liftWeightMAE9 j t m*liftWeightMAE9 j t (m+1)*hb

end
end MathGKM.Markov
