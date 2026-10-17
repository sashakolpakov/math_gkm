"""Machine-authored guarded *experimental* profile installation.

The theorem proves a model comparison. The certified path is fail-closed until
a host-execution refinement and a justified cost/coupling interpretation exist.
Hashes and successful replay alone cannot discharge these missing obligations.
"""
from __future__ import annotations
import fcntl
import json
import time
import uuid
from pathlib import Path
from .gate import Rejected, canonical, digest, file_digest
from .toolchain import ROOT, compile_module, replay

BINDING_FILES = ["MISSION.md", "docs/DESIGN.md", "lean-toolchain", "lake-manifest.json",
                 "MathGKM/Machine.lean", "MathGKM/Driver.lean", "machinery/toolchain.py",
                 "machinery/gate.py", "machinery/switch.py", "machinery/broker.py",
                 "contracts/construction.json"]

REFERENCE_HASHES = {
    "MISSION.md": "9cfa1230bd2e0e92dfaec64f68ee72143dc1a17d1435d449cba0ff16da0ce727",
    "docs/DESIGN.md": "47ebe858b2d7b06a9ac29527d74a7d65d7c39f988c399537b8da38bd24ce7d15",
    "lean-toolchain": "2bdc48adfa58d0017e538a0ad117c5d73d35deec879978f909406a80c8037273",
    "lake-manifest.json": "b513f28de3996d022de1bad05cd06002dc5f21286f4cd26454fcfae26a745725"
}


def bindings():
    result = {p: file_digest(ROOT / p) for p in BINDING_FILES}
    if any(result[p] != expected for p, expected in REFERENCE_HASHES.items()):
        raise Rejected("immutable reference input changed")
    return result


class SwitchGate:
    def __init__(self, location):
        self.location = Path(location)
        self.location.mkdir(parents=True, exist_ok=True)
        self.current = self.location / "engine.json"
        if not self.current.exists():
            self.current.write_text(canonical({"engine": "reference", "generation": 0}) + "\n")

    def _check_model(self, horizon, overhead):
        if type(horizon) is not int or type(overhead) is not int:
            raise Rejected("invalid resource quantities")
        if not 0 <= overhead < horizon <= 10000:
            raise Rejected("no strict gain after all declared overhead")
        source = f"""-- Machine-generated concrete model certificate; Codex/Astra.
import MathGKM.Machine
import Lean
open MathGKM.Machine
theorem model_switch : ∀ (s : State) (env : Nat → Input),
    (run {horizon} .candidate s env).state = (run {horizon} .reference s env).state ∧
    {overhead} + (run {horizon} .candidate s env).cost <
      (run {horizon} .reference s env).cost := by
  intro s env
  exact concrete_switch {horizon} {overhead} s env (by decide)
#print axioms model_switch
open Lean Elab Command in
run_cmd do
  for ax in (← collectAxioms ``model_switch) do
    unless [``propext, ``Classical.choice, ``Quot.sound].contains ax do
      throwError "forbidden axiom in model certificate"
"""
        name = "SwitchChecks.C" + digest(source)
        path = ROOT / (name.replace(".", "/") + ".lean")
        path.parent.mkdir(exist_ok=True)
        path.write_text(source)
        # Rebuild the dependency from current bytes, not an arbitrary cached olean.
        records = [compile_module("MathGKM.Machine")]
        if records[-1]["returncode"] != 0:
            raise Rejected("model compilation failed")
        records.append(replay("MathGKM.Machine"))
        if records[-1]["returncode"] != 0:
            raise Rejected("model replay failed")
        records.append(compile_module(name))
        if records[-1]["returncode"] != 0:
            raise Rejected("certificate compilation failed")
        records.append(replay(name))
        if records[-1]["returncode"] != 0:
            raise Rejected("certificate replay failed")
        return {"module": name, "source_hash": file_digest(path), "records": records}

    def prepare(self, state, *, horizon, overhead, deadline_ns):
        if json.loads(self.current.read_text())["engine"] != "reference":
            raise Rejected("incumbent is not reference")
        snapshot = bindings()
        certificate = self._check_model(horizon, overhead)
        if snapshot != bindings():
            raise Rejected("code changed during checking")
        return {"status": "model_certificate_only", "nonce": uuid.uuid4().hex,
                "bindings": snapshot, "incumbent": file_digest(self.current),
                "candidate": {"engine": "candidate", "generation": 1},
                "state": digest(state), "migration": "identity-on-research-state",
                "model": "step-indexed-inputs-v1", "cost": "abstract-dispatch-v1",
                "horizon": horizon, "overhead": overhead, "deadline_ns": deadline_ns,
                "certificate": certificate,
                "bridge_status": "unproved-host-cost-and-coupling"}

    def install(self, receipt, state, *, certified=False):
        # Supplying a different bridge_status in a receipt cannot enable this path.
        if certified:
            raise Rejected("certified switch unavailable: execution bridge and cost proof missing")
        with (self.location / "install.lock").open("a+") as lock:
            fcntl.flock(lock, fcntl.LOCK_EX)
            used_path = self.location / "used.json"
            used = json.loads(used_path.read_text()) if used_path.exists() else []
            if receipt["nonce"] in used:
                raise Rejected("replayed approval")
            self._bindings_check(receipt, state)
            checked = self._check_model(receipt["horizon"], receipt["overhead"])
            if any(checked[key] != receipt["certificate"].get(key)
                   for key in ("source_hash", "module")):
                raise Rejected("forged certificate")
            # Deadline and exact bindings are checked again after validation.
            self._bindings_check(receipt, state)
            installation = {"status": "experimental_profile_installation",
                            "certified_persistent_switch": False,
                            "receipt": receipt, "independent_process_recheck": checked,
                            "installed_monotonic_ns": time.monotonic_ns(),
                            "remaining": ["host refinement", "actual cost interpretation",
                                          "timed environment coupling", "independent supervisor audit"]}
            # Consume before install: a crash can lose liveness, never duplicate authority.
            used_path.write_text(canonical(used + [receipt["nonce"]]) + "\n")
            tmp = self.location / "next-engine.json"
            tmp.write_text(canonical(receipt["candidate"]) + "\n")
            tmp.replace(self.current)
            (self.location / "installation.json").write_text(canonical(installation) + "\n")
            return installation

    def _bindings_check(self, receipt, state):
        if receipt.get("status") != "model_certificate_only":
            raise Rejected("invalid evidence class")
        if receipt["bindings"] != bindings():
            raise Rejected("changed code, verifier, contract, or reference input")
        if receipt["incumbent"] != file_digest(self.current):
            raise Rejected("changed incumbent")
        if receipt["candidate"] != {"engine": "candidate", "generation": 1}:
            raise Rejected("changed candidate")
        if receipt["state"] != digest(state):
            raise Rejected("changed state")
        if receipt["model"] != "step-indexed-inputs-v1" or receipt["cost"] != "abstract-dispatch-v1":
            raise Rejected("changed model or cost")
        if receipt["migration"] != "identity-on-research-state":
            raise Rejected("changed migration")
        if time.monotonic_ns() > receipt["deadline_ns"]:
            raise Rejected("stale deadline")
