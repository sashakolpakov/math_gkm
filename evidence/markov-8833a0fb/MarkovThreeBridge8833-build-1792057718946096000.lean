import MarkovTwoBandsSource07F1
import MarkovThreeGaps8833
import MarkovThreeExtract8833
import MarkovTerminalCoefficientsE2
import MarkovThirdCorrectionSupport8BBB
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem three_cross_raw_1_18833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 1).coeff (2*n+1)*
 (thirdRunPolyADB2 n 3 1).coeff (2*n+3) ≤
 ((thirdRunPolyADB2 n 3 1).coeff (2*n+2))^2 := by
 have hh := three_cross_1_18833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*1-3:ℕ):ℤ)=0 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff18833 n 3 1 hn (by omega),
  cross_tail_coeff28833 n 3 1 hn (by omega),
  cross_tail_coeff38833 n 3 1 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_cross_raw_1_28833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 1).coeff (2*n+2)*
 (thirdRunPolyADB2 n 3 1).coeff (2*n+4) ≤
 ((thirdRunPolyADB2 n 3 1).coeff (2*n+3))^2 := by
 have hh := three_cross_1_28833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*1-3:ℕ):ℤ)=0 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff28833 n 3 1 hn (by omega),
  cross_tail_coeff38833 n 3 1 hn (by omega),
  cross_tail_coeff48833 n 3 1 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_cross_raw_1_38833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 1).coeff (2*n+3)*
 (thirdRunPolyADB2 n 3 1).coeff (2*n+5) ≤
 ((thirdRunPolyADB2 n 3 1).coeff (2*n+4))^2 := by
 have hh := three_cross_1_38833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*1-3:ℕ):ℤ)=0 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff38833 n 3 1 hn (by omega),
  cross_tail_coeff48833 n 3 1 hn (by omega),
  cross_tail_coeff58833 n 3 1 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_cross_raw_1_48833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 1).coeff (2*n+4)*
 (thirdRunPolyADB2 n 3 1).coeff (2*n+6) ≤
 ((thirdRunPolyADB2 n 3 1).coeff (2*n+5))^2 := by
 have hh := three_cross_1_48833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*1-3:ℕ):ℤ)=0 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff48833 n 3 1 hn (by omega),
  cross_tail_coeff58833 n 3 1 hn (by omega),
  cross_tail_coeff68833 n 3 1 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_tail_raw_18833 (n j : ℕ)
 (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n 3 1).coeff j*(thirdRunPolyADB2 n 3 1).coeff (j+2) ≤
 ((thirdRunPolyADB2 n 3 1).coeff (j+1))^2 := by
 have h := three_tail_18833 (3*(n:ℤ)+1-j) (by omega)
 have h0 := tail_low_run_coeff53D n 3 1 j (by omega) (by omega) hj (by omega)
 have h1 := tail_low_run_coeff53D n 3 1 (j+1) (by omega) (by omega) (by omega) (by omega)
 have h2 := tail_low_run_coeff53D n 3 1 (j+2) (by omega) (by omega) (by omega) (by omega)
 have e0 : 3*(n:ℤ)+1-j+2=3*n+3-j := by ring
 have e2 : 3*(n:ℤ)+1-j=3*n+3-(j+2:ℕ) := by push_cast; ring
 have e1 : 3*(n:ℤ)+1-j+1=3*n+3-(j+1:ℕ) := by push_cast; ring
 rw [e0,e2,e1,h0,h1,h2] at h
 nlinarith only [h]
theorem three_terminal_1_08833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 1).coeff (3*n+2)=432 := by
 have h := terminal_lo_coeff0E2 n 3 1 (by omega) (by omega) (by omega) (by omega)
 norm_num [terminallo0E2] at h
 rw [correctedThird_coeff_below8BBB n 3 1 (3*n+2) (by omega)]
 omega
theorem three_terminal_1_18833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 1).coeff (3*n+3)=72 := by
 have h := terminal_lo_coeff1E2 n 3 1 (by omega) (by omega) (by omega) (by omega)
 norm_num [terminallo1E2] at h
 rw [correctedThird_coeff_below8BBB n 3 1 (3*n+3) (by omega)]
 omega
theorem three_terminal_1_28833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 1).coeff (3*n+4)=6 := by
 have h := terminal_lo_coeff2E2 n 3 1 (by omega) (by omega) (by omega) (by omega)
 norm_num [terminallo2E2] at h
 have he : (thirdRunPolyADB2 n 3 1).coeff (3*n+4)=0 := by omega
 norm_num [correctedThirdRun8BBB,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
  Polynomial.coeff_X_pow,show 3*(n+1)+1=3*n+4 by omega,he]
