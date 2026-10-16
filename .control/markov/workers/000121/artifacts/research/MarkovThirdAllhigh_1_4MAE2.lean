import MarkovThirdAllhigh_1_4Part0MAE2
import MarkovThirdAllhigh_1_4Part1MAE2
import MarkovThirdAllhigh_1_4Part2MAE2
import MarkovThirdAllhigh_1_4Part3MAE2
import MarkovThirdAllhigh_1_4Part4MAE2
import MarkovThirdAllhigh_1_4Part5MAE2
import MarkovThirdAllhigh_1_4Part6MAE2
import MarkovThirdAllhigh_1_4Part7MAE2
import MarkovThirdAllhigh_1_4Part8MAE2
import MarkovThirdAllhigh_1_4Part9MAE2
import MarkovThirdAllhigh_1_4Part10MAE2
import MarkovThirdAllhigh_1_4Part11MAE2
import MarkovThirdAllhigh_1_4Part12MAE2
import MarkovThirdAllhigh_1_4Part13MAE2
import MarkovThirdAllhigh_1_4Part14MAE2
import MarkovThirdAllhigh_1_4Part15MAE2
import MarkovThirdAllhigh_1_4Part16MAE2
import MarkovThirdAllhigh_1_4Part17MAE2
import MarkovThirdAllhigh_1_4Part18MAE2
import MarkovThirdAllhigh_1_4Part19MAE2
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAllchart_high_1_4MAE2 (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 vAllBoundsM115 (7+y+3*x) (6+y+2*x) (5+y+x) (1+x) (4+y) := by
 intro q hq
 constructor
 · intro j
   by_cases h0 : j ≤ 1
   · rw [vE_zeroM115 _ _ _ _ _ q (j-1) (by omega) (by omega),zero_mul]; exact sq_nonneg _
   by_cases hN : 3*q+6 ≤ j
   · rw [vE_pastM115 _ _ _ _ _ q (j+1) (by omega) (by omega),v3pastM115,mul_zero]; exact sq_nonneg _
   by_cases h2 : j=2
   · convert (vAll_high_1_4_first2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h3 : j=3
   · convert (vAll_high_1_4_first3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_high_1_4_first4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_high_1_4_lowMAE2 x y (j-5) (q-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_high_1_4_cross1_1MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_high_1_4_cross1_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_high_1_4_cross1_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_high_1_4_cross1_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_high_1_4_mid1MAE2 x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_high_1_4_cross2_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_high_1_4_cross2_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_high_1_4_cross2_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_high_1_4_cross2_5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_high_1_4_mid2MAE2 x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 := by omega
   rcases ht with ht|ht|ht|ht
   · convert (vAll_high_1_4_tail2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_high_1_4_tail3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_high_1_4_tail4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_high_1_4_tail5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
 · intro j hj3 hjN
   by_cases h3 : j=3
   · convert (vAll_high_1_4_first3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_high_1_4_first4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_high_1_4_lowMAE2 x y (j-5) (q-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_high_1_4_cross1_1MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_high_1_4_cross1_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_high_1_4_cross1_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_high_1_4_cross1_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_high_1_4_mid1MAE2 x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_high_1_4_cross2_2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_high_1_4_cross2_3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_high_1_4_cross2_4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_high_1_4_cross2_5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_high_1_4_mid2MAE2 x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 ∨ j=3*q+6 := by omega
   rcases ht with ht|ht|ht|ht|ht
   · convert (vAll_high_1_4_tail2MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_high_1_4_tail3MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_high_1_4_tail4MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_high_1_4_tail5MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_high_1_4_tail6MAE2 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
end
end MathGKM.Markov
