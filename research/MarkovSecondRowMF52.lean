import MarkovSecondGapMF52
import MarkovSecondCoeff340
/-! Machine-authored f52ba141. Raw coefficients after smoothing; all indices. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

theorem second_coeff_clearMF52 (n k : ℕ) (m t : ℝ) (hn : 3 ≤ n) (hk : k ≤ n) :
 (n:ℝ)*(n-1)*(n-2)*(secondRow340 n m t).coeff k =
 (n.choose k:ℝ)*secondHMF52 k (n-k) m t := by
 have h := cubic_falling_coeff340 k (n-k) (by omega)
   (4*t) (secondB8934 m) (secondC8934 n m) (secondD8934 n m)
 rw [Nat.add_sub_of_le hk] at h
 simp only [Nat.cast_sub hk] at h
 convert h using 1 <;>
   simp only [secondRow340,secondHMF52,secondB8934,secondC8934,secondD8934] <;> ring

theorem second_binomial_productMF52 (i j : ℕ) :
 (i+2:ℝ)*(j+2)*((i+j+2).choose i:ℝ)*((i+j+2).choose (i+2):ℝ)=
 (i+1:ℝ)*(j+1)*((i+j+2).choose (i+1):ℝ)^2 := by
 have h0 := Nat.add_one_mul_choose_eq (i+j+2) i
 have h1 := Nat.add_one_mul_choose_eq (i+j+2) (i+1)
 have e0 : (i+j+2+1).choose (i+1)=(i+j+2).choose (i+1)+(i+j+2).choose i := by
   rw [Nat.choose_succ_succ]; simp [Nat.succ_eq_add_one,add_comm]
 have e1 : (i+j+2+1).choose (i+1+1)=(i+j+2).choose (i+2)+(i+j+2).choose (i+1) := by
   rw [Nat.choose_succ_succ]
   simp only [Nat.succ_eq_add_one,show i+1+1=i+2 by omega]
   ring
 rw [e0] at h0
 rw [e1] at h1
 have c0 : (i+1:ℝ)*((i+j+2).choose (i+1):ℝ)=
   (j+2:ℝ)*((i+j+2).choose i:ℝ) := by exact_mod_cast (by nlinarith [h0] : (i+1)*(i+j+2).choose (i+1)=(j+2)*(i+j+2).choose i)
 have c1 : (i+2:ℝ)*((i+j+2).choose (i+2):ℝ)=
   (j+1:ℝ)*((i+j+2).choose (i+1):ℝ) := by exact_mod_cast (by nlinarith [h1] : (i+2)*(i+j+2).choose (i+2)=(j+1)*(i+j+2).choose (i+1))
 calc
  _ = ((j+2:ℝ)*((i+j+2).choose i:ℝ))*((i+2:ℝ)*((i+j+2).choose (i+2):ℝ)) := by ring
  _ = _ := by rw [←c0,c1]; ring

