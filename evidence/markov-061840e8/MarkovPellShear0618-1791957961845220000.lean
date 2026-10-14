import MarkovPellMatching0618
/-! Machine-authored 061840e8. Exact exponent shear and coefficient bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def shear0618 : BiPoly →+* BiPoly :=
 eval₂RingHom (eval₂RingHom (Int.castRingHom BiPoly) U) (U*V)

theorem shear_U0618 : shear0618 U=U*V := by simp [shear0618,U]
theorem shear_V0618 : shear0618 V=U := by simp [shear0618,V]

theorem shear_monomial0618 (n m : ℕ) (z : ℤ) :
 shear0618 (monomial n (monomial m z))=monomial (n+m) (monomial n z) := by
 simp only [shear0618,eval₂RingHom_apply,eval₂_monomial,Int.castRingHom_apply]
 rw [← C_mul_X_pow_eq_monomial,← C_mul_X_pow_eq_monomial]
 simp only [map_mul,map_pow]
 simp only [U,V,pow_add,mul_pow]
 have hz : C (C z)=(z:BiPoly) := by simp
 rw [hz]
 ring

theorem shear_coeff0618 (p : BiPoly) (i j : ℕ) :
 coeff (shear0618 p) (i+j) i=coeff p i j := by
 induction p using Polynomial.induction_on' with
 | add p q hp hq => simp only [map_add,coeff_add0618,hp,hq]
 | monomial n p =>
   induction p using Polynomial.induction_on' with
   | add p q hp hq => simp only [monomial_add,map_add,coeff_add0618,hp,hq]
   | monomial m z =>
     rw [shear_monomial0618]
     by_cases hn : n=i
     · subst n
       simp [coeff,Polynomial.coeff_monomial]
     · simp [coeff,Polynomial.coeff_monomial,hn]

theorem match_map0618 {R T : Type*} [CommRing R] [CommRing T]
 (f : R →+* T) (u v : R) (n : ℕ) :
 matchPair0618 (f u) (f v) n=
   (f (matchPair0618 u v n).1,f (matchPair0618 u v n).2) := by
 induction n with
 | zero => simp [matchPair0618]
 | succ n ih => simp [matchPair0618,ih,map_add,map_mul]

theorem match_shear_coeff0618 (n i j : ℕ) :
 coeff (matchPair0618 (U*V) U n).2 (i+j) i=
   ((n-j).choose i : ℤ)*((n-i-1).choose j : ℤ) := by
 have h := match_map0618 shear0618 U V n
 rw [shear_U0618,shear_V0618] at h
 rw [h,shear_coeff0618]
 exact (match_coeff0618 n i j).2

#print axioms shear_coeff0618
#print axioms match_shear_coeff0618
end
end MathGKM.Markov
