import MarkovNextSourceM570
import MarkovNextDefsM570
import MarkovStripMiddleChooseMD11
import MarkovStripCoefficientsMD11
/-! Machine-authored 5703599b. Next-cone raw fourth-row identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
attribute [local irreducible] frame coeff

theorem source_next_four_scaledM570 (path : List Bool) (k l : ℕ)
 (hb : 9 ≤ (frame path).mid.b) (hs : 2*(frame path).mid.a ≤ (frame path).mid.b)
 (hu : (frame path).mid.b ≤ 3*(frame path).mid.a)
 (hbl : (frame path).mid.b=k+l+2) (hl : 3 ≤ l) :
 24*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*
 (coeff (frame path).mid.p ((frame path).mid.a+k) 4:ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*
 stripNextIM570 (frame path).mid.a k l (3*(frame path).mid.a-(frame path).mid.b:ℕ) := by
 have hc := strip_next_four_coeffM570 path hb hs hu k
 have h := strip_quartic_scaledMD11 k l hl (by omega) (frame path).mid.a
 have hq := strip_choose_correctionMD11 k l (by omega)
 have h0 := strip_choose_sevenMD11 (k+l) k (by omega)
 rw [hbl,show k+l+2-9=k+l-7 by omega] at hc
 push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc h0
 simp only [nextQuarticM570,mul_add,Polynomial.coeff_add,Polynomial.coeff_mul_C,
   Polynomial.coeff_one_add_X_pow] at hc
 unfold stripNextIM570 nextC0M570 nextC1M570 at *
 rw [hbl]
 linear_combination
   ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*hc+
   (k+1)*h+
   (-480*(3*(frame path).mid.a-(k+l+2):ℕ)+288*(frame path).mid.a*(3*(frame path).mid.a-(k+l+2):ℕ)+96*((k:ℝ)+l+2-2*(frame path).mid.a))*hq+
   (96*(frame path).mid.a+96*((k:ℝ)+l+2)-864)*(3*(frame path).mid.a-(k+l+2):ℕ)*(k+1)*h0
end
end MathGKM.Markov
