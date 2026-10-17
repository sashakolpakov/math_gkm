import MarkovExpressionM7A3
import Lean
/-! Machine-authored 7a344181. Data-only elaboration into ordinary expression
constructors. This proposes no proof and bypasses no kernel check. -/
open Lean Elab Term
namespace MathGKM.Markov

def expressionDataM7A3 : Nat → Json → Except String Expr
 | 0, j => return mkApp (mkConst ``NExprM7A3.c) (toExpr (← j.getNat?))
 | n+1, j => do
   if n ≥ 4 then throw "variable index exceeds four-variable certificate"
   let a ← j.getArr?
   let x := mkApp (mkConst ``NExprM7A3.x)
     (toExpr (⟨n % 4, Nat.mod_lt _ (by decide)⟩ : Fin 4))
   let mut e : Option Expr := none
   for k in a.reverse do
     let v ← expressionDataM7A3 n k
     e := some (match e with
       | none => v
       | some q => mkApp2 (mkConst ``NExprM7A3.add) v
           (mkApp2 (mkConst ``NExprM7A3.mul) x q))
   return e.getD (mkApp (mkConst ``NExprM7A3.c) (toExpr (0 : Nat)))

elab "nexpr_data% " n:num s:str : term => do
 let j ← ofExcept (Json.parse s.getString)
 ofExcept (expressionDataM7A3 n.getNat j)

end MathGKM.Markov
