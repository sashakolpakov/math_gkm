import MarkovBandGainM139
/-! Machine-authored 139fed75. An explicit correction polynomial for every
band row. The recurrence is signed; no coefficient shape is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def bandQM139 (q : ℕ) (r : Bool) : ℕ → Polynomial ℤ
 | 0 => 4*bandGainM139 q r 0
 | 1 => 4*bandGainM139 q r 1+2*(1-X)*bandQM139 q r 0
 | k+2 => 4*bandGainM139 q r (k+2)+2*(1-X)*bandQM139 q r (k+1)-
   (X+1)^2*bandQM139 q r k

def bandCorrectionM139 (q k : ℕ) (r : Bool) : Polynomial ℤ :=
 X^2*(X+1)^bandExponentM139 q k r*bandQM139 q r k

theorem band_correction_zeroM139 (q : ℕ) (r : Bool) (hq : 2 ≤ q) :
 bandCorrectionM139 q 0 r=
 C (correctionConstantMDB2 r)*(X^2*(X+1)^correctionExponentMDB2 q r) := by
 cases r <;> simp only [bandCorrectionM139,bandQM139,bandGainM139,
   band_exponent_falseM139,band_exponent_trueM139,
   correctionConstantMDB2,correctionExponentMDB2,Bool.false_eq_true,if_false,if_true]
   <;> norm_num <;> ring

theorem band_forcing_oneM139 (q : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+1+1)+1 ≤ sourceNME9C q r) :
 (X+1)^2*bandCorrectionM139 q 1 r+2*(X-1)*bandCorrectionM139 q 0 r=
 4*X*gainRowsMC3E q r 1 := by
 rw [band_gain_factorM139 q 1 r hq hn]
 have he : bandExponentM139 q 0 r=bandExponentM139 q 1 r+2 := by
   unfold bandExponentM139; omega
 simp only [bandCorrectionM139,he,bandQM139,pow_add]
 ring

theorem band_forcing_stepM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+(k+2)+1)+1 ≤ sourceNME9C q r) :
 (X+1)^2*bandCorrectionM139 q (k+2) r+
 2*(X-1)*bandCorrectionM139 q (k+1) r+bandCorrectionM139 q k r=
 4*X*gainRowsMC3E q r (k+2) := by
 rw [band_gain_factorM139 q (k+2) r hq hn]
 have he : bandExponentM139 q (k+1) r=bandExponentM139 q (k+2) r+2 := by
   unfold bandExponentM139; omega
 have hf : bandExponentM139 q k r=bandExponentM139 q (k+2) r+4 := by
   unfold bandExponentM139; omega
 simp only [bandCorrectionM139,he,hf,bandQM139,pow_add]
 ring

theorem source_band_factorM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 rawRowMC3E (threePolyM9E2 q r) (q+k+1)=
 lowerRowMFFD (sourceNME9C q r) (q+k+1)+bandCorrectionM139 q k r := by
 have hz : (X+1:Polynomial ℤ)^2≠0 := by
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
   norm_num at hh
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · rw [band_correction_zeroM139 q r hq]
     have h := source_row_firstMC3E q r hq
     simpa only [Nat.add_zero] using (sub_eq_iff_eq_add.mp h)
   · have he := second_row_equationMC3E q r hq (by omega)
     rw [←band_correction_zeroM139 q r hq] at he
     have hf := band_forcing_oneM139 q r hq hn
     apply mul_left_cancel₀ hz
     convert (show (X+1)^2*rawRowMC3E (threePolyM9E2 q r) (q+2)=
       (X+1)^2*(lowerRowMFFD (sourceNME9C q r) (q+2)+bandCorrectionM139 q 1 r) by
       linear_combination he-hf) using 1 <;> congr 2 <;> omega
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     have he := source_row_equationMC3E q (q+(k+2)+1) r hn
     have hf := band_forcing_stepM139 q k r hq hn
     rw [show q+(k+2)+1=(q+k+1)+2 by omega,
       row_disc_succMFFD,row_disc_succMFFD] at he
     simp only [rowShiftMFFD,show q+1 ≤ q+k+1+2 by omega,if_true,
       show q+k+1+2-(q+1)=k+2 by omega,pow_one] at he
     rw [show q+k+1+1=q+(k+1)+1 by omega,h1,h0] at he
     apply mul_left_cancel₀ hz
     rw [show q+(k+2)+1=q+k+1+2 by omega]
     linear_combination he-hf

theorem source_band_coeffM139 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)=lowerRawME9C (sourceNME9C q r) i (q+k+1)+
 (bandCorrectionM139 q k r).coeff i := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_band_factorM139 q k r hq hn,
   coeff_add,lower_row_formulaMFFD _ (q+k+1) hn i (q+k+1) le_rfl]

end
end MathGKM.Markov
