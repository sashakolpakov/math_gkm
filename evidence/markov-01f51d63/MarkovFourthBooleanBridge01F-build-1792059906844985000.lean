import MarkovFourthBoolean01F
import MarkovFourthSource01F
/-! Machine-authored 01f51d63. Local Boolean statistic to literal gauged blocks. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem fourth_boolean_local01F (p q r s t : Bool) :
 localFour01F (booleanGauge6905 p q)
   (headRatioOne01F [booleanGauge6905 q r,booleanGauge6905 r s,booleanGauge6905 s t])
   (headRatioTwo01F [booleanGauge6905 q r,booleanGauge6905 r s,booleanGauge6905 s t])
   (headRatioThree01F [booleanGauge6905 q r,booleanGauge6905 r s,booleanGauge6905 s t])=
 fourthLocalBoolean01F (X:ℤ[X]) p q r s t := by
 simp only [localFour01F,headRatioOne01F,headRatioTwo01F,headRatioThree01F,
   booleanGauge_formula6905,fourthLocalBoolean01F,U,
   Polynomial.coeff_add,Polynomial.coeff_sub,Polynomial.coeff_X_mul,
   Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,Polynomial.coeff_X,
   Polynomial.coeff_one]
 norm_num
 ring

theorem source_fourth_trace_local01F (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 logFour01F (tr16 (ambientWord5c U V (sourceWord28 (List.replicate n true++false::rest))))=
 let w := runBooleanListADB2 n true (sourceWord28 rest)
 localFourScan01F (w.take 3) w := by
 rw [source_fourth_trace01F,source_fourth_trace_long01F n rest hc]
 have h := runBoolean_source_shapeADB2 n rest
 have hl : 0 < (runBooleanListADB2 n true (sourceWord28 rest)).length := by
   rw [runList_length01F,(source_word_counts28 rest).2]; omega
 obtain ⟨m,ms,hw⟩ := List.exists_cons_of_length_pos hl
 rw [hw] at h ⊢
 exact cyclic_four_local01F m ms h

end
end MathGKM.Markov
