import MarkovThirdSmallGap65P0M762
import MarkovThirdSmallGap65P1M762
import MarkovThirdSmallGap65P2M762
import MarkovThirdSmallGap65P3M762
import MarkovThirdSmallGap65P4M762
import MarkovThirdSmallGap65P5M762
import MarkovThirdSmallGap65P6M762
import MarkovThirdSmallGap65P7M762
import MarkovThirdSmallGap65P8M762
import MarkovThirdSmallGap65P9M762
import MarkovThirdSmallGap65P10M762
import MarkovThirdSmallGap65P11M762
import MarkovThirdSmallGap65P12M762
import MarkovThirdSmallGap65P13M762
import MarkovThirdSmallGap65P14M762
import MarkovThirdSmallGap65P15M762
import MarkovThirdSmallGap65P16M762
import MarkovThirdSmallGap65P17M762
import MarkovThirdSmallGap65P18M762
import MarkovThirdSmallGap65P19M762
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird65zeroM762 (q j : ℤ) (hq : 2≤q) (hj : j≤0) : sThird65EM762 q j=0 := by
 unfold sThird65EM762
 rw [vFall_zeroM115 (j-0*q) 1 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 2 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 2 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 6 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 7 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 6 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 7 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 8 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 9 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 6 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 7 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 8 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 9 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 10 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 11 (by omega)]
 simp only [sThird65c0_1M762,sThird65c0_2M762,sThird65c0_3M762,sThird65c0_4M762,sThird65c0_5M762,sThird65c1_2M762,sThird65c1_3M762,sThird65c1_4M762,sThird65c1_5M762,sThird65c1_6M762,sThird65c1_7M762,sThird65c2_3M762,sThird65c2_4M762,sThird65c2_5M762,sThird65c2_6M762,sThird65c2_7M762,sThird65c2_8M762,sThird65c2_9M762,sThird65c3_3M762,sThird65c3_4M762,sThird65c3_5M762,sThird65c3_6M762,sThird65c3_7M762,sThird65c3_8M762,sThird65c3_9M762,sThird65c3_10M762,sThird65c3_11M762]
 ring
theorem sThird65pastM762 (q j : ℤ) (hq : 2≤q) (hj : 3*q+7≤j) : sThird65EM762 q j=0 := by
 unfold sThird65EM762
 rw [vFall_polyM115 (j-0*q) 1 (by omega)]
 rw [vFall_polyM115 (j-0*q) 2 (by omega)]
 rw [vFall_polyM115 (j-0*q) 3 (by omega)]
 rw [vFall_polyM115 (j-0*q) 4 (by omega)]
 rw [vFall_polyM115 (j-0*q) 5 (by omega)]
 rw [vFall_polyM115 (j-1*q) 2 (by omega)]
 rw [vFall_polyM115 (j-1*q) 3 (by omega)]
 rw [vFall_polyM115 (j-1*q) 4 (by omega)]
 rw [vFall_polyM115 (j-1*q) 5 (by omega)]
 rw [vFall_polyM115 (j-1*q) 6 (by omega)]
 rw [vFall_polyM115 (j-1*q) 7 (by omega)]
 rw [vFall_polyM115 (j-2*q) 3 (by omega)]
 rw [vFall_polyM115 (j-2*q) 4 (by omega)]
 rw [vFall_polyM115 (j-2*q) 5 (by omega)]
 rw [vFall_polyM115 (j-2*q) 6 (by omega)]
 rw [vFall_polyM115 (j-2*q) 7 (by omega)]
 rw [vFall_polyM115 (j-2*q) 8 (by omega)]
 rw [vFall_polyM115 (j-2*q) 9 (by omega)]
 rw [vFall_polyM115 (j-3*q) 3 (by omega)]
 rw [vFall_polyM115 (j-3*q) 4 (by omega)]
 rw [vFall_polyM115 (j-3*q) 5 (by omega)]
 rw [vFall_polyM115 (j-3*q) 6 (by omega)]
 rw [vFall_polyM115 (j-3*q) 7 (by omega)]
 rw [vFall_polyM115 (j-3*q) 8 (by omega)]
 rw [vFall_polyM115 (j-3*q) 9 (by omega)]
 rw [vFall_polyM115 (j-3*q) 10 (by omega)]
 rw [vFall_polyM115 (j-3*q) 11 (by omega)]
 simp only [sThird65c0_1M762,sThird65c0_2M762,sThird65c0_3M762,sThird65c0_4M762,sThird65c0_5M762,sThird65c1_2M762,sThird65c1_3M762,sThird65c1_4M762,sThird65c1_5M762,sThird65c1_6M762,sThird65c1_7M762,sThird65c2_3M762,sThird65c2_4M762,sThird65c2_5M762,sThird65c2_6M762,sThird65c2_7M762,sThird65c2_8M762,sThird65c2_9M762,sThird65c3_3M762,sThird65c3_4M762,sThird65c3_5M762,sThird65c3_6M762,sThird65c3_7M762,sThird65c3_8M762,sThird65c3_9M762,sThird65c3_10M762,sThird65c3_11M762]
 ring
