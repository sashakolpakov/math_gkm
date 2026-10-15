import MarkovCutActivityB485
/-! Machine-authored b485717c. Exact seven-site formulas, no numerical oracle. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

theorem activity_slice2B485 {R : Type*} [CommRing R] (y t : R) :
 activityCoeffB485 y y 1 (activityWordB485 t) 2 =
   (3+12*t+6*t^2)+
   (4+12*t+2*t^2)*y+
   (1+2*t)*y^2 := by
 simp only [activityWordB485,activityCoeffB485,cutChargeA27,cutFactorA27,
   Bool.false_eq_true,if_false,if_true]
 ring

theorem activity_coeff2B485 (t : ℤ) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 2).coeff 2 =
 1+2*t := by
 have he : activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 2 =
   C (3+12*t+6*t^2)+
   C (4+12*t+2*t^2)*X+
   C (1+2*t)*X^2 := by
  simpa only [map_add,map_mul,map_pow,map_ofNat,map_one] using
    activity_slice2B485 (X:ℤ[X]) (C t)
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 norm_num

#print axioms activity_slice2B485
#print axioms activity_coeff2B485

theorem activity_slice3B485 {R : Type*} [CommRing R] (y t : R) :
 activityCoeffB485 y y 1 (activityWordB485 t) 3 =
   (1+12*t+18*t^2+4*t^3)+
   (2+24*t+30*t^2+4*t^3)*y+
   (1+14*t+15*t^2)*y^2+
   (2*t+2*t^2)*y^3 := by
 simp only [activityWordB485,activityCoeffB485,cutChargeA27,cutFactorA27,
   Bool.false_eq_true,if_false,if_true]
 ring

theorem activity_coeff3B485 (t : ℤ) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 3).coeff 2 =
 1+14*t+15*t^2 := by
 have he : activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 3 =
   C (1+12*t+18*t^2+4*t^3)+
   C (2+24*t+30*t^2+4*t^3)*X+
   C (1+14*t+15*t^2)*X^2+
   C (2*t+2*t^2)*X^3 := by
  simpa only [map_add,map_mul,map_pow,map_ofNat,map_one] using
    activity_slice3B485 (X:ℤ[X]) (C t)
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 norm_num

#print axioms activity_slice3B485
#print axioms activity_coeff3B485

theorem activity_slice4B485 {R : Type*} [CommRing R] (y t : R) :
 activityCoeffB485 y y 1 (activityWordB485 t) 4 =
   (4*t+18*t^2+12*t^3+t^4)+
   (12*t+54*t^2+32*t^3+2*t^4)*y+
   (12*t+59*t^2+28*t^3+t^4)*y^2+
   (4*t+28*t^2+8*t^3)*y^3+
   (5*t^2)*y^4 := by
 simp only [activityWordB485,activityCoeffB485,cutChargeA27,cutFactorA27,
   Bool.false_eq_true,if_false,if_true]
 ring

theorem activity_coeff4B485 (t : ℤ) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 4).coeff 2 =
 12*t+59*t^2+28*t^3+t^4 := by
 have he : activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) 4 =
   C (4*t+18*t^2+12*t^3+t^4)+
   C (12*t+54*t^2+32*t^3+2*t^4)*X+
   C (12*t+59*t^2+28*t^3+t^4)*X^2+
   C (4*t+28*t^2+8*t^3)*X^3+
   C (5*t^2)*X^4 := by
  simpa only [map_add,map_mul,map_pow,map_ofNat,map_one] using
    activity_slice4B485 (X:ℤ[X]) (C t)
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 norm_num

#print axioms activity_slice4B485
#print axioms activity_coeff4B485
end
end MathGKM.Markov
