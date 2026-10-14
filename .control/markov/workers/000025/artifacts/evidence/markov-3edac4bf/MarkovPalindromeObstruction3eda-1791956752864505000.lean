import MarkovSquares28b1
import MarkovObstructionF80
import MarkovPolygon18
/-! Machine-authored 3edac4bf. A balanced palindrome obstruction to a
broadened sufficient condition. This is NOT a source counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
def badCore3eda : List Bool := [false,true,false,false,false,false,false,true,false]
def badPoly3eda : BiPoly := gasScalar80 U V 1 badCore3eda

theorem badCore_palindrome3eda : List.Palindrome badCore3eda := by decide
theorem badCore_balanced3eda : Balanced80 badCore3eda := by unfold Balanced80 badCore3eda; decide

theorem badCore_coeff3eda : coeff badPoly3eda 1 5=8 ∧
 coeff badPoly3eda 1 6=12 ∧ coeff badPoly3eda 1 7=20 := by
 have he : badPoly3eda =
    C (1*X^8+2*X^9+1*X^10)*X^0 +
    C (4*X^4+8*X^5+12*X^6+20*X^7+23*X^8+10*X^9)*X^1 +
    C (4*X^2+20*X^3+52*X^4+88*X^5+120*X^6+112*X^7+45*X^8)*X^2 +
    C (1*X^0+8*X^1+46*X^2+140*X^3+267*X^4+356*X^5+308*X^6+120*X^7)*X^3 +
    C (7*X^0+50*X^1+191*X^2+428*X^3+610*X^4+532*X^5+210*X^6)*X^4 +
    C (21*X^0+130*X^1+382*X^2+636*X^3+602*X^4+252*X^5)*X^5 +
    C (35*X^0+180*X^1+400*X^2+448*X^3+210*X^4)*X^6 +
    C (35*X^0+140*X^1+212*X^2+120*X^3)*X^7 +
    C (21*X^0+58*X^1+45*X^2)*X^8 +
    C (7*X^0+10*X^1)*X^9 +
    C (1*X^0)*X^10 := by
   simp only [badPoly3eda,badCore3eda,gasScalar80,gasWord80,gasT80,mm16,
     Bool.false_eq_true,if_false,if_true,U,V,map_add,map_mul,map_pow,map_ofNat,map_one]
   ring
 have hc : badPoly3eda.coeff 1=4*X^4+8*X^5+12*X^6+20*X^7+23*X^8+10*X^9 := by
   rw [he]
   simp only [coeff_add,coeff_C_mul_X_pow]
   norm_num
 change (badPoly3eda.coeff 1).coeff 5=8 ∧ (badPoly3eda.coeff 1).coeff 6=12 ∧
   (badPoly3eda.coeff 1).coeff 7=20
 rw [hc]
 norm_num [coeff_add,coeff_ofNat_mul,coeff_X_pow]

theorem palindrome_balance_not_sufficient3eda :
 List.Palindrome badCore3eda ∧ Balanced80 badCore3eda ∧ ¬GlobalLC18 badPoly3eda := by
 refine ⟨badCore_palindrome3eda,badCore_balanced3eda,?_⟩
 intro h
 have hh := h.2.1 1 5
 obtain ⟨h0,h1,h2⟩ := badCore_coeff3eda
 norm_num [h0,h1,h2] at hh

theorem badCore_not_source_three_eighths3eda (path : List Bool)
 (ha : (frame path).mid.a=3) (hb : (frame path).mid.b=8) :
 (frame path).mid.p≠badPoly3eda := by
 intro he
 have hc : coeff (frame path).mid.p 1 5≠0 := by rw [he,badCore_coeff3eda.1]; decide
 have hs := raw_lower_support18 path 1 5 hc
 norm_num [ha,hb] at hs

#print axioms palindrome_balance_not_sufficient3eda
#print axioms badCore_not_source_three_eighths3eda
end
end MathGKM.Markov
