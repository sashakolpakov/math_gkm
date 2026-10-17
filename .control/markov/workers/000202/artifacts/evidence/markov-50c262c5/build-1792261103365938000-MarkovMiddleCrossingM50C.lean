import MarkovMiddleLocalityM99A
/-! Machine-authored 50c262c5. Exact extension through j=q-1, retaining
the full signed middle correction and both residue classes. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem source_middle_crossing_formulaM50C (q k : ℕ) (r : Bool) (hq : 1 ≤ q) (hk : k ≤ q+(if r then 1 else 2)) :
 rawRowMC3E (threePolyM9E2 q r) (sourceNME9C q r+2-(q+3+k))=
 topTemplateMB3E (sourceNME9C q r) (q+3+k)+middleCorrectionM99A q r k := by
 have hn : 3*q+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
 have hindex (l : ℕ) (hl : l ≤ q+(if r then 1 else 2)) :
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
     simp only [Nat.add_assoc,Nat.reduceAdd,Nat.add_zero] at he ⊢
     linear_combination he
   · have h0 := ih 0 (by omega) (by omega)
     rw [show sourceNME9C q r+2-(q+3+1)+1=sourceNME9C q r+2-(q+3+0) by omega,
       show sourceNME9C q r+2-(q+3+1)+2=sourceNME9C q r+2-(q+2) by omega,
       h0,source_top_templateMB3E q (q+2) r hq le_rfl] at he
     rw [show q+3+1=(q+2)+2 by omega,topTemplateMB3E,middleCorrectionM99A]
     simp only [topDiagonalDeltaMB3E]
     simp only [Nat.add_assoc,Nat.reduceAdd,Nat.add_zero] at he ⊢
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
