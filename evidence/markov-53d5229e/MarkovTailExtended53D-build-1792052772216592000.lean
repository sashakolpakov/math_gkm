import MarkovTailEdge53D
namespace MathGKM.Markov
noncomputable section
theorem third_tail_low_extended53D (n c r j : ℕ) (hc : 4 ≤ c) (hr : 1 ≤ r)
 (hch : 2*r ≤ c) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 have h := tail_low_lc_extended53D c r (3*(n:ℤ)+2-j)
   (by exact_mod_cast hc) (by exact_mod_cast hr) (by exact_mod_cast hch) (by omega)
 have h0 := tail_low_run_coeff53D n c r j (by omega) hch hj (by omega)
 have h1 := tail_low_run_coeff53D n c r (j+1) (by omega) hch (by omega) (by omega)
 have h2 := tail_low_run_coeff53D n c r (j+2) (by omega) hch (by omega) (by omega)
 have e0 : 3*(n:ℤ)+2-j+1=3*n+3-j := by ring
 have e2 : 3*(n:ℤ)+2-j-1=3*n+3-(j+2:ℕ) := by push_cast; ring
 have e1 : 3*(n:ℤ)+2-j=3*n+3-(j+1:ℕ) := by push_cast; ring
 rw [e0,e2,e1,h0,h1,h2] at h
 nlinarith only [h]

theorem third_tail_lc53D (n c r j : ℕ) (hc : 4 ≤ c) (hr : 1 ≤ r)
 (hrc : r+1 ≤ c) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases h : 2*r ≤ c
 · exact third_tail_low_extended53D n c r j hc hr h hj hn
 · exact third_tail_high_lc53D n c r j hc hrc (by omega) hj hn
end
end MathGKM.Markov
