#!/usr/bin/env python3
"""Snapshot the machine's gate and test import shadowing in a separate fixture.

This does not prove Lean's False. It tests whether the gate binds its JSON
`false` target to the trusted meaning of Lean's False. No project files change.
"""
import argparse
import hashlib
import importlib
import json
import os
from pathlib import Path
import subprocess
import sys


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    project, output = args.project.resolve(), args.output_dir.resolve()
    output.mkdir(parents=True, exist_ok=False)
    machinery = output / "machinery"
    machinery.mkdir()
    (machinery / "__init__.py").write_text("")
    snapshots = {}
    for name in ("gate.py", "toolchain.py"):
        data = (project / "machinery" / name).read_bytes()
        (machinery / name).write_bytes(data)
        snapshots[name] = hashlib.sha256(data).hexdigest()
    packages = output / ".lake/packages"
    packages.mkdir(parents=True)
    for package in sorted((project / ".lake/packages").iterdir()):
        (packages / package.name).symlink_to(package.resolve(), target_is_directory=True)
    toolchain_name = (project / "lean-toolchain").read_text().strip()
    binary = Path.home() / ".elan/toolchains" / toolchain_name.replace("/", "--").replace(":", "---") / "bin"
    os.environ.update(PATH=str(binary) + ":/opt/homebrew/bin:/usr/bin:/bin",
                      GIT_CONFIG_NOSYSTEM="1", GIT_CONFIG_GLOBAL="/dev/null")
    sys.path.insert(0, str(output))
    gate_module = importlib.import_module("machinery.gate")
    tools = importlib.import_module("machinery.toolchain")
    tools.BUILD.mkdir(parents=True, exist_ok=True)
    gate = gate_module.ProofGate({"root": "false"})
    try:
        baseline = {"unexpected_receipt": gate.close_root("false", "trivial")}
    except gate_module.Rejected as error:
        baseline = {"rejected": str(error)}
    source = output / "Init.lean"
    source.write_text("prelude\ninductive True : Prop where\n  | intro : True\nabbrev False : Prop := True\n")
    compilation = tools.compile_module("Init")
    attack = None
    error = None
    if compilation["returncode"] == 0:
        try:
            attack = gate.close_root("false", "trivial")
        except Exception as failure:
            error = type(failure).__name__ + ": " + str(failure)
    fixture_files = {str(path.relative_to(output)): digest(path)
                     for path in sorted(output.rglob("*"))
                     if path.is_file() and not path.is_symlink()}
    report = {"scope": __doc__, "toolchain": toolchain_name,
              "machine_source_hashes": snapshots, "baseline": baseline,
              "shadow_compilation": compilation, "attack_receipt": attack,
              "attack_error": error, "fixture_hashes": fixture_files,
              "vulnerability_reproduced": "rejected" in baseline and attack is not None}
    (output / "report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({"vulnerability_reproduced": report["vulnerability_reproduced"],
                      "machine_source_hashes": snapshots, "report": str(output / "report.json")}, indent=2))
    return 0 if report["vulnerability_reproduced"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