theorem second_row_innerMF52 (i j : ℕ) (m t : ℝ) (hs : 1 ≤ i+j)
 (hm : 1 ≤ m) (ht : 0 ≤ t) (htm : t ≤ 2*m) :
 (secondRow340 (i+j+2) m t).coeff i*(secondRow340 (i+j+2) m t).coeff (i+2) ≤
 (secondRow340 (i+j+2) m t).coeff (i+1)^2 := by
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
 let c0 := (secondRow340 n m t).coeff i
 let c1 := (secondRow340 n m t).coeff (i+1)
 let c2 := (secondRow340 n m t).coeff (i+2)
 let B0 : ℝ := n.choose i
 let B1 : ℝ := n.choose (i+1)
 let B2 : ℝ := n.choose (i+2)
 let H0 := secondHMF52 i (j+2) m t
 let H1 := secondHMF52 (i+1) (j+1) m t
 let H2 := secondHMF52 (i+2) j m t
 have h0 : L*c0=B0*H0 := by
   have h := second_coeff_clearMF52 n i m t hn (by dsimp [n]; omega)
   convert h using 1 <;> dsimp [L,c0,B0,H0,n] <;> push_cast <;> congr 1 <;> ring
 have h1 : L*c1=B1*H1 := by
   have h := second_coeff_clearMF52 n (i+1) m t hn (by dsimp [n]; omega)
   convert h using 1 <;> dsimp [L,c1,B1,H1,n] <;> push_cast <;> congr 1 <;> ring
 have h2 : L*c2=B2*H2 := by
   have h := second_coeff_clearMF52 n (i+2) m t hn (by dsimp [n]; omega)
   convert h using 1 <;> dsimp [L,c2,B2,H2,n] <;> push_cast <;> congr 1 <;> ring
 have hp : L^2*c0*c2=B0*B2*H0*H2 := by
   calc
    _ = (L*c0)*(L*c2) := by ring
    _ = _ := by rw [h0,h2]; ring
 have hq : L^2*c1^2=B1^2*H1^2 := by nlinarith only [sq_nonneg (L*c1-B1*H1),congrArg (fun z : ℝ => z^2) h1]
 have hb : (i+2:ℝ)*(j+2)*B0*B2=(i+1:ℝ)*(j+1)*B1^2 := second_binomial_productMF52 i j
 have hg := second_gap_nonnegMF52 i j m t hm ht htm hs
 have hg' : 0 ≤ (i+2:ℝ)*(j+2)*H1^2-(i+1:ℝ)*(j+1)*H0*H2 := by
   convert hg using 1 <;> dsimp [secondGapMF52,H0,H1,H2] <;> congr 1 <;> ring
 have hh := mul_nonneg (sq_nonneg B1) hg'
 have he : (i+2:ℝ)*(j+2)*L^2*(c1^2-c0*c2)=
   B1^2*((i+2:ℝ)*(j+2)*H1^2-(i+1:ℝ)*(j+1)*H0*H2) := by
   linear_combination (i+2:ℝ)*(j+2)*hq-(i+2:ℝ)*(j+2)*hp-H0*H2*hb
 rw [←he] at hh
 have hf : 0 < (i+2:ℝ)*(j+2)*L^2 := by positivity
 have hc := (mul_nonneg_iff_of_pos_left hf).mp hh
 change c0*c2 ≤ c1^2
 linarith

theorem second_row_degreeMF52 (n : ℕ) (m t : ℝ) (hn : 3 ≤ n) :
 (secondRow340 n m t).natDegree ≤ n := by
 unfold secondRow340 CubicPoly5a7
 compute_degree
 omega

theorem second_zero_crossMF52 (n : ℕ) : CrossLC (CoeffSeq (secondRow340 n 0 0)) := by
 obtain ⟨ha,hb,hc,hd,h1,h2,h3⟩ := second_inequalities8934 n 0 0 (by norm_num)
   (by positivity) (by norm_num) (by norm_num) (Or.inr rfl)
 have h := cubic_crossLC5a7 ha hb.le hc.le hd h1 h2 h3
 rw [←coeffSeq_cubic5a7] at h
 have hh := crossLC_pascal h (n-3)
 rw [←coeffSeq_binomial_mul] at hh
 exact hh

theorem second_row_allMF52 (n m t i : ℕ) (hn : 3 ≤ n) (ht : t ≤ 2*m) :
 (secondRow340 n m t).coeff i*(secondRow340 n m t).coeff (i+2) ≤
 (secondRow340 n m t).coeff (i+1)^2 := by
 by_cases hm : m=0
 · subst m
   have he : t=0 := by omega
   subst t
   have h := crossLC_adjacent (second_zero_crossMF52 n) (i+1)
   simpa [CoeffSeq,show ¬(i:ℤ)<0 by omega,show ¬(i:ℤ)+1<0 by omega,
     show ¬(i:ℤ)+1+1<0 by omega,show ((i:ℤ)+1+1).toNat=i+2 by omega] using h
 · by_cases hi : i+2 ≤ n
   · have he : n=i+(n-(i+2))+2 := by omega
     rw [he]
     exact second_row_innerMF52 i (n-(i+2)) m t (by omega)
       (by exact_mod_cast (show 1 ≤ m by omega)) (by positivity) (by exact_mod_cast ht)
   · have hz : (secondRow340 n m t).coeff (i+2)=0 :=
       Polynomial.coeff_eq_zero_of_natDegree_lt (lt_of_le_of_lt (second_row_degreeMF52 n m t hn) (by omega))
     rw [hz,mul_zero]
     positivity
end
end MathGKM.Markov
