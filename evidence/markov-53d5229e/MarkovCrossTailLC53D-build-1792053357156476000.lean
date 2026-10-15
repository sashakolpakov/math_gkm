import MarkovCrossTailLowLarge53D
import MarkovCrossTailLowOne53D
import MarkovCrossTailHighLarge53D
import MarkovCrossTailHighOne53D
namespace MathGKM.Markov
noncomputable section
theorem cross_tail_low153D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : 2*r ≤ c) :
 crossTail153D n c r 0*crossTail353D n c r 0 ≤
 (crossTail253D n c r 0)^2 := by
 by_cases h : r=1
 · subst r
   have hh := cross_tail_gap_LowOne153D (n-5) 0 (c-4) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_LowLarge153D (n-5) (r-2) (c-2*r) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_high153D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : c ≤ 2*r) :
 crossTail153D n c r (2*r-c)*crossTail353D n c r (2*r-c) ≤
 (crossTail253D n c r (2*r-c))^2 := by
 by_cases h : c-r=1
 · have hh := cross_tail_gap_HighOne153D (n-5) (c-4) 0 (by omega) (by omega) (by omega)
   have he : r=c-1 := by omega
   rw [he]
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_HighLarge153D (n-5) (2*r-c) (c-r-2) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_raw153D (n c r : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) :
 (thirdRunPolyADB2 n c r).coeff (2*n+1)*(thirdRunPolyADB2 n c r).coeff (2*n+3) ≤
 ((thirdRunPolyADB2 n c r).coeff (2*n+2))^2 := by
 have h : crossTail153D n c r (2*r-c:ℕ)*crossTail353D n c r (2*r-c:ℕ) ≤
   (crossTail253D n c r (2*r-c:ℕ))^2 := by
  by_cases hch : 2*r ≤ c
  · have he : ((2*r-c:ℕ):ℤ)=0 := by omega
    rw [he]
    exact cross_tail_low153D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by exact_mod_cast hch)
  · have he : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
    rw [he]
    exact cross_tail_high153D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by omega)
 rw [cross_tail_coeff153D n c r hn (by omega),cross_tail_coeff253D n c r hn (by omega),
   cross_tail_coeff353D n c r hn (by omega)] at h
 nlinarith only [h]
theorem cross_tail_low253D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : 2*r ≤ c) :
 crossTail253D n c r 0*crossTail453D n c r 0 ≤
 (crossTail353D n c r 0)^2 := by
 by_cases h : r=1
 · subst r
   have hh := cross_tail_gap_LowOne253D (n-5) 0 (c-4) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_LowLarge253D (n-5) (r-2) (c-2*r) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_high253D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : c ≤ 2*r) :
 crossTail253D n c r (2*r-c)*crossTail453D n c r (2*r-c) ≤
 (crossTail353D n c r (2*r-c))^2 := by
 by_cases h : c-r=1
 · have hh := cross_tail_gap_HighOne253D (n-5) (c-4) 0 (by omega) (by omega) (by omega)
   have he : r=c-1 := by omega
   rw [he]
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_HighLarge253D (n-5) (2*r-c) (c-r-2) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_raw253D (n c r : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) :
 (thirdRunPolyADB2 n c r).coeff (2*n+2)*(thirdRunPolyADB2 n c r).coeff (2*n+4) ≤
 ((thirdRunPolyADB2 n c r).coeff (2*n+3))^2 := by
 have h : crossTail253D n c r (2*r-c:ℕ)*crossTail453D n c r (2*r-c:ℕ) ≤
   (crossTail353D n c r (2*r-c:ℕ))^2 := by
  by_cases hch : 2*r ≤ c
  · have he : ((2*r-c:ℕ):ℤ)=0 := by omega
    rw [he]
    exact cross_tail_low253D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by exact_mod_cast hch)
  · have he : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
    rw [he]
    exact cross_tail_high253D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by omega)
 rw [cross_tail_coeff253D n c r hn (by omega),cross_tail_coeff353D n c r hn (by omega),
   cross_tail_coeff453D n c r hn (by omega)] at h
 nlinarith only [h]
