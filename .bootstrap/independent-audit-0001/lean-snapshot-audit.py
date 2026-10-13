#!/usr/bin/env python3
"""Independently rebuild a reviewed source snapshot with trusted imports first.

This external audit neither edits the project nor supplies research proofs.
It does not certify the project verifier or any implementation/refinement claim.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import time

MODULES = ["MathGKM.Foundations", "MathGKM.Machine", "MathGKM", "MathGKM.Driver", "MathGKM.Audit"]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(args, cwd, env):
    start = time.monotonic()
    p = subprocess.Popen(args, cwd=cwd, env=env, stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE, text=True, start_new_session=True)
    timeout = False
    try:
        try:
            stdout, stderr = p.communicate(timeout=120)
        except subprocess.TimeoutExpired:
            timeout = True
            os.killpg(p.pid, signal.SIGKILL)
            stdout, stderr = p.communicate()
    finally:
        try:
            os.killpg(p.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
    return {"args": args, "returncode": p.returncode, "stdout": stdout,
            "stderr": stderr, "timeout": timeout, "seconds": round(time.monotonic() - start, 3)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project", required=True, type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    args = parser.parse_args()
    root, output = args.project.resolve(), args.output_dir.resolve()
    output.mkdir(parents=True, exist_ok=False)
    build = output / "build"
    build.mkdir()
    toolchain_name = (root / "lean-toolchain").read_text().strip()
    toolchain = Path.home() / ".elan/toolchains" / toolchain_name.replace("/", "--").replace(":", "---")
    packages = [p.resolve() / ".lake/build/lib/lean"
                for p in sorted((root / ".lake/packages").iterdir())]
    env = {"PATH": str(toolchain / "bin") + ":/opt/homebrew/bin:/usr/bin:/bin",
           "HOME": str(Path.home()), "LANG": "en_US.UTF-8", "TMPDIR": str(output),
           "GIT_CONFIG_NOSYSTEM": "1", "GIT_CONFIG_GLOBAL": "/dev/null",
           "LEAN_PATH": ":".join(str(p) for p in [toolchain / "lib/lean"] + packages + [build])}
    snapshots = {}
    for module in MODULES:
        rel = Path(*module.split(".")).with_suffix(".lean")
        data = (root / rel).read_bytes()
        target = output / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
        snapshots[str(rel)] = hashlib.sha256(data).hexdigest()
    results = {}
    for module in MODULES:
        rel = Path(*module.split("."))
        dest = build / rel.with_suffix(".olean")
        dest.parent.mkdir(parents=True, exist_ok=True)
        compiled = run([str(toolchain / "bin/lean"), "-o", str(dest),
                        str(rel.with_suffix(".lean"))], output, env)
        record = {"compile": compiled}
        if compiled["returncode"] == 0:
            record["replay"] = run([str(toolchain / "bin/leanchecker"), module], output, env)
            record["olean_sha256"] = sha(dest)
        results[module] = record
        print(json.dumps({"module": module, "compile": compiled["returncode"],
                          "replay": record.get("replay", {}).get("returncode")}), flush=True)
        (output / "progress.json").write_text(json.dumps(results, indent=2) + "\n")
        if compiled["returncode"] != 0:
            break
    unchanged = {rel: sha(root / rel) == digest for rel, digest in snapshots.items()}
    success = len(results) == len(MODULES) and all(
        record["compile"]["returncode"] == 0 and record.get("replay", {}).get("returncode") == 0
        for record in results.values())
    report = {"scope": __doc__, "toolchain": toolchain_name,
              "binary_hashes": {name: sha(toolchain / "bin" / name) for name in ("lean", "leanchecker")},
              "environment": env, "source_hashes": snapshots,
              "source_unchanged_at_end": unchanged, "results": results,
              "snapshot_compiles_and_replays": success}
    (output / "report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({"snapshot_compiles_and_replays": success,
                      "source_unchanged_at_end": unchanged}, indent=2))
    return 0 if success else 1


if __name__ == "__main__":
    raise SystemExit(main())
