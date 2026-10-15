import MarkovCutActivityB485
/-! Machine-authored b485717c. Geometric cut activities on actual source 7/10. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def geometricWordB485 {R : Type*} [Monoid R] (t : R) : List (Bool × R) :=
 [(true,t^8),(true,t^7),(false,t^6),(true,t^5),(true,t^4),(false,t^3),(true,t^2),(true,t),(true,1)]
theorem geometric_source_wordB485 :
 central28 [true,true,false,false]++[true]=[true,true,false,true,true,false,true,true,true] := by decide
theorem geometric_uniformB485 {R : Type*} [Monoid R] :
 geometricWordB485 (1:R)=
 ([true,true,false,true,true,false,true,true,true].map (fun r => (r,(1:R)))) := by
 simp [geometricWordB485]
end
end MathGKM.Markov
