"""Machine-authored premise/declaration inspector, construction 2026-10-17.

The trusted source is generated outside proposal text and run in a fresh process
AFTER rebuilding and replaying the candidate objects. Printed `#print axioms`
messages are diagnostics only and NEVER authorize admission. General Lean
elaborators still require OS isolation and a protected validator deployment.
"""
import json
from .study_common import Invalid, digest

MARKER = 'GKM_DECLARATIONS_V1:'


def inspector(module, declarations, required=(), catalog_modules=()):
    from .completion import NAME
    if not NAME.fullmatch(module) or not all(NAME.fullmatch(n) for n in (*declarations, *required)):
        raise Invalid('invalid inspector declaration')
    names = ', '.join('`'+n for n in declarations)
    required_names = ', '.join('`'+n for n in required)
    catalog = ', '.join('`'+n for n in catalog_modules)
    # Both types and values are traversed. No source/module-size proxy is used
    # to determine whether the consumer used new mathematical declarations.
    return f'''import {module}
import Lean
open Lean Elab Command in
run_cmd do
  let env ← getEnv
  let mut rows : Array Json := #[]
  let mut catalog : Array Json := #[]
  for (n, info) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? n then
      let origin := env.header.moduleNames[idx]!
      if ([{catalog}] : List Name).contains origin then
        catalog := catalog.push (Json.mkObj [
          ("name", toJson (toString n)), ("origin", toJson (toString origin)),
          ("type", toJson (reprStr info.type)),
          ("body", toJson (reprStr (info.value? (allowOpaque := true))))])
  for root in ([{names}] : List Name) do
    let some ci := env.checked.get.find? root | throwError "missing checked declaration {{root}}"
    if (ci.value? (allowOpaque := true)).isNone then
      throwError "checked declaration has no body {{root}}"
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
        let some info := env.checked.get.find? n | throwError "unknown dependency {{n}}"
        match info with
        | .axiomInfo _ =>
          unless [``propext, ``Classical.choice, ``Quot.sound].contains n do
            throwError "unpermitted premise {{n}} of {{root}}"
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
    if root == `{declarations[0]} then
      for n in ([{required_names}] : List Name) do
        unless seen.contains n do throwError "consumer does not use {{n}}"
    rows := rows.push (Json.mkObj [("name", toJson (toString root)),
      ("axioms", toJson (axioms.map toString)), ("constants", toJson constants),
      ("catalog", if root == `{declarations[0]} then Json.arr catalog else Json.arr #[])])
  liftIO <| IO.println ("{MARKER}" ++ (Json.arr rows).compress)
'''


def parse(record, declarations):
    if record['returncode'] or record['termination']:
        raise Invalid('trusted premise inspector failed')
    rows = [s[len(MARKER):] for s in record['stdout'].splitlines() if s.startswith(MARKER)]
    if len(rows) != 1:
        raise Invalid('missing or ambiguous inspector output')
    try:
        data = json.loads(rows[0])
        if [d['name'] for d in data] != list(declarations):
            raise Invalid('inspected declaration mismatch')
        for d in data:
            if not set(d['axioms']) <= {'propext', 'Classical.choice', 'Quot.sound'}:
                raise Invalid('unpermitted inspected premises')
            for c in d['constants'] + d.get('catalog', []):
                c['semantic_sha256'] = digest({'type': c['type'], 'body': c['body']})
        return data
    except (ValueError, KeyError, TypeError) as exc:
        raise Invalid('malformed inspector output') from exc


def used_versions(declarations, frozen_files):
    """Bind the ACTUAL transitive closure to frozen source and expression bodies."""
    result = {}
    for c in declarations[0]['constants']:
        path = c['origin'].replace('.', '/')+'.lean'
        if path in frozen_files:
            result[c['name']] = {'module': c['origin'], 'source_sha256': frozen_files[path],
                                 'semantic_sha256': c['semantic_sha256']}
    return result
