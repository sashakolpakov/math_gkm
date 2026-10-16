import MarkovRawConjugacyM10D
import MarkovRawPrefixM10D
import MarkovPrefixObstructionM10D

/-! Machine-authored 10d15751. All-word integral raw/residual correspondence,
including high-index exact divisibility. No log-concavity hypothesis discharged. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def swapPairM10D (z : BiPoly × BiPoly) : BiPoly × BiPoly :=
 (Bivariate.swap z.1,Bivariate.swap z.2)

theorem swap_rawAtomicM10D (z : BiPoly × BiPoly) (r : Bool) :
 swapPairM10D (rawAtomicM10D z r)=
 if r then rawRowCM10D (swapPairM10D z) else rawRowAM10D (swapPairM10D z) := by
 cases r <;> apply Prod.ext <;>
 simp [swapPairM10D,rawAtomicM10D,rawRowAM10D,rawRowCM10D,U,V]
 all_goals ring

theorem swap_raw_word_stepM10D (w : List Bool) (r : Bool) :
 swapPairM10D (rawPairM10D (expand80 (w++[r])))=
 if r then rawRowCM10D (rawRowAM10D (swapPairM10D (rawPairM10D (expand80 w))))
 else rawRowAM10D (swapPairM10D (rawPairM10D (expand80 w))) := by
 rw [expand_append80]
 cases r
 · simp only [expand80,List.append_nil,rawPair_appendM10D,swap_rawAtomicM10D,
     Bool.false_eq_true,ite_false]
 · have he : expand80 w++expand80 [true]=(expand80 w++[false])++[true] := by simp [expand80]
   rw [he,rawPair_appendM10D,swap_rawAtomicM10D]
   simp only [ite_true,rawPair_appendM10D,swap_rawAtomicM10D,Bool.false_eq_true,ite_false]

theorem word_pairScaleM10D (w : List Bool) :
 PairScaleM10D w.length (swapPairM10D (rawPairM10D (expand80 (false::w))))
   (hstateM10D (false::w)) := by
 induction w using List.reverseRecOn with
 | nil =>
   have hh : hstateM10D [false]=(U*(V+1),1) := by
     have hs := hstate_appendM10D [] false
     simpa [hstate_nilM10D,hstepMEA423] using hs
   rw [hh]
   simpa [rawPairM10D,expand80,rawAtomicM10D,swapPairM10D,U,V] using pairScale_initialM10D
 | append_singleton w r ih =>
   rw [show false::(w++[r])=(false::w)++[r] by rfl,
     swap_raw_word_stepM10D,hstate_appendM10D]
   simp only [List.length_append,List.length_singleton]
   cases r
   · simpa only [Bool.false_eq_true,ite_false,hstepMEA423,atomicAMEA423,hmixMEA423] using pairScale_AM10D ih
   · simp only [ite_true,←atomic_BMEA423]
     exact pairScale_CM10D (pairScale_AM10D ih)

theorem raw_word_clearedM10D (w : List Bool) (j : ℕ) :
 (X+1)^(2*j)*(Bivariate.swap (rawWord80 (false::w)).b).coeff j=
 (X+1)^w.length*(hstateM10D (false::w)).2.coeff j := by
 have h := (pairScale_coeffM10D (word_pairScaleM10D w) j).2
 simpa only [swapPairM10D,rawPair_matrixM10D,←rawWord_expand80] using h

theorem raw_word_highM10D (w : List Bool) (j : ℕ) (hj : w.length≤2*j) :
 (hstateM10D (false::w)).2.coeff j=
 (X+1)^(2*j-w.length)*(Bivariate.swap (rawWord80 (false::w)).b).coeff j := by
 have h := pairScale_highM10D (word_pairScaleM10D w) j hj
 simpa only [swapPairM10D,rawPair_matrixM10D,←rawWord_expand80] using h

theorem raw_word_lowM10D (w : List Bool) (j : ℕ) (hj : 2*j≤w.length) :
 (Bivariate.swap (rawWord80 (false::w)).b).coeff j=
 (X+1)^(w.length-2*j)*(hstateM10D (false::w)).2.coeff j := by
 have h := pairScale_lowM10D (word_pairScaleM10D w) j hj
 simpa only [swapPairM10D,rawPair_matrixM10D,←rawWord_expand80] using h

end
end MathGKM.Markov
