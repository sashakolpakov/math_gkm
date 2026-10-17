import MarkovSecondOutputMC3E
import MarkovCorrectionColumnsM418
/-! Machine-authored c3e5369f. Exact small-column bridge; no finite q bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem source_second_polynomialMC3E (d t : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r (t+3) (secondJMC3E d r):ℚ)=
 lowColumnMAE9 (sourceNME9C (secondQMC3E d r) r) (secondJMC3E d r) t+
 (if r then 36 else 24)*choosePolyM0D3 d (t+1)+
 (if r then 8*(d:ℚ)+24 else 4*(d:ℚ)+12)*choosePolyM0D3 d t := by
 have hq : (if r then 4 else 3) ≤ secondQMC3E d r := by unfold secondQMC3E; omega
 have hj : secondJMC3E d r=secondQMC3E d r+2 := by cases r <;> simp [secondJMC3E,secondQMC3E] <;> omega
 have he : secondExponentMC3E (secondQMC3E d r) r=d := by cases r <;> simp [secondExponentMC3E,secondQMC3E]
 have hn : 2*(secondJMC3E d r)+1 ≤ sourceNME9C (secondQMC3E d r) r := by
   cases r <;> simp [sourceNME9C,secondQMC3E,secondJMC3E] <;> omega
 rw [hj,second_row_sourceMC3E _ _ r hq,←hj,Int.cast_add,lower_column_polynomialMAE9 _ _ _ hn,
   second_correction_coeffMC3E,he]
 simp only [show 2 ≤ t+3 by omega,show 3 ≤ t+3 by omega,if_true,
   show t+3-2=t+1 by omega,show t+3-3=t by omega]
 cases r <;> simp [secondConstantMC3E,secondSlopeMC3E,secondQMC3E,choose_poly_natM0D3]
   <;> ring

theorem source_second_lowMC3E (d i : ℕ) (r : Bool) (hi : i ≤ 2) :
 threeRawM9E2 (secondQMC3E d r) r i (secondJMC3E d r)=
 if i=2 then secondConstantMC3E r else 0 := by
 have hq : (if r then 4 else 3) ≤ secondQMC3E d r := by unfold secondQMC3E; omega
 have hj : secondJMC3E d r=secondQMC3E d r+2 := by cases r <;> simp [secondJMC3E,secondQMC3E] <;> omega
 have hn : 2*(secondJMC3E d r)+1 ≤ sourceNME9C (secondQMC3E d r) r := by
   cases r <;> simp [sourceNME9C,secondQMC3E,secondJMC3E] <;> omega
 rw [hj,second_row_sourceMC3E _ _ r hq,←hj,
   ←lower_row_formulaMFFD _ (secondJMC3E d r) hn i (secondJMC3E d r) le_rfl,
   lowerRowMFFD,coeff_X_pow_mul',if_neg (by omega),zero_add,second_correction_coeffMC3E]
 interval_cases i <;> simp

end
end MathGKM.Markov
