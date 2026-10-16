import MarkovThirdAlllow_1_1Part0MAE2
import MarkovThirdAlllow_1_1Part1MAE2
import MarkovThirdAlllow_1_1Part2MAE2
import MarkovThirdAlllow_1_1Part3MAE2
import MarkovThirdAlllow_1_1Part4MAE2
import MarkovThirdAlllow_1_1Part5MAE2
import MarkovThirdAlllow_1_1Part6MAE2
import MarkovThirdAlllow_1_1Part7MAE2
import MarkovThirdAlllow_1_1Part8MAE2
import MarkovThirdAlllow_1_1Part9MAE2
import MarkovThirdAlllow_1_1Part10MAE2
import MarkovThirdAlllow_1_1Part11MAE2
import MarkovThirdAlllow_1_1Part12MAE2
import MarkovThirdAlllow_1_1Part13MAE2
import MarkovThirdAlllow_1_1Part14MAE2
import MarkovThirdAlllow_1_1Part15MAE2
import MarkovThirdAlllow_1_1Part16MAE2
import MarkovThirdAlllow_1_1Part17MAE2
import MarkovThirdAlllow_1_1Part18MAE2
import MarkovThirdAlllow_1_1Part19MAE2
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAllchart_low_1_1MAE2 (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 vAllBoundsM115 (7+y+3*x) (2+x) (0) (0) (0) := by
 intro q hq
 constructor
 · intro j
   by_cases h0 : j ≤ 1
   · rw [vE_zeroM115 _ _ _ _ _ q (j-1) (by omega) (by omega),zero_mul]; exact sq_nonneg _
   by_cases hN : 3*q+6 ≤ j
   · rw [vE_pastM115 _ _ _ _ _ q (j+1) (by omega) (by omega),v3pastM115,mul_zero]; exact sq_nonneg _
   by_cases h2 : j=2
   · convert (vAll_low_1_1_first2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h3 : j=3
   · convert (vAll_low_1_1_first3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_low_1_1_first4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_low_1_1_lowMAE2 x y (j-5) (q-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_low_1_1_cross1_1MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_low_1_1_cross1_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_low_1_1_cross1_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_low_1_1_cross1_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_low_1_1_mid1MAE2 x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_low_1_1_cross2_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_low_1_1_cross2_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_low_1_1_cross2_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_low_1_1_cross2_5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_low_1_1_mid2MAE2 x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 := by omega
   rcases ht with ht|ht|ht|ht
   · convert (vAll_low_1_1_tail2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_low_1_1_tail3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_low_1_1_tail4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_low_1_1_tail5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
 · intro j hj3 hjN
   by_cases h3 : j=3
   · convert (vAll_low_1_1_first3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_low_1_1_first4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_low_1_1_lowMAE2 x y (j-5) (q-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_low_1_1_cross1_1MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_low_1_1_cross1_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_low_1_1_cross1_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_low_1_1_cross1_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_low_1_1_mid1MAE2 x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_low_1_1_cross2_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_low_1_1_cross2_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_low_1_1_cross2_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_low_1_1_cross2_5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_low_1_1_mid2MAE2 x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 ∨ j=3*q+6 := by omega
   rcases ht with ht|ht|ht|ht|ht
   · convert (vAll_low_1_1_tail2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_low_1_1_tail3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_low_1_1_tail4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_low_1_1_tail5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_low_1_1_tail6MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
end
end MathGKM.Markov
