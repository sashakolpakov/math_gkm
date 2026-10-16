import MarkovMixtureObstructionM263
/-! Machine-authored 263d8c71. Explicit polygon and endpoint scope of the witness. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem mixture_triple_polygon_scopeM263 :
 ¬InPolygon 4 8 1 4 ∧ InPolygon 4 8 2 4 ∧ InPolygon 4 8 3 4 := by
 norm_num [InPolygon]

theorem mixture_not_endpointsM263 : badMixtureM263 ≠ 1 ∧ badMixtureM263 ≠ U+V := by
 have hc := mixture_raw_failureM263.1
 constructor
 · intro he
   rw [he] at hc
   norm_num [coeff] at hc
 · intro he
   rw [he] at hc
   norm_num [coeff,U,V,Polynomial.coeff_add] at hc

end
end MathGKM.Markov
