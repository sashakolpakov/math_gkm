import MarkovSecondNormalized340
import MarkovSecondCoeff340
import MarkovAmbientScaling77c2
/-! Machine-authored 34071a88. Stronger second-row inequality for literal
source coefficients; normalization is intermediate only. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem second_row_cleared340 (n h : ℕ) (hn : 3 ≤ n) (hh : h ≤ n) (m t : ℝ) :
 ((n:ℝ)+1)*n*(n-1)*(n-2)*(secondRow340 n m t).coeff h=
 ((n+1).choose (h+1) : ℝ)*secondNorm340 (h+1) (n+1) m t := by
 have hp := cubic_falling_coeff340 h (n-h) (by omega)
   (4*t) (secondB8934 m) (secondC8934 n m) (secondD8934 n m)
 rw [Nat.add_sub_of_le hh] at hp
 simp only [Nat.cast_sub hh] at hp
 have hc : ((h:ℝ)+1)*((n+1).choose (h+1) : ℝ)=
     ((n:ℝ)+1)*(n.choose h : ℝ) := by
   have he := congrArg (fun z : ℕ => (z:ℝ)) (Nat.add_one_mul_choose_eq n h)
   push_cast at he
   nlinarith only [he]
 unfold secondRow340 secondNorm340
 simp only [secondB8934,secondC8934,secondD8934] at hp
 linear_combination ((n:ℝ)+1)*hp -
  (4*t*(n-h)*(n-h-1)*(n-h-2)+(9*m^2+13*m+6)*h*(n-h)*(n-h-1)+
  (6*m^2+6*m*n+8*m+6*n+6)*h*(h-1)*(n-h)+(m+n+2)*(m+n+1)*h*(h-1)*(h-2))*hc

theorem second_row_scaled340 (n h : ℕ) (m t : ℝ) (hn : 3 ≤ n)
 (hend : h+2 ≤ n) (hm : 0 ≤ m) (ht : 0 ≤ t) (htm : t ≤ 2*m)
 (hmn : m ≤ n) (hsource : (n:ℝ) ≤ 2*m ∨ t=0) :
 (h+3 : ℝ)*(n-h)*(secondRow340 n m t).coeff h*(secondRow340 n m t).coeff (h+2) ≤
 (h+2 : ℝ)*(n-h-1)*((secondRow340 n m t).coeff (h+1))^2 := by
 let K : ℝ := ((n:ℝ)+1)*n*(n-1)*(n-2)
 have hnR : (3:ℝ) ≤ n := by exact_mod_cast hn
 have hn1 : 0 < (n:ℝ)-1 := by linarith
 have hn2 : 0 < (n:ℝ)-2 := by linarith
 have hn0 : 0 < (n:ℝ) := by linarith
 have hK : 0 < K := by dsimp [K]; positivity
 have hc (q : ℕ) (hq : q ≤ n) :
     (secondRow340 n m t).coeff q/((n+1).choose (q+1) : ℝ)=
       secondNorm340 (q+1) (n+1) m t/K := by
   have hb : (0:ℝ)<(n+1).choose (q+1) := by exact_mod_cast Nat.choose_pos (by omega : q+1 ≤ n+1)
   apply (div_eq_div_iff (ne_of_gt hb) (ne_of_gt hK)).mpr
   have he := second_row_cleared340 n q hn hq m t
   dsimp [K]
   nlinarith only [he]
 have hg := second_normalized_lc340 (h+1) (n+1) m t hm (by omega) (by omega) (by omega)
   ht htm (by push_cast; linarith) (by simpa using hsource)
 have hd := div_le_div_of_nonneg_right hg (le_of_lt (sq_pos_of_pos hK))
 rw [←div_pow] at hd
 rw [pow_two K,←div_mul_div_comm] at hd
 have hz :
 ((secondRow340 n m t).coeff h/((n+1).choose (h+1) : ℝ))*
 ((secondRow340 n m t).coeff (h+2)/((n+1).choose (h+3) : ℝ)) ≤
 ((secondRow340 n m t).coeff (h+1)/((n+1).choose (h+2) : ℝ))^2 := by
   rw [hc h (by omega),show h+3=(h+2)+1 by omega,hc (h+2) (by omega),
     show h+2=(h+1)+1 by omega,hc (h+1) (by omega)]
   convert hd using 1 <;> push_cast <;> congr 1 <;> ring
 have hz2 := normalized_to_scaled77 (n+1) (h+1) (by omega)
   ((secondRow340 n m t).coeff h) ((secondRow340 n m t).coeff (h+1))
   ((secondRow340 n m t).coeff (h+2)) hz
 convert hz2 using 1 <;> push_cast <;> ring

theorem source_second_ambient340 (path : List Bool) (i : ℕ)
 (hb : 5 ≤ (frame path).mid.b)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i 2)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) 2) :
 let m := (frame path).mid
 let s := i+2-m.a
 (s+2 : ℤ)*(m.b-1-s)*coeff m.p i 2*coeff m.p (i+2) 2 ≤
 (s+1 : ℤ)*(m.b-2-s)*coeff m.p (i+1) 2^2 := by
 obtain ⟨n,m,t,hn,hm,hn3,hmn,ht,hz,he⟩ := source_second_row340 path hb
 have hi := frame_reduced path
 have him : m ≤ i := by
   have h := h0.1
   rw [←hn,←hm] at h
   by_contra hh
   have hh' : i+1 ≤ m := by omega
   have hm' : m+1 < n+2 := by omega
   nlinarith [Nat.mul_le_mul_left (n+2) hh']
 let h := i-m
 have e : m+h=i := by dsimp [h]; omega
 have hend : h+2 ≤ n := by
   have hu := h2.2
   rw [←hn,←hm] at hu
   dsimp [h]
   omega
 have hzR : (n:ℝ) ≤ 2*m ∨ (t:ℝ)=0 := by
   rcases hz with hz | hz
   · left; exact_mod_cast hz
   · right; exact_mod_cast hz
 have hg := second_row_scaled340 n h m t hn3 hend (by positivity) (by positivity)
   (by exact_mod_cast ht) (by exact_mod_cast hmn) hzR
 rw [←he h,←he (h+1),←he (h+2)] at hg
 have e1 : m+(h+1)=i+1 := by omega
 have e2 : m+(h+2)=i+2 := by omega
 rw [e,e1,e2] at hg
 have hg' : (h+3 : ℝ)*(n-h)*(coeff (frame path).mid.p i 2 : ℝ)*coeff (frame path).mid.p (i+2) 2 ≤
     (h+2 : ℝ)*(n-h-1)*(coeff (frame path).mid.p (i+1) 2 : ℝ)^2 := by nlinarith only [hg]
 dsimp only
 rw [←hn,←hm,show i+2-(m+1)=h+1 by omega]
 push_cast
 have hgZ : (h+3 : ℤ)*(n-h)*coeff (frame path).mid.p i 2*coeff (frame path).mid.p (i+2) 2 ≤
     (h+2 : ℤ)*(n-h-1)*coeff (frame path).mid.p (i+1) 2^2 := by exact_mod_cast hg'
 convert hgZ using 1 <;> ring

#print axioms second_row_cleared340
#print axioms source_second_ambient340
end
end MathGKM.Markov