theorem cross_tail_low353D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : 2*r ≤ c) :
 crossTail353D n c r 0*crossTail553D n c r 0 ≤
 (crossTail453D n c r 0)^2 := by
 by_cases h : r=1
 · subst r
   have hh := cross_tail_gap_LowOne353D (n-5) 0 (c-4) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_LowLarge353D (n-5) (r-2) (c-2*r) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_high353D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : c ≤ 2*r) :
 crossTail353D n c r (2*r-c)*crossTail553D n c r (2*r-c) ≤
 (crossTail453D n c r (2*r-c))^2 := by
 by_cases h : c-r=1
 · have hh := cross_tail_gap_HighOne353D (n-5) (c-4) 0 (by omega) (by omega) (by omega)
   have he : r=c-1 := by omega
   rw [he]
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_HighLarge353D (n-5) (2*r-c) (c-r-2) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_raw353D (n c r : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) :
 (thirdRunPolyADB2 n c r).coeff (2*n+3)*(thirdRunPolyADB2 n c r).coeff (2*n+5) ≤
 ((thirdRunPolyADB2 n c r).coeff (2*n+4))^2 := by
 have h : crossTail353D n c r (2*r-c:ℕ)*crossTail553D n c r (2*r-c:ℕ) ≤
   (crossTail453D n c r (2*r-c:ℕ))^2 := by
  by_cases hch : 2*r ≤ c
  · have he : ((2*r-c:ℕ):ℤ)=0 := by omega
    rw [he]
    exact cross_tail_low353D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by exact_mod_cast hch)
  · have he : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
    rw [he]
    exact cross_tail_high353D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by omega)
 rw [cross_tail_coeff353D n c r hn (by omega),cross_tail_coeff453D n c r hn (by omega),
   cross_tail_coeff553D n c r hn (by omega)] at h
 nlinarith only [h]
theorem cross_tail_low453D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : 2*r ≤ c) :
 crossTail453D n c r 0*crossTail653D n c r 0 ≤
 (crossTail553D n c r 0)^2 := by
 by_cases h : r=1
 · subst r
   have hh := cross_tail_gap_LowOne453D (n-5) 0 (c-4) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_LowLarge453D (n-5) (r-2) (c-2*r) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_high453D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : c ≤ 2*r) :
 crossTail453D n c r (2*r-c)*crossTail653D n c r (2*r-c) ≤
 (crossTail553D n c r (2*r-c))^2 := by
 by_cases h : c-r=1
 · have hh := cross_tail_gap_HighOne453D (n-5) (c-4) 0 (by omega) (by omega) (by omega)
   have he : r=c-1 := by omega
   rw [he]
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_HighLarge453D (n-5) (2*r-c) (c-r-2) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
theorem cross_tail_raw453D (n c r : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) :
 (thirdRunPolyADB2 n c r).coeff (2*n+4)*(thirdRunPolyADB2 n c r).coeff (2*n+6) ≤
 ((thirdRunPolyADB2 n c r).coeff (2*n+5))^2 := by
 have h : crossTail453D n c r (2*r-c:ℕ)*crossTail653D n c r (2*r-c:ℕ) ≤
   (crossTail553D n c r (2*r-c:ℕ))^2 := by
  by_cases hch : 2*r ≤ c
  · have he : ((2*r-c:ℕ):ℤ)=0 := by omega
    rw [he]
    exact cross_tail_low453D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by exact_mod_cast hch)
  · have he : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
    rw [he]
    exact cross_tail_high453D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by omega)
 rw [cross_tail_coeff453D n c r hn (by omega),cross_tail_coeff553D n c r hn (by omega),
   cross_tail_coeff653D n c r hn (by omega)] at h
 nlinarith only [h]
theorem third_cross_tail_lc53D (n c r j : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hj : 2*n+1 ≤ j) (hj' : j ≤ 2*n+4) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 have he : j=2*n+1 ∨ j=2*n+2 ∨ j=2*n+3 ∨ j=2*n+4 := by omega
 rcases he with h | h | h | h <;> subst j
 · have h := cross_tail_raw153D n c r hn hc hr hrc
   convert h using 1 <;> congr 2 <;> omega
 · have h := cross_tail_raw253D n c r hn hc hr hrc
   convert h using 1 <;> congr 2 <;> omega
 · have h := cross_tail_raw353D n c r hn hc hr hrc
   convert h using 1 <;> congr 2 <;> omega
 · have h := cross_tail_raw453D n c r hn hc hr hrc
   convert h using 1 <;> congr 2 <;> omega
end
end MathGKM.Markov
