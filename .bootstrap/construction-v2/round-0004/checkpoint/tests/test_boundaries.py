"""Machine-authored adversarial bootstrap checks; no live proposer calls."""
import copy
import json
from pathlib import Path
import tempfile
import time
import unittest
from unittest.mock import patch

from machinery.broker import Broker, AstraProposer
from machinery.gate import ProofGate, Rejected, check_graph, digest
from machinery.switch import SwitchGate
from machinery.toolchain import ROOT, invoke


class AdmissionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.contract = json.loads((ROOT / "contracts/gate_fixture.json").read_text())
        cls.gate = ProofGate(cls.contract)
        cls.proof = ["intro", "rfl"]
        cls.receipt = cls.gate.close_root(cls.contract["root"], cls.proof)
        (ROOT / "evidence/proof-admission.json").write_text(json.dumps(cls.receipt, indent=2) + "\n")

    def test_universal_proof_has_no_axioms(self):
        self.assertEqual(self.receipt["axioms"], [])
        self.assertEqual(self.receipt["resolution"], "proof")

    def test_unrelated_true_does_not_close_root(self):
        with self.assertRaisesRegex(Rejected, "exact contract root"):
            self.gate.close_root("true", "trivial")

    def test_numerical_case_does_not_prove_universal(self):
        with self.assertRaises(Rejected):
            self.gate.close_root(self.contract["root"], "rfl")

    def test_valid_reduction_composes(self):
        # Checked application of True -> root to a proof of True.
        reduction = ["as", ["implies", "true", self.contract["root"]], ["intro", self.proof]]
        proof = ["apply", reduction, "trivial"]
        result = self.gate.close_root(self.contract["root"], proof)
        self.assertEqual(result["resolution"], "proof")

    def test_exact_refutation(self):
        gate = ProofGate({"root": "false", "status": "explicit_fixture"})
        result = gate.close_root(["not", "false"], ["intro", ["var", 0]], "refutation")
        self.assertEqual(result["resolution"], "refutation")

    def test_changed_hypotheses(self):
        with self.assertRaises(Rejected):
            self.gate.close_root(["implies", "false", self.contract["root"]],
                                 ["intro", ["absurd", ["var", 0]]])

    def test_false_proof_rejected_by_kernel(self):
        with self.assertRaisesRegex(Rejected, "kernel elaboration"):
            self.gate.check("false", "trivial")

    def test_source_injection_and_omitted_dependency(self):
        for term in ["by sorry", "by native_decide", "axiom evil : False", ["external", "evil"]]:
            with self.subTest(term=term), self.assertRaises(Rejected):
                self.gate.check("false", term)
        with self.assertRaisesRegex(Rejected, "dependencies"):
            self.gate.check("true", "trivial", ["untracked"])

    def test_forged_receipt(self):
        receipt = copy.deepcopy(self.receipt)
        receipt["source_hash"] = "forged"
        with self.assertRaisesRegex(Rejected, "binding mismatch"):
            self.gate.recheck(receipt)

    def test_complexity_audit_has_no_effect(self):
        # Audit data is not part of the proposal AST or any decision input.
        a, b = copy.deepcopy(self.receipt), copy.deepcopy(self.receipt)
        a["complexity_audit"] = 1
        b["complexity_audit"] = 10**30
        self.assertEqual(self.gate.recheck(a)["target"], self.gate.recheck(b)["target"])


class AttachmentTests(unittest.TestCase):
    def cell(self, name, deps=(), **kw):
        return {"id": name, "dependencies": list(deps), "used": list(deps), **kw}

    def test_compatible_sequential_graph(self):
        self.assertEqual(check_graph([self.cell("a"), self.cell("b", ["a"])]), ["a", "b"])

    def test_conflicting_binding(self):
        with self.assertRaisesRegex(Rejected, "conflicting"):
            check_graph([self.cell("a"), self.cell("a")])

    def test_missing_or_omitted_dependencies(self):
        for cells in [[self.cell("b", ["a"])], [self.cell("a", used=["unlisted"])]]:
            with self.subTest(cells=cells), self.assertRaises(Rejected):
                check_graph(cells)

    def test_circular_dependency(self):
        with self.assertRaisesRegex(Rejected, "circular"):
            check_graph([self.cell("a", ["b"]), self.cell("b", ["a"])])

    def test_unproved_assumption(self):
        with self.assertRaisesRegex(Rejected, "unproved"):
            check_graph([self.cell("a", assumptions=["False"])])


