import MarkovTerminalGapsE2
namespace MathGKM.Markov
noncomputable section
theorem terminal_low_lcE2 (c r : ℤ) (hr : 1 ≤ r) (hlo : 2*r ≤ c) (hhi : c ≤ 3*r) :
 terminallo0E2 c r*terminallo2E2 c r ≤ (terminallo1E2 c r)^2 := by
 by_cases h : 1 ≤ c-2*r
 · have hh := terminal_gap_lo0_10E2 (c-2*r-1) (3*r-c) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := terminal_gap_lo0_01E2 (c-2*r) (3*r-c-1) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring

theorem terminal_mid_lcE2 (c r : ℤ) (hc : 4 ≤ c) (hlo : c ≤ 2*r) (hhi : 3*r ≤ 2*c) :
 terminalmid0E2 c r*terminalmid2E2 c r ≤ (terminalmid1E2 c r)^2 := by
 by_cases h : 2 ≤ 2*r-c
 · have hh := terminal_gap_mid0_20E2 (2*r-c-2) (2*c-3*r) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · by_cases h' : 1 ≤ 2*r-c
   · have hh := terminal_gap_mid0_11E2 (2*r-c-1) (2*c-3*r-1) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := terminal_gap_mid0_02E2 (2*r-c) (2*c-3*r-2) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring

theorem terminal_high_lc0E2 (c r : ℤ) (hr : r+1 ≤ c) (hch : 2*c ≤ 3*r) :
 terminalhi0E2 c r*terminalhi2E2 c r ≤ (terminalhi1E2 c r)^2 := by
 have hh := terminal_gap_hi0_10E2 (c-r-1) (3*r-2*c) (by omega) (by omega)
 convert hh using 1 <;> congr 2 <;> ring

theorem terminal_high_lc1E2 (c r : ℤ) (hr : r+1 ≤ c) (hch : 2*c ≤ 3*r) :
 terminalhi1E2 c r*terminalhi3E2 c r ≤ (terminalhi2E2 c r)^2 := by
 have hh := terminal_gap_hi1_10E2 (c-r-1) (3*r-2*c) (by omega) (by omega)
 convert hh using 1 <;> congr 2 <;> ring
end
end MathGKM.Markov
