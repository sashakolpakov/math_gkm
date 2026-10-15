import Lean.CoreM
import Lean.Replay
/-! Machine-authored operational driver, not a mathematical module.
The replay body is the pinned LeanChecker.replayFromImports implementation.
Only module discovery is replaced by explicit module arguments, avoiding a
recursive search through every inherited compiled-import directory. -/
open Lean
unsafe def replayKnown6d (module : Name) : IO Unit := do
  let mFile ← findOLean module
  unless (← mFile.pathExists) do
    throw <| IO.userError s!"object file '{mFile}' of module {module} does not exist"
  let mut fnames := #[mFile]
  let sFile := OLeanLevel.server.adjustFileName mFile
  if (← sFile.pathExists) then
    fnames := fnames.push sFile
    let pFile := OLeanLevel.private.adjustFileName mFile
    if (← pFile.pathExists) then fnames := fnames.push pFile
  let parts ← readModuleDataParts fnames
  if h : parts.size = 0 then throw <| IO.userError "failed to read module data" else
  let (mod, _) := parts[0]
  let (_, s) ← importModulesCore mod.imports |>.run
  let env ← finalizeImport s mod.imports {} 0 false false (isModule := true)
  let mut newConstants := {}
  for name in parts[parts.size-1].1.constNames, ci in parts[parts.size-1].1.constants do
    newConstants := newConstants.insert name ci
  let env' ← env.replay newConstants
  env'.freeRegions
unsafe def main (args : List String) : IO Unit := do
  initSearchPath (← findSysroot)
  for arg in args do
    IO.println s!"replay begin {arg}"
    replayKnown6d arg.toName
    IO.println s!"replay passed {arg}"
