#!/usr/bin/env python3
"""Independent synthetic Lean checker audit; no project module is modified.

This is audit code, not a candidate research implementation. Custom axioms,
placeholders and deliberate kernel bypasses occur only in negative fixtures.
No fixture is a mathematical result or an admissible project proof.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import time


SOURCES = {
    "AuditValid": "import Init\ntheorem audit_valid : True := True.intro\n#print axioms audit_valid\n",
    "AuditAxiom": "import Init\naxiom audit_bad_axiom : False\ntheorem audit_false : False := audit_bad_axiom\n#print axioms audit_false\n",
    "AuditSorry": "import Init\ntheorem audit_unproved : False := by sorry\n#print axioms audit_unproved\n",
    "AuditForge": '''import Lean
open Lean Elab Command
elab "audit_forge" : command => do
  liftCoreM <| Lean.addDecl (.thmDecl {
    name := `audit_forged
    levelParams := []
    type := .const `False []
    value := .const `True.intro [] })
set_option debug.skipKernelTC true in
audit_forge
#print axioms audit_forged
''',
    "AuditImportsForge": "import AuditForge\ntheorem audit_imported_false : False := audit_forged\n#print axioms audit_imported_false\n",
}


def run(command, root, env, timeout):
    started = time.monotonic()
    p = subprocess.Popen(command, cwd=root, env=env, stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE, text=True, start_new_session=True)
    timed_out = False
    try:
        try:
            stdout, stderr = p.communicate(timeout=timeout)
        except subprocess.TimeoutExpired:
            timed_out = True
            os.killpg(p.pid, signal.SIGKILL)
            stdout, stderr = p.communicate()
    finally:
        try:
            os.killpg(p.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
    return {"command": command, "returncode": p.returncode,
            "stdout": stdout, "stderr": stderr, "timed_out": timed_out,
            "seconds": round(time.monotonic() - started, 3)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--timeout", type=int, default=60)
    parser.add_argument("--fresh", action="store_true",
                        help="Also replay all transitive imports; may require a large timeout.")
    args = parser.parse_args()
    project = args.project.resolve()
    output = args.output_dir.resolve()
    output.mkdir(parents=True, exist_ok=False)
    toolchain_name = (project / "lean-toolchain").read_text().strip()
    toolchain = Path.home() / ".elan/toolchains" / toolchain_name.replace("/", "--").replace(":", "---")
    binary = toolchain / "bin"
    build = output / "build"
    build.mkdir()
    package_libs = [str(p.resolve() / ".lake/build/lib/lean")
                    for p in sorted((project / ".lake/packages").iterdir())]
    env = {"PATH": str(binary) + ":/opt/homebrew/bin:/usr/bin:/bin",
           "HOME": str(Path.home()), "LANG": "en_US.UTF-8",
           "GIT_CONFIG_NOSYSTEM": "1", "GIT_CONFIG_GLOBAL": "/dev/null",
           "TMPDIR": str(output), "LEAN_PATH": ":".join([str(build)] + package_libs)}
    cases = {}
    for name, source in SOURCES.items():
        (output / (name + ".lean")).write_text(source)
        compilation = run([str(binary / "lean"), "-o", str(build / (name + ".olean")),
                           name + ".lean"], output, env, args.timeout)
        result = {"source_sha256": hashlib.sha256(source.encode()).hexdigest(),
                  "compile": compilation}
        if compilation["returncode"] == 0:
            result["replay"] = run([str(binary / "leanchecker"), name], output, env, args.timeout)
            if args.fresh and name in ("AuditAxiom", "AuditImportsForge"):
                result["fresh_replay"] = run([str(binary / "leanchecker"), "--fresh", name],
                                             output, env, args.timeout)
        cases[name] = result
        (output / "progress.json").write_text(json.dumps(cases, indent=2) + "\n")
        print(json.dumps({"case": name, "compile": compilation["returncode"],
                          "replay": result.get("replay", {}).get("returncode"),
                          "fresh_replay": result.get("fresh_replay", {}).get("returncode")}), flush=True)
    def code(name, phase):
        return cases[name].get(phase, {}).get("returncode")
    def rejected(name, phase):
        result = cases[name].get(phase, {})
        return result.get("returncode") not in (None, 0) and not result.get("timed_out")
    checks = {
        "valid_proof_passes": code("AuditValid", "compile") == 0 and code("AuditValid", "replay") == 0,
        "axiom_false_passes_replay": code("AuditAxiom", "compile") == 0 and code("AuditAxiom", "replay") == 0,
        "sorry_passes_replay": code("AuditSorry", "compile") == 0 and code("AuditSorry", "replay") == 0,
        "kernel_bypass_is_caught_in_target_module": code("AuditForge", "compile") == 0 and rejected("AuditForge", "replay"),
        "imported_kernel_bypass_passes_default_replay": code("AuditImportsForge", "compile") == 0 and code("AuditImportsForge", "replay") == 0,
    }
    if args.fresh:
        checks.update({
            "axiom_false_also_passes_fresh_replay": code("AuditAxiom", "fresh_replay") == 0,
            "imported_kernel_bypass_is_caught_by_fresh_replay": rejected("AuditImportsForge", "fresh_replay"),
        })
    report = {"toolchain": toolchain_name, "environment": env,
              "cases": cases, "checks": checks, "observations_confirmed": all(checks.values()),
              "scope": "Synthetic audit only. Axioms/sorry/bypasses are inadmissible negative fixtures; no project files changed."}
    (output / "report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(checks, indent=2))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
