import Lean.CoreM
import Lean.Replay
/-! Machine-authored operational checker. Replay the union of this run's
constants over only its inherited import boundary. No new-module constants
are admitted by import before replay. This is not a mathematical theorem. -/
open Lean
unsafe def replayIsolatedMF8F (args : List String) : IO Unit := do
  initSearchPath (← findSysroot)
  let names := args.map String.toName
  let mut imports : Array Import := #[]
  let mut newConstants := {}
  for name in names do
    let mFile ← findOLean name
    let mut fnames := #[mFile]
    let sFile := OLeanLevel.server.adjustFileName mFile
    if (← sFile.pathExists) then
      fnames := fnames.push sFile
      let pFile := OLeanLevel.private.adjustFileName mFile
      if (← pFile.pathExists) then fnames := fnames.push pFile
    let parts ← readModuleDataParts fnames
    if h : parts.size = 0 then throw <| IO.userError "empty module data" else
    let (mod, _) := parts[0]
    for imp in mod.imports do
      if !names.contains imp.module && !imports.any (fun i => i.module == imp.module) then
        imports := imports.push imp
    for n in parts[parts.size-1].1.constNames, ci in parts[parts.size-1].1.constants do
      newConstants := newConstants.insert n ci
    IO.println s!"collected {name}"
  let (_, s) ← importModulesCore imports |>.run
  let env ← finalizeImport s imports {} 0 false false (isModule := true)
  IO.println s!"replay union of {names.length} modules over {imports.size} inherited imports"
  let mut audited := 0
  for (n, ci) in newConstants.toList do
    if n.toString.startsWith "MathGKM.Markov." && (n.toString.endsWith "MF8F" || n.toString.endsWith "MF8F") then
      if (env.find? n).isSome then
        throw <| IO.userError s!"selected mathematical constant already imported: {n}"
      if ci.isUnsafe || ci.isPartial then
        throw <| IO.userError s!"unsafe or partial mathematical constant: {n}"
      audited := audited + 1
  IO.println s!"isolation checked for {audited} mathematical constants"
  let env' ← env.replay newConstants
  env'.freeRegions
  IO.println "replay union passed"

/- Run the unchanged kernel replay body on a joined Lean task with the requested thread stack. -/
unsafe def main (args : List String) : IO Unit := do
  let t ← IO.asTask (replayIsolatedMF8F args)
  IO.ofExcept t.get
