import MarkovKernelValuesMAD5
import MarkovLiftRootMFEE
/-! Machine-authored ad504da6. The single rational symmetric-pair inequality
is sufficient for all lower horizontal source rows. It is not assumed proved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000

def RationalPairStepMAD5 : Prop := ∀ j t m n : ℕ, 1 ≤ t → n+2 ≤ m → m ≤ j →
 pairAMAD5 j t (m-1)*pairBMAD5 j t (n+1)+pairAMAD5 j t (n+1)*pairBMAD5 j t (m-1) ≤
 pairAMAD5 j t m*pairBMAD5 j t n+pairAMAD5 j t n*pairBMAD5 j t m

theorem scalar_pair_stepMAD5 (H : RationalPairStepMAD5) (j t m n : ℕ)
 (hnm : n+2 ≤ m) (hmj : m ≤ j) :
 (2*(liftTermMAE9 j (t+1) m:ℚ)*liftTermMAE9 j (t+1) n-
    leftTermMAD5 j t m*liftTermMAE9 j (t+2) (n+1)-
    liftTermMAE9 j (t+2) (m+1)*leftTermMAD5 j t n)*
   ((liftTermMAE9 j (t+1) (m-1):ℚ)*liftTermMAE9 j (t+1) (n+1)) ≤
 (2*(liftTermMAE9 j (t+1) (m-1):ℚ)*liftTermMAE9 j (t+1) (n+1)-
    leftTermMAD5 j t (m-1)*liftTermMAE9 j (t+2) (n+1+1)-
    liftTermMAE9 j (t+2) (m-1+1)*leftTermMAD5 j t (n+1))*
   ((liftTermMAE9 j (t+1) m:ℚ)*liftTermMAE9 j (t+1) n) := by
 have hn : n ≤ j := by omega
 have hm : m-1 ≤ j := by omega
 have hn1 : n+1 ≤ j := by omega
 have hh := H j (t+1) m n (by omega) hnm hmj
 have hp (a : ℕ) (ha : a ≤ j) : (0:ℚ) ≤ liftTermMAE9 j (t+1) a := by
   exact_mod_cast (lift_term_positiveMAD5 j (t+1) a ha).le
 have hd : (0:ℚ) ≤ (liftTermMAE9 j (t+1) m:ℚ)*liftTermMAE9 j (t+1) n*
   liftTermMAE9 j (t+1) (m-1)*liftTermMAE9 j (t+1) (n+1)*
   ((t+4)/(t+j+4))*((t+j+5)/(t+5)) := by
   apply mul_nonneg
   · apply mul_nonneg
     · exact mul_nonneg (mul_nonneg (mul_nonneg (hp m hmj) (hp n hn)) (hp (m-1) hm)) (hp (n+1) hn1)
     · positivity
   · positivity
 have hh' := mul_le_mul_of_nonneg_left hh hd
 rw [pair_left_allMAD5 j t m hmj,pair_left_allMAD5 j t n hn,
   pair_left_allMAD5 j t (m-1) hm,pair_left_allMAD5 j t (n+1) hn1,
   pair_right_stepMAD5 j t m hmj,pair_right_stepMAD5 j t n hn,
   pair_right_stepMAD5 j t (m-1) hm,pair_right_stepMAD5 j t (n+1) hn1]
 simp only [Nat.cast_sub (show 1 ≤ m by omega),Nat.cast_add,Nat.cast_one] at hh' ⊢
 nlinarith only [hh']

theorem kernel_steps_of_rationalMAD5 (H : RationalPairStepMAD5) : KernelPairStepMAD5 := by
 intro j t i k hi hk hik
 have hiu : i ≤ j+1 := by omega
 have hkl : 1 ≤ k := by omega
 have hi1u : i+1 ≤ j+1 := by omega
 have hk1l : 1 ≤ k-1 := by omega
 rcases shifted_kernel_valuesMAD5 j t i hi hiu with ⟨ha,hb,hc⟩
 rcases shifted_kernel_valuesMAD5 j t k hkl hk with ⟨hd,he,hf⟩
 rcases shifted_kernel_valuesMAD5 j t (i+1) (by omega) hi1u with ⟨hg,hh,hi'⟩
 rcases shifted_kernel_valuesMAD5 j t (k-1) hk1l (by omega) with ⟨hj,hl,hm⟩
 unfold pairGapMAD5 pairDenMAD5
 simp only [ha,hb,hc,hd,he,hf,hg,hh,hi',hj,hl,hm]
 have hm1 : j+1-(i+1)=(j+1-i)-1 := by omega
 have hn1 : j+1-(k-1)=(j+1-k)+1 := by omega
 rw [hm1,hn1]
 have hr := scalar_pair_stepMAD5 H j t (j+1-i) (j+1-k) (by omega) (by omega)
 exact_mod_cast hr

theorem lower_horizontal_of_rationalMAD5 (H : RationalPairStepMAD5) : LowerHorizontalMFEE :=
 lower_horizontal_of_middleMFEE (lift_middle_of_pair_orderMAD5
   (shifted_order_of_kernel_stepsMAD5 (kernel_steps_of_rationalMAD5 H)))

theorem root_of_rational_and_remainingMAD5 (H : RationalPairStepMAD5)
 (ho : ThreeOutsideLowerMFEE) (h4 : OtherFourM9E2) : Conjecture63 :=
 root_iff_lower_horizontalMFEE.mpr ⟨lower_horizontal_of_rationalMAD5 H,ho,h4⟩

end
end MathGKM.Markov
