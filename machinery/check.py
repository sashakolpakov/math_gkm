"""Bounded, reproducible local validation entry point. Machine-authored."""
import json
import sys
from .toolchain import ROOT, invoke
from .provenance import checkpoint


def main():
    steps = [
        ("build", [sys.executable, "-u", "-m", "machinery.toolchain"], 180),
        ("tests", [sys.executable, "-u", "-m", "unittest", "discover", "-s", "tests", "-v"], 600),
        ("broker", [sys.executable, "-m", "machinery.broker", "evidence/bootstrap-actions.json"], 30)
    ]
    results = []
    for name, argv, timeout in steps:
        record = invoke(argv, timeout=timeout)
        (ROOT / f"evidence/{name}-latest.log").write_text(record["stdout"] + record["stderr"])
        if name == "tests":
            (ROOT / "evidence/tests.log").write_text(record["stdout"] + record["stderr"])
        results.append({"step": name, **record})
        print(json.dumps({"step": name, "returncode": record["returncode"], "elapsed_ns": record["elapsed_ns"]}), flush=True)
        (ROOT / "evidence/checks.json").write_text(json.dumps(results, indent=2) + "\n")
        if record["returncode"] != 0:
            return 1
    checkpoint()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
