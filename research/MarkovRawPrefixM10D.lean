import MarkovMechanical3eda
import MarkovSupport725

/-! Machine-authored 10d15751. Raw prefix-state model, with exact coefficients.
A prefix of a source word need not itself be the source word of its own ratio. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

def rawAtomicM10D (z : BiPoly × BiPoly) (r : Bool) : BiPoly × BiPoly :=
 if r then ((V+1)*z.1+U*V*z.2,z.1+U*z.2)
 else (V*(z.1+U*z.2),z.1+(U+1)*z.2)

def rawPairM10D (w : List Bool) : BiPoly × BiPoly :=
 w.foldl rawAtomicM10D (1,0)

theorem rawPair_appendM10D (w : List Bool) (r : Bool) :
 rawPairM10D (w++[r])=rawAtomicM10D (rawPairM10D w) r := by
 simp [rawPairM10D,List.foldl_append]

theorem rawPair_matrixM10D (w : List Bool) :
 rawPairM10D w=((gasWord80 U V (1:BiPoly) w).a,(gasWord80 U V (1:BiPoly) w).b) := by
 induction w using List.reverseRecOn with
 | nil => rfl
 | append_singleton w r ih =>
   rw [rawPair_appendM10D,ih,gasWord_append80]
   cases r <;> apply Prod.ext <;>
     simp [rawAtomicM10D,gasWord80,gasT80,mm16] <;> ring

theorem rawPair_sourceM10D (path : List Bool) :
 (rawPairM10D (expand80 (sourceWord28 path))).2=(frame path).mid.p := by
 rw [rawPair_matrixM10D,←rawWord_expand80,←source_word_exact3eda]

def badPrefixM10D : List Bool := [false,true,true,true,true,true,false,true,true]
def containingPathM10D : List Bool := [true,true,true,true,true,false]

theorem badPrefix_sourceM10D :
 (sourceWord28 containingPathM10D).take 9=badPrefixM10D ∧
 (frame containingPathM10D).mid.a=11 ∧ (frame containingPathM10D).mid.b=13 := by
 decide

theorem badPrefix_countsM10D : badPrefixM10D.count true=7 ∧ badPrefixM10D.length=9 := by
 decide

theorem badPrefix_not_sourceM10D (path : List Bool) : sourceWord28 path≠badPrefixM10D := by
 intro he
 obtain ⟨ha,hb⟩ := source_word_counts28 path
 rw [he,badPrefix_countsM10D.1] at ha
 rw [he,badPrefix_countsM10D.2] at hb
 have ht := source_take_floor3eda path 6 (by omega)
 rw [he,←ha,←hb] at ht
 norm_num [badPrefixM10D] at ht

theorem badPrefix_tripleM10D :
 coeff (rawPairM10D (expand80 badPrefixM10D)).2 4 4=10 ∧
 coeff (rawPairM10D (expand80 badPrefixM10D)).2 5 3=14 ∧
 coeff (rawPairM10D (expand80 badPrefixM10D)).2 6 2=20 := by
 norm_num [rawPairM10D,badPrefixM10D,expand80,List.foldl_cons,List.foldl_nil,
   rawAtomicM10D,add_mul,one_mul,mul_assoc,coeff_add,coeff_U_succ725,
   coeff_U_zero725,coeff_V_succ725,coeff_V_zero725,coeff,U,V,
   Polynomial.coeff_add,Polynomial.coeff_one,Polynomial.coeff_X,
   Polynomial.coeff_C,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul]

theorem badPrefix_valid_failureM10D :
 InPolygon 7 9 4 4 ∧ InPolygon 7 9 5 3 ∧ InPolygon 7 9 6 2 ∧
 coeff (rawWord80 badPrefixM10D).b 5 3^2 <
 coeff (rawWord80 badPrefixM10D).b 4 4*coeff (rawWord80 badPrefixM10D).b 6 2 := by
 obtain ⟨h0,h1,h2⟩ := badPrefix_tripleM10D
 rw [rawPair_matrixM10D,←rawWord_expand80] at h0 h1 h2
 norm_num [InPolygon,h0,h1,h2]

end
end MathGKM.Markov