theorem three_lc_18833 (n j : ℕ) (hn : 4 ≤ n) (hj : j ≤ 3*n+2) :
 (correctedThirdRun8BBB n 3 1).coeff j*(correctedThirdRun8BBB n 3 1).coeff (j+2) ≤
 ((correctedThirdRun8BBB n 3 1).coeff (j+1))^2 := by
 by_cases hlast : j ≤ 3*n+1
 · have h : (thirdRunPolyADB2 n 3 1).coeff j*(thirdRunPolyADB2 n 3 1).coeff (j+2) ≤
     ((thirdRunPolyADB2 n 3 1).coeff (j+1))^2 := by
    by_cases htwo : j ≤ 2*n
    · exact third_two_bands_lc07F1 n 3 1 j (by omega) (by omega) hn htwo
    · by_cases hcross : j ≤ 2*n+4
      · have he : j=2*n+1 ∨ j=2*n+2 ∨ j=2*n+3 ∨ j=2*n+4 := by omega
        rcases he with he | he | he | he <;> subst j
        · convert three_cross_raw_1_18833 n hn using 1 <;> congr 2 <;> omega
        · convert three_cross_raw_1_28833 n hn using 1 <;> congr 2 <;> omega
        · convert three_cross_raw_1_38833 n hn using 1 <;> congr 2 <;> omega
        · convert three_cross_raw_1_48833 n hn using 1 <;> congr 2 <;> omega
      · exact three_tail_raw_18833 n j (by omega) hlast
   rw [correctedThird_coeff_below8BBB n 3 1 j (by omega),
     correctedThird_coeff_below8BBB n 3 1 (j+2) (by omega),
     correctedThird_coeff_below8BBB n 3 1 (j+1) (by omega)]
   exact h
 · have he : j=3*n+2 := by omega
   subst j
   have h0 := three_terminal_1_08833 n hn
   have h1 := three_terminal_1_18833 n hn
   have h2 := three_terminal_1_28833 n hn
   rw [show 3*n+2+2=3*n+4 by omega,
      show 3*n+2+1=3*n+3 by omega,h0,h1,h2]
   norm_num
theorem three_cross_raw_2_18833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 2).coeff (2*n+1)*
 (thirdRunPolyADB2 n 3 2).coeff (2*n+3) ≤
 ((thirdRunPolyADB2 n 3 2).coeff (2*n+2))^2 := by
 have hh := three_cross_2_18833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*2-3:ℕ):ℤ)=1 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff18833 n 3 2 hn (by omega),
  cross_tail_coeff28833 n 3 2 hn (by omega),
  cross_tail_coeff38833 n 3 2 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_cross_raw_2_28833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 2).coeff (2*n+2)*
 (thirdRunPolyADB2 n 3 2).coeff (2*n+4) ≤
 ((thirdRunPolyADB2 n 3 2).coeff (2*n+3))^2 := by
 have hh := three_cross_2_28833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*2-3:ℕ):ℤ)=1 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff28833 n 3 2 hn (by omega),
  cross_tail_coeff38833 n 3 2 hn (by omega),
  cross_tail_coeff48833 n 3 2 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_cross_raw_2_38833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 2).coeff (2*n+3)*
 (thirdRunPolyADB2 n 3 2).coeff (2*n+5) ≤
 ((thirdRunPolyADB2 n 3 2).coeff (2*n+4))^2 := by
 have hh := three_cross_2_38833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*2-3:ℕ):ℤ)=1 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff38833 n 3 2 hn (by omega),
  cross_tail_coeff48833 n 3 2 hn (by omega),
  cross_tail_coeff58833 n 3 2 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_cross_raw_2_48833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 2).coeff (2*n+4)*
 (thirdRunPolyADB2 n 3 2).coeff (2*n+6) ≤
 ((thirdRunPolyADB2 n 3 2).coeff (2*n+5))^2 := by
 have hh := three_cross_2_48833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have heq : ((2*2-3:ℕ):ℤ)=1 := by norm_num
 rw [←heq] at hh
 rw [cross_tail_coeff48833 n 3 2 hn (by omega),
  cross_tail_coeff58833 n 3 2 hn (by omega),
  cross_tail_coeff68833 n 3 2 hn (by omega)] at hh
 nlinarith only [hh]
