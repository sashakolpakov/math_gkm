import MarkovTwoSeriesMEC6
/-! Machine-authored 6799c386. Finite, exact geometric-series extraction.
No analytic convergence or external assertion is used. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def geoM679 {R : Type*} [CommRing R] (a : R) : PowerSeries R :=
 PowerSeries.mk (a^·)

theorem geo_inverseM679 {R : Type*} [CommRing R] (a : R) :
 geoM679 a*(1-PowerSeries.C a*PowerSeries.X)=1 := by
 apply PowerSeries.ext
 intro n
 rw [mul_sub,mul_one,←mul_assoc]
 cases n with
 | zero => simp [geoM679]
 | succ n =>
   simp only [PowerSeries.coeff_succ_mul_X,PowerSeries.coeff_mul_C,
     geoM679,PowerSeries.coeff_mk,map_sub,PowerSeries.coeff_one,
     Nat.succ_ne_zero,if_false,pow_succ]
   ring

theorem geo_pow_coeffM679 {R : Type*} [CommRing R] (a : R) (m n : ℕ) :
 PowerSeries.coeff n (geoM679 a^(m+1))=
   a^n*((m+n).choose m:R) := by
 have he : geoM679 a=PowerSeries.rescale a (PowerSeries.mk (1:ℕ→R)) := by
   apply PowerSeries.ext
   intro k
   simp [geoM679,PowerSeries.coeff_rescale]
 rw [he,←map_pow,PowerSeries.mk_one_pow_eq_mk_choose_add,
   PowerSeries.coeff_rescale,PowerSeries.coeff_mk]

theorem geometric_unfoldM679 {R : Type*} [CommRing R] (f g h : R)
 (he : (1-f)*g=h) (n : ℕ) :
 g=(∑ r∈range n, f^r*h)+f^n*g := by
 induction n with
 | zero => simp
 | succ n ih =>
   rw [sum_range_succ,pow_succ]
   linear_combination ih+f^n*he

theorem finite_series_coeffM679 {R : Type*} [CommRing R]
 (f g h : PowerSeries R) (he : (1-PowerSeries.X*f)*g=h) (q : ℕ) :
 PowerSeries.coeff q g=
   ∑ r∈range (q+1), PowerSeries.coeff (q-r) (f^r*h) := by
 have hg := geometric_unfoldM679 (PowerSeries.X*f) g h he (q+1)
 have hc := congrArg (PowerSeries.coeff q) hg
 simp only [map_add,map_sum,mul_pow,mul_assoc,PowerSeries.coeff_X_pow_mul'] at hc
 have hz : ¬q+1 ≤ q := by omega
 simp only [if_neg hz,zero_add,add_zero] at hc
 rw [hc]
 apply sum_congr rfl
 intro r hr
 rw [if_pos (by have := mem_range.mp hr; omega)]

end
end MathGKM.Markov
