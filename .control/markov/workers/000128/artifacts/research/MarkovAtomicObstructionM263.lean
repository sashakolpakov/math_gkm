import MarkovRawPrefixM10D
import MarkovSecondWord8934
/-! Machine-authored 263d8c71. Atomic-word enlargement obstruction.
This word is not an expansion of any source word and is not a root witness. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

def badAtomicM263 : List Bool := [false,true,false,true,true,true,true,true]

theorem expanded_no_adjacent_CM263 (w : List Bool) (r : Bool) :
 adj8934 r (expand80 w)=0 := by
 induction w generalizing r with
 | nil => simp [expand80,adj8934]
 | cons e w ih => cases e <;> cases r <;> simp [expand80,adj8934,ih]

theorem badAtomic_not_expandedM263 (w : List Bool) : expand80 w ≠ badAtomicM263 := by
 intro he
 have h := expanded_no_adjacent_CM263 w false
 rw [he] at h
 norm_num [badAtomicM263,adj8934] at h

theorem badAtomic_not_sourceM263 (path : List Bool) :
 expand80 (sourceWord28 path) ≠ badAtomicM263 := badAtomic_not_expandedM263 _

theorem badAtomic_tripleM263 :
 coeff (rawPairM10D badAtomicM263).2 3 1=4 ∧
 coeff (rawPairM10D badAtomicM263).2 4 1=6 ∧
 coeff (rawPairM10D badAtomicM263).2 5 1=10 := by
 norm_num [rawPairM10D,badAtomicM263,List.foldl_cons,List.foldl_nil,
   rawAtomicM10D,add_mul,one_mul,mul_assoc,coeff_add,coeff_U_succ725,
   coeff_U_zero725,coeff_V_succ725,coeff_V_zero725,coeff,U,V,
   Polynomial.coeff_add,Polynomial.coeff_one,Polynomial.coeff_X,
   Polynomial.coeff_C,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul]

theorem badAtomic_horizontal_failureM263 :
 coeff (rawPairM10D badAtomicM263).2 4 1^2 <
 coeff (rawPairM10D badAtomicM263).2 3 1*coeff (rawPairM10D badAtomicM263).2 5 1 := by
 obtain ⟨h0,h1,h2⟩ := badAtomic_tripleM263
 norm_num [h0,h1,h2]

end
end MathGKM.Markov