theorem sThird65adjacentM762 (q j : ℤ) (hq : 2≤q) :
 sThird65EM762 q (j-1)*sThird65EM762 q (j+1) ≤ sThird65EM762 q j^2 := by
 by_cases h0 : j≤1
 · rw [sThird65zeroM762 q (j-1) hq (by omega),zero_mul]; exact sq_nonneg _
 by_cases hN : 3*q+6≤j
 · rw [sThird65pastM762 q (j+1) hq (by omega),mul_zero]; exact sq_nonneg _
 by_cases hq5 : q<5
 · interval_cases q <;> interval_cases j <;> norm_num [sThird65EM762,sThird65c0_1M762,sThird65c0_2M762,sThird65c0_3M762,sThird65c0_4M762,sThird65c0_5M762,sThird65c1_2M762,sThird65c1_3M762,sThird65c1_4M762,sThird65c1_5M762,sThird65c1_6M762,sThird65c1_7M762,sThird65c2_3M762,sThird65c2_4M762,sThird65c2_5M762,sThird65c2_6M762,sThird65c2_7M762,sThird65c2_8M762,sThird65c2_9M762,sThird65c3_3M762,sThird65c3_4M762,sThird65c3_5M762,sThird65c3_6M762,sThird65c3_7M762,sThird65c3_8M762,sThird65c3_9M762,sThird65c3_10M762,sThird65c3_11M762,vFallM115]
 by_cases h2 : j=2
 · convert sThird65first2M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases h3 : j=3
 · convert sThird65first3M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases h4 : j=4
 · convert sThird65first4M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hl : j≤q
 · convert sThird65lowM762 (j-5) (q-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc1 : j=q+1
 · convert sThird65cross1_1M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc2 : j=q+2
 · convert sThird65cross1_2M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc3 : j=q+3
 · convert sThird65cross1_3M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc4 : j=q+4
 · convert sThird65cross1_4M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hm1 : j≤2*q+1
 · convert sThird65mid1M762 (j-q-5) (2*q+1-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd2 : j=2*q+2
 · convert sThird65cross2_2M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd3 : j=2*q+3
 · convert sThird65cross2_3M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd4 : j=2*q+4
 · convert sThird65cross2_4M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd5 : j=2*q+5
 · convert sThird65cross2_5M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hm2 : j≤3*q+1
 · convert sThird65mid2M762 (j-2*q-6) (3*q+1-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 := by omega
 rcases ht with ht|ht|ht|ht
 · convert sThird65tail2M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert sThird65tail3M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert sThird65tail4M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert sThird65tail5M762 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega

theorem sThird65rawM762 (n : ℕ) (hn : 1≤n) (rest : List Bool)
 (ha : (frame rest).mid.a=1) (hb : (frame rest).mid.b=6) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m := (frame path).mid.b-3*(n+2)
 have hc (k : ℕ) : 720*coeff (frame path).mid.p 3 k=sThird65EM762 (n+1) ((k:ℤ)-m) := by
   have h := sThird65coeffM762 (6*((frame path).mid.p).coeff 3) m (n+1) k
     (by simpa only [Nat.cast_add,Nat.cast_one] using sThird65sourceMAE2 n rest hn ha hb)
   simp only [Nat.cast_add,Nat.cast_one,Polynomial.coeff_ofNat_mul] at h
   change 120*(6*coeff (frame path).mid.p 3 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : sThird65EM762 (n+1) ((j:ℤ)-m)*sThird65EM762 (n+1) (j+2-m) ≤ sThird65EM762 (n+1) (j+1-m)^2 := by
   convert sThird65adjacentM762 (n+1) (j+1-m) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]
end
end MathGKM.Markov
