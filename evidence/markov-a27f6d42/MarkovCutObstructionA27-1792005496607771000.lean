import MarkovCutPartitionA27
import MarkovPolygon18
/-! Machine-authored a27f6d42. A non-source cut word with a reversed diagonal
inequality. This does not refute the pinned conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def cutBadWordA27 : List Bool := [true,false,true,true,true,true,true]

theorem cutBad_sliceA27 :
 cutCoeffA27 (X : ℤ[X]) X 1 (cutBadWordA27++[true]) 1 =
 8+20*X+20*X^2+14*X^3+10*X^4+6*X^5+2*X^6 := by
 simp only [cutBadWordA27,List.cons_append,List.nil_append,cutCoeffA27,
   cutChargeA27,cutFactorA27,Bool.false_eq_true,if_false,if_true]
 ring

theorem cutBad_coeffA27 :
 coeff (ambientScalar5c U V cutBadWordA27) 1 2=20 ∧
 coeff (ambientScalar5c U V cutBadWordA27) 1 3=14 ∧
 coeff (ambientScalar5c U V cutBadWordA27) 1 4=10 := by
 simp only [ambient_cut_coeffA27,cutBad_sliceA27]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]

theorem cutBad_reversedA27 :
 coeff (ambientScalar5c U V cutBadWordA27) 1 3^2 <
 coeff (ambientScalar5c U V cutBadWordA27) 1 2*
   coeff (ambientScalar5c U V cutBadWordA27) 1 4 := by
 obtain ⟨h0,h1,h2⟩ := cutBad_coeffA27
 norm_num [h0,h1,h2]

/-- The virtual 7/9 polygon excludes the j=4 endpoint at s=1. -/
theorem cutBad_polygon_exclusionA27 :
 cutBadWordA27.count true+1=7 ∧ cutBadWordA27.length+2=9 ∧
 ¬ InPolygon 7 9 4 4 := by
 norm_num [cutBadWordA27,InPolygon]

theorem cutBad_not_sourceA27 (path : List Bool)
 (ha : (frame path).mid.a=7) (hb : (frame path).mid.b=9) :
 central28 path≠cutBadWordA27 := by
 intro hw
 have hz := raw_outside_polygon18 path 4 4 (by
   rw [ha,hb]; exact cutBad_polygon_exclusionA27.2.2)
 have he := source_ambient_coeff5c path 4 4 1 (by rw [ha])
 rw [hw,cutBad_coeffA27.2.2,hz] at he
 norm_num at he

#print axioms cutBad_sliceA27
#print axioms cutBad_reversedA27
#print axioms cutBad_polygon_exclusionA27
#print axioms cutBad_not_sourceA27
end
end MathGKM.Markov
