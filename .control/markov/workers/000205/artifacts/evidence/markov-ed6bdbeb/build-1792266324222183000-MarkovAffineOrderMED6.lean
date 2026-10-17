import MarkovAffinePrefixMED6
import MarkovAffineScalarMED6
/-! Machine-authored ed6bdbeb. Affine prefix comparison for e>=1 and b>=1. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

theorem affine_first_orderMED6 (e : ℝ) (he : 1≤e) (b r : ℕ) (hb : 1≤b) :
 (affineReverseMED6 e b r 1-affineReverseMED6 e b r 0)*affineReverseMED6 e (b+1) r 0 ≤
 affineReverseMED6 e b r 0*affineReverseMED6 e (b+1) r 1 := by
 have he0 : 0<e := by linarith
 by_cases hr : r=0
 · subst r
   simp [affineReverseMED6,nbNatM8F7]
   positivity
 have hr' : 1≤r := by omega
 have h := mul_le_mul_of_nonneg_left
   (affine_scalar_firstMED6 b r (e/3) (by exact_mod_cast hb) (by exact_mod_cast hr') (by linarith))
   (by positivity : 0≤(b:ℝ)+1)
 have h' : (affineReverseMED6 e b r 1-affineReverseMED6 e b r 0)/affineReverseMED6 e (b+1) r 1 ≤
   affineReverseMED6 e b r 0/affineReverseMED6 e (b+1) r 0 := by
   rw [show (1:ℕ)=0+1 by omega,affine_deltaMED6 e he0 b r 0 (by omega),affine_initial_ratioMED6 e he0]
   simpa only [Nat.cast_zero,sub_zero,zero_add,add_comm (e/3) 1,←mul_div_assoc,mul_one] using h
 exact (div_le_div_iff₀ (affine_reverse_positiveMED6 e he0 _ _ _ hr')
   (affine_reverse_positiveMED6 e he0 _ _ _ (by omega))).mp h'

theorem affine_increment_orderMED6 (e : ℝ) (he : 1≤e) (b r k : ℕ) (hb : 1≤b) (hk : k+2≤r) :
 (affineReverseMED6 e b r (k+2)-affineReverseMED6 e b r (k+1))*affineReverseMED6 e (b+1) r (k+1) ≤
 (affineReverseMED6 e b r (k+1)-affineReverseMED6 e b r k)*affineReverseMED6 e (b+1) r (k+2) := by
 have he0 : 0<e := by linarith
 apply (div_le_div_iff₀ (affine_reverse_positiveMED6 e he0 _ _ _ hk)
   (affine_reverse_positiveMED6 e he0 _ _ _ (by omega))).mp
 rw [show k+2=(k+1)+1 by omega,affine_deltaMED6 e he0 b r (k+1) (by omega),
   affine_deltaMED6 e he0 b r k (by omega)]
 have hn : (2:ℝ)≤(r:ℝ)-k := by exact_mod_cast (show (2:ℤ)≤(r:ℤ)-k by omega)
 have h := mul_le_mul_of_nonneg_left
   (affine_scalar_tailMED6 b ((r:ℝ)-k) (k+e/3) (by exact_mod_cast hb) hn
     (by have hkn : 0≤(k:ℝ) := Nat.cast_nonneg k; linarith))
   (by positivity : 0≤(b:ℝ)+1)
 convert h using 1 <;> push_cast <;> ring

theorem affine_prefix_orderMED6 (e : ℝ) (he : 1≤e) (b r x y : ℕ) (hb : 1≤b) (hxy : x<y) :
 0≤affineReverseMED6 e b r x*prefixM8F7 (affineReverseMED6 e (b+1) r) y-
   affineReverseMED6 e b r y*prefixM8F7 (affineReverseMED6 e (b+1) r) x := by
 have he0 : 0<e := by linarith
 by_cases hy : y≤r
 · have h := increment_prefix_orderM9F23 (affineReverseMED6 e b r)
     (affineReverseMED6 e (b+1) r) r
     (affine_reverse_positiveMED6 e he0 b r) (affine_reverse_positiveMED6 e he0 (b+1) r)
     (affine_first_orderMED6 e he b r hb) (fun k hk => affine_increment_orderMED6 e he b r k hb hk)
     x y (by omega) hy
   linarith
 · have hz : affineReverseMED6 e b r y=0 := by simp [affineReverseMED6,hy]
   rw [hz,zero_mul,sub_zero]
   apply mul_nonneg (affine_reverse_nonnegMED6 e he0 b r x)
   exact sum_nonneg (fun k _ => affine_reverse_nonnegMED6 e he0 _ _ _)

end
end MathGKM.Markov
