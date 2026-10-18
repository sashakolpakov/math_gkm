"""Machine-authored inventory limited to explicitly named fresh-project paths."""
from datetime import datetime, timezone
import json
import platform
import shutil
import sys
from .gate import file_digest
from .switch import REFERENCE_HASHES
from .toolchain import ROOT


def checkpoint():
    initial = json.loads((ROOT / ".bootstrap/round-0001/input-manifest.json").read_text())
    checked = {p: {"expected": sha, "actual": file_digest(ROOT / p)}
               for p, sha in REFERENCE_HASHES.items()}
    if not all(v["expected"] == v["actual"] for v in checked.values()):
        raise RuntimeError("immutable input changed")
    artifacts = {}
    # Never recursively list the workspace root, Git, supervisor state or dependencies.
    for dirname in ["MathGKM", "machinery", "tests", "contracts", "GateChecks", "SwitchChecks"]:
        for path in sorted((ROOT / dirname).glob("*")):
            if path.is_file() and path.suffix in (".py", ".lean", ".json"):
                artifacts[str(path.relative_to(ROOT))] = file_digest(path)
    for name in ["MathGKM.lean", "README.md", "docs/CONSTRUCTION.md", "docs/ATTEMPTS.md", "RESUME.json"]:
        if (ROOT / name).exists():
            artifacts[name] = file_digest(ROOT / name)
    manifest = {
        "generated_utc": datetime.now(timezone.utc).isoformat(),
        "provenance": "machine-authored in current authorized Codex/Astra bootstrap invocation",
        "proposer_role": "Codex/Astra", "provider_model_attestation": None,
        "model_attestation_note": "role as supplied by invocation; no provider API queried",
        "initial_input_manifest": initial,
        "initial_prompt": {"path": ".bootstrap/round-0001/prompt.txt",
                           "sha256": file_digest(ROOT / ".bootstrap/round-0001/prompt.txt")},
        "immutable_inputs_check": checked,
        "artifacts_sha256": artifacts,
        "python": {"executable": sys.executable, "version": sys.version},
        "platform": platform.platform(),
        "capabilities": {name: shutil.which(name) for name in ["lean", "leanchecker", "gap", "sage"]},
        "git_environment": {"GIT_CONFIG_NOSYSTEM": "1", "GIT_CONFIG_GLOBAL": "/dev/null"},
        "limits": {"action_count": 32, "lean_command_timeout_seconds": 120,
                   "driver_horizon": 10000, "external_llm_calls": 0,
                   "unbounded_background_services": 0, "outer_invocation_budget": "not exposed"},
        "boundary": {"workspace": str(ROOT), "temporary_files": ".scratch",
                     "dependencies": "only supplied read-only pinned packages and Lean toolchain",
                     "network": "shell networking disabled; hosted search unused in this construction checkpoint",
                     "isolation_claim": "provided permission boundary; no independent host-isolation proof"},
        "claims": {"certified_persistent_switch": False, "agoh_started": False, "markov_started": False,
                   "independent_supervisor_acceptance": "pending"}
    }
    (ROOT / "evidence/provenance.json").write_text(json.dumps(manifest, indent=2) + "\n")
    return manifest


if __name__ == "__main__":
    result = checkpoint()
    print(json.dumps({"artifacts": len(result["artifacts_sha256"]), "immutable_inputs": "unchanged"}))
