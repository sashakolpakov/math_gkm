import MarkovGFSectionM13E
import MarkovCorrectionModelM13E
/-! Machine-authored 13e37040. Exact source residual in the new rational
representation. The coefficient extraction propositions are explicit open goals. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries

def gfRawM13E (q : ℕ) (r : Bool) (i j : ℕ) : ℤ :=
 coeff (PowerSeries.coeff (3*q+(if r then 1 else 2)) gfMasterSeriesM13E) i j+
 coeff (PowerSeries.coeff q (gfESeriesM13E r)) i j+
 coeff (PowerSeries.coeff q (gfLSeriesM13E r)) i j

theorem gf_raw_eqM13E (q : ℕ) (r : Bool) (i j : ℕ) :
 gfRawM13E q r i j=threeRawM9E2 q r i j := by
 rw [←three_raw_formulaM9E2,gf_source_coeff_splitM13E]
 simp only [coeff_add0618,gfRawM13E,gf_d_section_coeffM13E]

def ThreeRationalTriangleM13E : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   ¬(sourceNME9C q r < i+j+q ∧ sourceNME9C q r+2 ≤ i+2*j) →
   gfRawM13E q r i j*gfRawM13E q r i (j+2) ≤ gfRawM13E q r i (j+1)^2) ∧
 (∀ i j, 1 ≤ i → q < j+2 → j+q < sourceNME9C q r →
   ¬(4 ≤ i ∧ sourceNME9C q r < i+j+q+2 ∧ sourceNME9C q r ≤ i+2*j) →
   ¬(i=3 ∧ sourceNME9C q r ≤ 2*j ∧ sourceNME9C q r < i+j+q+2) →
   gfRawM13E q r i (j+2)*gfRawM13E q r (i+2) j ≤
     gfRawM13E q r (i+1) (j+1)^2)


theorem rational_triangle_iffM13E : ThreeRationalTriangleM13E ↔ ThreeTriangleResidualM50C := by
 simp only [ThreeRationalTriangleM13E,ThreeTriangleResidualM50C,gf_raw_eqM13E]

theorem root_iff_rational_triangleM13E :
 Conjecture63 ↔ ThreeRationalTriangleM13E ∧ OtherFourM9E2 := by
 rw [rational_triangle_iffM13E,root_iff_triangleM50C]

def MasterKernelExtractionM13E : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r i j, 3 ≤ i →
 (coeff (PowerSeries.coeff (3*q+(if r then 1 else 2)) gfMasterSeriesM13E) i j:ℝ)=baseValueM13E q r i j
def CorrectionKernelExtractionM13E : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r i j, 3 ≤ i →
 (coeff (PowerSeries.coeff q (gfESeriesM13E r)) i j:ℝ)=correctionValueM13E q r i j

theorem source_two_kernel_of_extractionsM13E
 (hD : MasterKernelExtractionM13E) (hE : CorrectionKernelExtractionM13E)
 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 (threeRawM9E2 q r i j:ℝ)=baseValueM13E q r i j+correctionValueM13E q r i j := by
 rw [gf_source_masterM13E q i j r hi,Int.cast_add,hD q hq r i j hi,hE q hq r i j hi]

end
end MathGKM.Markov
