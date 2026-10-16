import MarkovLiftRatioMAE9
/-! Machine-authored 7e2e958e. Along a fixed reversed index r=t-m, the
scaled kernel weight changes by exactly 2 at each parameter step. This is
an identity for the remaining sign-pattern investigation, not an LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem lift_weight_reverseM7E2 (j t r : ℚ) :
 liftWeightMAE9 j t (t-r)=
 r^2+(4*j+7)*r+4*j^2+16*j+2*t+20 := by
 unfold liftWeightMAE9 liftDenMAE9
 ring

theorem lift_weight_stepM7E2 (j t m : ℚ) :
 liftWeightMAE9 j (t+1) (m+1)=liftWeightMAE9 j t m+2 := by
 unfold liftWeightMAE9 liftDenMAE9
 ring

theorem lift_diagonal_stepM7E2 (j t m : ℕ) (hm : m+1 ≤ j) :
 (liftTermMAE9 j (t+1) (m+1):ℚ)*(t+4)*(m+1)*
   liftDenMAE9 (t+1) (m+1)*liftWeightMAE9 j t m=
 (liftTermMAE9 j t m:ℚ)*(t+j+4)*(j-m)*liftDenMAE9 t m*
   (liftWeightMAE9 j t m+2) := by
 have h0 := lift_scaledMAE9 j t m (by omega)
 have h1 := lift_scaledMAE9 j (t+1) (m+1) hm
 have hc := choose_lower_step67 j m (by omega)
 have hb0 := Nat.choose_mul_succ_eq (t+j+3) j
 rw [show t+j+3+1-j=t+4 by omega] at hb0
 have hb : ((t+j+4).choose j:ℚ)*(t+4)=
   ((t+j+3).choose j:ℚ)*(t+j+4) := by
   exact_mod_cast (by simpa only [Nat.add_assoc] using hb0.symm)
 push_cast at h1
 rw [lift_weight_stepM7E2] at h1
 rw [show t+1+j+3=t+j+4 by omega] at h1
 linear_combination (t+4:ℚ)*(m+1)*liftWeightMAE9 j t m*h1-
   (t+j+4:ℚ)*(j-m)*(liftWeightMAE9 j t m+2)*h0+
   (j.choose (m+1):ℚ)*(m+1)*liftWeightMAE9 j t m*(liftWeightMAE9 j t m+2)*hb+
   ((t+j+3).choose j:ℚ)*(t+j+4)*liftWeightMAE9 j t m*(liftWeightMAE9 j t m+2)*hc

end
end MathGKM.Markov
