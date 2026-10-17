import MarkovUnivariateCertificateM9DB
/-! Machine-authored 9db2326d. Support-aware univariate gap certificate. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000

theorem third_one_11_nonnegM9DB (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r 11 x 2 := by
 cases r
 · exact fixed_two_one_transferM9DB 11 false (by decide +kernel) x
 · exact fixed_two_one_transferM9DB 11 true (by decide +kernel) x

end MathGKM.Markov
