import MarkovTerminalExtractE2
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
theorem terminal_lo_coeff0E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : 2*r ≤ c) (hhi : c ≤ 3*r) :
 terminallo0E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+2) := by
 have he := tail_low_run_coeff53D n c r (3*n+2) hc (by omega) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+2:ℕ)=1 := by omega
 rw [hk,terminal_lo_0_formulaE2] at he
 exact he
theorem terminal_lo_coeff1E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : 2*r ≤ c) (hhi : c ≤ 3*r) :
 terminallo1E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+3) := by
 have he := tail_low_run_coeff53D n c r (3*n+3) hc (by omega) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+3:ℕ)=0 := by omega
 rw [hk,terminal_lo_1_formulaE2] at he
 exact he
theorem terminal_lo_coeff2E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : 2*r ≤ c) (hhi : c ≤ 3*r) :
 terminallo2E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+4) := by
 have he := extract_four_bandsE2 n c r (3*n+4) hc (by omega)
 have hs := tail_low_seriesE2 n c r (3*n+4) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+4:ℕ)=-1 := by omega
 have hj : 3*n+4-(3*n+4)=0 := by omega
 rw [hk] at hs
 rw [hj,fourth_series0E2] at he
 have hg := terminal_lo_2_formulaE2 (c:ℤ) r
 have hq : ((2*r-c:ℕ):ℤ)=0 := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ)=3*(r:ℤ)-c := by omega
 rw [hq,ht] at he
 rw [hq] at hs
 omega
theorem terminal_mid_coeff0E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : c ≤ 2*r) (hhi : 3*r ≤ 2*c) :
 terminalmid0E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+2) := by
 have he := tail_high_run_coeff53D n c r (3*n+2) hc (by omega) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+2:ℕ)=1 := by omega
 rw [hk,terminal_mid_0_formulaE2] at he
 exact he
theorem terminal_mid_coeff1E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : c ≤ 2*r) (hhi : 3*r ≤ 2*c) :
 terminalmid1E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+3) := by
 have he := tail_high_run_coeff53D n c r (3*n+3) hc (by omega) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+3:ℕ)=0 := by omega
 rw [hk,terminal_mid_1_formulaE2] at he
 exact he
theorem terminal_mid_coeff2E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : c ≤ 2*r) (hhi : 3*r ≤ 2*c) :
 terminalmid2E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+4) := by
 have he := extract_four_bandsE2 n c r (3*n+4) hc (by omega)
 have hs := tail_high_seriesE2 n c r (3*n+4) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+4:ℕ)=-1 := by omega
 have hj : 3*n+4-(3*n+4)=0 := by omega
 rw [hk] at hs
 rw [hj,fourth_series0E2] at he
 have hg := terminal_mid_2_formulaE2 (c:ℤ) r
 have hq : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-r := by omega
 rw [hq,ht] at he
 rw [hq] at hs
 omega
theorem terminal_hi_coeff0E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : r ≤ c) (hhi : 2*c ≤ 3*r) :
 terminalhi0E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+2) := by
 have he := tail_high_run_coeff53D n c r (3*n+2) hc (by omega) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+2:ℕ)=1 := by omega
 rw [hk,terminal_hi_0_formulaE2] at he
 exact he
theorem terminal_hi_coeff1E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : r ≤ c) (hhi : 2*c ≤ 3*r) :
 terminalhi1E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+3) := by
 have he := tail_high_run_coeff53D n c r (3*n+3) hc (by omega) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+3:ℕ)=0 := by omega
 rw [hk,terminal_hi_1_formulaE2] at he
 exact he
theorem terminal_hi_coeff2E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : r ≤ c) (hhi : 2*c ≤ 3*r) :
 terminalhi2E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+4) := by
 have he := extract_four_bandsE2 n c r (3*n+4) hc (by omega)
 have hs := tail_high_seriesE2 n c r (3*n+4) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+4:ℕ)=-1 := by omega
 have hj : 3*n+4-(3*n+4)=0 := by omega
 rw [hk] at hs
 rw [hj,fourth_series0E2] at he
 have hg := terminal_hi_2_formulaE2 (c:ℤ) r
 have hq : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-r := by omega
 rw [hq,ht] at he
 rw [hq] at hs
 omega
theorem terminal_hi_coeff3E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 (hlo : r ≤ c) (hhi : 2*c ≤ 3*r) :
 terminalhi3E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+5) := by
 have he := extract_four_bandsE2 n c r (3*n+5) hc (by omega)
 have hs := tail_high_seriesE2 n c r (3*n+5) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+5:ℕ)=-2 := by omega
 have hj : 3*n+5-(3*n+4)=1 := by omega
 rw [hk] at hs
 rw [hj,fourth_series1E2] at he
 have hg := terminal_hi_3_formulaE2 (c:ℤ) r
 have hq : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-r := by omega
 rw [hq,ht] at he
 rw [hq] at hs
 have hu : ((3*r-2*c:ℕ):ℤ)=3*(r:ℤ)-2*c := by omega
 rw [hu] at he
 omega
end
end MathGKM.Markov
