import MarkovOffsetGlobalMAF6
import MarkovShiftedSumMAF6
import MarkovHorizontalLCB46
import MathGKM.MarkovBoundary
/-! Machine-authored af6200bf. Entire lower horizontal half of every
numerator-two source. Raw coefficients, all indices and zeros retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 1000000

theorem lower_value_lc_ge_twoMAF6 (j d i : ℕ) (hj : 2 ≤ j) :
 lowerValM58E j d i*lowerValM58E j d (i+2) ≤ lowerValM58E j d (i+1)^2 := by
 have h := shifted_sumMAF6 (lowerTermM58E j d i) (lowerTermM58E j d (i+1))
   (lowerTermM58E j d (i+2)) (2*d)
   (lower_term_nonnegM58E j d i) (lower_term_nonnegM58E j d (i+1))
   (lower_term_nonnegM58E j d (i+2))
   (lower_term_highMAF6 _ _ _ _ (by omega)) (lower_term_highMAF6 _ _ _ _ (by omega))
   (fun h k => lower_term_shiftedMAF6 j d i h k hj)
 simpa only [lower_term_sumMAF6] using h

theorem source_two_lower_lcMAF6 (path : List Bool) (j d i : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*(j+d)+1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 by_cases hj : 2 ≤ j
 · simpa only [source_two_lower_formulaM58E path j d _ ha hb] using lower_value_lc_ge_twoMAF6 j d i hj
 · have hc : j=0 ∨ j=1 := by omega
   rcases hc with rfl | rfl
   · exact boundary_raw_logConcave path i
   · exact horizontal_one_raw46 path i

theorem lower_binomial_lcMAF6 : LowerBinomialLCM58E := by
 apply lower_source_iffM58E.mp
 intro path j d i ha hb _ _ _
 exact source_two_lower_lcMAF6 path j d i ha hb

theorem source_two_lower_halfMAF6 (path : List Bool) (j i : ℕ)
 (ha : (frame path).mid.a=2) (hb : 2*j+1 ≤ (frame path).mid.b) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,hq,hb',_⟩ := source_two_squares3556 path ha
 exact source_two_lower_lcMAF6 path j (q-j) i ha (by omega)

end
end MathGKM.Markov
