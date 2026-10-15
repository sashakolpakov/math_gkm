import MarkovDegreeObstruction07a7
import MarkovSingleLayerInteger9c20
/-! Machine-authored 7d905904. The auxiliary degree deformation can fail
even though the complete raw source triple satisfies the target. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem marked_source27_formula7d {R : Type*} [CommRing R] (y z : R) :
 degreeCoeff07a7 y z y 1 1 (central28 sourcePath27_07a7++[true]) 2=
 1+3*z*(1+y)+z^2*(11+25*y+14*y^2) := by
 rw [source_word27_07a7]
 simp only [degreeCoeff07a7,cutChargeA27,cutFactorA27,
   Bool.false_eq_true,if_false,if_true,pow_zero,pow_one]
 ring

def source27Deformed7d (z : ℝ) : ℝ[X] :=
 degreeCoeff07a7 X (C z) X 1 1 (central28 sourcePath27_07a7++[true]) 2

theorem source27_deformed_gap7d (z : ℝ) :
 (source27Deformed7d z).coeff 1^2-
 (source27Deformed7d z).coeff 0*(source27Deformed7d z).coeff 2=
 z^2*(-5+108*z+471*z^2) := by
 rw [source27Deformed7d,marked_source27_formula7d]
 simp only [mul_add,Polynomial.coeff_add,Polynomial.coeff_mul_C,
   Polynomial.coeff_C_mul,Polynomial.coeff_mul_X_pow,Polynomial.coeff_C,
   Polynomial.coeff_one,Polynomial.coeff_X,pow_two]
 norm_num
 ring

theorem source27_deformed_failure7d :
 (source27Deformed7d (1/100)).coeff 1^2-
 (source27Deformed7d (1/100)).coeff 0*(source27Deformed7d (1/100)).coeff 2=
 -(38729/100000000:ℝ) := by
 rw [source27_deformed_gap7d]
 norm_num

theorem source27_deformed_ge_one7d (z : ℝ) (hz : 1≤z) :
 (source27Deformed7d z).coeff 0*(source27Deformed7d z).coeff 2≤
 (source27Deformed7d z).coeff 1^2 := by
 have h : 0≤z^2*(-5+108*z+471*z^2) := by
   apply mul_nonneg (sq_nonneg z)
   nlinarith [sq_nonneg z]
 rw [←source27_deformed_gap7d] at h
 linarith

theorem source27_deformed_at_one7d :
 source27Deformed7d 1=cutCoeffA27 (X:ℝ[X]) X 1
   (central28 sourcePath27_07a7++[true]) 2 := by
 simp only [source27Deformed7d,map_one]
 exact degreeCoeff_forget07a7 _ _ _ _ _ _

#print axioms marked_source27_formula7d
#print axioms source27_deformed_failure7d
#print axioms source27_deformed_ge_one7d
#print axioms source27_deformed_at_one7d
end
end MathGKM.Markov
