import MarkovClearedKernelMBEC
/-! Machine-authored beca0ad5. Exact two-variable polynomial certificate family.
Its universal coefficient positivity remains an explicit unproved premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def certificateEvalMBEC (k s : ℕ) : BiPoly →+* ℤ :=
 Polynomial.eval₂RingHom (Polynomial.evalRingHom (s:ℤ)) (k:ℤ)

theorem certificate_eval_uMBEC (k s : ℕ) : certificateEvalMBEC k s U=k := by
 simp [certificateEvalMBEC,U]

theorem certificate_eval_vMBEC (k s : ℕ) : certificateEvalMBEC k s V=s := by
 simp [certificateEvalMBEC,V]

def certificateKernelMBEC (h t r : ℕ) : BiPoly :=
 (integerWeightMBEC r:BiPoly)*
   (∏ i ∈ range r, (U+((h-i:ℕ):BiPoly)))*
   (∏ i ∈ range (h-r), (U+V+((h+3+t-r-i:ℕ):BiPoly)))

def certificateConvMBEC (h t u m : ℕ) : BiPoly :=
 ∑ r ∈ range (m+1), certificateKernelMBEC h t r*certificateKernelMBEC h u (m-r)

def certificateGapMBEC (h : ℕ) : BiPoly :=
 certificateConvMBEC h 1 1 (h-1)*certificateConvMBEC h 0 2 h-
 certificateConvMBEC h 1 1 h*certificateConvMBEC h 0 2 (h-1)

theorem certificate_kernel_evalMBEC (h t r k s : ℕ) (hr : r ≤ h) :
 certificateEvalMBEC k s (certificateKernelMBEC h t r)=clearedKernelMBEC (h+k) (s+t) h r := by
 unfold certificateKernelMBEC clearedKernelMBEC
 simp only [map_mul,map_intCast,map_prod,map_add,map_natCast,certificate_eval_uMBEC,certificate_eval_vMBEC]
 rw [Nat.descFactorial_eq_prod_range,Nat.descFactorial_eq_prod_range]
 push_cast
 congr 1
 · congr 1
   apply prod_congr rfl
   intro i hi
   have hi' : i<r := mem_range.mp hi
   exact_mod_cast (show k+(h-i)=h+k-i by omega)
 · apply prod_congr rfl
   intro i hi
   have hi' : i<h-r := mem_range.mp hi
   exact_mod_cast (show k+s+(h+3+t-r-i)=s+t+(h+k)+3-r-i by omega)

theorem certificate_conv_evalMBEC (h t u m k s : ℕ) (hm : m ≤ h) :
 certificateEvalMBEC k s (certificateConvMBEC h t u m)=clearedConvMBEC (h+k) (s+t) (s+u) h m := by
 unfold certificateConvMBEC clearedConvMBEC
 simp only [map_sum,map_mul]
 apply sum_congr rfl
 intro r hr
 have hr' : r ≤ m := by simpa using hr
 rw [certificate_kernel_evalMBEC _ _ _ _ _ (by omega),certificate_kernel_evalMBEC _ _ _ _ _ (by omega)]

theorem certificate_gap_evalMBEC (h k s : ℕ) :
 certificateEvalMBEC k s (certificateGapMBEC h)=clearedGapMBEC (h+k) s h := by
 unfold certificateGapMBEC clearedGapMBEC
 simp only [map_sub,map_mul]
 rw [certificate_conv_evalMBEC _ _ _ _ _ _ (by omega),
   certificate_conv_evalMBEC _ _ _ _ _ _ (by omega),
   certificate_conv_evalMBEC _ _ _ _ _ _ (by omega),
   certificate_conv_evalMBEC _ _ _ _ _ _ (by omega)]
 simp

theorem polynomial_eval_nonnegMBEC (p : ℤ[X]) (s : ℕ) (H : ∀ i, 0 ≤ p.coeff i) :
 0 ≤ p.eval (s:ℤ) := by
 rw [Polynomial.eval_eq_sum_range]
 apply sum_nonneg
 intro i hi
 exact mul_nonneg (H i) (by positivity)

theorem certificate_eval_nonnegMBEC (P : BiPoly) (k s : ℕ)
 (H : ∀ i j, 0 ≤ coeff P i j) : 0 ≤ certificateEvalMBEC k s P := by
 change 0 ≤ P.eval₂ (Polynomial.evalRingHom (s:ℤ)) (k:ℤ)
 rw [Polynomial.eval₂_eq_sum_range]
 apply sum_nonneg
 intro i hi
 apply mul_nonneg
 · exact polynomial_eval_nonnegMBEC (P.coeff i) s (H i)
 · positivity

def CertificatePositiveMBEC : Prop := ∀ h : ℕ, 4 ≤ h → ∀ i j, 0 ≤ coeff (certificateGapMBEC h) i j

theorem cleared_of_certificateMBEC (H : CertificatePositiveMBEC) : ClearedCoreMBEC := by
 intro j s h hh hj
 obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
 rw [←certificate_gap_evalMBEC]
 exact certificate_eval_nonnegMBEC _ _ _ (H h hh)

theorem source_band_of_certificateMBEC (H : CertificatePositiveMBEC)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_clearedMBEC (cleared_of_certificateMBEC H) q k i r hq hn

end
end MathGKM.Markov
