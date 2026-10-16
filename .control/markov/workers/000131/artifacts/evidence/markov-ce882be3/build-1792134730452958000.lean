import MarkovStripSourceMCE8
import MarkovStripChooseMCE8
import MarkovStripGapMCE8
/-! Machine-authored ce882be3. Corrected raw common-binomial identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem strip_seed_scaledMCE8 (k l : ℕ) (hl : 2 ≤ l) (hN : 5 ≤ k+l) (a t : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*
 (((1+(X:ℝ[X]))^(k+l-5)*stripSeedMCE8 a (k+l+2) t).coeff (k+1))=
 ((k+l).choose k:ℝ)*l*(l-1)*stripHMCE8 a k l t := by
 have he : (1+(X:ℝ[X]))^(k+l-5)*stripSeedMCE8 a (k+l+2) t=
   C (24*t)*(1+X)^(k+l-5)+((1+X)^(k+l-5)*stripCubicMB9D a (k+l+2))*X := by
   unfold stripSeedMCE8
   ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_mul_X,Polynomial.coeff_one_add_X_pow]
 have h := strip_cubic_scaledMB9D k l hl hN a
 have hc := strip_choose_correctionMCE8 k l hN
 unfold stripHMCE8
 linear_combination ((k:ℝ)+1)*h+24*t*hc
end
end MathGKM.Markov
