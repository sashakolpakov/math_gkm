import MarkovAffineKernelM13E
import MarkovRampRatiosM9F23
/-! Machine-authored ed6bdbeb. Affine-weight prefix identities and ratios.
The proof organization adapts the inherited ramp-weight argument. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

def affineReverseMED6 (e : ℝ) (b r k : ℕ) : ℝ :=
 if k≤r then (3*k+e)*nbNatM8F7 b (r-k) else 0

theorem affine_convolutionMED6 (e : ℝ) (a b j r : ℕ) :
 affineKernelM13E e a b j r=convolutionM8F7 (affineReverseMED6 e b r) (nbNatM8F7 a) j := by
 rw [affineKernelM13E,diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _)
   j r (j+1) (by omega)]
 unfold convolutionM8F7
 apply sum_congr rfl
 intro k hk
 have hk' : k≤j := by simpa using hk
 by_cases hr : k≤r
 · rw [affineReverseMED6,if_pos hr]
   have ej : ((j-k:ℕ):ℤ)=(j:ℤ)-k := by omega
   have er : ((r-k:ℕ):ℤ)=(r:ℤ)-k := by omega
   rw [←ej,←er,nbSeq_natMDB9,nbSeq_natMDB9]
   simp [affineWeightM13E,nbNatM8F7,mul_comm,mul_left_comm]
 · rw [affineReverseMED6,if_neg hr,nbSeq_zeroMDB9 b _ (by omega)]
   ring

theorem affine_prefixMED6 (e : ℝ) (a b j r : ℕ) :
 (∑ k ∈ range (j+1),affineKernelM13E e a b k r)=affineKernelM13E e (a+1) b j r := by
 simp only [affine_convolutionMED6]
 change prefixM8F7 (convolutionM8F7 _ _) j=_
 rw [prefix_of_convolutionM8F7,nb_prefixM8F7]

theorem affine_rectangleMED6 (e : ℝ) (a b j r : ℕ) :
 (∑ k ∈ range (j+1),∑ l ∈ range (r+1),affineKernelM13E e a b k l)=
 affineKernelM13E e (a+1) (b+1) j r := by
 simp_rw [affine_kernel_swapM13E e a b,affine_prefixMED6,affine_kernel_swapM13E e (b+1) a]
 exact affine_prefixMED6 e a (b+1) j r

theorem affine_reverse_positiveMED6 (e : ℝ) (he : 0<e) (b r k : ℕ) (hk : k≤r) :
 0<affineReverseMED6 e b r k := by
 rw [affineReverseMED6,if_pos hk]
 exact mul_pos (by positivity) (nb_positiveM9F23 _ _)

theorem affine_reverse_nonnegMED6 (e : ℝ) (he : 0<e) (b r k : ℕ) :
 0≤affineReverseMED6 e b r k := by
 by_cases hk : k≤r
 · exact (affine_reverse_positiveMED6 e he b r k hk).le
 · simp [affineReverseMED6,hk]

theorem affine_initial_ratioMED6 (e : ℝ) (he : 0<e) (b r : ℕ) :
 affineReverseMED6 e b r 0/affineReverseMED6 e (b+1) r 0=
 ((b:ℝ)+1)/(r+b+1) := by
 simp only [affineReverseMED6,Nat.zero_le,if_true,Nat.cast_zero,mul_zero,zero_add,Nat.sub_zero]
 rw [nb_raiseM9F23]
 have hn := (nb_positiveM9F23 b r).ne'
 have he0 := he.ne'
 field_simp

theorem affine_delta_ratioMED6 (e : ℝ) (he : 0<e) (b n k : ℕ) :
 (affineReverseMED6 e b (k+n+1) (k+1)-affineReverseMED6 e b (k+n+1) k)/
   affineReverseMED6 e (b+1) (k+n+1) (k+1)=
 ((b:ℝ)+1)*((n:ℝ)+1-b*(k+e/3))/((k+1+e/3)*(n+1)*(n+b+1)) := by
 have h1 : k+1 ≤ k+n+1 := by omega
 have h0 : k ≤ k+n+1 := by omega
 simp only [affineReverseMED6,if_pos h1,if_pos h0,
   show k+n+1-(k+1)=n by omega,show k+n+1-k=n+1 by omega]
 rw [nb_nextM9F23,nb_raiseM9F23]
 have hn := (nb_positiveM9F23 b n).ne'
 have he0 : (3*((k:ℝ)+1)+e)≠0 := by positivity
 have he1 : ((k:ℝ)+1+e/3)≠0 := by positivity
 push_cast
 field_simp
 <;> ring

theorem affine_deltaMED6 (e : ℝ) (he : 0<e) (b r k : ℕ) (hk : k+1≤r) :
 (affineReverseMED6 e b r (k+1)-affineReverseMED6 e b r k)/
   affineReverseMED6 e (b+1) r (k+1)=
 ((b:ℝ)+1)*((r:ℝ)-k-b*(k+e/3))/((k+1+e/3)*(r-k)*(r-k+b)) := by
 obtain ⟨n,hn⟩ := Nat.exists_eq_add_of_le hk
 have hr : r=k+n+1 := by omega
 rw [hr,affine_delta_ratioMED6 e he]
 push_cast
 ring

end
end MathGKM.Markov
