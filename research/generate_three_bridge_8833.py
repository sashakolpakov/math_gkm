"""Machine-authored Lean transport generation; no experimental premise."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
head='''import MarkovThreeGaps8833
import MarkovThreeExtract8833
import MarkovTerminalCoefficientsE2
import MarkovThirdCorrectionSupport8BBB
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
s=head
for r in [1,2]:
 q=max(2*r-3,0)
 for k in range(1,5):
  s+=f'''theorem three_cross_raw_{r}_{k}8833 (n : ℕ) (hn : 4 ≤ n) :
 (thirdRunPolyADB2 n 3 {r}).coeff (2*n+{k})*
 (thirdRunPolyADB2 n 3 {r}).coeff (2*n+{k+2}) ≤
 ((thirdRunPolyADB2 n 3 {r}).coeff (2*n+{k+1}))^2 := by
 have hh := three_cross_{r}_{k}8833 ((n:ℤ)-4) (by omega)
 rw [show (n:ℤ)-4+4=n by ring] at hh
 have h0 := cross_tail_coeff{k}8833 n 3 {r} hn (by omega)
 have h1 := cross_tail_coeff{k+1}8833 n 3 {r} hn (by omega)
 have h2 := cross_tail_coeff{k+2}8833 n 3 {r} hn (by omega)
 norm_num only [Nat.reduceMul,Nat.reduceSub,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero] at h0 h1 h2
 rw [h0,h1,h2] at hh
 nlinarith only [hh]
'''
 nm='tail_low_run_coeff53D' if r==1 else 'tail_high_run_coeff53D'
 s+=f'''theorem three_tail_raw_{r}8833 (n j : ℕ)
 (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n 3 {r}).coeff j*(thirdRunPolyADB2 n 3 {r}).coeff (j+2) ≤
 ((thirdRunPolyADB2 n 3 {r}).coeff (j+1))^2 := by
 have h := three_tail_{r}8833 (3*(n:ℤ)+1-j) (by omega)
 have h0 := {nm} n 3 {r} j (by omega) (by omega) hj (by omega)
 have h1 := {nm} n 3 {r} (j+1) (by omega) (by omega) (by omega) (by omega)
 have h2 := {nm} n 3 {r} (j+2) (by omega) (by omega) (by omega) (by omega)
 have e0 : 3*(n:ℤ)+1-j+2=3*n+3-j := by ring
 have e2 : 3*(n:ℤ)+1-j=3*n+3-(j+2:ℕ) := by push_cast; ring
 have e1 : 3*(n:ℤ)+1-j+1=3*n+3-(j+1:ℕ) := by push_cast; ring
 norm_num only [Nat.cast_ofNat,Nat.cast_one] at h0 h1 h2
 rw [e0,e1,e2,h0,h1,h2] at h
 nlinarith only [h]
'''
 values=[432,72,6] if r==1 else [1752,432,72,6]
 chamber='lo' if r==1 else 'hi'
 for k,v in enumerate(values):
  s+=f'''theorem three_terminal_{r}_{k}8833 (n : ℕ) (hn : 4 ≤ n) :
 (correctedThirdRun8BBB n 3 {r}).coeff (3*n+{k+2})={v} := by
 have h := terminal_{chamber}_coeff{k}E2 n 3 {r} (by omega) (by omega) (by omega) (by omega)
 norm_num [terminal{chamber}{k}E2] at h
'''
  if k<len(values)-1:
   s+=f''' rw [correctedThird_coeff_below8BBB n 3 {r} (3*n+{k+2}) (by omega)]
 omega
'''
  else:
   s+=f''' have he : (thirdRunPolyADB2 n 3 {r}).coeff (3*n+{k+2})=0 := by omega
 norm_num [correctedThirdRun8BBB,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
  Polynomial.coeff_X_pow,show 3*(n+1)+{r}=3*n+{k+2} by omega,he]
'''
 s+=f'''theorem three_lc_{r}8833 (n j : ℕ) (hn : 4 ≤ n) (hj : j ≤ 3*n+{r+1}) :
 (correctedThirdRun8BBB n 3 {r}).coeff j*(correctedThirdRun8BBB n 3 {r}).coeff (j+2) ≤
 ((correctedThirdRun8BBB n 3 {r}).coeff (j+1))^2 := by
 by_cases hlast : j ≤ 3*n+1
 · have h : (thirdRunPolyADB2 n 3 {r}).coeff j*(thirdRunPolyADB2 n 3 {r}).coeff (j+2) ≤
     ((thirdRunPolyADB2 n 3 {r}).coeff (j+1))^2 := by
    by_cases htwo : j ≤ 2*n
    · exact third_two_bands_lc07F1 n 3 {r} j (by omega) (by omega) hn htwo
    · by_cases hcross : j ≤ 2*n+4
      · have he : j=2*n+1 ∨ j=2*n+2 ∨ j=2*n+3 ∨ j=2*n+4 := by omega
        rcases he with he | he | he | he <;> subst j
'''
 for k in range(1,5):s+=f'        · convert three_cross_raw_{r}_{k}8833 n hn using 1 <;> congr 2 <;> omega\n'
 s+=f'''      · exact three_tail_raw_{r}8833 n j (by omega) hlast
   rw [correctedThird_coeff_below8BBB n 3 {r} j (by omega),
     correctedThird_coeff_below8BBB n 3 {r} (j+2) (by omega),
     correctedThird_coeff_below8BBB n 3 {r} (j+1) (by omega)]
   exact h
'''
 if r==1:
  s+=' · have he : j=3*n+2 := by omega\n   subst j\n'
 else:
  s+=' · have he : j=3*n+2 ∨ j=3*n+3 := by omega\n   rcases he with he | he <;> subst j\n'
 for k in range(r):
  indent='   ' if r==1 else '   · '
  # normalize arithmetic indices then use exact finite terminal values
  s+=indent+f'''have h0 := three_terminal_{r}_{k}8833 n hn
'''
  pre='   ' if r==1 else '     '
  s+=pre+f'have h1 := three_terminal_{r}_{k+1}8833 n hn\n'+pre+f'have h2 := three_terminal_{r}_{k+2}8833 n hn\n'
  s+=pre+f'''rw [show 3*n+{k+2}+2=3*n+{k+4} by omega,
      show 3*n+{k+2}+1=3*n+{k+3} by omega,h0,h1,h2]
'''+pre+'norm_num\n'
s+='end\nend MathGKM.Markov\n'
s=s.replace('import MarkovThreeGaps8833','import MarkovTwoBandsSource07F1\nimport MarkovThreeGaps8833')
(R/'research/MarkovThreeBridge8833.lean').write_text(s)
print('generated',len(s))
