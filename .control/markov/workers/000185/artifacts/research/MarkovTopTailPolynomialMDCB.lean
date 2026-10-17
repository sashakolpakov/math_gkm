import MarkovTopTailResidualMDCB
import MarkovPolynomialCertificateMBEC
/-! Machine-authored dcb64029. Two-variable polynomial family for the exact
tail gap. Coefficient positivity is a sufficient, explicitly open condition. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def tailNumPolyMDCB (k : ℕ) : BiPoly :=
 ∏ j ∈ range k, (U+j+1)*(V+2*U+j+9)
def tailRestPolyMDCB (r k : ℕ) : BiPoly :=
 ∏ j ∈ Ico k r, ((j:BiPoly)+1)*(V+U+j+6)
def tailTermPolyMDCB (r k : ℕ) : BiPoly := tailNumPolyMDCB k*tailRestPolyMDCB r k
def tailLinearPolyMDCB (r : ℕ) (f : ℕ → BiPoly) : BiPoly :=
 f r+4*∑ k ∈ range r, ((r:BiPoly)-k)*f k
def tailAPolyMDCB (r : ℕ) : BiPoly := tailLinearPolyMDCB r (tailTermPolyMDCB r)
def tailEPolyMDCB (r : ℕ) : BiPoly :=
 tailLinearPolyMDCB r (fun k => (k:BiPoly)*(V+2*U+k+9)*tailTermPolyMDCB r k)
def tailCPolyMDCB (r : ℕ) : BiPoly :=
 tailLinearPolyMDCB r (fun k => (k:BiPoly)*(k-1)*(V+2*U+k+9)*(V+2*U+k+10)*tailTermPolyMDCB r k)
def tailGapPolyMDCB (r : ℕ) : BiPoly :=
 (U+2)*(U+5)*tailEPolyMDCB r^2-(U+1)*(U+4)*tailAPolyMDCB r*tailCPolyMDCB r

theorem tail_num_poly_evalMDCB (i d k : ℕ) :
 certificateEvalMBEC i d (tailNumPolyMDCB k)=tailNumMDCB i d k := by
 simp [tailNumPolyMDCB,tailNumMDCB,certificate_eval_uMBEC,certificate_eval_vMBEC,map_ofNat]

theorem tail_rest_poly_evalMDCB (i d r k : ℕ) :
 certificateEvalMBEC i d (tailRestPolyMDCB r k)=tailRestMDCB i d r k := by
 simp [tailRestPolyMDCB,tailRestMDCB,certificate_eval_uMBEC,certificate_eval_vMBEC,map_ofNat]

theorem tail_term_poly_evalMDCB (i d r k : ℕ) :
 certificateEvalMBEC i d (tailTermPolyMDCB r k)=tailTermMDCB i d r k := by
 simp [tailTermPolyMDCB,tailTermMDCB,tail_num_poly_evalMDCB,tail_rest_poly_evalMDCB]

theorem tail_linear_poly_evalMDCB (i d r : ℕ) (f : ℕ → BiPoly) :
 certificateEvalMBEC i d (tailLinearPolyMDCB r f)=
 topLinearM55C r (fun k => certificateEvalMBEC i d (f k)) := by
 simp [tailLinearPolyMDCB,topLinearM55C,map_ofNat]

theorem tail_gap_poly_evalMDCB (i d r : ℕ) :
 certificateEvalMBEC i d (tailGapPolyMDCB r)=tailGapMDCB i d r := by
 simp [tailGapPolyMDCB,tailGapMDCB,tailAPolyMDCB,tailEPolyMDCB,tailCPolyMDCB,
   tailAMDCB,tailEMDCB,tailCMDCB,tail_linear_poly_evalMDCB,tail_term_poly_evalMDCB,
   certificate_eval_uMBEC,certificate_eval_vMBEC,map_ofNat]

def TailCoefficientPositiveMDCB : Prop := ∀ r : ℕ, 5 ≤ r → ∀ a b,
 0 ≤ coeff (tailGapPolyMDCB r) a b

theorem top_tail_of_coefficient_positiveMDCB (H : TailCoefficientPositiveMDCB) : TopTailResidualMDCB := by
 intro d i r hi hr hd
 rw [←tail_gap_poly_evalMDCB]
 exact certificate_eval_nonnegMBEC _ _ _ (H r hr)

theorem top_moment_of_tail_coefficient_positiveMDCB (H : TailCoefficientPositiveMDCB) : TopMomentBoundM55C :=
 top_moment_iff_tail_residualMDCB.mpr (top_tail_of_coefficient_positiveMDCB H)

theorem source_top_of_tail_coefficient_positiveMDCB (H : TailCoefficientPositiveMDCB)
 (q t i : ℕ) (r : Bool) (hq : 1 ≤ q) (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 :=
 source_top_sector_of_momentM55C (top_moment_of_tail_coefficient_positiveMDCB H) q t i r hq ht0 ht

end
end MathGKM.Markov
