import MarkovDistanceTwo863a
/-! Machine-authored 863a7482. The opposite distance-two orientation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem choose_twisted_step863 (n k : ℕ) (hk : k ≤ n) :
 (n.choose (k+1) : ℚ)*(k+1)*(n+1)=
 ((n+1).choose k : ℚ)*(n+1-k)*(n-k) := by
 have h0 := choose_lower_step67 n k hk
 have h1 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.choose_mul_succ_eq n k)
 push_cast [Nat.cast_sub (show k ≤ n+1 by omega)] at h1
 linear_combination (n+1:ℚ)*h0+(n-k:ℚ)*h1

theorem choose_twisted_lc863 (n s : ℕ) :
 ((n+2).choose s : ℚ)*(n.choose (s+2) : ℚ) ≤
 ((n+1).choose (s+1) : ℚ)^2 := by
 by_cases hs : s+2 ≤ n
 · have hn : (s:ℚ)+2 ≤ n := by exact_mod_cast hs
   have h0 := choose_twisted_step863 (n+1) s (by omega)
   have h1 := choose_twisted_step863 n (s+1) (by omega)
   push_cast at h0 h1
   have hD : (s+1 : ℚ)*(n+2) ≤ (s+2)*(n+1) := by nlinarith
   have hN : (n-s : ℚ)*(n-s-1) ≤ (n+2-s)*(n+1-s) := by nlinarith
   have h := ratio_cross67 ((n+2).choose s : ℚ) ((n+1).choose (s+1) : ℚ)
     ((n+1).choose (s+1) : ℚ) (n.choose (s+2) : ℚ)
     ((n+2-s)*(n+1-s)) ((n-s)*(n-s-1)) ((s+1)*(n+2)) ((s+2)*(n+1))
     (by positivity) (by positivity) (by positivity) (by positivity)
     (by convert h0 using 1 <;> ring) (by convert h1 using 1 <;> ring)
     (mul_le_mul hN hD (by positivity) (by apply mul_nonneg <;> linarith))
   simpa [pow_two] using h
 · rw [Nat.choose_eq_zero_of_lt (by omega : n<s+2)]
   norm_num only [Nat.cast_zero,mul_zero]
   exact sq_nonneg _

theorem rising_forward_certificate863 (s q : ℚ) (hs : 1 ≤ s) (hq : 0 ≤ q) :
 s*(q+1)*(s+q+2)*(s+q+3) ≤ (s+2)*(q+2)*(s+q)*(s+q+1) := by
 let x := s-1
 have hx : 0 ≤ x := by dsimp [x]; linarith
 have he : (s+2)*(q+2)*(s+q)*(s+q+1)-s*(q+1)*(s+q+2)*(s+q+3)=
   x^3+4*x^2+x*q^2+x*q+3*x+2*q^3+7*q^2+5*q := by dsimp [x]; ring
 have hp : 0 ≤ x^3+4*x^2+x*q^2+x*q+3*x+2*q^3+7*q^2+5*q := by positivity
 linarith

theorem rising_forward863 (s q : ℕ) (hs : 1 ≤ s) :
 (s+1 : ℚ)*((s+q-1).choose q : ℚ)*((s+q+3).choose (q+2) : ℚ) ≤
 (s+2 : ℚ)*((s+q+1).choose (q+1) : ℚ)^2 := by
 have h0 := choose_skew_step863 (s+q-1) q (by omega)
 have h1 := choose_skew_step863 (s+q+1) (q+1) (by omega)
 rw [show s+q-1+2=s+q+1 by omega] at h0
 push_cast [Nat.cast_sub (show 1 ≤ s+q by omega)] at h0
 push_cast at h1
 have hsR : (0:ℚ)<s := by exact_mod_cast (show 0<s by omega)
 have hcert := rising_forward_certificate863 s q (by exact_mod_cast hs) (by positivity)
 have h := ratio_cross67
   ((s+1 : ℚ)*((s+q-1).choose q : ℚ))
   ((s+2 : ℚ)*((s+q+1).choose (q+1) : ℚ))
   ((s+q+1).choose (q+1) : ℚ) ((s+q+3).choose (q+2) : ℚ)
   ((s+2)*(s+q+1)*(s+q)) ((s+q+3)*(s+q+2))
   ((s+1)*s*(q+1)) ((q+2)*(s+1))
   (by positivity) (by positivity) (by positivity) (by positivity)
   (by linear_combination (s+1:ℚ)*(s+2)*h0)
   (by convert h1 using 1 <;> ring)
   (by have hh := mul_le_mul_of_nonneg_left hcert (by positivity : (0:ℚ) ≤ s+1)
       nlinarith only [hh])
 convert h using 1 <;> ring

