import MarkovWordConjugacyM10D

/-! Machine-authored 10d15751. All-path coefficient adapter for the integral
conjugacy. The protected raw coefficients are unchanged. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
attribute [local irreducible] frame coeff

theorem source_raw_residual_clearedM10D (path : List Bool) (j : ℕ) :
 (X+1)^(2*j)*(Bivariate.swap (frame path).mid.p).coeff j=
 (X+1)^((frame path).mid.b-1)*hresidualM511 (X:ℤ[X]) (sourceWord28 path) j := by
 have hw := sourceWord_central28 path
 have hl := (source_word_counts28 path).2
 rw [hw] at hl
 have h := raw_word_clearedM10D (central28 path++[true]) j
 rw [←hw,←source_word_exact3eda] at h
 have he : (central28 path++[true]).length=(frame path).mid.b-1 := by
   simp only [List.length_cons] at hl
   omega
 rw [he] at h
 rw [hresidual_diffM511]
 exact h

theorem source_raw_high_quotientM10D (path : List Bool) (j : ℕ)
 (hj : (frame path).mid.b≤2*j+1) :
 hresidualM511 (X:ℤ[X]) (sourceWord28 path) j=
 (X+1)^(2*j+1-(frame path).mid.b)*(Bivariate.swap (frame path).mid.p).coeff j := by
 have hh := source_raw_residual_clearedM10D path j
 have hb : 1≤(frame path).mid.b := by have hi := frame_reduced path; omega
 have he : (X+1:ℤ[X])^(2*j)=(X+1)^((frame path).mid.b-1)*
   (X+1)^(2*j+1-(frame path).mid.b) := by rw [←pow_add]; congr 1; omega
 rw [he,mul_assoc] at hh
 have hn : (X+1:ℤ[X])≠0 := X_add_C_ne_zero (1:ℤ)
 exact (mul_left_cancel₀ (pow_ne_zero _ hn) hh).symm

end
end MathGKM.Markov
