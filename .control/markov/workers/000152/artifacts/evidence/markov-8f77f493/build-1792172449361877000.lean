import MarkovDiagonalShapeMDB9
/-! Machine-authored 8f77f493. Finite convolution and prefix identities. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def convolutionM8F7 (f g : ℕ → ℝ) (j : ℕ) : ℝ :=
 ∑ k ∈ range (j+1), f k*g (j-k)

def prefixM8F7 (f : ℕ → ℝ) (j : ℕ) : ℝ := ∑ k ∈ range (j+1), f k

theorem convolution_seriesM8F7 (f g : ℕ → ℝ) (j : ℕ) :
 convolutionM8F7 f g j=PowerSeries.coeff j (PowerSeries.mk f*PowerSeries.mk g) := by
 simp [convolutionM8F7,PowerSeries.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]

theorem convolution_commM8F7 (f g : ℕ → ℝ) : convolutionM8F7 f g=convolutionM8F7 g f := by
 funext j
 rw [convolution_seriesM8F7,convolution_seriesM8F7,mul_comm]

theorem convolution_assocM8F7 (f g h : ℕ → ℝ) :
 convolutionM8F7 (convolutionM8F7 f g) h=convolutionM8F7 f (convolutionM8F7 g h) := by
 have hm (u v : ℕ → ℝ) : PowerSeries.mk (convolutionM8F7 u v)=PowerSeries.mk u*PowerSeries.mk v := by
   ext j
   simp only [PowerSeries.coeff_mk,←convolution_seriesM8F7]
 funext j
 rw [convolution_seriesM8F7,convolution_seriesM8F7,hm,hm,mul_assoc]

theorem prefix_convolutionM8F7 (f : ℕ → ℝ) : prefixM8F7 f=convolutionM8F7 f (fun _ => 1) := by
 funext j; simp [prefixM8F7,convolutionM8F7]

theorem convolution_prefixM8F7 (f g : ℕ → ℝ) :
 convolutionM8F7 (prefixM8F7 f) g=convolutionM8F7 f (prefixM8F7 g) := by
 rw [prefix_convolutionM8F7,prefix_convolutionM8F7,convolution_assocM8F7,
   convolution_commM8F7 (fun _ => 1) g]

theorem prefix_of_convolutionM8F7 (f g : ℕ → ℝ) :
 prefixM8F7 (convolutionM8F7 f g)=convolutionM8F7 f (prefixM8F7 g) := by
 rw [prefix_convolutionM8F7,convolution_assocM8F7,←prefix_convolutionM8F7]

def nbNatM8F7 (s k : ℕ) : ℝ := ((k+s).choose s:ℝ)

theorem nb_prefixM8F7 (s : ℕ) : prefixM8F7 (nbNatM8F7 s)=nbNatM8F7 (s+1) := by
 funext j
 unfold prefixM8F7 nbNatM8F7
 norm_cast
 simpa [Nat.add_assoc] using Nat.sum_range_add_choose j s

def weightNatM8F7 (k : ℕ) : ℝ := if k=0 then 1 else 2
def weightedReverseM8F7 (b r k : ℕ) : ℝ :=
 if k≤r then weightNatM8F7 k*nbNatM8F7 b (r-k) else 0

def kernelM8F7 (a b j r : ℕ) : ℝ :=
 diagSumMDB9 (nbSeqMDB9 a) (nbSeqMDB9 b) weightSeqMDB9 j r

theorem kernel_convolutionM8F7 (a b j r : ℕ) :
 kernelM8F7 a b j r=convolutionM8F7 (weightedReverseM8F7 b r) (nbNatM8F7 a) j := by
 rw [kernelM8F7,diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _)
   j r (j+1) (by omega)]
 unfold convolutionM8F7
 apply sum_congr rfl
 intro k hk
 have hk' : k≤j := by simpa using hk
 by_cases hr : k≤r
 · rw [weightedReverseM8F7,if_pos hr]
   have ej : ((j-k:ℕ):ℤ)=(j:ℤ)-k := by omega
   have er : ((r-k:ℕ):ℤ)=(r:ℤ)-k := by omega
   rw [←ej,←er,nbSeq_natMDB9,nbSeq_natMDB9]
   simp [weightSeqMDB9,weightNatM8F7,nbNatM8F7,mul_comm,mul_left_comm]
 · rw [weightedReverseM8F7,if_neg hr,nbSeq_zeroMDB9 b _ (by omega)]
   ring

theorem kernel_swapM8F7 (a b j r : ℕ) : kernelM8F7 a b j r=kernelM8F7 b a r j :=
 diagSum_swapMDB9 _ _ _ _ _

theorem kernel_prefixM8F7 (a b j r : ℕ) :
 (∑ k ∈ range (j+1),kernelM8F7 a b k r)=kernelM8F7 (a+1) b j r := by
 simp only [kernel_convolutionM8F7]
 change prefixM8F7 (convolutionM8F7 _ _) j=_
 rw [prefix_of_convolutionM8F7,nb_prefixM8F7]

theorem kernel_rectangleM8F7 (a b j r : ℕ) :
 (∑ k ∈ range (j+1),∑ l ∈ range (r+1),kernelM8F7 a b k l)=
 kernelM8F7 (a+1) (b+1) j r := by
 simp_rw [kernel_swapM8F7 a b,kernel_prefixM8F7,kernel_swapM8F7 (b+1) a]
 exact kernel_prefixM8F7 a (b+1) j r

theorem kernel_positiveM8F7 (a b j r : ℕ) : 0<kernelM8F7 a b j r := by
 unfold kernelM8F7 diagSumMDB9
 apply lt_of_lt_of_le (b:=weightSeqMDB9 0*nbSeqMDB9 a j*nbSeqMDB9 b r)
 · simp only [weightSeqMDB9,lt_self_iff_false,if_false,if_true,one_mul,nbSeq_natMDB9]
   exact mul_pos (by exact_mod_cast Nat.choose_pos (by omega : a≤j+a))
     (by exact_mod_cast Nat.choose_pos (by omega : b≤r+b))
 · apply single_le_sum
   · intro k hk; exact mul_nonneg (mul_nonneg (weight_nonnegMDB9 _) (nbSeq_nonnegMDB9 _ _)) (nbSeq_nonnegMDB9 _ _)
   · simp

end
end MathGKM.Markov
