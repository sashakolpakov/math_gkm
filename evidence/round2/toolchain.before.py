"""Machine-authored Codex/Astra bootstrap. Never invokes Lake or the network."""
from pathlib import Path
import os
import subprocess
import time
import json

ROOT = Path(__file__).resolve().parents[1]
BUILD = ROOT / ".scratch" / "build"


def environment():
    env = os.environ.copy()
    # leanchecker recursively scans these paths. Never include the workspace
    # root: it contains the denied Git directory and supervisor launch records.
    paths = [str(BUILD)]
    paths += [str(p / ".lake/build/lib/lean")
              for p in sorted((ROOT / ".lake/packages").iterdir())]
    env.update(LEAN_PATH=":".join(paths), GIT_CONFIG_NOSYSTEM="1",
               GIT_CONFIG_GLOBAL="/dev/null", TMPDIR=str(ROOT / ".scratch"))
    return env


def invoke(args, timeout=120):
    started = time.monotonic_ns()
    try:
        p = subprocess.run(args, cwd=ROOT, env=environment(), text=True,
                           capture_output=True, timeout=timeout)
        result = {"argv": args, "returncode": p.returncode,
                "stdout": p.stdout, "stderr": p.stderr,
                "elapsed_ns": time.monotonic_ns() - started}
    except subprocess.TimeoutExpired:
        result = {"argv": args, "returncode": None, "stdout": "",
                "stderr": "timeout", "elapsed_ns": time.monotonic_ns() - started}
    with (ROOT / "evidence/commands.jsonl").open("a") as log:
        log.write(json.dumps(result) + "\n")
    return result


def compile_module(module):
    relative = Path(*module.split("."))
    output = BUILD / relative.with_suffix(".olean")
    output.parent.mkdir(parents=True, exist_ok=True)
    return invoke(["lean", "-o", str(output), str(relative.with_suffix(".lean"))])


def replay(module):
    return invoke(["leanchecker", module])


if __name__ == "__main__":
    import json
    records = []
    for name in ["MathGKM.Foundations", "MathGKM.Machine", "MathGKM",
                 "MathGKM.Driver", "MathGKM.Audit"]:
        for result in [compile_module(name)]:
            records.append(result)
            print(json.dumps(result))
            if result["returncode"] != 0:
                raise SystemExit(1)
    result = replay("MathGKM")
    records.append(result)
    print(json.dumps(result))
    if result["returncode"] != 0:
        raise SystemExit(1)
    (ROOT / "evidence/build.json").write_text(json.dumps(records, indent=2) + "\n")
