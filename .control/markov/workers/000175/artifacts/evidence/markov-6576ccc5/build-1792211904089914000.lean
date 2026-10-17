import MarkovBandLiftM657
import MarkovBandEdgeM657
import MarkovBandSupportM139
/-! Machine-authored 6576ccc5. Exact positive source output and unconditional
edge/tail inequalities. The middle window is retained as an open obligation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem source_band_liftM657 (q k t : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r (t+3) (q+k+1)=
 liftOutputMAE9 (bandExponentM139 q k r) (q+k+1) t+
 correctionLiftM657 (bandExponentM139 q k r) k (t+1) r := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_band_factorM139 q k r hq hn,coeff_add]
 have he : 2*(q+k+1)+1+bandExponentM139 q k r=sourceNME9C q r := by
   unfold bandExponentM139; omega
 have hl := lower_row_liftMAE9 (bandExponentM139 q k r) (q+k+1) t
 rw [he] at hl
 rw [hl]
 congr 1
 have hq' : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 unfold bandCorrectionM139
 rw [mul_assoc,coeff_X_pow_mul',if_pos (by omega),show t+3-2=t+1 by omega]
 have h := band_smoothed_liftM657 (bandExponentM139 q k r) k (t+1) r
 simpa only [bandAtM139,hq'] using h

theorem source_band_low_zeroM657 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hi : i<2) :
 threeRawM9E2 q r i (q+k+1)=0 := by
 rw [source_band_residual_coeffM831 q k i r hq hn]
 simp [bandRowM831,coeff_X_pow_mul',show ¬2 ≤ i by omega]

theorem source_band_low_lcM657 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hi : i ≤ 2) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 := by
 by_cases he : i=2
 · subst i; exact source_band_firstM657 q k r hq hn
 · rw [source_band_low_zeroM657 q k i r hq hn (by omega),zero_mul]
   exact sq_nonneg _

theorem source_band_tail_valueM657 (q k t : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r)
 (ht : bandExponentM139 q k r+k ≤ t) :
 threeRawM9E2 q r (t+3) (q+k+1)=
 liftOutputMAE9 (bandExponentM139 q k r) (q+k+1) t := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_band_factorM139 q k r hq hn,
   coeff_add,band_correction_tailM139 q k (t+3) r (by omega),add_zero]
 have h := lower_row_liftMAE9 (bandExponentM139 q k r) (q+k+1) t
 rw [show 2*(q+k+1)+1+bandExponentM139 q k r=sourceNME9C q r by
   unfold bandExponentM139; omega] at h
 exact h

theorem source_band_tail_lcM657 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r)
 (hi : bandExponentM139 q k r+k+2 < i) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 := by
 obtain ⟨t,ht⟩ := Nat.exists_eq_add_of_le (show 3 ≤ i by omega)
 have hei : i=t+3 := by omega
 subst i
 rw [source_band_tail_valueM657 q k t r hq hn (by omega),
   show t+3+2=(t+2)+3 by omega,show t+3+1=(t+1)+3 by omega,
   source_band_tail_valueM657 q k (t+2) r hq hn (by omega),
   source_band_tail_valueM657 q k (t+1) r hq hn (by omega)]
 exact lift_output_lcM7A3 _ _ _

def BandMiddleM657 : Prop := ∀ q k : ℕ, ∀ r, 2 ≤ q →
 2*(q+k+1)+1 ≤ sourceNME9C q r → ∀ i,
 3 ≤ i → i ≤ bandExponentM139 q k r+k+2 →
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2

theorem band_all_iff_middleM657 :
 (∀ q k : ℕ, ∀ r, 2 ≤ q → 2*(q+k+1)+1 ≤ sourceNME9C q r → ∀ i,
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2) ↔ BandMiddleM657 := by
 constructor
 · intro h q k r hq hn i _ _; exact h q k r hq hn i
 · intro h q k r hq hn i
   by_cases hlo : i ≤ 2
   · exact source_band_low_lcM657 q k i r hq hn hlo
   by_cases hhi : bandExponentM139 q k r+k+2 < i
   · exact source_band_tail_lcM657 q k i r hq hn hhi
   exact h q k r hq hn i (by omega) (by omega)

end
end MathGKM.Markov
