import MarkovCentralExprMF88
/-! Machine-authored f88f6a75. Unbounded central-depth inequality.
The computational signs are checked by ordinary kernel reduction. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000
set_option compiler.extract_closed false

theorem central_cert_7_0_falseMF88 : oneNonnegM9DB (centralGapExprMF88 0 3 7 false) := by decide +kernel

theorem central_cert_7_0_trueMF88 : oneNonnegM9DB (centralGapExprMF88 0 3 7 true) := by decide +kernel

theorem central_cert_7_1_falseMF88 : oneNonnegM9DB (centralGapExprMF88 1 3 7 false) := by decide +kernel

theorem central_cert_7_1_trueMF88 : oneNonnegM9DB (centralGapExprMF88 1 3 7 true) := by decide +kernel

theorem central_cert_7_2_falseMF88 : oneNonnegM9DB (centralGapExprMF88 2 3 7 false) := by decide +kernel

theorem central_cert_7_2_trueMF88 : oneNonnegM9DB (centralGapExprMF88 2 2 7 true) := by decide +kernel

theorem central_cert_7_3_falseMF88 : oneNonnegM9DB (centralGapExprMF88 3 2 7 false) := by decide +kernel

theorem central_cert_7_3_trueMF88 : oneNonnegM9DB (centralGapExprMF88 3 2 7 true) := by decide +kernel

theorem central_low_7MF88 (h k : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralRawME10 h k 7 r*centralRawME10 h k 9 r ≤ centralRawME10 h k 8 r^2 := by
 by_cases ht : centralTME10 h k r < 9
 · rw [central_raw_zeroME10 h k 9 r ht,mul_zero]
   exact sq_nonneg _
 have ht' : 9 ≤ 3*k+h+(if r then 1 else 0) := by simpa [centralTME10] using (Nat.le_of_not_gt ht)
 interval_cases h <;> cases r
 · apply central_certificate_transferMF88 0 3 7 k false central_cert_7_0_falseMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
 · apply central_certificate_transferMF88 0 3 7 k true central_cert_7_0_trueMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
 · apply central_certificate_transferMF88 1 3 7 k false central_cert_7_1_falseMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
 · apply central_certificate_transferMF88 1 3 7 k true central_cert_7_1_trueMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
 · apply central_certificate_transferMF88 2 3 7 k false central_cert_7_2_falseMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
 · apply central_certificate_transferMF88 2 2 7 k true central_cert_7_2_trueMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
 · apply central_certificate_transferMF88 3 2 7 k false central_cert_7_3_falseMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
 · apply central_certificate_transferMF88 3 2 7 k true central_cert_7_3_trueMF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega

end MathGKM.Markov
