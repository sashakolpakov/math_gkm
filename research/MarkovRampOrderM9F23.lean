import MarkovRampRatiosM9F23
import MarkovRampScalarM9F23
import MarkovIncrementPrefixM9F23
/-! Machine-authored 9f234835. The ramp prefix comparison for b >= 1.
The exceptional b=0 minor remains false, as recorded in the inherited diagnostic. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem ramp_delta_tailM9F23 (b r k : ℕ) (hk : 1 ≤ k) (hkr : k+1 ≤ r) :
 (weightedReverseM9F23 b r (k+1)-weightedReverseM9F23 b r k)/
 weightedReverseM9F23 (b+1) r (k+1)=
 ((b:ℝ)+1)*((r:ℝ)-k-b*k)/((k+1)*((r:ℝ)-k)*((r:ℝ)-k+b)) := by
 obtain ⟨n,hn⟩ := Nat.exists_eq_add_of_le hkr
 have hr : r=k+n+1 := by omega
 rw [hr]
 rw [weighted_tail_ratioM9F23 b n k hk]
 push_cast
 ring

theorem ramp_delta_firstM9F23 (b r : ℕ) (hr : 1 ≤ r) :
 (weightedReverseM9F23 b r 1-weightedReverseM9F23 b r 0)/
 weightedReverseM9F23 (b+1) r 1=
 ((b:ℝ)+1)*(3*r-b)/(4*r*(r+b)) := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : r≠0)
 rw [show n.succ=n+1 by omega,weighted_first_ratioM9F23]
 push_cast
 ring

theorem ramp_first_orderM9F23 (b r : ℕ) (hb : 1 ≤ b) :
 (weightedReverseM9F23 b r 1-weightedReverseM9F23 b r 0)*
   weightedReverseM9F23 (b+1) r 0 ≤
 weightedReverseM9F23 b r 0*weightedReverseM9F23 (b+1) r 1 := by
 by_cases hr : r=0
 · subst r
   simp [weightedReverseM9F23,weightNatM9F23,nbNatM8F7]
 have hr' : 1 ≤ r := by omega
 have h := mul_le_mul_of_nonneg_left
   (ramp_scalar_initialM9F23 b r (by exact_mod_cast hb) (by exact_mod_cast hr'))
   (by positivity : 0 ≤ (b:ℝ)+1)
 have h' : (weightedReverseM9F23 b r 1-weightedReverseM9F23 b r 0)/
     weightedReverseM9F23 (b+1) r 1 ≤
   weightedReverseM9F23 b r 0/weightedReverseM9F23 (b+1) r 0 := by
   rw [ramp_delta_firstM9F23 b r hr',weighted_initial_ratioM9F23]
   simpa only [←mul_div_assoc,mul_one] using h
 exact (div_le_div_iff₀ (weighted_positiveM9F23 _ _ _ hr')
   (weighted_positiveM9F23 _ _ _ (by omega))).mp h'

theorem ramp_increment_orderM9F23 (b r k : ℕ) (hb : 1 ≤ b) (hk : k+2 ≤ r) :
 (weightedReverseM9F23 b r (k+2)-weightedReverseM9F23 b r (k+1))*
    weightedReverseM9F23 (b+1) r (k+1) ≤
 (weightedReverseM9F23 b r (k+1)-weightedReverseM9F23 b r k)*
    weightedReverseM9F23 (b+1) r (k+2) := by
 apply (div_le_div_iff₀ (weighted_positiveM9F23 _ _ _ hk)
   (weighted_positiveM9F23 _ _ _ (by omega))).mp
 by_cases hk0 : k=0
 · subst k
   simp only [Nat.zero_add]
   rw [show (2:ℕ)=1+1 by omega,ramp_delta_tailM9F23 b r 1 (by omega) (by omega),
     ramp_delta_firstM9F23 b r (by omega)]
   have h := mul_le_mul_of_nonneg_left
     (ramp_scalar_firstM9F23 b r (by exact_mod_cast hb) (by exact_mod_cast hk))
     (by positivity : 0 ≤ (b:ℝ)+1)
   simpa only [Nat.cast_one,one_add_one_eq_two,mul_one,←mul_div_assoc] using h
 · have hk1 : 1 ≤ k := by omega
   rw [show k+2=(k+1)+1 by omega,ramp_delta_tailM9F23 b r (k+1) (by omega) (by omega),
     ramp_delta_tailM9F23 b r k hk1 (by omega)]
   have hn : (2:ℝ) ≤ (r:ℝ)-k := by exact_mod_cast (show (2:ℤ) ≤ (r:ℤ)-k by omega)
   have h := mul_le_mul_of_nonneg_left
     (ramp_scalar_tailM9F23 b ((r:ℝ)-k) k (by exact_mod_cast hb) hn (by exact_mod_cast hk1))
     (by positivity : 0 ≤ (b:ℝ)+1)
   convert h using 1 <;> push_cast <;> ring

theorem weighted_prefix_orderM9F23 (b r x y : ℕ) (hb : 1 ≤ b) (hxy : x<y) :
 0 ≤ weightedReverseM9F23 b r x*prefixM8F7 (weightedReverseM9F23 (b+1) r) y-
   weightedReverseM9F23 b r y*prefixM8F7 (weightedReverseM9F23 (b+1) r) x := by
 by_cases hy : y ≤ r
 · have h := increment_prefix_orderM9F23 (weightedReverseM9F23 b r)
     (weightedReverseM9F23 (b+1) r) r
     (weighted_positiveM9F23 b r) (weighted_positiveM9F23 (b+1) r)
     (ramp_first_orderM9F23 b r hb) (fun k hk => ramp_increment_orderM9F23 b r k hb hk)
     x y (by omega) hy
   linarith
 · have hz : weightedReverseM9F23 b r y=0 := by simp [weightedReverseM9F23,hy]
   rw [hz,zero_mul,sub_zero]
   apply mul_nonneg (weighted_nonnegM9F23 b r x)
   exact sum_nonneg (fun k _ => weighted_nonnegM9F23 _ _ _)

end
end MathGKM.Markov
