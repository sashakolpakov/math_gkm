import MarkovTerminalGapM263
import MarkovSecondRowMF52
import MarkovSecondCoeff340
/-! Machine-authored 263d8c71. Raw coefficients after smoothing; all indices. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def terminalBM263 (m r : ℝ) : ℝ := 9*m^2+7*m+2-4*r
def terminalCM263 (n m : ℝ) : ℝ := 6*m^2+6*m*n+4*n
def terminalDM263 (n m : ℝ) : ℝ := (m+n)*(m+n+1)
def terminalRowM263 (n : ℕ) (m t r : ℝ) : ℝ[X] :=
 (1+X)^(n-3)*CubicPoly5a7 (4*t) (terminalBM263 m r) (terminalCM263 n m) (terminalDM263 n m)

theorem terminal_coeff_clearM263 (n k : ℕ) (m t r : ℝ) (hn : 3 ≤ n) (hk : k ≤ n) :
 (n:ℝ)*(n-1)*(n-2)*(terminalRowM263 n m t r).coeff k =
 (n.choose k:ℝ)*terminalHM263 k (n-k) m t r := by
 have h := cubic_falling_coeff340 k (n-k) (by omega)
   (4*t) (terminalBM263 m r) (terminalCM263 n m) (terminalDM263 n m)
 rw [Nat.add_sub_of_le hk] at h
 simp only [Nat.cast_sub hk] at h
 convert h using 1 <;>
   simp only [terminalRowM263,terminalHM263,terminalBM263,terminalCM263,terminalDM263] <;> ring

theorem terminal_row_innerM263 (i j : ℕ) (m t r : ℝ) (hs : 1 ≤ i+j)
 (hm : 1 ≤ m) (ht : 0 ≤ t) (htm : t+r ≤ 2*m) (hr : r=0 ∨ r=1) :
 (terminalRowM263 (i+j+2) m t r).coeff i*(terminalRowM263 (i+j+2) m t r).coeff (i+2) ≤
 (terminalRowM263 (i+j+2) m t r).coeff (i+1)^2 := by
 let n := i+j+2
 let L : ℝ := n*(n-1)*(n-2)
 have hn : 3 ≤ n := by dsimp [n]; omega
 have hL : 0 < L := by
   have hnR : (3:ℝ) ≤ n := by exact_mod_cast hn
   dsimp [L]
   have h0 : (0:ℝ)<n := by linarith
   have h1 : (0:ℝ)<n-1 := by linarith
   have h2 : (0:ℝ)<n-2 := by linarith
   positivity
 let c0 := (terminalRowM263 n m t r).coeff i
 let c1 := (terminalRowM263 n m t r).coeff (i+1)
 let c2 := (terminalRowM263 n m t r).coeff (i+2)
 let B0 : ℝ := n.choose i
 let B1 : ℝ := n.choose (i+1)
 let B2 : ℝ := n.choose (i+2)
 let H0 := terminalHM263 i (j+2) m t r
 let H1 := terminalHM263 (i+1) (j+1) m t r
 let H2 := terminalHM263 (i+2) j m t r
 have h0 : L*c0=B0*H0 := by
   have h := terminal_coeff_clearM263 n i m t r hn (by dsimp [n]; omega)
   convert h using 1 <;> dsimp [L,c0,B0,H0,n] <;> push_cast <;> congr 1 <;> ring
 have h1 : L*c1=B1*H1 := by
   have h := terminal_coeff_clearM263 n (i+1) m t r hn (by dsimp [n]; omega)
   convert h using 1 <;> dsimp [L,c1,B1,H1,n] <;> push_cast <;> congr 1 <;> ring
 have h2 : L*c2=B2*H2 := by
   have h := terminal_coeff_clearM263 n (i+2) m t r hn (by dsimp [n]; omega)
   convert h using 1 <;> dsimp [L,c2,B2,H2,n] <;> push_cast <;> congr 1 <;> ring
 have hp : L^2*c0*c2=B0*B2*H0*H2 := by
   calc
    _ = (L*c0)*(L*c2) := by ring
    _ = _ := by rw [h0,h2]; ring
 have hq : L^2*c1^2=B1^2*H1^2 := by nlinarith only [sq_nonneg (L*c1-B1*H1),congrArg (fun z : ℝ => z^2) h1]
 have hb : (i+2:ℝ)*(j+2)*B0*B2=(i+1:ℝ)*(j+1)*B1^2 := second_binomial_productMF52 i j
 have hg := terminal_gap_nonnegM263 i j m t r hm ht htm hr hs
 have hg' : 0 ≤ (i+2:ℝ)*(j+2)*H1^2-(i+1:ℝ)*(j+1)*H0*H2 := by
   convert hg using 1 <;> dsimp [terminalGapM263,H0,H1,H2] <;> congr 1 <;> ring
 have hh := mul_nonneg (sq_nonneg B1) hg'
 have he : (i+2:ℝ)*(j+2)*L^2*(c1^2-c0*c2)=
   B1^2*((i+2:ℝ)*(j+2)*H1^2-(i+1:ℝ)*(j+1)*H0*H2) := by
   linear_combination (i+2:ℝ)*(j+2)*hq-(i+2:ℝ)*(j+2)*hp-H0*H2*hb
 rw [←he] at hh
 have hf : 0 < (i+2:ℝ)*(j+2)*L^2 := by positivity
 have hc := (mul_nonneg_iff_of_pos_left hf).mp hh
 change c0*c2 ≤ c1^2
 linarith

theorem terminal_row_degreeM263 (n : ℕ) (m t r : ℝ) (hn : 3 ≤ n) :
 (terminalRowM263 n m t r).natDegree ≤ n := by
 unfold terminalRowM263 CubicPoly5a7
 compute_degree
 omega

theorem terminal_zero_crossM263 (n : ℕ) (hn : 3 ≤ n) :
 CrossLC (CoeffSeq (terminalRowM263 n 0 0 0)) := by
 have hnR : (3:ℝ) ≤ n := by exact_mod_cast hn
 have hh : (2:ℝ)*(n*(n+1)) ≤ (4*n)^2 := by nlinarith [sq_nonneg (n:ℝ)]
 have h := cubic_crossLC5a7 (A:=0) (B:=2) (C:=4*n) (D:=n*(n+1))
   (by norm_num) (by norm_num) (by positivity) (by positivity)
   (by norm_num) hh (by positivity)
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
