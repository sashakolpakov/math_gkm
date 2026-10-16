import MarkovVerticalSecondRightMDE6
/-! Machine-authored 762ebbae. Literal source expansion, third column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
theorem small_v3poly_6_11M762 : (frame [true,false,false,false,false]).mid.p=
 C (1*X^11+5*X^12+10*X^13+10*X^14+5*X^15+1*X^16)*X^0 +
 C (20*X^10+92*X^11+172*X^12+164*X^13+80*X^14+16*X^15)*X^1 +
 C (16*X^8+216*X^9+784*X^10+1342*X^11+1233*X^12+595*X^13+120*X^14)*X^2 +
 C (12*X^6+216*X^7+1348*X^8+3952*X^9+6280*X^10+5644*X^11+2730*X^12+560*X^13)*X^3 +
 C (8*X^4+152*X^5+1184*X^6+5120*X^7+12992*X^8+19680*X^9+17600*X^10+8645*X^11+1820*X^12)*X^4 +
 C (4*X^2+72*X^3+628*X^4+3456*X^5+12492*X^6+29344*X^7+43680*X^8+39600*X^9+20020*X^10+4368*X^11)*X^5 +
 C (1*X^0+17*X^1+172*X^2+1212*X^3+5954*X^4+20282*X^5+46844*X^6+70764*X^7+66363*X^8+35035*X^9+8008*X^10)*X^6 +
 C (10*X^0+152*X^1+1208*X^2+6272*X^3+22216*X^4+53464*X^5+84864*X^6+84216*X^7+47190*X^8+11440*X^9)*X^7 +
 C (45*X^0+604*X^1+3980*X^2+16263*X^3+43457*X^4+75450*X^5+81378*X^6+49335*X^7+12870*X^8)*X^8 +
 C (120*X^0+1400*X^1+7640*X^2+24612*X^3+49180*X^4+59620*X^5+40040*X^6+11440*X^7)*X^9 +
 C (210*X^0+2086*X^1+9244*X^2+22870*X^3+32615*X^4+25025*X^5+8008*X^6)*X^10 +
 C (252*X^0+2072*X^1+7192*X^2+12924*X^3+11830*X^4+4368*X^5)*X^11 +
 C (210*X^0+1372*X^1+3508*X^2+4095*X^3+1820*X^4)*X^12 +
 C (120*X^0+584*X^1+980*X^2+560*X^3)*X^13 +
 C (45*X^0+145*X^1+120*X^2)*X^14 +
 C (10*X^0+16*X^1)*X^15 +
 C (1*X^0)*X^16 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
 norm_num
 ring
theorem small_v3col_6_11M762 : ((frame [true,false,false,false,false]).mid.p).coeff 3=12*X^6+216*X^7+1348*X^8+3952*X^9+6280*X^10+5644*X^11+2730*X^12+560*X^13 := by
 rw [small_v3poly_6_11M762]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem small_v3lc_6_11M762 (j : ℕ) (hj : j ≤ 16) :
 coeff (frame [true,false,false,false,false]).mid.p 3 j*coeff (frame [true,false,false,false,false]).mid.p 3 (j+2) ≤
 coeff (frame [true,false,false,false,false]).mid.p 3 (j+1)^2 := by
 simp only [coeff,small_v3col_6_11M762]
 interval_cases j <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
end
end MathGKM.Markov
