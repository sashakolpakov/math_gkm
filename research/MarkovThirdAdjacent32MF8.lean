import MarkovThirdFinite32Q1MF8
import MarkovThirdFinite32Q2MF8
import MarkovThirdFinite32Q3MF8
import MarkovThirdFinite32Q4MF8
import MarkovThirdSmallGap32P0MF8
import MarkovThirdSmallGap32P1MF8
import MarkovThirdSmallGap32P2MF8
import MarkovThirdSmallGap32P3MF8
import MarkovThirdSmallGap32P4MF8
import MarkovThirdSmallGap32P5MF8
import MarkovThirdSmallGap32P6MF8
import MarkovThirdSmallGap32P7MF8
import MarkovThirdSmallGap32P8MF8
import MarkovThirdSmallGap32P9MF8
import MarkovThirdSmallGap32P10MF8
import MarkovThirdSmallGap32P11MF8
import MarkovThirdSmallGap32P12MF8
import MarkovThirdSmallGap32P13MF8
import MarkovThirdSmallGap32P14MF8
import MarkovThirdSmallGap32P15MF8
import MarkovThirdSmallGap32P16MF8
import MarkovThirdSmallGap32P17MF8
import MarkovThirdSmallGap32P18MF8
import MarkovThirdSmallGap32P19MF8
import MarkovThirdSupport32MF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird32adjacentMF8 (q j : ℤ) (hq : 1≤q) :
 sThird32EMF8 q (j-1)*sThird32EMF8 q (j+1) ≤ sThird32EMF8 q j^2 := by
 by_cases h0 : j≤1
 · rw [sThird32zeroMF8 q (j-1) hq (by omega),zero_mul]; exact sq_nonneg _
 by_cases hN : 3*q+6≤j
 · rw [sThird32pastMF8 q (j+1) hq (by omega),mul_zero]; exact sq_nonneg _
 by_cases hq5 : q<5
 · interval_cases q
   · exact sThird32finite1MF8 j (by omega) (by omega)
   · exact sThird32finite2MF8 j (by omega) (by omega)
   · exact sThird32finite3MF8 j (by omega) (by omega)
   · exact sThird32finite4MF8 j (by omega) (by omega)
 have transport (q' j' : ℤ) (hq' : q'=q) (hj' : j'=j)
   (h : sThird32EMF8 q' (j'-1)*sThird32EMF8 q' (j'+1) ≤ sThird32EMF8 q' j'^2) :
   sThird32EMF8 q (j-1)*sThird32EMF8 q (j+1) ≤ sThird32EMF8 q j^2 := by
   simpa only [hq',hj'] using h
 by_cases h2 : j=2
 · apply transport _ _ ?_ ?_ (sThird32first2MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases h3 : j=3
 · apply transport _ _ ?_ ?_ (sThird32first3MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases h4 : j=4
 · apply transport _ _ ?_ ?_ (sThird32first4MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hl : j≤q
 · apply transport _ _ ?_ ?_ (sThird32lowMF8 (j-5) (q-j) (by omega) (by omega)) <;> omega
 by_cases hc1 : j=q+1
 · apply transport _ _ ?_ ?_ (sThird32cross1_1MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hc2 : j=q+2
 · apply transport _ _ ?_ ?_ (sThird32cross1_2MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hc3 : j=q+3
 · apply transport _ _ ?_ ?_ (sThird32cross1_3MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hc4 : j=q+4
 · apply transport _ _ ?_ ?_ (sThird32cross1_4MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hm1 : j≤2*q+1
 · apply transport _ _ ?_ ?_ (sThird32mid1MF8 (j-q-5) (2*q+1-j) (by omega) (by omega)) <;> omega
 by_cases hd2 : j=2*q+2
 · apply transport _ _ ?_ ?_ (sThird32cross2_2MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hd3 : j=2*q+3
 · apply transport _ _ ?_ ?_ (sThird32cross2_3MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hd4 : j=2*q+4
 · apply transport _ _ ?_ ?_ (sThird32cross2_4MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hd5 : j=2*q+5
 · apply transport _ _ ?_ ?_ (sThird32cross2_5MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 by_cases hm2 : j≤3*q+1
 · apply transport _ _ ?_ ?_ (sThird32mid2MF8 (j-2*q-6) (3*q+1-j) (by omega) (by omega)) <;> omega
 have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 := by omega
 rcases ht with ht|ht|ht|ht
 · apply transport _ _ ?_ ?_ (sThird32tail2MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 · apply transport _ _ ?_ ?_ (sThird32tail3MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 · apply transport _ _ ?_ ?_ (sThird32tail4MF8 (q-5) (0) (by omega) (by omega)) <;> omega
 · apply transport _ _ ?_ ?_ (sThird32tail5MF8 (q-5) (0) (by omega) (by omega)) <;> omega

end
end MathGKM.Markov
