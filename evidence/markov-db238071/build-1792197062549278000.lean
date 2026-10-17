import MarkovDenseCertificateMC9F
/-! Machine-authored db238071. Abstract transport keeps concrete data opaque
to elaboration; every coefficient equality remains checked by the kernel. -/
namespace MathGKM.Markov

theorem dense_mul_transportMDB2 (n : ℕ) (a b c : DenseMC9F n)
 (h : dmulMC9F n a b = c) (v : ℕ → ℚ) :
 devalMC9F n v c = devalMC9F n v a * devalMC9F n v b :=
 (congrArg (devalMC9F n v) h).symm.trans (deval_mulMC9F n v a b)

theorem dense_gap_transportMDB2 (n : ℕ) (a b c d e : DenseMC9F n)
 (h : daddMC9F n (daddMC9F n a b) (dnegMC9F n (daddMC9F n c d)) = e)
 (v : ℕ → ℚ) :
 devalMC9F n v e = devalMC9F n v a + devalMC9F n v b -
   devalMC9F n v c - devalMC9F n v d := by
 rw [← h, deval_addMC9F, deval_addMC9F, deval_negMC9F, deval_addMC9F]
 ring

end MathGKM.Markov
