"""Codex/Astra 2026-10-13. Restricted proof-term admission, never arbitrary Lean text.

The small AST is deliberately extensible only through reviewed code changes.
Kernel elaboration plus a separate leanchecker process validates each proof.
leanchecker shares Lean's kernel; it is not an independent kernel implementation.
Receipts are evidence records, not bearer credentials. Consumers recheck inputs.
"""
from __future__ import annotations
import hashlib
import json
import re
import tempfile
from . import trust
from .process import run
from pathlib import Path
from .toolchain import ROOT, BUILD, invoke, compile_module, replay


class Rejected(ValueError):
    pass


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def digest(value):
    return hashlib.sha256(canonical(value).encode()).hexdigest()


def file_digest(path):
    from .study_common import sha
    return sha(path)


def bounded(tree):
    if len(canonical(tree)) > 24000:
        raise Rejected("proposal too large")
    def walk(x, depth=0):
        if depth > 64:
            raise Rejected("proposal too deep")
        if isinstance(x, list):
            for y in x:
                walk(y, depth + 1)
    walk(tree)


def nat_expr(x, variables):
    if type(x) is int and 0 <= x <= 1000000:
        return str(x)
    if isinstance(x, list) and len(x) == 2 and x[0] == "natvar":
        k = x[1]
        if type(k) is int and 0 <= k < len(variables):
            return variables[-1-k]
    raise Rejected("invalid natural expression")


def proposition(p, variables=()):
    if p == "true":
        return "True"
    if p == "false":
        return "False"
    if not isinstance(p, list) or not p:
        raise Rejected("invalid proposition")
    tag, *xs = p
    if tag in ("and", "implies") and len(xs) == 2:
        op = "∧" if tag == "and" else "→"
        return f"({proposition(xs[0], variables)} {op} {proposition(xs[1], variables)})"
    if tag == "not" and len(xs) == 1:
        return f"(¬ {proposition(xs[0], variables)})"
    if tag == "eqNat" and len(xs) == 2:
        return f"(({nat_expr(xs[0], variables)} : Nat) = {nat_expr(xs[1], variables)})"
    if tag == "forallNat" and len(xs) == 1:
        name = f"n{len(variables)}"
        return f"(∀ {name} : Nat, {proposition(xs[0], variables + (name,))})"
    raise Rejected("unknown proposition constructor")


def proof_term(t, bound=()):
    if t == "trivial":
        return "True.intro"
    if t == "rfl":
        return "rfl"
    if not isinstance(t, list) or not t:
        raise Rejected("invalid proof expression")
    tag, *xs = t
    if tag == "var" and len(xs) == 1 and type(xs[0]) is int:
        if 0 <= xs[0] < len(bound):
            return bound[-1-xs[0]]
    if tag == "intro" and len(xs) == 1:
        name = f"h{len(bound)}"
        return f"(fun {name} => {proof_term(xs[0], bound + (name,))})"
    if tag == "as" and len(xs) == 2:
        return f"(show {proposition(xs[0])} from {proof_term(xs[1], bound)})"
    if tag in ("pair", "apply") and len(xs) == 2:
        a, b = (proof_term(x, bound) for x in xs)
        return f"(And.intro {a} {b})" if tag == "pair" else f"({a} {b})"
    if tag in ("left", "right", "absurd") and len(xs) == 1:
        name = {"left": "And.left", "right": "And.right", "absurd": "False.elim"}[tag]
        return f"({name} {proof_term(xs[0], bound)})"
    raise Rejected("unknown or unbound proof constructor")


