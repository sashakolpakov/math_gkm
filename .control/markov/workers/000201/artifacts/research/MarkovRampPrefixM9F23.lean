import MarkovLowerDiagonalMF88
import MarkovPrefixM8F7
/-! Machine-authored 9f234835. Ramp-weight convolution and prefix identities, adapted from the inherited weight-two proof. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def weightNatM9F23 (k : ℕ) : ℝ := if k=0 then 1 else 4*k
def weightedReverseM9F23 (b r k : ℕ) : ℝ :=
 if k≤r then weightNatM9F23 k*nbNatM8F7 b (r-k) else 0

def kernelM9F23 (a b j r : ℕ) : ℝ :=
 diagSumMDB9 (nbSeqMDB9 a) (nbSeqMDB9 b) rampWeightMF88 j r

theorem kernel_convolutionM9F23 (a b j r : ℕ) :
 kernelM9F23 a b j r=convolutionM8F7 (weightedReverseM9F23 b r) (nbNatM8F7 a) j := by
 rw [kernelM9F23,diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _)
   j r (j+1) (by omega)]
 unfold convolutionM8F7
 apply sum_congr rfl
 intro k hk
 have hk' : k≤j := by simpa using hk
 by_cases hr : k≤r
 · rw [weightedReverseM9F23,if_pos hr]
   have ej : ((j-k:ℕ):ℤ)=(j:ℤ)-k := by omega
   have er : ((r-k:ℕ):ℤ)=(r:ℤ)-k := by omega
   rw [←ej,←er,nbSeq_natMDB9,nbSeq_natMDB9]
   simp [rampWeightMF88,weightNatM9F23,nbNatM8F7,mul_comm,mul_left_comm]
 · rw [weightedReverseM9F23,if_neg hr,nbSeq_zeroMDB9 b _ (by omega)]
   ring

theorem kernel_swapM9F23 (a b j r : ℕ) : kernelM9F23 a b j r=kernelM9F23 b a r j :=
 diagSum_swapMDB9 _ _ _ _ _

theorem kernel_prefixM9F23 (a b j r : ℕ) :
 (∑ k ∈ range (j+1),kernelM9F23 a b k r)=kernelM9F23 (a+1) b j r := by
 simp only [kernel_convolutionM9F23]
 change prefixM8F7 (convolutionM8F7 _ _) j=_
 rw [prefix_of_convolutionM8F7,nb_prefixM8F7]

theorem kernel_rectangleM9F23 (a b j r : ℕ) :
 (∑ k ∈ range (j+1),∑ l ∈ range (r+1),kernelM9F23 a b k l)=
 kernelM9F23 (a+1) (b+1) j r := by
 simp_rw [kernel_swapM9F23 a b,kernel_prefixM9F23,kernel_swapM9F23 (b+1) a]
 exact kernel_prefixM9F23 a (b+1) j r

theorem kernel_positiveM9F23 (a b j r : ℕ) : 0<kernelM9F23 a b j r := by
 unfold kernelM9F23 diagSumMDB9
 apply lt_of_lt_of_le (b:=rampWeightMF88 0*nbSeqMDB9 a j*nbSeqMDB9 b r)
 · simp only [rampWeightMF88,lt_self_iff_false,if_false,if_true,one_mul,nbSeq_natMDB9]
   exact mul_pos (by exact_mod_cast Nat.choose_pos (by omega : a≤j+a))
     (by exact_mod_cast Nat.choose_pos (by omega : b≤r+b))
 · simpa using (single_le_sum (f:=fun k : ℕ => rampWeightMF88 k*
       nbSeqMDB9 a ((j:ℤ)-k)*nbSeqMDB9 b ((r:ℤ)-k))
       (s:=range (min j r+1))
       (fun k hk => mul_nonneg (mul_nonneg (ramp_weight_nonnegMF88 _)
         (nbSeq_nonnegMDB9 _ _)) (nbSeq_nonnegMDB9 _ _))
       (a:=0) (by simp))

end
end MathGKM.Markov
