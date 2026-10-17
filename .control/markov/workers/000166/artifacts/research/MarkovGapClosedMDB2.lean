import MarkovProductEval0MDB2
import MarkovProductEval1MDB2
import MarkovProductEval2MDB2
import MarkovProductEval3MDB2
import MarkovGapDataMDB2
/-! Machine-authored db238071. No numerical experiment is used as a proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
theorem gap_identityMDB2 : daddMC9F 4 (daddMC9F 4 prod0s21MDB2 prod1s21MDB2) (dnegMC9F 4 (daddMC9F 4 prod2s21MDB2 prod3s21MDB2)) = gapMDB2 := dbeq_soundMC9F 4 _ _ (by decide +kernel)
attribute [local irreducible] devalMC9F
theorem gap_evalMDB2 (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) gapMDB2 = pairReducedMAD5 T x g z := by
 have h := dense_gap_transportMDB2 4 prod0s21MDB2 prod1s21MDB2 prod2s21MDB2 prod3s21MDB2 gapMDB2 gap_identityMDB2 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T)
 simpa only [product0_evalMDB2,product1_evalMDB2,product2_evalMDB2,product3_evalMDB2,pairReducedMAD5] using h
theorem pair_reduced_nonnegMDB2 (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) : 0 ≤ pairReducedMAD5 T x g z := by
 rw [← gap_evalMDB2]
 apply deval_nonnegMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) _ gapMDB2 gap_positiveMDB2
 intro k
 rcases k with _|k
 · exact hx
 rcases k with _|k
 · exact hg
 rcases k with _|k <;> assumption
theorem reduced_pair_positiveMDB2 : ReducedPairPositiveMAD5 := by
 intro T x g z
 exact pair_reduced_nonnegMDB2 T x g z (by positivity) (by positivity) (by positivity) (by positivity)
end
end MathGKM.Markov
