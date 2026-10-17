import StudyCheck
import Lean
open Lean Elab Command in
run_cmd do
  let env ← getEnv
  let mut rows : Array Json := #[]
  let mut catalog : Array Json := #[]
  for (n, info) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? n then
      let origin := env.header.moduleNames[idx]!
      if ([`MathGKM.Accepted30a816954581ff493dbc79e1, `MathGKM.Accepted4782fa9e1118d42efd314631, `MathGKM.Accepted850eb30550d569e2c57c5846, `MathGKM.Accepted9538b98425c4a113da28508c, `MathGKM.ContinuationObligations, `MathGKM.HarnessFixture, `MathGKM.Protocol, `MathGKM.ResearchSemantics, `MathGKM.Target0a44a09250b3acffceb0a603, `MathGKM.Target76ccf46e11e578b80a63e491, `MathGKM.Target9f0559c601a2a45c01e8bc86, `MathGKM.Targetd08a11c29060ec725c6f074f] : List Name).contains origin then
        catalog := catalog.push (Json.mkObj [
          ("name", toJson (toString n)), ("origin", toJson (toString origin)),
          ("type", toJson (reprStr info.type)),
          ("body", toJson (reprStr (info.value? (allowOpaque := true))))])
  for root in ([`StudyObligation, `StudyInterface, `StudyTransport] : List Name) do
    let some ci := env.checked.get.find? root | throwError "missing checked declaration {root}"
    if (ci.value? (allowOpaque := true)).isNone then
      throwError "checked declaration has no body {root}"
    let mut axioms : List Name := []
    let mut todo := [root]
    let mut seen : List Name := []
    let mut constants : Array Json := #[]
    let mut fuel := 200000
    while !todo.isEmpty && fuel > 0 do
      fuel := fuel - 1
      let n := todo.head!
      todo := todo.tail!
      if !seen.contains n then
        seen := n :: seen
        let some info := env.checked.get.find? n | throwError "unknown dependency {n}"
        match info with
        | .axiomInfo _ =>
          unless [``propext, ``Classical.choice, ``Quot.sound].contains n do
            throwError "unpermitted premise {n} of {root}"
          axioms := n :: axioms
        | .inductInfo v => todo := v.ctors ++ todo
        | _ => pure ()
        todo := info.type.getUsedConstants.toList ++ todo
        if let some body := info.value? (allowOpaque := true) then
          todo := body.getUsedConstants.toList ++ todo
        let origin := match env.getModuleIdxFor? n with
          | none => "local"
          | some idx => toString env.header.moduleNames[idx]!
        if origin.startsWith "MathGKM." || n == root || origin == "StudyCheck" then
          constants := constants.push (Json.mkObj [
            ("name", toJson (toString n)), ("origin", toJson origin),
            ("type", toJson (reprStr info.type)),
            ("body", toJson (reprStr (info.value? (allowOpaque := true))))])
    if fuel == 0 then throwError "dependency traversal exhausted"
    if root == `StudyObligation then
      for n in ([] : List Name) do
        unless seen.contains n do throwError "consumer does not use {n}"
    rows := rows.push (Json.mkObj [("name", toJson (toString root)),
      ("axioms", toJson (axioms.map toString)), ("constants", toJson constants),
      ("catalog", if root == `StudyObligation then Json.arr catalog else Json.arr #[])])
  liftIO <| IO.println ("GKM_DECLARATIONS_V1:" ++ (Json.arr rows).compress)
