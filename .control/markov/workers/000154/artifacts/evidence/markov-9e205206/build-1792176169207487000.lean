import MarkovGeometricM679
/-! Machine-authored 9e205206. Exact positive-binomial resolvent for a
quadratic denominator. Formal power series only; no convergence assumption. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries Finset
set_option maxHeartbeats 3000000

def quadDenomM9E2 {R : Type*} [CommRing R] (a b c : R) : PowerSeries R :=
 (1-C a*X)*(1-C b*X)-C c*X
def quadInverseM9E2 {R : Type*} [CommRing R] (a b c : R) : PowerSeries R :=
 invOfUnit (quadDenomM9E2 a b c) 1

theorem quad_inverseM9E2 {R : Type*} [CommRing R] (a b c : R) :
 quadDenomM9E2 a b c*quadInverseM9E2 a b c=1 := by
 apply mul_invOfUnit
 simp [quadDenomM9E2]

theorem quad_resolventM9E2 {R : Type*} [CommRing R] (a b c : R) :
 (1-X*(C c*geoM679 a*geoM679 b))*quadInverseM9E2 a b c=
 geoM679 a*geoM679 b := by
 have ha := geo_inverseM679 a
 have hb := geo_inverseM679 b
 have hi := quad_inverseM9E2 a b c
 have he : geoM679 a*geoM679 b*quadDenomM9E2 a b c=
     1-X*(C c*geoM679 a*geoM679 b) := by
   unfold quadDenomM9E2
   calc
    _ = (geoM679 a*(1-C a*X))*(geoM679 b*(1-C b*X))-
      X*(C c*geoM679 a*geoM679 b) := by ring
    _ = _ := by rw [ha,hb]; ring
 rw [←he,mul_assoc,hi,mul_one]

def twoGeoCoeffM9E2 {R : Type*} [CommRing R] (a b : R) (m n : ℕ) : R :=
 ∑ k∈range (n+1), a^k*b^(n-k)*((m+k).choose m:R)*((m+(n-k)).choose m:R)

theorem two_geo_coeffM9E2 {R : Type*} [CommRing R] (a b : R) (m n : ℕ) :
 PowerSeries.coeff n (geoM679 a^(m+1)*geoM679 b^(m+1))=twoGeoCoeffM9E2 a b m n := by
 rw [PowerSeries.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 simp only [geo_pow_coeffM679]
 unfold twoGeoCoeffM9E2
 apply sum_congr rfl
 intro k hk
 ring

def quadCoeffM9E2 {R : Type*} [CommRing R] (a b c : R) (n : ℕ) : R :=
 ∑ m∈range (n+1), c^m*twoGeoCoeffM9E2 a b m (n-m)

theorem quad_coeffM9E2 {R : Type*} [CommRing R] (a b c : R) (n : ℕ) :
 PowerSeries.coeff n (quadInverseM9E2 a b c)=quadCoeffM9E2 a b c n := by
 rw [finite_series_coeffM679 _ _ _ (quad_resolventM9E2 a b c) n]
 unfold quadCoeffM9E2
 apply sum_congr rfl
 intro m hm
 have he : (C c*geoM679 a*geoM679 b)^m*(geoM679 a*geoM679 b)=
   C (c^m)*(geoM679 a^(m+1)*geoM679 b^(m+1)) := by
   simp only [mul_pow,map_pow,pow_succ]
   ring
 rw [he,PowerSeries.coeff_C_mul,two_geo_coeffM9E2]

theorem two_geo_nonnegM9E2 (a b : BiPoly) (ha : PolyNonneg16 a)
 (hb : PolyNonneg16 b) (m n : ℕ) : PolyNonneg16 (twoGeoCoeffM9E2 a b m n) := by
 have hp (p : BiPoly) (h : PolyNonneg16 p) (k : ℕ) : PolyNonneg16 (p^k) := by
   induction k with
   | zero => simpa using poly_one_nonneg16
   | succ k ih => rw [pow_succ]; exact poly_mul_nonneg16 ih h
 have hn (k : ℕ) : PolyNonneg16 (k:BiPoly) := by
   intro i j
   simp only [coeff,Polynomial.coeff_natCast]
   split_ifs <;> simp only [Polynomial.coeff_zero,Polynomial.coeff_natCast] <;>
     split_ifs <;> positivity
 intro i j
 simp only [twoGeoCoeffM9E2,coeff,Polynomial.finsetSum_coeff]
 apply sum_nonneg
 intro k hk
 exact poly_mul_nonneg16 (poly_mul_nonneg16
   (poly_mul_nonneg16 (hp a ha k) (hp b hb (n-k))) (hn _)) (hn _) i j

theorem quad_coeff_nonnegM9E2 (a b c : BiPoly) (ha : PolyNonneg16 a)
 (hb : PolyNonneg16 b) (hc : PolyNonneg16 c) (n : ℕ) :
 PolyNonneg16 (quadCoeffM9E2 a b c n) := by
 have hp (k : ℕ) : PolyNonneg16 (c^k) := by
   induction k with
   | zero => simpa using poly_one_nonneg16
   | succ k ih => rw [pow_succ]; exact poly_mul_nonneg16 ih hc
 intro i j
 simp only [quadCoeffM9E2,coeff,Polynomial.finsetSum_coeff]
 apply sum_nonneg
 intro k hk
 exact poly_mul_nonneg16 (hp k) (two_geo_nonnegM9E2 a b ha hb k (n-k)) i j

end
end MathGKM.Markov
