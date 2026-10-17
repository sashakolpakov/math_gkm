import MarkovDenseBooleanMC9F
import Lean
/-! Machine-authored c9f23b44. Data-only elaboration: JSON coefficient lists
become ordinary integer/list constructor terms. No proof is manufactured here.
The kernel still checks every arithmetic identity and every resulting term. -/
open Lean Elab Term
namespace MathGKM.Markov

def denseTypeExprMC9F : Nat → Expr
 | 0 => mkConst ``Int
 | n+1 => mkApp (mkConst ``List [levelZero]) (denseTypeExprMC9F n)

def denseDataExprMC9F : Nat → Json → Except String Expr
 | 0, j => return toExpr (← j.getInt?)
 | n+1, j => do
   let a ← j.getArr?
   let ty := denseTypeExprMC9F n
   let mut e := mkApp (mkConst ``List.nil [levelZero]) ty
   for k in a.reverse do
     let v ← denseDataExprMC9F n k
     e := mkApp3 (mkConst ``List.cons [levelZero]) ty v e
   return e

elab "dense_data% " n:num s:str : term => do
 let j ← ofExcept (Json.parse s.getString)
 ofExcept (denseDataExprMC9F n.getNat j)

end MathGKM.Markov