theorem three_tail_raw_28833 (n j : ℕ)
 (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n 3 2).coeff j*(thirdRunPolyADB2 n 3 2).coeff (j+2) ≤
 ((thirdRunPolyADB2 n 3 2).coeff (j+1))^2 := by
 have h := three_tail_28833 (3*(n:ℤ)+1-j) (by omega)
 have h0 := tail_high_run_coeff53D n 3 2 j (by omega) (by omega) hj (by omega)
 have h1 := tail_high_run_coeff53D n 3 2 (j+1) (by omega) (by omega) (by omega) (by omega)
 have h2 := tail_high_run_coeff53D n 3 2 (j+2) (by omega) (by omega) (by omega) (by omega)
 have e0 : 3*(n:ℤ)+1-j+2=3*n+3-j := by ring
 have e2 : 3*(n:ℤ)+1-j=3*n+3-(j+2:ℕ) := by push_cast; ring
 have e1 : 3*(n:ℤ)+1-j+1=3*n+3-(j+1:ℕ) := by push_cast; ring
 rw [e0,e2,e1,h0,h1,h2] at h
 nlinarith only [h]
theorem three_terminal_2_08833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 2).coeff (3*n+2)=1752 := by
 have h := terminal_hi_coeff0E2 n 3 2 (by omega) (by omega) (by omega) (by omega)
 norm_num [terminalhi0E2] at h
 rw [correctedThird_coeff_below8BBB n 3 2 (3*n+2) (by omega)]
 omega
theorem three_terminal_2_18833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 2).coeff (3*n+3)=432 := by
 have h := terminal_hi_coeff1E2 n 3 2 (by omega) (by omega) (by omega) (by omega)
 norm_num [terminalhi1E2] at h
 rw [correctedThird_coeff_below8BBB n 3 2 (3*n+3) (by omega)]
 omega
theorem three_terminal_2_28833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 2).coeff (3*n+4)=72 := by
 have h := terminal_hi_coeff2E2 n 3 2 (by omega) (by omega) (by omega) (by omega)
 norm_num [terminalhi2E2] at h
 rw [correctedThird_coeff_below8BBB n 3 2 (3*n+4) (by omega)]
 omega
theorem three_terminal_2_38833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 2).coeff (3*n+5)=6 := by
 have h := terminal_hi_coeff3E2 n 3 2 (by omega) (by omega) (by omega) (by omega)
 norm_num [terminalhi3E2] at h
 have he : (thirdRunPolyADB2 n 3 2).coeff (3*n+5)=0 := by omega
 norm_num [correctedThirdRun8BBB,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
  Polynomial.coeff_X_pow,show 3*(n+1)+2=3*n+5 by omega,he]
theorem three_lc_28833 (n j : ℕ) (hn : 4 ≤ n) (hj : j ≤ 3*n+3) :
 (correctedThirdRun8BBB n 3 2).coeff j*(correctedThirdRun8BBB n 3 2).coeff (j+2) ≤
 ((correctedThirdRun8BBB n 3 2).coeff (j+1))^2 := by
 by_cases hlast : j ≤ 3*n+1
 · have h : (thirdRunPolyADB2 n 3 2).coeff j*(thirdRunPolyADB2 n 3 2).coeff (j+2) ≤
     ((thirdRunPolyADB2 n 3 2).coeff (j+1))^2 := by
    by_cases htwo : j ≤ 2*n
    · exact third_two_bands_lc07F1 n 3 2 j (by omega) (by omega) hn htwo
    · by_cases hcross : j ≤ 2*n+4
      · have he : j=2*n+1 ∨ j=2*n+2 ∨ j=2*n+3 ∨ j=2*n+4 := by omega
        rcases he with he | he | he | he <;> subst j
        · convert three_cross_raw_2_18833 n hn using 1 <;> congr 2 <;> omega
        · convert three_cross_raw_2_28833 n hn using 1 <;> congr 2 <;> omega
        · convert three_cross_raw_2_38833 n hn using 1 <;> congr 2 <;> omega
        · convert three_cross_raw_2_48833 n hn using 1 <;> congr 2 <;> omega
      · exact three_tail_raw_28833 n j (by omega) hlast
   rw [correctedThird_coeff_below8BBB n 3 2 j (by omega),
     correctedThird_coeff_below8BBB n 3 2 (j+2) (by omega),
     correctedThird_coeff_below8BBB n 3 2 (j+1) (by omega)]
   exact h
 · have he : j=3*n+2 ∨ j=3*n+3 := by omega
   rcases he with he | he <;> subst j
   · have h0 := three_terminal_2_08833 n hn
     have h1 := three_terminal_2_18833 n hn
     have h2 := three_terminal_2_28833 n hn
     rw [show 3*n+2+2=3*n+4 by omega,
      show 3*n+2+1=3*n+3 by omega,h0,h1,h2]
     norm_num
   · have h0 := three_terminal_2_18833 n hn
     have h1 := three_terminal_2_28833 n hn
     have h2 := three_terminal_2_38833 n hn
     rw [show 3*n+3+2=3*n+5 by omega,
      show 3*n+3+1=3*n+4 by omega,h0,h1,h2]
     norm_num
end
end MathGKM.Markov
