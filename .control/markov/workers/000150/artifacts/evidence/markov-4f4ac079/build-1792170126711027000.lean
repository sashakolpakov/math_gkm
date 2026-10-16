import MarkovUpperDifferenceM4F4
import MarkovVerticalRegionsM0D3
/-! Machine-authored 4f4ac079. A common finite convolution for both regions,
with an actual-source adapter. No log-concavity premise is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

def twoKernelM4F4 (i j m : ℕ) : ℤ :=
 ((j+i).choose i:ℤ)*(m.choose (i-2):ℤ)+
 2*∑ k∈range (min j m), ((j-(k+1)+i).choose i:ℤ)*((m-(k+1)).choose (i-2):ℤ)

theorem two_kernel_nonnegM4F4 (i j m : ℕ) : 0 ≤ twoKernelM4F4 i j m := by
 unfold twoKernelM4F4
 positivity

theorem lower_kernelM4F4 (i j d : ℕ) (hi : 2 ≤ i) :
 lowerValM58E j d i=twoKernelM4F4 i j (j+2*d) := by
 rw [lower_prefixM4F4 i j d hi]
 unfold twoKernelM4F4 lowerBaseM4F4
 rw [min_eq_left (by omega : j ≤ j+2*d)]
 congr 1
 congr 1
 rw [←sum_range_reflect (fun t => ((t+i).choose i:ℤ)*((t+2*d).choose (i-2):ℤ)) j]
 apply sum_congr rfl
 intro k hk
 have hk' := mem_range.mp hk
 rw [show j-1-k=j-(k+1) by omega,show j+2*d-(k+1)=j-(k+1)+2*d by omega]

theorem upper_kernelM4F4 (i N d : ℕ) (hi : 2 ≤ i) (hd : 1 ≤ d) :
 upperValM2B3 N d i=twoKernelM4F4 i (N+2*d) N := by
 rw [upper_prefixM4F4 i N d hi hd]
 unfold twoKernelM4F4 upperBaseM4F4
 rw [min_eq_right (by omega : N ≤ N+2*d)]
 congr 1
 congr 1
 rw [←sum_range_reflect (fun t => ((t+2*d+i).choose i:ℤ)*(t.choose (i-2):ℤ)) N]
 apply sum_congr rfl
 intro k hk
 have hk' := mem_range.mp hk
 rw [show N-1-k=N-(k+1) by omega,show N+2*d-(k+1)=N-(k+1)+2*d by omega]

theorem two_kernel_zeroM4F4 (i j m : ℕ) (hm : m < i-2) : twoKernelM4F4 i j m=0 := by
 unfold twoKernelM4F4
 rw [Nat.choose_eq_zero_of_lt hm,Nat.cast_zero,mul_zero,zero_add]
 have hz : (∑ k∈range (min j m), ((j-(k+1)+i).choose i:ℤ)*((m-(k+1)).choose (i-2):ℤ))=0 := by
   apply sum_eq_zero
   intro k hk
   rw [Nat.choose_eq_zero_of_lt (by omega : m-(k+1) < i-2),Nat.cast_zero,mul_zero]
 rw [hz,mul_zero]

theorem two_kernel_posM4F4 (i j m : ℕ) (hm : i-2 ≤ m) : 0 < twoKernelM4F4 i j m := by
 have h0 : 0 < ((j+i).choose i:ℤ) := by exact_mod_cast Nat.choose_pos (by omega : i ≤ j+i)
 have h1 : 0 < (m.choose (i-2):ℤ) := by exact_mod_cast Nat.choose_pos hm
 unfold twoKernelM4F4
 have hs : 0 ≤ ∑ k∈range (min j m), ((j-(k+1)+i).choose i:ℤ)*((m-(k+1)).choose (i-2):ℤ) := by
   positivity
 nlinarith [mul_pos h0 h1]

theorem source_two_kernelM4F4 (path : List Bool) (q i j : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*q+1)
 (hi : 3 ≤ i) (hj : j ≤ 2*q) :
 coeff (frame path).mid.p i j=twoKernelM4F4 i j (2*q-j) := by
 by_cases hl : j ≤ q
 · have he : q=j+(q-j) := by omega
   rw [source_two_lower_formulaM58E path j (q-j) i ha (by rw [←he]; exact hb),
     lower_kernelM4F4 i j (q-j) (by omega)]
   congr 1
   omega
 · by_cases hN : 1 ≤ 2*q-j
   · have hh := source_two_upper_formulaM2B3 path (2*q-j) (j-q) i hN (by omega) ha
       (by convert hb using 2 <;> omega)
     rw [show 2*q-j+2*(j-q)=j by omega] at hh
     rw [hh,upper_kernelM4F4 i (2*q-j) (j-q) (by omega) (by omega)]
     congr 1
     omega
   · have he : j=2*q := by omega
     have hp : ¬InPolygon (frame path).mid.a (frame path).mid.b i j := by
       rw [ha,hb]
       unfold InPolygon
       omega
     rw [raw_outside_polygon18 path i j hp,two_kernel_zeroM4F4 i j (2*q-j) (by omega)]

theorem source_two_kernel_outsideM4F4 (path : List Bool) (q i j : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*q+1)
 (hi : 3 ≤ i) (hj : 2*q < j) : coeff (frame path).mid.p i j=0 := by
 apply raw_outside_polygon18
 rw [ha,hb]
 unfold InPolygon
 omega

theorem source_two_vertical_of_kernelM4F4 (i : ℕ) (hi : 4 ≤ i)
 (hk : ∀ j m, twoKernelM4F4 i j (m+2)*twoKernelM4F4 i (j+2) m ≤
   twoKernelM4F4 i (j+1) (m+1)^2)
 (path : List Bool) (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,hq,hb,_⟩ := source_two_squares3556 path ha
 by_cases hj : j+2 ≤ 2*q
 · rw [source_two_kernelM4F4 path q i j ha hb (by omega) (by omega),
     source_two_kernelM4F4 path q i (j+2) ha hb (by omega) hj,
     source_two_kernelM4F4 path q i (j+1) ha hb (by omega) (by omega)]
   convert hk j (2*q-j-2) using 1 <;> congr 2 <;> omega
 · rw [source_two_kernel_outsideM4F4 path q i (j+2) ha hb (by omega) (by omega),mul_zero]
   exact sq_nonneg _
end
end MathGKM.Markov
