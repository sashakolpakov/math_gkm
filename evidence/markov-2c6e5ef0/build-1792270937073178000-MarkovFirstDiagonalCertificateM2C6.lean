import MarkovUpperEdgesM9F23
/-! Machine-authored 2c6e5ef0. Two upper-entry diagonal rows, both residues;
certificates are polynomial identities in an unbounded natural parameter. -/
namespace MathGKM.Markov
open Polynomial
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def firstGapExprM2C6 (s r : Bool) : PolyExprM6C0 :=
 let z : ℕ := if s then 1 else 0
 let d : ℕ := if r then 1 else 2
 let a := PolyExprM6C0.c (4*(d+3-3*z))
 let b := .c 4 *ₑ (.x +ₑ .c (7+z)) *ₑ chooseExprM6C0 (.x +ₑ .c (9+d-2*z)) 2
 let c := chooseExprM6C0 (.c 2 *ₑ .x +ₑ .c (16+d-z)) 3 +ₑ .c 4 *ₑ
   (chooseExprM6C0 (.c 2 *ₑ .x +ₑ .c (17+d-z)) 5 +ₑ
    .c (-1) *ₑ chooseExprM6C0 (.x +ₑ .c (10+d-2*z)) 5 +ₑ
    .c (-1) *ₑ (.x +ₑ .c (7+z)) *ₑ chooseExprM6C0 (.x +ₑ .c (9+d-2*z)) 4)
 b *ₑ b +ₑ .c (-1) *ₑ (a *ₑ c)

set_option maxHeartbeats 400000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem first_gap_signsM2C6 (s r : Bool) :
 denseNonnegM6C0 (exprDenseM6C0 (firstGapExprM2C6 s r)) := by
 cases s <;> cases r <;> decide +kernel

end MathGKM.Markov
