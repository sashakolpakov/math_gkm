import MarkovFiberAdjacent67c3
/-! Machine-authored request 863a7482. Distance-two comparisons for the exact
Pell horizontal summands. No assertion about their full sum. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem choose_skew_step863 (n k : ℕ) (hk : k ≤ n) :
 ((n+2).choose (k+1) : ℚ)*(k+1)*(n+1-k)=
 (n.choose k : ℚ)*(n+2)*(n+1) := by
 have h0 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.add_one_mul_choose_eq n k)
 have h1 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.choose_mul_succ_eq (n+1) (k+1))
 push_cast [Nat.cast_sub (show k+1 ≤ n+1+1 by omega)] at h1
 push_cast [Nat.cast_sub (show k ≤ n+1 by omega)] at h1
 push_cast at h0
 linear_combination -(k+1:ℚ)*h1-(n+2:ℚ)*h0

theorem choose_skew_lc863 (n s : ℕ) :
 (n.choose s : ℚ)*((n+2).choose (s+2) : ℚ) ≤
 ((n+1).choose (s+1) : ℚ)^2 := by
 by_cases hs : s ≤ n
 · have h := choose_upper_lc6 n (n-s)
   have e0 : n.choose s=n.choose (n-s) := (Nat.choose_symm hs).symm
   have e1 : (n+1).choose (s+1)=(n+1).choose (n-s) := by
     rw [← Nat.choose_symm (show s+1 ≤ n+1 by omega)]
     congr 1; omega
   have e2 : (n+2).choose (s+2)=(n+2).choose (n-s) := by
     rw [← Nat.choose_symm (show s+2 ≤ n+2 by omega)]
     congr 1; omega
   rw [e0,e1,e2]
   exact_mod_cast h
 · rw [Nat.choose_eq_zero_of_lt (by omega : n<s)]
   norm_num only [Nat.cast_zero,zero_mul]
   exact sq_nonneg _

theorem rising_reverse863 (s q : ℕ) :
 (s+1 : ℚ)*((s+q+1).choose (q+2) : ℚ)*((s+q+1).choose q : ℚ) ≤
 (s:ℚ)*((s+q+1).choose (q+1) : ℚ)^2 := by
 have h0 := choose_lower_step67 (s+q+1) q (by omega)
 have h1 := choose_lower_step67 (s+q+1) (q+1) (by omega)
 push_cast at h0 h1
 have he : (q+2 : ℚ)*
   (s*((s+q+1).choose (q+1) : ℚ)^2-
    (s+1)*((s+q+1).choose (q+2) : ℚ)*((s+q+1).choose q : ℚ))=
   s*((s+q+1).choose (q+1) : ℚ)^2 := by
   linear_combination ((s+q+1).choose (q+1) : ℚ)*s*h0-
     ((s+q+1).choose q : ℚ)*(s+1)*h1
 have hz : 0 ≤ (q+2 : ℚ)*
   (s*((s+q+1).choose (q+1) : ℚ)^2-
    (s+1)*((s+q+1).choose (q+2) : ℚ)*((s+q+1).choose q : ℚ)) := by
   rw [he]; positivity
 have := (mul_nonneg_iff_of_pos_left (by positivity : (0:ℚ)<q+2)).mp hz
 linarith

theorem reverse_stride_certificate863 (s h : ℚ) (hh : 0 ≤ h) (he : h ≤ 2*s) :
 s*(2*s+4)*(2*s+3)*(h+1)*(2*s+1-h) ≤
 (s+1)*(2*s+2)*(2*s+1)*(h+2)*(2*s+2-h) := by
 let e := 2*s-h
 have he0 : 0 ≤ e := by dsimp [e]; linarith
 have hid :
 (s+1)*(2*s+2)*(2*s+1)*(h+2)*(2*s+2-h)-
 s*(2*s+4)*(2*s+3)*(h+1)*(2*s+1-h)=
 h^4/2+h^3*e+3*h^3+h^2*e^2+7*h^2*e+17*h^2/2+
 h*e^3+7*h*e^2+19*h*e+14*h+e^4/2+3*e^3+17*e^2/2+14*e+8 := by
   dsimp [e]; ring
 have hp : 0 ≤ h^4/2+h^3*e+3*h^3+h^2*e^2+7*h^2*e+17*h^2/2+
 h*e^3+7*h*e^2+19*h*e+14*h+e^4/2+3*e^3+17*e^2/2+14*e+8 := by positivity
 linarith

theorem stride_reverse863 (s h : ℕ) (hs : 1 ≤ s) :
 (s:ℚ)*((2*s).choose h : ℚ)*((2*s+4).choose (h+2) : ℚ) ≤
 (s+1 : ℚ)*((2*s+2).choose (h+1) : ℚ)^2 := by
 by_cases hh : h ≤ 2*s
 · have hsR : (0:ℚ)<s := by exact_mod_cast (show 0<s by omega)
   have hhR : (h:ℚ) ≤ 2*s := by exact_mod_cast hh
   have h0 := choose_skew_step863 (2*s) h hh
   have h1 := choose_skew_step863 (2*s+2) (h+1) (by omega)
   push_cast at h0 h1
   have ht := ratio_cross67
     ((s:ℚ)*((2*s).choose h : ℚ))
     ((s+1 : ℚ)*((2*s+2).choose (h+1) : ℚ))
     ((2*s+2).choose (h+1) : ℚ) ((2*s+4).choose (h+2) : ℚ)
     ((s+1)*(2*s+2)*(2*s+1)) ((2*s+4)*(2*s+3))
     (s*(h+1)*(2*s+1-h)) ((h+2)*(2*s+2-h))
     (by positivity) (by positivity)
     (by apply mul_pos; exact mul_pos hsR (by positivity); linarith)
     (by apply mul_pos; positivity; linarith)
     (by linear_combination (s:ℚ)*(s+1)*h0)
     (by convert h1 using 1 <;> ring)
     (by convert reverse_stride_certificate863 s h (by positivity) hhR using 1 <;> ring)
   convert ht using 1 <;> ring
 · rw [Nat.choose_eq_zero_of_lt (by omega : 2*s<h)]
   norm_num only [Nat.cast_zero,mul_zero,zero_mul]
   positivity

#print axioms choose_skew_lc863
#print axioms rising_reverse863
#print axioms stride_reverse863
end
end MathGKM.Markov