class BrokerTests(unittest.TestCase):
    def test_fixture_is_not_live(self):
        with self.assertRaisesRegex(Rejected, "disabled"):
            AstraProposer().propose({})
        self.assertEqual(AstraProposer().propose({}, fixture=[])["provenance"], "explicit_protocol_fixture")

    def test_nonproof_feedback_changes_agenda(self):
        broker = Broker({})
        result = broker.act({"kind": "experiment", "payload": {"tool": "python", "experiment": "coupling_counterexample"}})
        self.assertFalse(result["mathematical_resolution"])
        self.assertEqual(broker.agenda[0]["task"], "prove_time_dependent_response_obstruction")

    def test_unavailable_tool_not_refutation(self):
        result = Broker({}).act({"kind": "experiment", "payload": {"tool": "not_installed"}})
        self.assertEqual(result["evidence"], "capability_failure")

    def test_exploration_cannot_install(self):
        self.assertFalse(Broker({}).act({"kind": "strategy", "payload": "change agenda"})["persistent_rewrite"])
        self.assertFalse(Broker({}).act({"kind": "rewrite", "payload": {}})["installed"])

    def test_no_complexity_scheduling(self):
        a, b = Broker({}), Broker({})
        a.act({"kind": "strategy", "payload": "next", "complexity_audit": 0})
        b.act({"kind": "strategy", "payload": "next", "complexity_audit": 10**20})
        self.assertEqual(a.agenda, b.agenda)

    def test_bounded_actions(self):
        broker = Broker({}, limit=1)
        broker.act({"kind": "conjecture"})
        with self.assertRaisesRegex(Rejected, "budget"):
            broker.act({"kind": "conjecture"})


class SwitchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.directory = Path(tempfile.mkdtemp(prefix="switch-", dir=ROOT / ".scratch"))
        cls.gate = SwitchGate(cls.directory)
        cls.state = {"code": [{"rewrite": {"code": [{"record": {"value": 7}}]}}],
                     "archive": [], "agenda": [], "pending": None, "history": []}
        cls.receipt = cls.gate.prepare(cls.state, horizon=8, overhead=3,
                                      deadline_ns=time.monotonic_ns() + 600_000_000_000)
        (ROOT / "evidence/model-switch.json").write_text(json.dumps(cls.receipt, indent=2) + "\n")

    def test_a_missing_bridge_rejects_certified_install(self):
        receipt = copy.deepcopy(self.receipt)
        receipt["bridge_status"] = "claimed proved by proposal"
        with self.assertRaisesRegex(Rejected, "bridge"):
            self.gate.install(receipt, self.state, certified=True)

    def test_b_all_binding_mutations(self):
        mutations = {"candidate": {}, "state": "changed", "model": "timed",
                     "cost": "reward-edited", "migration": "drop-data", "deadline_ns": 0,
                     "bindings": {}, "incumbent": "changed", "status": "certified"}
        for key, value in mutations.items():
            with self.subTest(key=key):
                receipt = copy.deepcopy(self.receipt)
                receipt[key] = value
                with self.assertRaises(Rejected):
                    self.gate.install(receipt, self.state)

    def test_c_overhead_removes_gain(self):
        for n, k in [(3, 3), (3, 4), (0, 0)]:
            with self.assertRaisesRegex(Rejected, "gain"):
                self.gate._check_model(n, k)

    def test_c_deadline_rechecked_after_validation(self):
        receipt = copy.deepcopy(self.receipt)
        receipt["deadline_ns"] = 2
        # Explicit clock/checker fixture exercises the post-validation boundary.
        with patch("machinery.switch.time.monotonic_ns", side_effect=[1, 3]), \
             patch.object(self.gate, "_check_model", return_value=receipt["certificate"]):
            with self.assertRaisesRegex(Rejected, "stale deadline"):
                self.gate.install(receipt, self.state)

    def test_c_objective_and_verifier_bindings(self):
        for name in self.receipt["bindings"]:
            receipt = copy.deepcopy(self.receipt)
            receipt["bindings"][name] = "changed bytes"
            with self.subTest(name=name), self.assertRaisesRegex(Rejected, "changed code"):
                self.gate.install(receipt, self.state)

    def test_c_complexity_audit_does_not_change_switch_check(self):
        for audit in (1, 10**30):
            receipt = copy.deepcopy(self.receipt)
            receipt["complexity_audit"] = audit
            self.gate._bindings_check(receipt, self.state)

    def test_d_forged_certificate(self):
        receipt = copy.deepcopy(self.receipt)
        receipt["certificate"]["source_hash"] = "forged"
        with self.assertRaisesRegex(Rejected, "forged certificate"):
            self.gate.install(receipt, self.state)

    def test_z_experimental_install_and_replay_rejection(self):
        installed = self.gate.install(self.receipt, self.state)
        self.assertFalse(installed["certified_persistent_switch"])
        self.assertEqual(json.loads(self.gate.current.read_text())["engine"], "candidate")
        with self.assertRaisesRegex(Rejected, "replayed"):
            self.gate.install(self.receipt, self.state)
        # Read the installed profile and execute the formal interpreter itself.
        call = {"horizon": 8, "engine": json.loads(self.gate.current.read_text())["engine"],
                "state": self.state, "inputs": []}
        path = self.directory / "invocation.json"
        path.write_text(json.dumps(call))
        result = invoke(["lean", "--run", "MathGKM/Driver.lean", str(path)])
        self.assertEqual(result["returncode"], 0, result)
        actual = json.loads(result["stdout"])
        self.assertEqual(actual["state"]["archive"], [7])
        self.assertEqual(actual["cost"], 11)
        (ROOT / "evidence/experimental-installation.json").write_text(
            json.dumps({"installation": installed, "execution": result,
                        "location": str(self.directory.relative_to(ROOT))}, indent=2) + "\n")


class DriverTests(unittest.TestCase):
    def test_future_rewrites_and_response_costs(self):
        state = {"code": [{"request": {"query": 0}}], "archive": [],
                 "agenda": [], "history": [], "pending": None}
        inputs = [
            {"answer": 5, "delay": 2, "replacement": [{"rewrite": {"code": [{"request": {"query": 1}}]}}]},
            {"answer": 999, "delay": 999, "replacement": None},
            {"answer": 11, "delay": 4, "replacement": [{"record": {"value": 17}}]}
        ]
        records, values = [], []
        for engine in ("reference", "candidate"):
            path = ROOT / ".scratch" / ("driver-" + engine + ".json")
            path.write_text(json.dumps({"horizon": 8, "engine": engine, "state": state, "inputs": inputs}))
            record = invoke(["lean", "--run", "MathGKM/Driver.lean", str(path)])
            self.assertEqual(record["returncode"], 0, record)
            records.append(record)
            values.append(json.loads(record["stdout"]))
        self.assertEqual(values[0]["state"], values[1]["state"])
        self.assertEqual(values[0]["state"]["archive"], [17, 11, 5])
        self.assertEqual(values[0]["cost"], 31)
        self.assertEqual(values[1]["cost"], 23)
        (ROOT / "evidence/driver-future-rewrites.json").write_text(json.dumps(records, indent=2) + "\n")


if __name__ == "__main__":
    unittest.main(verbosity=2)
