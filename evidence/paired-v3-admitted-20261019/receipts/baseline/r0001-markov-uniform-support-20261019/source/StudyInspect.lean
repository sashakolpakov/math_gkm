import StudyCheck
import Lean
import Lean.Meta.Sym.ExprPtr

namespace MathGKMTrustedInspection013
open Lean
private def j (xs : List Json) : Json := toJson xs
private def s (x : String) : Json := toJson x
private partial def nm : Name → Json
  | .anonymous => j [s "anonymous"]
  | .str p v => j [s "str", nm p, toJson v]
  | .num p v => j [s "num", nm p, toJson v]
private partial def lv : Level → Json
  | .zero => j [s "zero"]
  | .succ u => j [s "succ", lv u]
  | .max u v => j [s "max", lv u, lv v]
  | .imax u v => j [s "imax", lv u, lv v]
  | .param n => j [s "param", nm n]
  | .mvar n => j [s "mvar", nm n.name]
private def sub (v : Substring.Raw) : Json :=
  j [toJson v.str, toJson v.startPos.byteIdx, toJson v.stopPos.byteIdx]
private def si : SourceInfo → Json
  | .none => j [s "none"]
  | .original a b c d => j [s "original", sub a, toJson b.byteIdx, sub c, toJson d.byteIdx]
  | .synthetic a b c => j [s "synthetic", toJson a.byteIdx, toJson b.byteIdx, toJson c]
private def pre : Syntax.Preresolved → Json
  | .namespace n => j [s "namespace", nm n]
  | .decl n fs => j [s "decl", nm n, toJson fs]
private partial def syn : Syntax → Json
  | .missing => j [s "missing"]
  | .node i k as => j [s "node", si i, nm k, toJson (as.map syn)]
  | .atom i v => j [s "atom", si i, toJson v]
  | .ident i r v ps => j [s "ident", si i, sub r, nm v, toJson (ps.map pre)]
private def dv : DataValue → Json
  | .ofString v => j [s "string", toJson v]
  | .ofBool v => j [s "bool", toJson v]
  | .ofName v => j [s "name", nm v]
  | .ofNat v => j [s "nat", toJson v]
  | .ofInt v => j [s "int", toJson v]
  | .ofSyntax v => j [s "syntax", syn v]
private def bi : BinderInfo → Json
  | .default => s "default"
  | .implicit => s "implicit"
  | .strictImplicit => s "strictImplicit"
  | .instImplicit => s "instImplicit"
private def rotr (x : UInt32) (n : UInt32) : UInt32 :=
  (x >>> n) ||| (x <<< (32-n))
private def shaK : Array UInt32 := #[
  0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
  0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
  0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
  0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
  0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
  0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
  0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
  0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2]
private structure Sha where
  h : Array UInt32 := #[0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19]
  block : ByteArray := ByteArray.empty
