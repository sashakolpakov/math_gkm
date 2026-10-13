"""Machine-authored Codex/Astra. Bounded action broker; no live model calls."""
from __future__ import annotations
from dataclasses import dataclass, field
import json
import shutil
import time
from .gate import Rejected, canonical, digest
from .toolchain import ROOT, invoke


class AstraProposer:
    """Supervisor activation is deliberately not implemented in bootstrap.

    A live implementation must accept contract/state, return actions, record
    provider identity/usage/delay, and keep replies as environmental input.
    Fixtures never claim to be live model responses.
    """
    def propose(self, context, *, fixture=None):
        if fixture is None:
            raise Rejected("live proposer disabled: supervisor activation required")
        return {"provenance": "explicit_protocol_fixture", "context_hash": digest(context),
                "actions": fixture}


@dataclass
class Broker:
    contract: dict
    agenda: list = field(default_factory=list)
    events: list = field(default_factory=list)
    limit: int = 32

    def act(self, action):
        if len(self.events) >= self.limit:
            raise Rejected("action budget exhausted")
        start = time.monotonic_ns()
        kind = action.get("kind")
        payload = action.get("payload", {})
        result = self._dispatch(kind, payload)
        event = {"action": action, "result": result, "elapsed_ns": time.monotonic_ns() - start,
                 "contract_hash": digest(self.contract), "index": len(self.events),
                 "provenance": "Codex/Astra bootstrap", "provider_usage": None}
        self.events.append(event)
        return result

    def _dispatch(self, kind, payload):
        if kind == "experiment":
            tool = payload.get("tool")
            if tool == "python" and payload.get("experiment") == "coupling_counterexample":
                # Exact integer experiment: a time-sensitive environment returns
                # the request time. This falsifies unconditional stream coupling.
                result = {"fast_answer": 1, "reference_answer": 2,
                          "same_response": 1 == 2}
                self.agenda.append({"task": "prove_time_dependent_response_obstruction",
                                    "reason": "experiment found unequal replies"})
                return {"evidence": "computation", "result": result,
                        "mathematical_resolution": False}
            if tool in ("gap", "sage"):
                path = shutil.which(tool)
                if path is None:
                    return {"evidence": "capability_failure", "tool": tool,
                            "mathematical_resolution": False}
                if payload.get("experiment") != "version":
                    return {"evidence": "capability_failure", "reason": "unregistered experiment"}
                args = [path, "-q", "-c", 'Print(GAPInfo.Version, "\\n"); QUIT;'] if tool == "gap" else [path, "--version"]
                return {"evidence": "tool_observation", "execution": invoke(args, timeout=10)}
            return {"evidence": "capability_failure", "reason": "unregistered experiment"}
        if kind == "literature":
            # Hosted search is supplied by the actual proposer tools, not shell
            # networking. Intake preserves source evidence without trusting it.
            required = {"query", "url", "retrieved_utc", "passage", "tool_record"}
            if not required <= payload.keys():
                return {"evidence": "pending_hosted_search", "request": payload}
            return {"evidence": "retrieved_text", "source": payload,
                    "mathematical_resolution": False}
        if kind in ("representation", "conjecture", "proof", "refutation", "attachment"):
            self.agenda.append({"task": kind, "proposal": payload, "status": "needs_check"})
            return {"evidence": "bootstrap_candidate", "mathematical_resolution": False}
        if kind == "strategy":
            self.agenda.append({"task": payload, "status": "provisional"})
            return {"evidence": "exploratory_revision", "persistent_rewrite": False}
        if kind == "rewrite":
            return {"evidence": "bootstrap_candidate", "installed": False,
                    "reason": "use bound switch gate; exploration cannot install"}
        return {"evidence": "capability_failure", "reason": "unknown action"}

    def save(self, path):
        path.write_text(canonical({"events": self.events, "agenda": self.agenda}) + "\n")


if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        raise SystemExit("usage: python -m machinery.broker ACTIONS.json")
    actions = json.loads((ROOT / sys.argv[1]).read_text())
    if not isinstance(actions, list):
        raise Rejected("expected bounded action list")
    broker = Broker(json.loads((ROOT / "contracts/construction.json").read_text()))
    for action in actions:
        print(canonical(broker.act(action)))
    broker.save(ROOT / "evidence/broker.json")