theorem choose_down_step863 (n k : ℕ) (hk : k ≤ n) :
 ((n+2).choose k : ℚ)*(n+2-k)*(n+1-k)*(n-k)=
 (n.choose (k+1) : ℚ)*(k+1)*(n+2)*(n+1) := by
 have h0 := choose_upper_two67 n k (by omega)
 have h1 := choose_lower_step67 n k hk
 linear_combination (n-k:ℚ)*h0-(n+2:ℚ)*(n+1)*h1

theorem forward_stride_certificate863 (s h : ℚ) (hh : 0 ≤ h) (hr : h+2 ≤ 2*s) :
 (s+2)*(2*s+4)*(2*s+3)*(h+1)*(2*s+1-h)*(2*s-h)*(2*s-1-h) ≤
 (s+1)*(h+2)*(2*s+2)*(2*s+1)*(2*s+4-h)*(2*s+3-h)*(2*s+2-h) := by
 let r := 2*s-h-2
 have hr0 : 0 ≤ r := by dsimp [r]; linarith
 have he :
 (s+1)*(h+2)*(2*s+2)*(2*s+1)*(2*s+4-h)*(2*s+3-h)*(2*s+2-h)-
 (s+2)*(2*s+4)*(2*s+3)*(h+1)*(2*s+1-h)*(2*s-h)*(2*s-1-h)=
 9*h^4*r^2/2+63*h^4*r/2+57*h^4+11*h^3*r^3+138*h^3*r^2+
 553*h^3*r+726*h^3+9*h^2*r^4+168*h^2*r^3+2259*h^2*r^2/2+
 6483*h^2*r/2+3381*h^2+3*h*r^5+76*h*r^4+742*h*r^3+3485*h*r^2+
 7868*h*r+6852*h+r^6/2+29*r^5/2+349*r^4/2+2215*r^3/2+3881*r^2+7074*r+5220 := by
   dsimp [r]; ring
 have hp : 0 ≤ 9*h^4*r^2/2+63*h^4*r/2+57*h^4+11*h^3*r^3+138*h^3*r^2+
 553*h^3*r+726*h^3+9*h^2*r^4+168*h^2*r^3+2259*h^2*r^2/2+
 6483*h^2*r/2+3381*h^2+3*h*r^5+76*h*r^4+742*h*r^3+3485*h*r^2+
 7868*h*r+6852*h+r^6/2+29*r^5/2+349*r^4/2+2215*r^3/2+3881*r^2+7074*r+5220 := by positivity
 linarith

theorem stride_forward863 (s h : ℕ) (hs : 1 ≤ s) :
 (s+2 : ℚ)*((2*s).choose (h+2) : ℚ)*((2*s+4).choose h : ℚ) ≤
 (s+1 : ℚ)*((2*s+2).choose (h+1) : ℚ)^2 := by
 by_cases hh : h+2 ≤ 2*s
 · have hhR : (h:ℚ)+2 ≤ 2*s := by exact_mod_cast hh
   have p1 : (0:ℚ)<2*s+1-h := by linarith
   have p2 : (0:ℚ)<2*s-h := by linarith
   have p3 : (0:ℚ)<2*s-1-h := by linarith
   have p4 : (0:ℚ)<2*s+4-h := by linarith
   have p5 : (0:ℚ)<2*s+3-h := by linarith
   have p6 : (0:ℚ)<2*s+2-h := by linarith
   have h0 := choose_down_step863 (2*s) (h+1) (by omega)
   have h1 := choose_down_step863 (2*s+2) h (by omega)
   push_cast at h0 h1
   have ht := ratio_cross67
     ((s+2 : ℚ)*((2*s).choose (h+2) : ℚ))
     ((s+1 : ℚ)*((2*s+2).choose (h+1) : ℚ))
     ((2*s+2).choose (h+1) : ℚ) ((2*s+4).choose h : ℚ)
     ((s+1)*(h+2)*(2*s+2)*(2*s+1)) ((h+1)*(2*s+4)*(2*s+3))
     ((s+2)*(2*s+1-h)*(2*s-h)*(2*s-1-h))
     ((2*s+4-h)*(2*s+3-h)*(2*s+2-h))
     (by positivity) (by positivity)
     (by positivity)
     (by positivity)
     (by linear_combination (s+1:ℚ)*(s+2)*h0)
     (by convert h1 using 1 <;> ring)
     (by convert forward_stride_certificate863 s h (by positivity) hhR using 1 <;> ring)
   convert ht using 1 <;> ring
 · rw [Nat.choose_eq_zero_of_lt (by omega : 2*s<h+2)]
   norm_num only [Nat.cast_zero,mul_zero,zero_mul]
   positivity

#print axioms choose_twisted_lc863
#print axioms rising_forward863
#print axioms stride_forward863
end
end MathGKM.Markov
