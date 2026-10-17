import MarkovVerticalMassM9C28
import MarkovVerticalBoundaryM9C28
import MarkovThreeCertificateMBEB
/-! Machine-authored request 9c28b628. Universal polynomial evaluator bridges.
A sign certificate is a separate obligation, not assumed in these identities. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def vLowExprM9C28 (c : ℕ) (r : Bool) (t : ℕ) : PolyExprM6C0 :=
 let d := PolyExprM6C0.k +ₑ .c ((c+4-2*t:ℕ):ℚ)
 let j := .c 3 *ₑ PolyExprM6C0.x +ₑ .k +ₑ .c (c+(if r then 7 else 6)+t)
 liftExprMBEB d j (c+1) +ₑ .c 4 *ₑ
   affineExprMBEB (if r then 2 else 1) (c+3) (c+2) (.x +ₑ .c t) d
def vUpperExprM9C28 (c : ℕ) (r : Bool) (t : ℕ) : PolyExprM6C0 :=
 let H := PolyExprM6C0.k +ₑ .c (c+2+2*t)
 let T := .c 3 *ₑ PolyExprM6C0.x +ₑ .k +ₑ .c ((2*c+(if r then 12 else 11)-t:ℕ):ℚ)
 shortExprGeneralMBEB H T (c+1) +ₑ .c 4 *ₑ
   affineExprMBEB (if r then 2 else 1) (c+2) (c+3) (.x +ₑ .c (2-t:ℕ)) H

