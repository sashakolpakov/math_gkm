import MarkovBandShiftM139
/-! Machine-authored 139fed75. Positivity for every correction parameter
reduces to the d=0 boundary. The boundary identity below remains a conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def BandBoundaryNonnegM139 : Prop :=
 ∀ (k i : ℕ) (r : Bool), 0 ≤ (bandAtM139 0 k r).coeff i

theorem band_nonneg_monoM139 (hb : BandBoundaryNonnegM139) (k : ℕ) (r : Bool) :
 (∀ d i, 0 ≤ (bandAtM139 d k r).coeff i) ∧
 (∀ d i, (bandAtM139 d k r).coeff i ≤ (bandAtM139 (d+1) k r).coeff i) := by
 induction k with
 | zero =>
   have he (d : ℕ) : bandAtM139 d 0 r=if r then 8 else 4 := by
     cases r <;> norm_num [bandAtM139,bandQM139,bandGainM139]
   constructor
   · intro d i
     rw [he]
     cases r <;> cases i <;> norm_num
   · intro d i
     rw [he,he]
 | succ k ih =>
   have hm (d i : ℕ) : (bandAtM139 d (k+1) r).coeff i ≤ (bandAtM139 (d+1) (k+1) r).coeff i := by
     have he := congrArg (fun p : Polynomial ℤ => p.coeff i) (band_differenceM139 d k r)
     simp only [coeff_sub,coeff_add] at he
     have h0 := ih.2 (d+1) i
     have hX : 0 ≤ (X*bandAtM139 (d+2) k r).coeff i := by
       cases i with
       | zero => simp
       | succ i => rw [coeff_X_mul]; exact ih.1 (d+2) i
     omega
   refine ⟨?_,hm⟩
   intro d i
   induction d with
   | zero => exact hb (k+1) i r
   | succ d hd => exact hd.trans (hm d i)

theorem band_nonnegative_iff_boundaryM139 :
 (∀ d k i r, 0 ≤ (bandAtM139 d k r).coeff i) ↔ BandBoundaryNonnegM139 := by
 constructor
 · intro h k i r; exact h 0 k i r
 · intro h d k i r; exact (band_nonneg_monoM139 h k r).1 d i

def BandBoundaryFormulaM139 : Prop := ∀ (k m : ℕ) (r : Bool), m ≤ k →
 (2*(m:ℤ)+3)*(bandAtM139 0 k r).coeff m=
   2*(if r then 3*(k:ℤ)+m+6 else 3*(k:ℤ)+3-m)*
     ((k+m+2).choose (2*m+2):ℤ)*((2*m+2).choose (m+1):ℤ)

theorem band_boundary_nonneg_of_formulaM139 (hf : BandBoundaryFormulaM139) :
 BandBoundaryNonnegM139 := by
 intro k m r
 by_cases hm : m ≤ k
 · have he := hf k m r hm
   have hp : 0 ≤ 2*(if r then 3*(k:ℤ)+m+6 else 3*(k:ℤ)+3-m)*
     ((k+m+2).choose (2*m+2):ℤ)*((2*m+2).choose (m+1):ℤ) := by
     have hmk : (m:ℤ) ≤ k := by exact_mod_cast hm
     have hc : 0 ≤ (if r then 3*(k:ℤ)+m+6 else 3*(k:ℤ)+3-m) := by
       cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> omega
     positivity
   have ha : (0:ℤ)<2*(m:ℤ)+3 := by positivity
   nlinarith
 · unfold bandAtM139
   rw [band_Q_tailM139 _ k m r (by omega)]

theorem band_nonnegative_of_formulaM139 (hf : BandBoundaryFormulaM139) :
 ∀ d k i r, 0 ≤ (bandAtM139 d k r).coeff i :=
 band_nonnegative_iff_boundaryM139.mpr (band_boundary_nonneg_of_formulaM139 hf)

end
end MathGKM.Markov
