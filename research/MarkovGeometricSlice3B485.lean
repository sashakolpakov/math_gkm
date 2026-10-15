import MarkovGeometricWordB485
/-! Machine-authored exact identity, independently elaborated and kernel checked. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
theorem geometric_slice3B485 {R : Type*} [CommRing R] (y t : R) :
 activityCoeffB485 y y 1 (geometricWordB485 t) 3 =
   (t^3+t^4+2*t^5+3*t^6+4*t^7+5*t^8+7*t^9+7*t^10+8*t^11+8*t^12+8*t^13+7*t^14+7*t^15+5*t^16+4*t^17+3*t^18+2*t^19+t^20+t^21)+
   (5*t^3+7*t^4+15*t^5+19*t^6+25*t^7+31*t^8+44*t^9+46*t^10+54*t^11+55*t^12+52*t^13+44*t^14+41*t^15+29*t^16+23*t^17+19*t^18+13*t^19+5*t^20+5*t^21)*y+
   (10*t^3+22*t^4+48*t^5+50*t^6+66*t^7+85*t^8+121*t^9+137*t^10+172*t^11+171*t^12+147*t^13+116*t^14+103*t^15+71*t^16+57*t^17+52*t^18+35*t^19+10*t^20+10*t^21)*y^2+
   (10*t^3+40*t^4+84*t^5+70*t^6+98*t^7+134*t^8+192*t^9+251*t^10+339*t^11+311*t^12+231*t^13+167*t^14+145*t^15+95*t^16+80*t^17+79*t^18+50*t^19+10*t^20+10*t^21)*y^3+
   (5*t^3+45*t^4+86*t^5+55*t^6+92*t^7+131*t^8+199*t^9+324*t^10+449*t^11+354*t^12+214*t^13+143*t^14+125*t^15+75*t^16+70*t^17+71*t^18+40*t^19+5*t^20+5*t^21)*y^4+
   (t^3+31*t^4+51*t^5+23*t^6+57*t^7+79*t^8+151*t^9+313*t^10+404*t^11+249*t^12+114*t^13+74*t^14+67*t^15+35*t^16+39*t^17+37*t^18+17*t^19+t^20+t^21)*y^5+
   (12*t^4+16*t^5+4*t^6+22*t^7+27*t^8+96*t^9+225*t^10+238*t^11+99*t^12+31*t^13+22*t^14+21*t^15+9*t^16+13*t^17+10*t^18+3*t^19)*y^6+
   (2*t^4+2*t^5+4*t^7+4*t^8+54*t^9+113*t^10+83*t^11+17*t^12+3*t^13+3*t^14+3*t^15+t^16+2*t^17+t^18)*y^7+
   (24*t^9+35*t^10+13*t^11)*y^8+
   (7*t^9+5*t^10)*y^9+
   (t^9)*y^10 := by
 simp only [geometricWordB485,activityCoeffB485,cutChargeA27,cutFactorA27,
   Bool.false_eq_true,if_false,if_true]
 ring
theorem geometric_coeff3B485 (t : ℤ) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 3).coeff 9 =
   7*t^9+5*t^10 := by
 have he : activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 3 =
   C (t^3+t^4+2*t^5+3*t^6+4*t^7+5*t^8+7*t^9+7*t^10+8*t^11+8*t^12+8*t^13+7*t^14+7*t^15+5*t^16+4*t^17+3*t^18+2*t^19+t^20+t^21)+
   C (5*t^3+7*t^4+15*t^5+19*t^6+25*t^7+31*t^8+44*t^9+46*t^10+54*t^11+55*t^12+52*t^13+44*t^14+41*t^15+29*t^16+23*t^17+19*t^18+13*t^19+5*t^20+5*t^21)*X+
   C (10*t^3+22*t^4+48*t^5+50*t^6+66*t^7+85*t^8+121*t^9+137*t^10+172*t^11+171*t^12+147*t^13+116*t^14+103*t^15+71*t^16+57*t^17+52*t^18+35*t^19+10*t^20+10*t^21)*X^2+
   C (10*t^3+40*t^4+84*t^5+70*t^6+98*t^7+134*t^8+192*t^9+251*t^10+339*t^11+311*t^12+231*t^13+167*t^14+145*t^15+95*t^16+80*t^17+79*t^18+50*t^19+10*t^20+10*t^21)*X^3+
   C (5*t^3+45*t^4+86*t^5+55*t^6+92*t^7+131*t^8+199*t^9+324*t^10+449*t^11+354*t^12+214*t^13+143*t^14+125*t^15+75*t^16+70*t^17+71*t^18+40*t^19+5*t^20+5*t^21)*X^4+
   C (t^3+31*t^4+51*t^5+23*t^6+57*t^7+79*t^8+151*t^9+313*t^10+404*t^11+249*t^12+114*t^13+74*t^14+67*t^15+35*t^16+39*t^17+37*t^18+17*t^19+t^20+t^21)*X^5+
   C (12*t^4+16*t^5+4*t^6+22*t^7+27*t^8+96*t^9+225*t^10+238*t^11+99*t^12+31*t^13+22*t^14+21*t^15+9*t^16+13*t^17+10*t^18+3*t^19)*X^6+
   C (2*t^4+2*t^5+4*t^7+4*t^8+54*t^9+113*t^10+83*t^11+17*t^12+3*t^13+3*t^14+3*t^15+t^16+2*t^17+t^18)*X^7+
   C (24*t^9+35*t^10+13*t^11)*X^8+
   C (7*t^9+5*t^10)*X^9+
   C (t^9)*X^10 := by
  simpa only [map_add,map_mul,map_pow,map_ofNat,map_one] using
    geometric_slice3B485 (X:ℤ[X]) (C t)
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 norm_num
#print axioms geometric_slice3B485
#print axioms geometric_coeff3B485
end
end MathGKM.Markov