class ProofGate:
    """Exact-target gate. The caller owns the contract, the proposal cannot edit it."""
    def __init__(self, contract):
        self.contract = json.loads(canonical(contract))

    def check(self, target, proof, dependencies=()):
        bounded(target)
        bounded(proof)
        # This initial language has no external theorem references at all.
        if dependencies:
            raise Rejected("external dependencies not supported by this gate version")
        formula = proposition(target)
        term = proof_term(proof)
        identity = digest({"target": target, "proof": proof})
        directory = Path(tempfile.mkdtemp(prefix="gate-", dir=ROOT / ".scratch"))
        path = directory / "GateProof.lean"
        source = ("-- Machine-generated closed AST, provisional boundary check.\n"
                  "import Lean\n"
                  f"theorem accepted : {formula} := {term}\n"
                  "open Lean Elab Command in\n"
                  "run_cmd do\n"
                  "  unless (← collectAxioms ``accepted).isEmpty do\n"
                  "    throwError \"nonempty axiom dependencies\"\n")
        path.write_text(source)
        binary_hashes = {str(p): trust.sha(p) for p in (trust.LEAN, trust.CHECKER)}
        # No writable import directory during elaboration. Core precedes the
        # isolated output directory during replay; only GateProof is produced.
        elaboration = run([str(trust.LEAN), "-o", "GateProof.olean", "GateProof.lean"],
                          cwd=directory, env=trust.environment([trust.CORE]), timeout=120)
        if elaboration["returncode"] != 0 or elaboration["termination"]:
            raise Rejected("kernel elaboration failed: " + elaboration["stdout"])
        allowed = {"GateProof.lean", "GateProof.olean", "GateProof.olean.private",
                   "GateProof.olean.server", "GateProof.ilean"}
        if any(p.is_symlink() or p.name not in allowed for p in directory.iterdir()):
            raise Rejected("unexpected import artifact")
        checked = run([str(trust.CHECKER), "GateProof"], cwd=directory,
                      env=trust.environment([trust.CORE, directory]), timeout=120)
        if checked["returncode"] != 0 or checked["termination"]:
            raise Rejected("kernel replay failed")
        if path.read_text() != source or any(trust.sha(Path(p)) != h for p, h in binary_hashes.items()):
            raise Rejected("changed source or executable during check")
        return {"kind": "bootstrap_check_candidate", "authoritative": False,
                "boundary_status": "supervisor_freeze_and_validation_pending",
                "target": json.loads(canonical(target)), "proof": json.loads(canonical(proof)),
                "dependencies": [], "axioms": [], "contract_hash": digest(self.contract),
                "source": str(path.relative_to(ROOT)), "source_hash": file_digest(path),
                "olean_hash": file_digest(directory / "GateProof.olean"),
                "binary_hashes": binary_hashes, "trusted_import_root": str(trust.CORE),
                "checks": [elaboration, checked], "historical_novelty": "not_assessed",
                "usefulness": "not_assessed"}

    def close_root(self, target, proof, polarity="proof"):
        if polarity not in ("proof", "refutation"):
            raise Rejected("invalid resolution polarity")
        exact = self.contract["root"]
        if polarity == "refutation":
            exact = ["not", exact]
        if target != exact:
            raise Rejected("not the exact contract root or its negation")
        receipt = self.check(target, proof)
        receipt["resolution_attempt"] = polarity
        receipt["root_closed"] = False
        return receipt

    def recheck(self, receipt):
        if receipt.get("contract_hash") != digest(self.contract):
            raise Rejected("receipt contract mismatch")
        new = self.check(receipt["target"], receipt["proof"], receipt["dependencies"])
        for key in ("source_hash", "olean_hash", "axioms"):
            if new[key] != receipt.get(key):
                raise Rejected("receipt binding mismatch: " + key)
        return new


def check_graph(cells, accepted=()):
    """Structural filter only. Does not certify semantic conservativity."""
    ids = [c["id"] for c in cells]
    if len(set(ids)) != len(ids) or set(ids) & set(accepted):
        raise Rejected("conflicting binding")
    by_id = {c["id"]: c for c in cells}
    done, active = set(accepted), set()
    def visit(name):
        if name in done:
            return
        if name in active:
            raise Rejected("circular dependency")
        if name not in by_id:
            raise Rejected("missing dependency")
        c = by_id[name]
        if set(c["used"]) != set(c["dependencies"]):
            raise Rejected("omitted or spurious dependency")
        if c.get("assumptions"):
            raise Rejected("unproved assumption")
        active.add(name)
        for dep in c["dependencies"]:
            visit(dep)
        active.remove(name)
        done.add(name)
    for name in ids:
        visit(name)
    return sorted(done)