private def shaBlock (h : Array UInt32) (block : ByteArray) : Array UInt32 := Id.run do
  let mut w : Array UInt32 := #[]
  for i in [:16] do
    let mut x : UInt32 := 0
    for j in [:4] do x := (x <<< 8) ||| block[i*4+j]!.toUInt32
    w := w.push x
  for i in [16:64] do
    let x := w[i-15]!
    let y := w[i-2]!
    w := w.push (w[i-16]! + ((rotr x 7) ^^^ (rotr x 18) ^^^ (x >>> 3)) +
      w[i-7]! + ((rotr y 17) ^^^ (rotr y 19) ^^^ (y >>> 10)))
  let mut a := h[0]!; let mut b := h[1]!; let mut c := h[2]!; let mut d := h[3]!
  let mut e := h[4]!; let mut f := h[5]!; let mut g := h[6]!; let mut z := h[7]!
  for i in [:64] do
    let t1 := z + ((rotr e 6) ^^^ (rotr e 11) ^^^ (rotr e 25)) +
      ((e &&& f) ^^^ ((~~~e) &&& g)) + shaK[i]! + w[i]!
    let t2 := ((rotr a 2) ^^^ (rotr a 13) ^^^ (rotr a 22)) +
      ((a &&& b) ^^^ (a &&& c) ^^^ (b &&& c))
    z := g; g := f; f := e; e := d+t1; d := c; c := b; b := a; a := t1+t2
  return (h.zip #[a,b,c,d,e,f,g,z]).map fun (x,y) => x+y
private def shaUpdate (st : Sha) (bytes : ByteArray) : Sha := Id.run do
  let mut st := st
  for byte in bytes do
    st := {st with block := st.block.push byte}
    if st.block.size == 64 then
      st := {h := shaBlock st.h st.block, block := ByteArray.empty}
  return st
private def shaFinish (st : Sha) (size : Nat) : String := Id.run do
  let mut tail := ByteArray.empty.push 128
  while (st.block.size + tail.size) % 64 != 56 do tail := tail.push 0
  for i in [:8] do tail := tail.push (UInt8.ofNat ((size*8 / 2^(8*(7-i))) % 256))
  let st := shaUpdate st tail
  let digits := "0123456789abcdef".toList.toArray
  let mut out := ""
  for x in st.h do
    for i in [:8] do
      out := out.push digits[(x.toNat / 2^(4*(7-i))) % 16]!
  return out

private structure Stream where
  handle : IO.FS.Handle
  nonce : String := ""
  bytes : Nat := 0
  sha : Sha := {}
  nodes : Nat := 0
  decls : Nat := 0
  cache : Std.HashMap Lean.Meta.Sym.ExprPtr Nat := {}
private abbrev M := StateRefT Stream IO
private def fail (category : String) (observed : Option Nat := none) (limit : Option Nat := none) : M α := do
  let st ← get
  let record := j [s "failure", s category, toJson st.nodes, toJson st.decls, toJson observed, toJson limit]
  let text := record.compress ++ "\n"
  if st.bytes + text.utf8ByteSize <= 33554432 then
    st.handle.putStr text
    st.handle.flush
  IO.println ("GKM_INSPECTION_FAILURE_V3:" ++ st.nonce ++ ":" ++ record.compress)
  throw <| IO.userError "trusted inspection did not complete"
private def emit (v : Json) : M Unit := do
  let text := v.compress ++ "\n"
  let st ← get
  if text.utf8ByteSize > 1048576 then fail "record_size_limit" (some text.utf8ByteSize) (some 1048576)
  if st.bytes + text.utf8ByteSize > 33554432 then fail "artifact_size_limit" (some (st.bytes + text.utf8ByteSize)) (some 33554432)
  st.handle.putStr text
  modify fun st => { st with bytes := st.bytes + text.utf8ByteSize, sha := shaUpdate st.sha text.toUTF8 }
private partial def expr (e : Expr) (depth : Nat := 0) : M Nat := do
  if depth > 4096 then fail "expression_depth_limit"
  let key : Lean.Meta.Sym.ExprPtr := {expr := e}
  if let some id := (← get).cache[key]? then return id
  let (tag, fields, children) ← match e with
    | .bvar n => pure ("bvar", j [toJson n], #[])
    | .fvar n => pure ("fvar", j [nm n.name], #[])
    | .mvar n => pure ("mvar", j [nm n.name], #[])
    | .sort u => pure ("sort", j [lv u], #[])
    | .const n us => pure ("const", j [nm n, toJson (us.map lv)], #[])
    | .app f a => pure ("app", j [], #[← expr f (depth+1), ← expr a (depth+1)])
    | .lam n t b i => pure ("lam", j [nm n, bi i], #[← expr t (depth+1), ← expr b (depth+1)])
    | .forallE n t b i => pure ("forallE", j [nm n, bi i], #[← expr t (depth+1), ← expr b (depth+1)])
    | .letE n t v b d => pure ("letE", j [nm n, toJson d], #[← expr t (depth+1), ← expr v (depth+1), ← expr b (depth+1)])
    | .lit (.natVal n) => pure ("nat", j [toJson n], #[])
    | .lit (.strVal v) => pure ("string", j [toJson v], #[])
    | .mdata d b => pure ("mdata", toJson (d.entries.map fun (n,v) => j [nm n, dv v]), #[← expr b (depth+1)])
    | .proj n i b => pure ("proj", j [nm n, toJson i], #[← expr b (depth+1)])
  let id := (← get).nodes
  if id >= 1000000 then fail "expression_node_limit"
  emit <| j [s "expr", toJson id, s tag, fields, toJson children]
  modify fun st => { st with nodes := id+1, cache := st.cache.insert key id }
  return id
private def kind : ConstantInfo → String
  | .axiomInfo _ => "axiom"
  | .defnInfo _ => "definition"
  | .thmInfo _ => "theorem"
  | .opaqueInfo _ => "opaque"
  | .quotInfo _ => "quotient"
  | .inductInfo _ => "inductive"
  | .ctorInfo _ => "constructor"
  | .recInfo _ => "recursor"
private def declaration (env : Environment) (n : Name) : M Unit := do
  let some info := env.checked.get.find? n | fail "unknown_dependency"
  let t ← expr info.type
  let b : Json ← match info.value? (allowOpaque := true) with
    | none => pure Json.null
    | some v => do
      let id ← expr v
      pure (toJson id)
  let origin := match env.getModuleIdxFor? n with
    | none => "local"
    | some idx => toString env.header.moduleNames[idx]!
  emit <| j [s "decl", toJson (toString n), toJson origin, s (kind info),
    toJson info.isUnsafe, toJson (info.levelParams.map nm), toJson t, b]
  modify fun st => {st with decls := st.decls+1}

open Lean Elab Command in
run_cmd do
  let env ← getEnv
  let handle ← IO.FS.Handle.mk "declarations.json" IO.FS.Mode.write
  let action : M Unit := do
    emit <| j [s "header", s "math-gkm.inspection-dag.v3", toJson ([s "StudyObligation", s "StudyInterface", s "StudyTransport"] : List Json)]
    let mut emitted : NameHashSet := {}
    let mut catalog : Array String := #[]
    for (n, _) in env.constants.toList do
      if let some idx := env.getModuleIdxFor? n then
        if ([`MathGKM.MarkovCoverageR0000, `MathGKM.Protocol, `MathGKM.Accepted8acfcca661d31b57110fe18a, `MathGKM.MarkovLiftR0001, `MathGKM.ResearchSemantics, `MathGKM.MarkovLiftUniqueR0001, `MathGKM.Target150943fbddb8d04d2074a5cf, `MathGKM.ContinuationObligations, `MathGKM.Accepted54255e349b93aabd9e655107, `MathGKM.Targete2acb94e473db39f8642f450, `MathGKM.MarkovHomogeneityR0001, `MathGKM.Markov] : List Name).contains env.header.moduleNames[idx]! then
          if catalog.size >= 200000 then fail "catalog_node_limit"
          declaration env n
          emitted := emitted.insert n
          catalog := catalog.push (toString n)
    emit <| j [s "catalog", toJson catalog]
    for root in ([`StudyObligation, `StudyInterface, `StudyTransport] : List Name) do
      let some ci := env.checked.get.find? root | fail "missing_root"
      if (ci.value? (allowOpaque := true)).isNone then fail "missing_body"
      let mut todo := #[root]
      let mut enqueued : NameHashSet := {}
      enqueued := enqueued.insert root
      let mut pos := 0
      let mut edges := 0
      let mut duplicates := 0
      let mut axioms : Array String := #[]
      let mut constants : Array String := #[]
      while pos < todo.size do
        let n := todo[pos]!
        pos := pos+1
        let some info := env.checked.get.find? n | fail "unknown_dependency"
        let mut deps := info.type.getUsedConstants.toList
        if let some body := info.value? (allowOpaque := true) then
          deps := deps ++ body.getUsedConstants.toList
        match info with
        | .axiomInfo _ =>
          unless [``propext, ``Classical.choice, ``Quot.sound].contains n do
            fail "forbidden_axiom"
          axioms := axioms.push (toString n)
        | .inductInfo v => deps := deps ++ v.ctors
        | _ => pure ()
        for dep in deps do
          if edges >= 200000 then fail "dependency_edge_limit"
          edges := edges+1
          if enqueued.contains dep then duplicates := duplicates+1
          else
            if todo.size >= 200000 then fail "dependency_node_limit"
            enqueued := enqueued.insert dep
            todo := todo.push dep
        let origin := match env.getModuleIdxFor? n with
          | none => "local"
          | some idx => toString env.header.moduleNames[idx]!
        if origin.startsWith "MathGKM." || n == root || origin == "StudyCheck" then
          if !emitted.contains n then
            if (← get).decls >= 200000 then fail "catalog_node_limit"
            declaration env n
            emitted := emitted.insert n
          constants := constants.push (toString n)
      if root == `StudyObligation then
        for n in ([] : List Name) do
          unless enqueued.contains n do fail "missing_required"
      emit <| j [s "root", toJson (toString root), toJson axioms, toJson constants,
        toJson pos, toJson edges, toJson duplicates]
    let st ← get
    emit <| j [s "end", toJson st.nodes, toJson st.decls, toJson (3 : Nat), toJson catalog.size]
  let (_, final) ← liftIO <| action.run {handle := handle, nonce := "6baed305d00a6953d823b45ca9d571013e0d0fc0291fce761b0b68a021158be8"}
  liftIO <| handle.flush
  liftIO <| IO.println ("GKM_DECLARATIONS_COMPLETE_V3:6baed305d00a6953d823b45ca9d571013e0d0fc0291fce761b0b68a021158be8:" ++ toString final.bytes ++ ":" ++ shaFinish final.sha final.bytes)
end MathGKMTrustedInspection013
