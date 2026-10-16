import MarkovStripCoefficientsMB9D
import MarkovBinomialRatios6a40
/-! Machine-authored ce882be3. Zero-inclusive binomial correction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem strip_choose_fiveMCE8 (n k : ℕ) (hn : 5 ≤ n) :
 (n:ℝ)*(n-1)*(n-2)*(n-3)*(n-4)*((n-5).choose k:ℝ)=
 (n.choose k:ℝ)*((n:ℝ)-k)*(n-k-1)*(n-k-2)*(n-k-3)*(n-k-4) := by
 have h0 := bc_upper6 (n-1) k
 have h1 := bc_upper6 (n-2) k
 have h2 := bc_upper6 (n-3) k
 have h3 := bc_upper6 (n-4) k
 have h4 := bc_upper6 (n-5) k
 rw [show n-1+1=n by omega] at h0
 rw [show n-2+1=n-1 by omega] at h1
 rw [show n-3+1=n-2 by omega] at h2
 rw [show n-4+1=n-3 by omega] at h3
 rw [show n-5+1=n-4 by omega] at h4
 unfold bc6 at h0 h1 h2 h3 h4
 push_cast [Nat.cast_sub (show 1 ≤ n by omega),Nat.cast_sub (show 2 ≤ n by omega),
   Nat.cast_sub (show 3 ≤ n by omega),Nat.cast_sub (show 4 ≤ n by omega),Nat.cast_sub hn] at h0 h1 h2 h3 h4
 linear_combination
   -((n:ℝ)-k-1)*(n-k-2)*(n-k-3)*(n-k-4)*h0-
   n*(n-k-2)*(n-k-3)*(n-k-4)*h1-
   n*(n-1)*(n-k-3)*(n-k-4)*h2-
   n*(n-1)*(n-2)*(n-k-4)*h3-
   n*(n-1)*(n-2)*(n-3)*h4

theorem strip_choose_correctionMCE8 (k l : ℕ) (hN : 5 ≤ k+l) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*
 ((k+l-5).choose (k+1):ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*(l-3)*(l-4)*(l-5) := by
 have h := strip_choose_fiveMCE8 (k+l) k hN
 have h1 := bc_lower6 (k+l-5) k
 unfold bc6 at h1
 push_cast [Nat.cast_sub hN] at h1
 push_cast at h
 linear_combination ((l:ℝ)-5)*h+
   ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*h1
end
end MathGKM.Markov
