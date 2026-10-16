import MarkovThirdAllmidhigh_1_2Part0M9FC
import MarkovThirdAllmidhigh_1_2Part1M9FC
import MarkovThirdAllmidhigh_1_2Part2M9FC
import MarkovThirdAllmidhigh_1_2Part3M9FC
import MarkovThirdAllmidhigh_1_2Part4M9FC
import MarkovThirdAllmidhigh_1_2Part5M9FC
import MarkovThirdAllmidhigh_1_2Part6M9FC
import MarkovThirdAllmidhigh_1_2Part7M9FC
import MarkovThirdAllmidhigh_1_2Part8M9FC
import MarkovThirdAllmidhigh_1_2Part9M9FC
import MarkovThirdAllmidhigh_1_2Part10M9FC
import MarkovThirdAllmidhigh_1_2Part11M9FC
import MarkovThirdAllmidhigh_1_2Part12M9FC
import MarkovThirdAllmidhigh_1_2Part13M9FC
import MarkovThirdAllmidhigh_1_2Part14M9FC
import MarkovThirdAllmidhigh_1_2Part15M9FC
import MarkovThirdAllmidhigh_1_2Part16M9FC
import MarkovThirdAllmidhigh_1_2Part17M9FC
import MarkovThirdAllmidhigh_1_2Part18M9FC
import MarkovThirdAllmidhigh_1_2Part19M9FC
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAllchart_midhigh_1_2M9FC (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 vAllBoundsM115 (7+2*y+3*x) (4+y+2*x) (1+x) (3+y+x) (0) := by
 intro q hq
 constructor
 · intro j
   by_cases h0 : j ≤ 1
   · rw [vE_zeroM115 _ _ _ _ _ q (j-1) (by omega) (by omega),zero_mul]; exact sq_nonneg _
   by_cases hN : 3*q+6 ≤ j
   · rw [vE_pastM115 _ _ _ _ _ q (j+1) (by omega) (by omega),v3pastM115,mul_zero]; exact sq_nonneg _
   by_cases h2 : j=2
   · convert (vAll_midhigh_1_2_first2M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h3 : j=3
   · convert (vAll_midhigh_1_2_first3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_midhigh_1_2_first4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_midhigh_1_2_lowM9FC x y (j-5) (q-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_midhigh_1_2_cross1_1M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_midhigh_1_2_cross1_2M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_midhigh_1_2_cross1_3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_midhigh_1_2_cross1_4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_midhigh_1_2_mid1M9FC x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_midhigh_1_2_cross2_2M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_midhigh_1_2_cross2_3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_midhigh_1_2_cross2_4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_midhigh_1_2_cross2_5M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_midhigh_1_2_mid2M9FC x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 := by omega
   rcases ht with ht|ht|ht|ht
   · convert (vAll_midhigh_1_2_tail2M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midhigh_1_2_tail3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midhigh_1_2_tail4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midhigh_1_2_tail5M9FC x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
 · intro j hj3 hjN
   by_cases h3 : j=3
   · convert (vAll_midhigh_1_2_first3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_midhigh_1_2_first4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_midhigh_1_2_lowM9FC x y (j-5) (q-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_midhigh_1_2_cross1_1M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_midhigh_1_2_cross1_2M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_midhigh_1_2_cross1_3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_midhigh_1_2_cross1_4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_midhigh_1_2_mid1M9FC x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_midhigh_1_2_cross2_2M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_midhigh_1_2_cross2_3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_midhigh_1_2_cross2_4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_midhigh_1_2_cross2_5M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_midhigh_1_2_mid2M9FC x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 ∨ j=3*q+6 := by omega
   rcases ht with ht|ht|ht|ht|ht
   · convert (vAll_midhigh_1_2_tail2M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midhigh_1_2_tail3M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midhigh_1_2_tail4M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midhigh_1_2_tail5M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midhigh_1_2_tail6M9FC x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
end
end MathGKM.Markov
