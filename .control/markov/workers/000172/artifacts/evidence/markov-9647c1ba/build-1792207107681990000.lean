import MarkovThirdOutputM964
import MarkovCorrectionColumnsM418
/-! Machine-authored 9647c1ba. Ordinary rational column formulas; no
normalization of final source coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem source_third_polynomialM964 (d t : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r (t+3) (thirdJM964 d r):ℚ)=
 lowColumnMAE9 (sourceNME9C (thirdQM964 d r) r) (thirdJM964 d r) t+
 thirdCM964 r*choosePolyM0D3 d (t+1)+thirdLM964 d r*choosePolyM0D3 d t+
 (if 1 ≤ t then thirdVM964 d r*choosePolyM0D3 d (t-1) else 0) := by
 obtain ⟨he,hj,hn,hc,hl,hv⟩ := third_parametersM964 d r
 have hq : (if r then 6 else 5) ≤ thirdQM964 d r := by unfold thirdQM964; omega
 have hn' : 2*thirdJM964 d r+1 ≤ sourceNME9C (thirdQM964 d r) r := by omega
 rw [hj,third_row_sourceMC3E _ _ r hq,←hj,Int.cast_add,
   lower_column_polynomialMAE9 _ _ _ hn',third_correction_coeffM964,he,hc,hl,hv]
 simp only [show 2 ≤ t+3 by omega,show 3 ≤ t+3 by omega,if_true,
   show t+3-2=t+1 by omega,show t+3-3=t by omega,show t+3-4=t-1 by omega,
   show (4 ≤ t+3) ↔ (1 ≤ t) by omega,choose_poly_natM0D3]
 split_ifs <;> push_cast <;> simp only [choose_poly_natM0D3] <;> ring

theorem source_third_lowM964 (d i : ℕ) (r : Bool) (hi : i ≤ 2) :
 threeRawM9E2 (thirdQM964 d r) r i (thirdJM964 d r)=if i=2 then (thirdCM964 r:ℤ) else 0 := by
 obtain ⟨he,hj,hn,hc,hl,hv⟩ := third_parametersM964 d r
 have hq : (if r then 6 else 5) ≤ thirdQM964 d r := by unfold thirdQM964; omega
 have hn' : 2*thirdJM964 d r+1 ≤ sourceNME9C (thirdQM964 d r) r := by omega
 rw [hj,third_row_sourceMC3E _ _ r hq,←hj,
   ←lower_row_formulaMFFD _ (thirdJM964 d r) hn' i (thirdJM964 d r) le_rfl,
   lowerRowMFFD,coeff_X_pow_mul',if_neg (by omega),zero_add,third_correction_coeffM964,he,hc]
 interval_cases i <;> simp

end
end MathGKM.Markov
