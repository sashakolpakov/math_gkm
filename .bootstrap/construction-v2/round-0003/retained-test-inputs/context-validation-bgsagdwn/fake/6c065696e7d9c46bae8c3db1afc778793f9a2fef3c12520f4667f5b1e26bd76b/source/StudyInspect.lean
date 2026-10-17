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
      if ([`MathGKM.HarnessFixture, `MathGKM.Protocol, `MathGKM.ResearchSemantics, `MathGKM.Target32ba58c788a1dba172cfa3ef, `MathGKM.Original, `MathGKM.ContinuationObligations, `MathGKM.Counterfeit, `MathGKM.Acceptedc0c6e175cfed4a9ebc71832b] : List Name).contains origin then
        catalog := catalog.push (Json.mkObj [
          ("name", toJson (toString n)), ("origin", toJson (toString origin)),
          ("type", toJson ((repr info.type).pretty 100000000)),
          ("body", toJson ((repr (info.value? (allowOpaque := true))).pretty 100000000))])
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
            ("type", toJson ((repr info.type).pretty 100000000)),
            ("body", toJson ((repr (info.value? (allowOpaque := true))).pretty 100000000))])
    if fuel == 0 then throwError "dependency traversal exhausted"
    if root == `StudyObligation then
      for n in ([] : List Name) do
        unless seen.contains n do throwError "consumer does not use {n}"
    rows := rows.push (Json.mkObj [("name", toJson (toString root)),
      ("axioms", toJson (axioms.map toString)), ("constants", toJson constants),
      ("catalog", if root == `StudyObligation then Json.arr catalog else Json.arr #[])])
  liftIO <| IO.FS.writeFile "declarations.json" (Json.arr rows).compress
  liftIO <| IO.println "GKM_DECLARATIONS_FILE_V1:declarations.json"
