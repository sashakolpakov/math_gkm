"""Machine-authored Codex/Astra bootstrap. Never invokes Lake or the network."""
from pathlib import Path
import os
import subprocess
import time
import json

ROOT = Path(__file__).resolve().parents[1]
BUILD = ROOT / ".scratch" / "build"


def environment():
    from .trust import environment as clean_environment
    env = clean_environment()
    # leanchecker recursively scans these paths. Never include the workspace
    # root: it contains the denied Git directory and supervisor launch records.
    from .trust import CORE
    paths = [str(CORE), str(BUILD)]
    paths += [str(p / ".lake/build/lib/lean")
              for p in sorted((ROOT / ".lake/packages").iterdir())]
    env.update(LEAN_PATH=":".join(paths), GIT_CONFIG_NOSYSTEM="1",
               GIT_CONFIG_GLOBAL="/dev/null", TMPDIR=str(ROOT / ".scratch"))
    return env


def invoke(args, timeout=120):
    # General project build path is explicitly experimental, never admission.
    from .process import run
    from .trust import LEAN, CHECKER
    args = list(args)
    if args[0] == "lean":
        args[0] = str(LEAN)
    if args[0] == "leanchecker":
        args[0] = str(CHECKER)
    result = run(args, cwd=ROOT, env=environment(), timeout=min(timeout, 180))
    with (ROOT / "evidence/round2/commands.jsonl").open("a") as log:
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
