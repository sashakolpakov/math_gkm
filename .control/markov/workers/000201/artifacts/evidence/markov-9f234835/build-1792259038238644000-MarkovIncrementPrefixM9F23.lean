import MarkovPrefixM8F7
/-! Machine-authored 9f234835. Decreasing increment ratios control a prefix
minor. No assumption that the original sequence is decreasing is needed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem increment_prefix_adjacentM9F23 (f g : ℕ → ℝ) (R : ℕ)
 (hg : ∀ k, k ≤ R → 0 < g k)
 (hfirst : (f 1-f 0)*g 0 ≤ f 0*g 1)
 (hstep : ∀ k, k+2 ≤ R →
   (f (k+2)-f (k+1))*g (k+1) ≤ (f (k+1)-f k)*g (k+2))
 (k : ℕ) (hk : k+1 ≤ R) :
 f (k+1)*prefixM8F7 g k ≤ f k*prefixM8F7 g (k+1) := by
 induction k with
 | zero =>
   simp only [prefixM8F7,sum_range_succ,sum_range_zero,zero_add]
   nlinarith only [hfirst]
 | succ k ih =>
   have hh := ih (by omega)
   have hs := hstep k (by omega)
   have hp : 0 < g (k+1) := hg _ (by omega)
   have hn : 0 ≤ prefixM8F7 g k := sum_nonneg (fun i hi =>
     (hg i (by simp only [mem_range] at hi; omega)).le)
   have he : prefixM8F7 g (k+1)=prefixM8F7 g k+g (k+1) := by
     simp [prefixM8F7,sum_range_succ]
   have he2 : prefixM8F7 g (k+2)=prefixM8F7 g (k+1)+g (k+2) := by
     simp [prefixM8F7,sum_range_succ,show k+2=k+1+1 by omega]
   rw [he] at hh
   have hA := mul_le_mul_of_nonneg_right hh (hg (k+2) (by omega)).le
   have hB := mul_le_mul_of_nonneg_right hs hn
   have hE := mul_le_mul_of_nonneg_right hs hp.le
   have hC : 0 ≤ g (k+1)*(f (k+1)*g (k+2)-
       (f (k+2)-f (k+1))*prefixM8F7 g (k+1)) := by
     rw [he]
     nlinarith only [hA,hB,hE]
   have hD := (mul_nonneg_iff_of_pos_left hp).mp hC
   simp only [Nat.succ_eq_add_one,show k+1+1=k+2 by omega]
   rw [he2]
   nlinarith only [hD]

theorem increment_prefix_orderM9F23 (f g : ℕ → ℝ) (R : ℕ)
 (hf : ∀ k, k ≤ R → 0 < f k) (hg : ∀ k, k ≤ R → 0 < g k)
 (hfirst : (f 1-f 0)*g 0 ≤ f 0*g 1)
 (hstep : ∀ k, k+2 ≤ R →
   (f (k+2)-f (k+1))*g (k+1) ≤ (f (k+1)-f k)*g (k+2))
 (x y : ℕ) (hxy : x ≤ y) (hy : y ≤ R) :
 f y*prefixM8F7 g x ≤ f x*prefixM8F7 g y := by
 have hm : MonotoneOn (fun k => prefixM8F7 g k / f k) (Set.Iic R) := by
   apply monotoneOn_of_le_succ Set.ordConnected_Iic
   intro k _ hk hk1
   apply (div_le_div_iff₀ (hf k hk) (hf (k+1) hk1)).mpr
   simpa only [mul_comm] using increment_prefix_adjacentM9F23 f g R hg hfirst hstep k hk1
 have h := hm (by exact le_trans hxy hy) hy hxy
 have h' := (div_le_div_iff₀ (hf x (le_trans hxy hy)) (hf y hy)).mp h
 simpa only [mul_comm] using h'

end
end MathGKM.Markov
