import MarkovCrossMassMBEB
import MarkovThreeCertificateMBEB
/-! Machine-authored bebe7940. Exact polynomial gap certificates at both
correction-entry rows; all q in their support, both residues. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def crossCorrectionExprMBEB (t : ℕ) (s r : Bool) : PolyExprM6C0 :=
 if s then
   if t=0 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) 2 1 (.c 1) .x
   else if t=1 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) 3 2 (.c 0) (.x +ₑ .c 2)
   else .c 0
 else if t=0 then .c (4*(if r then 2 else 1)) *ₑ (.x +ₑ .c 1) else .c 0
def crossExprMBEB (t : ℕ) (s r : Bool) : PolyExprM6C0 :=
 let j := PolyExprM6C0.x +ₑ .c (if s then (if r then 4 else 3) else (if r then 2 else 1))
 liftExprMBEB (.x +ₑ .c ((if s then 0 else 1)+2*t)) (j +ₑ .c ((2-t:ℕ):ℚ)) t +ₑ
 crossCorrectionExprMBEB t s r

theorem cross_correction_expr_natMBEB (n t : ℕ) (s r : Bool) :
 exprEvalM6C0 n 0 (crossCorrectionExprMBEB t s r)=(crossCorrectionMBEB n t s r:ℚ) := by
 have h0 (e : ℕ) : exprEvalM6C0 (n:ℚ) 0 (affineExprMBEB e 2 1 (.c 1) .x)=
   (affineIntMBEB e 2 1 1 n:ℚ) :=
   affine_expr_natMBEB (n:ℚ) 0 e 2 1 1 n (.c 1) .x (by norm_num [exprEvalM6C0]) rfl
 have h1 (e : ℕ) : exprEvalM6C0 (n:ℚ) 0 (affineExprMBEB e 3 2 (.c 0) (.x +ₑ .c 2))=
   (affineIntMBEB e 3 2 0 (n+2):ℚ) :=
   affine_expr_natMBEB (n:ℚ) 0 e 3 2 0 (n+2) (.c 0) (.x +ₑ .c 2)
     (by norm_num [exprEvalM6C0]) (by simp [exprEvalM6C0])
 cases s <;> cases r <;> by_cases ht0 : t=0 <;> by_cases ht1 : t=1
 all_goals simp [crossCorrectionExprMBEB,crossCorrectionMBEB,ht0,ht1,exprEvalM6C0,h0,h1]
 all_goals ring
 all_goals simp

theorem cross_expr_natMBEB (n t : ℕ) (s r : Bool) :
 exprEvalM6C0 n 0 (crossExprMBEB t s r)=(crossMassMBEB n t s r:ℚ) := by
 unfold crossExprMBEB
 simp only [exprEvalM6C0,cross_correction_expr_natMBEB]
 rw [lift_expr_natMBEB _ _ (n+(if s then 0 else 1)+2*t) (crossJMBEB n s r+(2-t)) t _ _
   (by cases s <;> simp [exprEvalM6C0] <;> ring)
   (by cases s <;> cases r <;> simp [exprEvalM6C0,crossJMBEB])]
 simp only [crossMassMBEB,Int.cast_add]

def crossGapExprMBEB (s r : Bool) : PolyExprM6C0 :=
 crossExprMBEB 1 s r *ₑ crossExprMBEB 1 s r +ₑ
 .c (-1) *ₑ (crossExprMBEB 0 s r *ₑ crossExprMBEB 2 s r)

set_option maxHeartbeats 400000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem cross_gap_certificatesMBEB :
 denseNonnegM6C0 (exprDenseM6C0 (crossGapExprMBEB false false)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (crossGapExprMBEB false true)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (crossGapExprMBEB true false)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (crossGapExprMBEB true true)) := by decide +kernel

theorem cross_mass_lcMBEB (n : ℕ) (s r : Bool) :
 crossMassMBEB n 0 s r*crossMassMBEB n 2 s r ≤ crossMassMBEB n 1 s r^2 := by
 have hc : denseNonnegM6C0 (exprDenseM6C0 (crossGapExprMBEB s r)) := by
   cases s <;> cases r
   · exact cross_gap_certificatesMBEB.1
   · exact cross_gap_certificatesMBEB.2.1
   · exact cross_gap_certificatesMBEB.2.2.1
   · exact cross_gap_certificatesMBEB.2.2.2
 have he := expr_nonneg_certificateM6C0 _ hc (n:ℚ) 0 (by positivity) (by norm_num)
 simp only [crossGapExprMBEB,exprEvalM6C0,cross_expr_natMBEB] at he
 have hh : (crossMassMBEB n 0 s r:ℚ)*(crossMassMBEB n 2 s r:ℚ) ≤
   (crossMassMBEB n 1 s r:ℚ)^2 := by nlinarith only [he]
 exact_mod_cast hh

end MathGKM.Markov