theorem vlow_expr_natM9C28 (c x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 exprEvalM6C0 x h (vLowExprM9C28 c r t)=(vLowMassM9C28 c x h t r:ℚ) := by
 have hd : c+h+4-2*t=h+(c+4-2*t) := by omega
 unfold vLowExprM9C28
 simp only [exprEvalM6C0]
 rw [lift_expr_natMBEB _ _ (c+h+4-2*t) (lowJM9C28 c x h r+t) (c+1) _ _
     (by simp [exprEvalM6C0,hd]) (by cases r <;> simp [exprEvalM6C0,lowJM9C28] <;> ring),
   affine_expr_natMBEB _ _ _ _ _ (x+t) (c+h+4-2*t) _ _
     (by simp [exprEvalM6C0]) (by simp [exprEvalM6C0,hd])]
 simp only [vLowMassM9C28,Int.cast_add,Int.cast_mul,Int.cast_ofNat]

theorem vupper_expr_natM9C28 (c x h t : ℕ) (r : Bool) (ht : t ≤ 2) :
 exprEvalM6C0 x h (vUpperExprM9C28 c r t)=(vUpperMassM9C28 c x h t r:ℚ) := by
 have hT : vUpperKM9C28 c x h r+c+1-t=3*x+h+(2*c+(if r then 12 else 11)-t) := by
   cases r <;> simp [vUpperKM9C28] <;> omega
 have hJ : x+2-t=x+(2-t) := by omega
 unfold vUpperExprM9C28
 simp only [exprEvalM6C0]
 rw [short_general_natMBEB _ _ (c+h+2+2*t) (vUpperKM9C28 c x h r+c+1-t) (c+1) _ _
     (by simp [exprEvalM6C0]; ring) (by simp [exprEvalM6C0,hT]),
   affine_expr_natMBEB _ _ _ _ _ (x+2-t) (c+h+2+2*t) _ _
     (by simp [exprEvalM6C0,hJ]) (by simp [exprEvalM6C0]; ring)]
 simp only [vUpperMassM9C28,Int.cast_add,Int.cast_mul,Int.cast_ofNat]

def vEntryCorrectionExprM9C28 (c t : ℕ) (s r : Bool) : PolyExprM6C0 :=
 if s then
  if t=1 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (c+3) (c+2) (.c 0) (.x +ₑ .c (c+3))
  else if t=2 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (c+3) (c+2) (.c 1) (.x +ₑ .c (c+1))
  else .c 0
 else if t=2 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (c+3) (c+2) (.c 0) (.x +ₑ .c (c+2)) else .c 0
def vExitCorrectionExprM9C28 (c t : ℕ) (s r : Bool) : PolyExprM6C0 :=
 if s then
  if t=0 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (c+2) (c+3) (.c 1) (.x +ₑ .c (c+2))
  else if t=1 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (c+2) (c+3) (.c 0) (.x +ₑ .c (c+4))
  else .c 0
 else if t=0 then .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (c+2) (c+3) (.c 0) (.x +ₑ .c (c+3)) else .c 0
def vEntryExprM9C28 (c : ℕ) (s r : Bool) (t : ℕ) : PolyExprM6C0 :=
 liftExprMBEB (.x +ₑ .c ((c+(if s then 5 else 6)-2*t:ℕ):ℚ))
   (.x +ₑ .c (c+(if s then (if r then 5 else 4) else (if r then 3 else 2))+t)) (c+1) +ₑ
 vEntryCorrectionExprM9C28 c t s r
def vExitExprM9C28 (c : ℕ) (s r : Bool) (t : ℕ) : PolyExprM6C0 :=
 shortExprGeneralMBEB (.x +ₑ .c (c+(if s then 2 else 3)+2*t))
   (.x +ₑ .c ((2*c+(if s then (if r then 9 else 8) else (if r then 7 else 6))-t:ℕ):ℚ)) (c+1) +ₑ
 vExitCorrectionExprM9C28 c t s r

theorem ventry_correction_exprM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 exprEvalM6C0 n 0 (vEntryCorrectionExprM9C28 c t s r)=(vEntryCorrectionM9C28 c n t s r:ℚ) := by
 cases s <;> interval_cases t
 all_goals norm_num only [vEntryCorrectionExprM9C28,vEntryCorrectionM9C28,Bool.false_eq_true,
   if_true,if_false,Nat.reduceEqDiff,exprEvalM6C0,Int.cast_zero,Int.cast_mul,Int.cast_ofNat]
 all_goals congr 1
 all_goals apply affine_expr_natMBEB <;> simp [exprEvalM6C0] <;> ring

theorem vexit_correction_exprM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 exprEvalM6C0 n 0 (vExitCorrectionExprM9C28 c t s r)=(vExitCorrectionM9C28 c n t s r:ℚ) := by
 cases s <;> interval_cases t
 all_goals norm_num only [vExitCorrectionExprM9C28,vExitCorrectionM9C28,Bool.false_eq_true,
   if_true,if_false,Nat.reduceEqDiff,exprEvalM6C0,Int.cast_zero,Int.cast_mul,Int.cast_ofNat]
 all_goals congr 1
 all_goals apply affine_expr_natMBEB <;> simp [exprEvalM6C0] <;> ring

theorem ventry_expr_natM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 exprEvalM6C0 n 0 (vEntryExprM9C28 c s r t)=(vEntryMassM9C28 c n t s r:ℚ) := by
 have hd : c+n+(if s then 5 else 6)-2*t=n+(c+(if s then 5 else 6)-2*t) := by cases s <;> simp <;> omega
 unfold vEntryExprM9C28
 rw [exprEvalM6C0,ventry_correction_exprM9C28 c n t s r ht,
   lift_expr_natMBEB _ _ (c+n+(if s then 5 else 6)-2*t) (vEntryJM9C28 c n s r+t) (c+1) _ _
     (by simp [exprEvalM6C0,hd]) (by cases s <;> cases r <;> simp [exprEvalM6C0,vEntryJM9C28] <;> ring)]
 simp only [vEntryMassM9C28,Int.cast_add]

theorem vexit_expr_natM9C28 (c n t : ℕ) (s r : Bool) (ht : t ≤ 2) :
 exprEvalM6C0 n 0 (vExitExprM9C28 c s r t)=(vExitMassM9C28 c n t s r:ℚ) := by
 have hT : vExitQM9C28 c n s r+c+(if s then 4 else 3)-t=
   n+(2*c+(if s then (if r then 9 else 8) else (if r then 7 else 6))-t) := by
   cases s <;> cases r <;> simp [vExitQM9C28] <;> omega
 unfold vExitExprM9C28
 rw [exprEvalM6C0,vexit_correction_exprM9C28 c n t s r ht,
   short_general_natMBEB _ _ (n+c+(if s then 2 else 3)+2*t)
    (vExitQM9C28 c n s r+c+(if s then 4 else 3)-t) (c+1) _ _
     (by simp [exprEvalM6C0]; ring) (by simp [exprEvalM6C0,hT])]
 simp only [vExitMassM9C28,Int.cast_add]

def vGapExprM9C28 (c : ℕ) (upper r : Bool) : PolyExprM6C0 :=
 let f := if upper then vUpperExprM9C28 c r else vLowExprM9C28 c r
 f 1 *ₑ f 1 +ₑ .c (-1) *ₑ (f 0 *ₑ f 2)
def vBoundaryGapExprM9C28 (c : ℕ) (exit s r : Bool) : PolyExprM6C0 :=
 let f := if exit then vExitExprM9C28 c s r else vEntryExprM9C28 c s r
 f 1 *ₑ f 1 +ₑ .c (-1) *ₑ (f 0 *ₑ f 2)

end MathGKM.Markov
