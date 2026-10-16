import MarkovStripMiddleChooseMD11
import MarkovStripMiddleSourceMD11
import MarkovStripCoefficientsMD11
import MarkovMiddleDefsM570
/-! Machine-authored 5703599b, adapted from excluded d11e335e draft. Exact scaled source correction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 9000000
attribute [local irreducible] frame coeff

theorem source_middle_four_scaledM570 (path : List Bool) (k l : ℕ)
 (hb : 9 ≤ (frame path).mid.b) (hs : 3*(frame path).mid.a ≤ (frame path).mid.b)
 (hu : (frame path).mid.b ≤ 4*(frame path).mid.a)
 (hbl : (frame path).mid.b=k+l+2) (hl : 3 ≤ l) :
 24*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*
 (coeff (frame path).mid.p ((frame path).mid.a+k) 4:ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*
 stripMiddleIM570 (frame path).mid.a k l (4*(frame path).mid.a-(frame path).mid.b:ℕ) := by
 have hc := strip_middle_four_coeffMD11 path hb hs hu k
 have h := strip_quartic_scaledMD11 k l hl (by omega) (frame path).mid.a
 have hq := strip_choose_correctionMD11 k l (by omega)
 rw [hbl,show k+l+2-9=k+l-7 by omega] at hc
 push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc
 unfold stripMiddleIM570
 rw [hbl]
 linear_combination
   ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*hc+
   (k+1)*h+96*(4*(frame path).mid.a-(k+l+2):ℕ)*hq
end
end MathGKM.Markov
