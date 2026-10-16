import MarkovThirdSmallGap31P0MF8
import MarkovThirdSmallGap31P1MF8
import MarkovThirdSmallGap31P2MF8
import MarkovThirdSmallGap31P3MF8
import MarkovThirdSmallGap31P4MF8
import MarkovThirdSmallGap31P5MF8
import MarkovThirdSmallGap31P6MF8
import MarkovThirdSmallGap31P7MF8
import MarkovThirdSmallGap31P8MF8
import MarkovThirdSmallGap31P9MF8
import MarkovThirdSmallGap31P10MF8
import MarkovThirdSmallGap31P11MF8
import MarkovThirdSmallGap31P12MF8
import MarkovThirdSmallGap31P13MF8
import MarkovThirdSmallGap31P14MF8
import MarkovThirdSmallGap31P15MF8
import MarkovThirdSmallGap31P16MF8
import MarkovThirdSmallGap31P17MF8
import MarkovThirdSmallGap31P18MF8
import MarkovThirdSmallGap31P19MF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
theorem sThird31zeroMF8 (q j : ℤ) (hq : 1≤q) (hj : j≤0) : sThird31EMF8 q j=0 := by
 unfold sThird31EMF8
 rw [vFall_zeroM115 (j-0*q) 2 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-0*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-1*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-2*q) 6 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 3 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 4 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 5 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 6 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 7 (by omega)]
 rw [vFall_zeroM115 (j-3*q) 8 (by omega)]
 simp only [sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8]
 ring
theorem sThird31pastMF8 (q j : ℤ) (hq : 1≤q) (hj : 3*q+7≤j) : sThird31EMF8 q j=0 := by
 unfold sThird31EMF8
 rw [vFall_polyM115 (j-0*q) 2 (by omega)]
 rw [vFall_polyM115 (j-0*q) 3 (by omega)]
 rw [vFall_polyM115 (j-0*q) 4 (by omega)]
 rw [vFall_polyM115 (j-1*q) 3 (by omega)]
 rw [vFall_polyM115 (j-1*q) 4 (by omega)]
 rw [vFall_polyM115 (j-1*q) 5 (by omega)]
 rw [vFall_polyM115 (j-2*q) 3 (by omega)]
 rw [vFall_polyM115 (j-2*q) 4 (by omega)]
 rw [vFall_polyM115 (j-2*q) 5 (by omega)]
 rw [vFall_polyM115 (j-2*q) 6 (by omega)]
 rw [vFall_polyM115 (j-3*q) 3 (by omega)]
 rw [vFall_polyM115 (j-3*q) 4 (by omega)]
 rw [vFall_polyM115 (j-3*q) 5 (by omega)]
 rw [vFall_polyM115 (j-3*q) 6 (by omega)]
 rw [vFall_polyM115 (j-3*q) 7 (by omega)]
 rw [vFall_polyM115 (j-3*q) 8 (by omega)]
 simp only [sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8]
 ring
theorem sThird31adjacentMF8 (q j : ℤ) (hq : 1≤q) :
 sThird31EMF8 q (j-1)*sThird31EMF8 q (j+1) ≤ sThird31EMF8 q j^2 := by
 by_cases h0 : j≤1
 · rw [sThird31zeroMF8 q (j-1) hq (by omega),zero_mul]; exact sq_nonneg _
 by_cases hN : 3*q+6≤j
 · rw [sThird31pastMF8 q (j+1) hq (by omega),mul_zero]; exact sq_nonneg _
 by_cases hq5 : q<5
 · interval_cases q <;> interval_cases j <;> norm_num [sThird31EMF8,sThird31c0_2MF8,sThird31c0_3MF8,sThird31c0_4MF8,sThird31c1_3MF8,sThird31c1_4MF8,sThird31c1_5MF8,sThird31c2_3MF8,sThird31c2_4MF8,sThird31c2_5MF8,sThird31c2_6MF8,sThird31c3_3MF8,sThird31c3_4MF8,sThird31c3_5MF8,sThird31c3_6MF8,sThird31c3_7MF8,sThird31c3_8MF8,vFallM115]
 by_cases h2 : j=2
 · convert sThird31first2MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases h3 : j=3
 · convert sThird31first3MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases h4 : j=4
 · convert sThird31first4MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hl : j≤q
 · convert sThird31lowMF8 (j-5) (q-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc1 : j=q+1
 · convert sThird31cross1_1MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc2 : j=q+2
 · convert sThird31cross1_2MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc3 : j=q+3
 · convert sThird31cross1_3MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hc4 : j=q+4
 · convert sThird31cross1_4MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hm1 : j≤2*q+1
 · convert sThird31mid1MF8 (j-q-5) (2*q+1-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd2 : j=2*q+2
 · convert sThird31cross2_2MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd3 : j=2*q+3
 · convert sThird31cross2_3MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd4 : j=2*q+4
 · convert sThird31cross2_4MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hd5 : j=2*q+5
 · convert sThird31cross2_5MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 by_cases hm2 : j≤3*q+1
 · convert sThird31mid2MF8 (j-2*q-6) (3*q+1-j) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 := by omega
 rcases ht with ht|ht|ht|ht
 · convert sThird31tail2MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert sThird31tail3MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert sThird31tail4MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega
 · convert sThird31tail5MF8 (q-5) (0) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega

theorem sThird31rawMF8 (n : ℕ) (hn : 0≤n) (rest : List Bool)
 (ha : (frame rest).mid.a=2) (hb : (frame rest).mid.b=3) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m : ℕ := 0
 have hc (k : ℕ) : 720*coeff (frame path).mid.p 3 k=sThird31EMF8 (n+1) ((k:ℤ)+2) := by
   have h := sThird31coeffMF8 (6*X^2*((frame path).mid.p).coeff 3) 0 (n+1) (k+2)
     (by simpa only [pow_zero,one_mul,one_mul,Nat.cast_add,Nat.cast_one] using sThird31sourceMF8 n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Nat.cast_zero,sub_zero,mul_assoc] at h
   simp only [show (6:ℤ[X])=C (6:ℤ) from rfl,Polynomial.coeff_C_mul] at h
   rw [Polynomial.coeff_X_pow_mul] at h
   change 120*(6*coeff (frame path).mid.p 3 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : sThird31EMF8 (n+1) ((j:ℤ)+2)*sThird31EMF8 (n+1) (j+2+2) ≤ sThird31EMF8 (n+1) (j+1+2)^2 := by
   convert sThird31adjacentMF8 (n+1) (j+1+2) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]
end
end MathGKM.Markov
