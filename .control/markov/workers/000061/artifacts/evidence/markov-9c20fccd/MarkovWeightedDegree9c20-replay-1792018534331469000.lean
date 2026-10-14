import MarkovSameDegreeObstruction9c20
/-! Machine-authored 9c20fccd. Arbitrary nonnegative reweighting fails even
among terms with equal degree and cut count in one actual source. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 15000
def flatMask9c20 : List (Bool × Bool) := [(true,true),(true,true),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,true)]
def curvedMask9c20 : List (Bool × Bool) := [(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,true),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,true),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,true)]
theorem weighted_masks_source9c20 :
 flatMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 20 true)++[true]) 3 ∧
 curvedMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 20 true)++[true]) 3 ∧
 maskDegree07a7 1 flatMask9c20=24 ∧ maskDegree07a7 1 curvedMask9c20=24 := by
 decide
theorem weighted_mask_polys9c20 {R : Type*} [CommRing R] (y : R) :
 maskWeight340 y y 1 flatMask9c20=1+7*y+22*y^2+42*y^3+57*y^4+63*y^5+64*y^6+64*y^7+64*y^8+64*y^9+64*y^10+64*y^11+64*y^12+64*y^13+64*y^14+64*y^15+64*y^16+64*y^17+64*y^18+63*y^19+57*y^20+42*y^21+22*y^22+7*y^23+y^24 ∧
 maskWeight340 y y 1 curvedMask9c20=1+9*y+39*y^2+111*y^3+240*y^4+432*y^5+688*y^6+1005*y^7+1365*y^8+1723*y^9+2019*y^10+2208*y^11+2272*y^12+2208*y^13+2019*y^14+1723*y^15+1365*y^16+1005*y^17+688*y^18+432*y^19+240*y^20+111*y^21+39*y^22+9*y^23+y^24 := by
 simp only [flatMask9c20,curvedMask9c20,maskWeight340,cutFactorA27,cutChargeA27,
   if_true,if_false,Bool.false_eq_true]
 constructor <;> ring
theorem weighted_sameDegree_failure9c20 :
 let p := 26*maskWeight340 (X:ℤ[X]) X 1 flatMask9c20+
   maskWeight340 (X:ℤ[X]) X 1 curvedMask9c20
 p.coeff 6=2352 ∧ p.coeff 7=2669 ∧ p.coeff 8=3029 ∧
 p.coeff 7^2-p.coeff 6*p.coeff 8 = -647 := by
 obtain ⟨hp,hq⟩ := weighted_mask_polys9c20 (X:ℤ[X])
 dsimp only
 rw [hp,hq]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_X,Polynomial.coeff_one]
theorem weighted_source_raw_lc9c20 :
 let m := (frame (List.replicate 20 true)).mid
 m.a=21 ∧ m.b=22 ∧ InPolygon m.a m.b 18 6 ∧
 InPolygon m.a m.b 17 7 ∧ InPolygon m.a m.b 16 8 ∧
 coeff m.p 16 8*coeff m.p 18 6≤coeff m.p 17 7^2 := by
 have ha : (frame (List.replicate 20 true)).mid.a=21 := by rfl
 have hb : (frame (List.replicate 20 true)).mid.b=22 := by rfl
 refine ⟨ha,hb,?_,?_,?_,?_⟩
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · exact source_near_one_diagonal0618 (List.replicate 20 true) (by rw [ha,hb])
     16 6 (by norm_num [ha,hb,InPolygon]) (by norm_num [ha,hb,InPolygon])
     (by norm_num [ha,hb,InPolygon])
#print axioms weighted_masks_source9c20
#print axioms weighted_sameDegree_failure9c20
#print axioms weighted_source_raw_lc9c20
end
end MathGKM.Markov
