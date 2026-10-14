import MarkovAdjacent67c3
/-! Machine-authored 67c3f3f5. Adjacent summand indices admit individual
charge-preserving comparisons, unlike the inherited distance-three example. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem rising_first67 (s q : ℕ) (hs : 1 ≤ s) :
 (s+1 : ℚ)*((s+q-1).choose q : ℚ)*((s+q+2).choose (q+1) : ℚ) ≤
 (s+2 : ℚ)*((s+q).choose q : ℚ)*((s+q+1).choose (q+1) : ℚ) := by
 have h1 := congrArg (fun z : ℕ => (z:ℚ))
   (Nat.choose_mul_succ_eq (s+q-1) q)
 have h2 := congrArg (fun z : ℕ => (z:ℚ))
   (Nat.choose_mul_succ_eq (s+q+1) (q+1))
 have e : s+q-1+1=s+q := by omega
 rw [e] at h1
 push_cast [Nat.cast_sub (show 1 ≤ s+q by omega),
   Nat.cast_sub (show q ≤ s+q by omega)] at h1
 push_cast [Nat.cast_sub (show q+1 ≤ s+q+1+1 by omega)] at h2
 rw [show s+q+1-q=s+1 by omega] at h2
 push_cast at h2
 have he : (s+q : ℚ)*
   ((s+2)*((s+q).choose q : ℚ)*((s+q+1).choose (q+1) : ℚ)-
    (s+1)*((s+q-1).choose q : ℚ)*((s+q+2).choose (q+1) : ℚ))=
   2*q*((s+q).choose q : ℚ)*((s+q+1).choose (q+1) : ℚ) := by
   linear_combination -((s+q+2).choose (q+1) : ℚ)*(s+1)*h1+
     ((s+q).choose q : ℚ)*s*h2
 have hp : 0 < (s+q : ℚ) := by exact_mod_cast (show 0<s+q by omega)
 have hz : 0 ≤ (s+q : ℚ)*
   ((s+2)*((s+q).choose q : ℚ)*((s+q+1).choose (q+1) : ℚ)-
    (s+1)*((s+q-1).choose q : ℚ)*((s+q+2).choose (q+1) : ℚ)) := by
   rw [he]; positivity
 have := (mul_nonneg_iff_of_pos_left hp).mp hz
 linarith

theorem rising_second67 (s q : ℕ) :
 (s+1 : ℚ)*((s+q).choose (q+1) : ℚ)*((s+q+1).choose q : ℚ)=
 (s : ℚ)*((s+q+1).choose (q+1) : ℚ)*((s+q).choose q : ℚ) := by
 have h0 := choose_lower_step67 (s+q) q (by omega)
 have h1 := choose_lower_step67 (s+q+1) q (by omega)
 push_cast at h0 h1
 have he : (q+1 : ℚ)*
   ((s+1)*((s+q).choose (q+1) : ℚ)*((s+q+1).choose q : ℚ)-
    s*((s+q+1).choose (q+1) : ℚ)*((s+q).choose q : ℚ))=0 := by
   linear_combination ((s+q+1).choose q : ℚ)*(s+1)*h0-
     ((s+q).choose q : ℚ)*s*h1
 have hp : (0:ℚ)<q+1 := by positivity
 have := (mul_eq_zero.mp he).resolve_left (ne_of_gt hp)
 linarith

theorem cross_product67 (a b c d x y z w : ℚ)
 (hx : 0 ≤ x) (hw : 0 ≤ w) (hb : 0 ≤ b) (hc : 0 ≤ c)
 (hA : a*d ≤ b*c) (hB : x*w ≤ y*z) : (a*x)*(d*w) ≤ (b*y)*(c*z) := by
 calc
 (a*x)*(d*w)=(a*d)*(x*w) := by ring
 _ ≤ (b*c)*(x*w) := mul_le_mul_of_nonneg_right hA (mul_nonneg hx hw)
 _ ≤ (b*c)*(y*z) := mul_le_mul_of_nonneg_left hB (mul_nonneg hb hc)
 _ = (b*y)*(c*z) := by ring

theorem binomial_pair_first67 (n s q h : ℕ) (hs : 1 ≤ s) :
 (((n+1).choose s : ℚ)*((s+q-1).choose q : ℚ)*((2*s).choose (h+1) : ℚ))*
 ((n.choose (s+2) : ℚ)*((s+q+2).choose (q+1) : ℚ)*((2*s+4).choose h : ℚ)) ≤
 (((n+1).choose (s+1) : ℚ)*((s+q).choose q : ℚ)*((2*s+2).choose (h+1) : ℚ))*
 ((n.choose (s+1) : ℚ)*((s+q+1).choose (q+1) : ℚ)*((2*s+2).choose h : ℚ)) := by
 have hb := rising_first67 s q hs
 have hc := stride_adjacent_first67 s h hs
 have hp : 0 < (s+1 : ℚ)*(s+2) := by positivity
 have hk :
 (((s+q-1).choose q : ℚ)*((2*s).choose (h+1) : ℚ))*
 (((s+q+2).choose (q+1) : ℚ)*((2*s+4).choose h : ℚ)) ≤
 (((s+q).choose q : ℚ)*((2*s+2).choose (h+1) : ℚ))*
 (((s+q+1).choose (q+1) : ℚ)*((2*s+2).choose h : ℚ)) := by
   apply (mul_le_mul_iff_of_pos_left hp).mp
   have hh := mul_le_mul hb hc (by positivity) (by positivity)
   convert hh using 1 <;> ring
 have hh := cross_product67 _ _ _ _ _ _ _ _ (by positivity) (by positivity)
   (by positivity) (by positivity) (choose_adjacent_first67 n s) hk
 convert hh using 1 <;> ring

theorem binomial_pair_second67 (n s q h : ℕ) (hs : 1 ≤ s) :
 ((n.choose s : ℚ)*((s+q).choose (q+1) : ℚ)*((2*s).choose h : ℚ))*
 (((n+1).choose (s+2) : ℚ)*((s+q+1).choose q : ℚ)*((2*s+4).choose (h+1) : ℚ)) ≤
 ((n.choose (s+1) : ℚ)*((s+q+1).choose (q+1) : ℚ)*((2*s+2).choose h : ℚ))*
 (((n+1).choose (s+1) : ℚ)*((s+q).choose q : ℚ)*((2*s+2).choose (h+1) : ℚ)) := by
 have hb := (rising_second67 s q).le
 have hc := stride_adjacent_second67 s h hs
 have hp : 0 < (s:ℚ)*(s+1) := by
   have : (0:ℚ)<s := by exact_mod_cast (show 0<s by omega)
   positivity
 have hk :
 (((s+q).choose (q+1) : ℚ)*((2*s).choose h : ℚ))*
 (((s+q+1).choose q : ℚ)*((2*s+4).choose (h+1) : ℚ)) ≤
 (((s+q+1).choose (q+1) : ℚ)*((2*s+2).choose h : ℚ))*
 (((s+q).choose q : ℚ)*((2*s+2).choose (h+1) : ℚ)) := by
   apply (mul_le_mul_iff_of_pos_left hp).mp
   have hh := mul_le_mul hb hc (by positivity) (by positivity)
   convert hh using 1 <;> ring
 have hh := cross_product67 _ _ _ _ _ _ _ _ (by positivity) (by positivity)
   (by positivity) (by positivity) (choose_adjacent_second67 n s) hk
 convert hh using 1 <;> ring

#print axioms binomial_pair_first67
#print axioms binomial_pair_second67
end
end MathGKM.Markov
