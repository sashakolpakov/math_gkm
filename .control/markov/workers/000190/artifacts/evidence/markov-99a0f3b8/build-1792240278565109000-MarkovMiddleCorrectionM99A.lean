import MarkovTopSectorResidualM97B
/-! Machine-authored 99a0f3b8. Exact correction beyond the upper sector.
No sign or log-concavity is inferred from the signed recurrence. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

def middleGainM99A (q k : ℕ) (r : Bool) : Polynomial ℤ :=
 gainRowsMC3E q r (q+(if r then 1 else 2)-k)

def middleCorrectionM99A (q : ℕ) (r : Bool) : ℕ → Polynomial ℤ
 | 0 => 4*X*middleGainM99A q 0 r
 | 1 => 4*X*middleGainM99A q 1 r+2*(1-X)*middleCorrectionM99A q r 0
 | k+2 => 4*X*middleGainM99A q (k+2) r+
     2*(1-X)*middleCorrectionM99A q r (k+1)-(X+1)^2*middleCorrectionM99A q r k

theorem source_middle_equationM99A (q j : ℕ) (r : Bool) (hj : q ≤ j+1) :
 rawRowMC3E (threePolyM9E2 q r) j+
 2*(X-1)*rawRowMC3E (threePolyM9E2 q r) (j+1)+
 (X+1)^2*rawRowMC3E (threePolyM9E2 q r) (j+2)=
 topDeltaMB3E (sourceNME9C q r) j+
 2*(X+1)*topDeltaMB3E (sourceNME9C q r) (j+1)+
 (X+1)^2*topDeltaMB3E (sourceNME9C q r) (j+2)+
 4*X*gainRowsMC3E q r (j+1-q) := by
 have h := source_rows_equationMB3E q (j+2) r
 rw [row_disc_succMFFD,row_S_twice_succMFFD] at h
 simp only [rowShiftMFFD,show q+1 ≤ j+2 by omega,if_true,pow_one,
   show j+2-(q+1)=j+1-q by omega] at h
 linear_combination h

theorem source_middle_formulaM99A (q k : ℕ) (r : Bool) (hq : 1 ≤ q) (hk : k ≤ q) :
 rawRowMC3E (threePolyM9E2 q r) (sourceNME9C q r+2-(q+3+k))=
 topTemplateMB3E (sourceNME9C q r) (q+3+k)+middleCorrectionM99A q r k := by
 have hn : 3*q+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
 have hindex (l : ℕ) (hl : l ≤ q) :
   sourceNME9C q r+2-(q+3+l)+1-q=q+(if r then 1 else 2)-l := by
   cases r <;> simp [sourceNME9C] <;> omega
 induction k using Nat.strong_induction_on with
 | h k ih =>
   have he := source_middle_equationM99A q (sourceNME9C q r+2-(q+3+k)) r (by omega)
   rw [hindex k hk] at he
   change _ = _+4*X*middleGainM99A q k r at he
   rcases k with _|_|k
   · rw [show sourceNME9C q r+2-(q+3+0)+1=sourceNME9C q r+2-(q+2) by omega,
       show sourceNME9C q r+2-(q+3+0)+2=sourceNME9C q r+2-(q+1) by omega,
       source_top_templateMB3E q (q+2) r hq le_rfl,
       source_top_templateMB3E q (q+1) r hq (by omega)] at he
     rw [show q+3+0=(q+1)+2 by omega,topTemplateMB3E,middleCorrectionM99A]
     simp only [topDiagonalDeltaMB3E]
     convert (show rawRowMC3E (threePolyM9E2 q r) (sourceNME9C q r+2-(q+3))=_ by
       linear_combination he) using 1 <;> congr 2 <;> omega
   · have h0 := ih 0 (by omega) (by omega)
     rw [show sourceNME9C q r+2-(q+3+1)+1=sourceNME9C q r+2-(q+3+0) by omega,
       show sourceNME9C q r+2-(q+3+1)+2=sourceNME9C q r+2-(q+2) by omega,
       h0,source_top_templateMB3E q (q+2) r hq le_rfl] at he
     rw [show q+3+1=(q+2)+2 by omega,topTemplateMB3E,middleCorrectionM99A]
     simp only [topDiagonalDeltaMB3E]
     linear_combination he
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     rw [show sourceNME9C q r+2-(q+3+(k+2))+1=sourceNME9C q r+2-(q+3+(k+1)) by omega,
       show sourceNME9C q r+2-(q+3+(k+2))+2=sourceNME9C q r+2-(q+3+k) by omega,
       h1,h0] at he
     rw [show q+3+(k+2)=(q+3+k)+2 by omega,topTemplateMB3E,middleCorrectionM99A]
     simp only [topDiagonalDeltaMB3E]
     have he1 : q+3+k+1=q+3+(k+1) := by omega
     rw [he1]
     linear_combination he

end
end MathGKM.Markov
