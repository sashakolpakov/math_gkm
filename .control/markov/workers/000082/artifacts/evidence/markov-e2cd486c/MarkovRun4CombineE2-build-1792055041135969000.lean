import MarkovRun4LowOneE2
import MarkovRun4LowLargeE2
import MarkovRun4HighOneE2
import MarkovRun4HighLargeE2
import MarkovCrossCoefficientsE2
namespace MathGKM.Markov
noncomputable section
theorem run4_cross_gap0E2 (c r : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (q : ℤ) (hq : q=max (2*r-c) 0) :
 crossTail153D 4 c r q*crossTail353D 4 c r q ≤ (crossTail253D 4 c r q)^2 := by
 by_cases hch : 2*r ≤ c
 · have hq' : q=0 := by omega
   rw [hq']
   by_cases h1 : r=1
   · subst r
     have hh := run4_LowOne_0E2 0 (c-4) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_LowLarge_0E2 (r-2) (c-2*r) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
 · have hq' : q=2*r-c := by omega
   rw [hq']
   by_cases h1 : c-r=1
   · have hh := run4_HighOne_0E2 (c-4) 0 (by omega) (by omega)
     have he : r=c-1 := by omega
     rw [he]
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_HighLarge_0E2 (2*r-c) (c-r-2) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
theorem run4_cross_gap1E2 (c r : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (q : ℤ) (hq : q=max (2*r-c) 0) :
 crossTail253D 4 c r q*crossTail453D 4 c r q ≤ (crossTail353D 4 c r q)^2 := by
 by_cases hch : 2*r ≤ c
 · have hq' : q=0 := by omega
   rw [hq']
   by_cases h1 : r=1
   · subst r
     have hh := run4_LowOne_1E2 0 (c-4) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_LowLarge_1E2 (r-2) (c-2*r) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
 · have hq' : q=2*r-c := by omega
   rw [hq']
   by_cases h1 : c-r=1
   · have hh := run4_HighOne_1E2 (c-4) 0 (by omega) (by omega)
     have he : r=c-1 := by omega
     rw [he]
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_HighLarge_1E2 (2*r-c) (c-r-2) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
theorem run4_cross_gap2E2 (c r : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (q : ℤ) (hq : q=max (2*r-c) 0) :
 crossTail353D 4 c r q*crossTail553D 4 c r q ≤ (crossTail453D 4 c r q)^2 := by
 by_cases hch : 2*r ≤ c
 · have hq' : q=0 := by omega
   rw [hq']
   by_cases h1 : r=1
   · subst r
     have hh := run4_LowOne_2E2 0 (c-4) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_LowLarge_2E2 (r-2) (c-2*r) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
 · have hq' : q=2*r-c := by omega
   rw [hq']
   by_cases h1 : c-r=1
   · have hh := run4_HighOne_2E2 (c-4) 0 (by omega) (by omega)
     have he : r=c-1 := by omega
     rw [he]
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_HighLarge_2E2 (2*r-c) (c-r-2) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
theorem run4_cross_gap3E2 (c r : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (q : ℤ) (hq : q=max (2*r-c) 0) :
 crossTail453D 4 c r q*crossTail653D 4 c r q ≤ (crossTail553D 4 c r q)^2 := by
 by_cases hch : 2*r ≤ c
 · have hq' : q=0 := by omega
   rw [hq']
   by_cases h1 : r=1
   · subst r
     have hh := run4_LowOne_3E2 0 (c-4) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_LowLarge_3E2 (r-2) (c-2*r) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
 · have hq' : q=2*r-c := by omega
   rw [hq']
   by_cases h1 : c-r=1
   · have hh := run4_HighOne_3E2 (c-4) 0 (by omega) (by omega)
     have he : r=c-1 := by omega
     rw [he]
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_HighLarge_3E2 (2*r-c) (c-r-2) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
theorem run4_cross_lcE2 (c r j : ℕ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (hj : 9 ≤ j) (hj' : j ≤ 12) :
 (thirdRunPolyADB2 4 c r).coeff j*(thirdRunPolyADB2 4 c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 4 c r).coeff (j+1))^2 := by
 have hq : ((2*r-c:ℕ):ℤ)=max (2*(r:ℤ)-c) 0 := by omega
 interval_cases j
 · have h := run4_cross_gap0E2 c r (by omega) (by omega) (by omega) _ hq
   rw [cross_tail_coeff1E2 4 c r (by omega) (by omega),
     cross_tail_coeff2E2 4 c r (by omega) (by omega),
     cross_tail_coeff3E2 4 c r (by omega) (by omega)] at h
   norm_num only [Nat.reduceAdd,Nat.reduceMul] at h ⊢
   nlinarith only [h]
 · have h := run4_cross_gap1E2 c r (by omega) (by omega) (by omega) _ hq
   rw [cross_tail_coeff2E2 4 c r (by omega) (by omega),
     cross_tail_coeff3E2 4 c r (by omega) (by omega),
     cross_tail_coeff4E2 4 c r (by omega) (by omega)] at h
   norm_num only [Nat.reduceAdd,Nat.reduceMul] at h ⊢
   nlinarith only [h]
 · have h := run4_cross_gap2E2 c r (by omega) (by omega) (by omega) _ hq
   rw [cross_tail_coeff3E2 4 c r (by omega) (by omega),
     cross_tail_coeff4E2 4 c r (by omega) (by omega),
     cross_tail_coeff5E2 4 c r (by omega) (by omega)] at h
   norm_num only [Nat.reduceAdd,Nat.reduceMul] at h ⊢
   nlinarith only [h]
 · have h := run4_cross_gap3E2 c r (by omega) (by omega) (by omega) _ hq
   rw [cross_tail_coeff4E2 4 c r (by omega) (by omega),
     cross_tail_coeff5E2 4 c r (by omega) (by omega),
     cross_tail_coeff6E2 4 c r (by omega) (by omega)] at h
   norm_num only [Nat.reduceAdd,Nat.reduceMul] at h ⊢
   nlinarith only [h]
end
end MathGKM.Markov
