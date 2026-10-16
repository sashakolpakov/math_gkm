"""Machine-authored adaptation of the checked falling-factorial bridge."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovSecondRowMF52.lean').read_text()
s=s[:s.index('theorem second_zero_crossMF52')]
s=s.replace('import MarkovSecondGapMF52','import MarkovTerminalGapM263\nimport MarkovSecondRowMF52')
s=s.replace('f52ba141','263d8c71').replace('MF52','M263')
# The inherited binomial identity needs no new duplicate proof.
a=s.index('theorem second_binomial_productM263');b=s.index('theorem second_row_innerM263')
s=s[:a]+s[b:]
s=s.replace('second_binomial_productM263','second_binomial_productMF52')
s=s.replace('import MarkovSecondRowM263','import MarkovSecondRowMF52')
s=s.replace('m t','m t r').replace('(htm : t ≤ 2*m)','(htm : t+r ≤ 2*m) (hr : r=0 ∨ r=1)')
s=s.replace('hm ht htm hs','hm ht htm hr hs')
s=s.replace('secondRow340','terminalRowM263').replace('secondHM263','terminalHM263').replace('secondGapM263','terminalGapM263').replace('second_gap_nonnegM263','terminal_gap_nonnegM263')
s=s.replace('secondB8934 m','terminalBM263 m r').replace('secondC8934','terminalCM263').replace('secondD8934','terminalDM263').replace('secondB8934','terminalBM263')
s=s.replace('second_coeff_clearM263','terminal_coeff_clearM263').replace('second_row_innerM263','terminal_row_innerM263').replace('second_row_degreeM263','terminal_row_degreeM263')
pos=s.index('theorem terminal_coeff_clearM263')
s=s[:pos]+'''def terminalBM263 (m r : ℝ) : ℝ := 9*m^2+7*m+2-4*r
def terminalCM263 (n m : ℝ) : ℝ := 6*m^2+6*m*n+4*n
def terminalDM263 (n m : ℝ) : ℝ := (m+n)*(m+n+1)
def terminalRowM263 (n : ℕ) (m t r : ℝ) : ℝ[X] :=
 (1+X)^(n-3)*CubicPoly5a7 (4*t) (terminalBM263 m r) (terminalCM263 n m) (terminalDM263 n m)

'''+s[pos:]
s+='''theorem terminal_zero_crossM263 (n : ℕ) (hn : 3 ≤ n) :
 CrossLC (CoeffSeq (terminalRowM263 n 0 0 0)) := by
 have hnR : (3:ℝ) ≤ n := by exact_mod_cast hn
 have hh : (2:ℝ)*(n*(n+1)) ≤ (4*n)^2 := by nlinarith [sq_nonneg (n:ℝ)]
 have h := cubic_crossLC5a7 (A:=0) (B:=2) (C:=4*n) (D:=n*(n+1))
   (by norm_num) (by norm_num) (by positivity) (by positivity)
   (by norm_num) hh (by nlinarith)
 rw [←coeffSeq_cubic5a7] at h
 have hs := crossLC_pascal h (n-3)
 rw [←coeffSeq_binomial_mul] at hs
 simpa [terminalRowM263,terminalBM263,terminalCM263,terminalDM263] using hs

theorem terminal_row_allM263 (n m t r i : ℕ) (hn : 3 ≤ n)
 (ht : t+r ≤ 2*m) (hr : r ≤ 1) :
 (terminalRowM263 n m t r).coeff i*(terminalRowM263 n m t r).coeff (i+2) ≤
 (terminalRowM263 n m t r).coeff (i+1)^2 := by
 by_cases hm : m=0
 · subst m
   have he : t=0 := by omega
   have he' : r=0 := by omega
   subst t; subst r
   have h := crossLC_adjacent (terminal_zero_crossM263 n hn) (i+1)
   simpa [CoeffSeq,show ¬(i:ℤ)<0 by omega,show ¬(i:ℤ)+1<0 by omega,
     show ¬(i:ℤ)+1+1<0 by omega,show ((i:ℤ)+1+1).toNat=i+2 by omega] using h
 · by_cases hi : i+2 ≤ n
   · have he : n=i+(n-(i+2))+2 := by omega
     rw [he]
     exact terminal_row_innerM263 i (n-(i+2)) m t r (by omega)
       (by exact_mod_cast (show 1 ≤ m by omega)) (by positivity) (by exact_mod_cast ht)
       (by rcases (show r=0 ∨ r=1 by omega) with rfl | rfl <;> norm_num)
   · have hz : (terminalRowM263 n m t r).coeff (i+2)=0 :=
       Polynomial.coeff_eq_zero_of_natDegree_lt (lt_of_le_of_lt (terminal_row_degreeM263 n m t r hn) (by omega))
     rw [hz,mul_zero]
     positivity
end
end MathGKM.Markov
'''
(R/'research/MarkovTerminalRowM263.lean').write_text(s)
