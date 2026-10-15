import MarkovTailGapLowLarge53D
import MarkovTailGapLowOne53D
import MarkovTailGapHighLarge53D
import MarkovTailGapHighOne53D
import MarkovTailCoefficients53D
/-! Machine-authored 53d5229e. Third-band inequalities for literal coefficients. -/
namespace MathGKM.Markov
noncomputable section

theorem tail_low_lc53D (c r k : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r)
 (hch : 2*r ≤ c) (hk : 2 ≤ k) :
 tailLow53D c r (k-1)*tailLow53D c r (k+1) ≤ (tailLow53D c r k)^2 := by
 by_cases h : r=1
 · subst r
   have hh := tail_gap_LowOne53D (k-2) 0 (c-4) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := tail_gap_LowLarge53D (k-2) (r-2) (c-2*r) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring

theorem tail_high_lc53D (c r k : ℤ) (hc : 4 ≤ c) (hr : r+1 ≤ c)
 (hch : c ≤ 2*r) (hk : 0 ≤ k) :
 tailHigh53D c r (k-1)*tailHigh53D c r (k+1) ≤ (tailHigh53D c r k)^2 := by
 by_cases h : c-r=1
 · have hh := tail_gap_HighOne53D k (c-4) 0 hk (by omega) (by omega)
   have he : r=c-1 := by omega
   rw [he]
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := tail_gap_HighLarge53D k (2*r-c) (c-r-2) hk (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring

theorem third_tail_low_lc53D (n c r j : ℕ) (hc : 4 ≤ c) (hr : 1 ≤ r)
 (hch : 2*r ≤ c) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 have h := tail_low_lc53D c r (3*(n:ℤ)+2-j)
   (by exact_mod_cast hc) (by exact_mod_cast hr) (by exact_mod_cast hch) (by omega)
 have h0 := tail_low_run_coeff53D n c r j (by omega) hch hj (by omega)
 have h1 := tail_low_run_coeff53D n c r (j+1) (by omega) hch (by omega) (by omega)
 have h2 := tail_low_run_coeff53D n c r (j+2) (by omega) hch (by omega) (by omega)
 have e0 : 3*(n:ℤ)+2-j+1=3*n+3-j := by ring
 have e2 : 3*(n:ℤ)+2-j-1=3*n+3-(j+2:ℕ) := by push_cast; ring
 have e1 : 3*(n:ℤ)+2-j=3*n+3-(j+1:ℕ) := by push_cast; ring
 rw [e0,e2,e1,h0,h1,h2] at h
 nlinarith only [h]

theorem third_tail_high_lc53D (n c r j : ℕ) (hc : 4 ≤ c) (hr : r+1 ≤ c)
 (hch : c ≤ 2*r) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 have h := tail_high_lc53D c r (3*(n:ℤ)+2-j)
   (by exact_mod_cast hc) (by exact_mod_cast hr) (by exact_mod_cast hch) (by omega)
 have h0 := tail_high_run_coeff53D n c r j (by omega) hch hj (by omega)
 have h1 := tail_high_run_coeff53D n c r (j+1) (by omega) hch (by omega) (by omega)
 have h2 := tail_high_run_coeff53D n c r (j+2) (by omega) hch (by omega) (by omega)
 have e0 : 3*(n:ℤ)+2-j+1=3*n+3-j := by ring
 have e2 : 3*(n:ℤ)+2-j-1=3*n+3-(j+2:ℕ) := by push_cast; ring
 have e1 : 3*(n:ℤ)+2-j=3*n+3-(j+1:ℕ) := by push_cast; ring
 rw [e0,e2,e1,h0,h1,h2] at h
 nlinarith only [h]

end
end MathGKM.Markov
