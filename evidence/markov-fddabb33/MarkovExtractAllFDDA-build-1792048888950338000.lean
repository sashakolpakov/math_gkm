import MarkovExtractFDDA
/-! Machine-authored fddabb33. All-index denominator extraction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem extract_allFDDA (P K : ℤ[X]) (h : (1-X)^6*P=K) (j : ℕ) :
 P.coeff j=∑ p ∈ Finset.HasAntidiagonal.antidiagonal j,
 K.coeff p.1*((p.2+5).choose 5 : ℤ) := by
 have hh : (1-X)^6*P=K+X^(j+1)*0 := by simpa using h
 rw [extract_delayedFDDA P K 0 (j+1) j hh (by omega)]
 rw [mul_comm,PowerSeries.coeff_mul]
 simp only [Polynomial.coeff_coe,inverseSix_coeffFDDA]

#print axioms extract_allFDDA
end
end MathGKM.Markov
