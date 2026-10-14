import MarkovCutDegree07a7
import MarkovPellRawLC0618
/-! Machine-authored 9c20fccd. Equal cut count and degree do not guarantee
pairwise compatibility, even within an actual source. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000
def leftMask9c20 : List (Bool × Bool) := [(true,true),(true,true),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,true)]
def rightMask9c20 : List (Bool × Bool) := [(true,false),(true,false),(true,false),(true,true),(true,false),(true,false),(true,false),(true,false),(true,false),(true,true),(true,false),(true,false),(true,false),(true,false),(true,false),(true,false),(true,true)]
theorem sameDegree_source9c20 :
 leftMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 16 true)++[true]) 3 ∧
 rightMask9c20 ∈ cutMasksFe01 (central28 (List.replicate 16 true)++[true]) 3 ∧
 maskDegree07a7 1 leftMask9c20=20 ∧ maskDegree07a7 1 rightMask9c20=20 := by
 decide
theorem sameDegree_polys9c20 {R : Type*} [CommRing R] (y : R) :
 maskWeight340 y y 1 leftMask9c20=1+7*y+22*y^2+42*y^3+57*y^4+63*y^5+64*y^6+64*y^7+64*y^8+64*y^9+64*y^10+64*y^11+64*y^12+64*y^13+64*y^14+63*y^15+57*y^16+42*y^17+22*y^18+7*y^19+y^20 ∧
 maskWeight340 y y 1 rightMask9c20=1+9*y+39*y^2+111*y^3+239*y^4+423*y^5+648*y^6+887*y^7+1104*y^8+1258*y^9+1314*y^10+1258*y^11+1104*y^12+887*y^13+648*y^14+423*y^15+239*y^16+111*y^17+39*y^18+9*y^19+y^20 := by
 simp only [leftMask9c20,rightMask9c20,maskWeight340,cutFactorA27,cutChargeA27,
   if_true,if_false,Bool.false_eq_true]
 constructor <;> ring
theorem sameDegree_mixed_failure9c20 :
 let p := maskWeight340 (X:ℤ[X]) X 1 leftMask9c20
 let q := maskWeight340 (X:ℤ[X]) X 1 rightMask9c20
 2*p.coeff 6*q.coeff 6-p.coeff 5*q.coeff 7-q.coeff 5*p.coeff 7 = -9 := by
 obtain ⟨hp,hq⟩ := sameDegree_polys9c20 (X:ℤ[X])
 dsimp only
 rw [hp,hq]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_X,Polynomial.coeff_one]
theorem full_source_still_lc9c20 :
 let m := (frame (List.replicate 16 true)).mid
 m.a=17 ∧ m.b=18 ∧ InPolygon m.a m.b 15 5 ∧
 InPolygon m.a m.b 14 6 ∧ InPolygon m.a m.b 13 7 ∧
 coeff m.p 13 7*coeff m.p 15 5≤coeff m.p 14 6^2 := by
 have ha : (frame (List.replicate 16 true)).mid.a=17 := by rfl
 have hb : (frame (List.replicate 16 true)).mid.b=18 := by rfl
 refine ⟨ha,hb,?_,?_,?_,?_⟩
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · norm_num [ha,hb,InPolygon]
 · exact source_near_one_diagonal0618 (List.replicate 16 true) (by rw [ha,hb])
     13 5 (by norm_num [ha,hb,InPolygon]) (by norm_num [ha,hb,InPolygon])
     (by norm_num [ha,hb,InPolygon])
#print axioms sameDegree_source9c20
#print axioms sameDegree_mixed_failure9c20
#print axioms full_source_still_lc9c20
end
end MathGKM.Markov
