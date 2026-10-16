import MarkovStripChooseMCE8
/-! Machine-authored d11e335e. Seventh order shifted choose identity, zeros retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000

theorem strip_choose_sevenMD11 (n k : ℕ) (hn : 7 ≤ n) :
 (n:ℝ)*(n-1)*(n-2)*(n-3)*(n-4)*(n-5)*(n-6)*((n-7).choose k:ℝ)=
 (n.choose k:ℝ)*((n:ℝ)-k)*(n-k-1)*(n-k-2)*(n-k-3)*(n-k-4)*(n-k-5)*(n-k-6) := by
 have h := strip_choose_fiveMCE8 n k (by omega)
 have h5 := bc_upper6 (n-6) k
 have h6 := bc_upper6 (n-7) k
 rw [show n-6+1=n-5 by omega] at h5
 rw [show n-7+1=n-6 by omega] at h6
 unfold bc6 at h5 h6
 push_cast [Nat.cast_sub (show 6 ≤ n by omega),Nat.cast_sub hn] at h5 h6
 linear_combination
   ((n:ℝ)-k-5)*(n-k-6)*h-
   n*(n-1)*(n-2)*(n-3)*(n-4)*(n-k-6)*h5-
   n*(n-1)*(n-2)*(n-3)*(n-4)*(n-5)*h6

theorem strip_choose_correctionMD11 (k l : ℕ) (hN : 7 ≤ k+l) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*
 ((k+l-7).choose (k+1):ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*(l-3)*(l-4)*(l-5)*(l-6)*(l-7) := by
 have h := strip_choose_sevenMD11 (k+l) k hN
 have h1 := bc_lower6 (k+l-7) k
 unfold bc6 at h1
 push_cast [Nat.cast_sub hN] at h1
 push_cast at h
 linear_combination ((l:ℝ)-7)*h+
   ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*h1
end
end MathGKM.Markov
