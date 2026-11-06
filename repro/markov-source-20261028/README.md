# Preserved Markov proof sources

This directory contains 499 unchanged Lean modules and the three original
dependency/build pins, recovered from the local closed-round 112 and 122 archives
and the selected round 125, 126 and 127 admission packets. The union contains 154
`Accepted` export modules. Every overlapping source had identical bytes.

`MANIFEST.json` records each file's SHA256, its original archive, the complete
first-party import order and the exported modules. `provenance/` retains the
original archive manifests unchanged. Paths in those historical manifests refer
to the old archives; their validator objects and runtime journals are not part
of this source package. The old manifests are provenance, not instructions to
restore missing runtime state.

The cleanup checked all 499 source hashes and the complete local import closure.
It did not recompile this entire campaign or rerun its historical validators.
No new admission, conjecture resolution or fresh validation is claimed.

## Rebuild

Use the pinned Lean toolchain and dependency revisions in this directory. From
this directory, populate the dependencies and their upstream compilation cache:

```sh
lake exe cache get
```

Then compile the recorded modules in dependency order:

```sh
python3 - <<'PY'
import json
import subprocess
from pathlib import Path

manifest = json.loads(Path('MANIFEST.json').read_text())
for module in manifest['build_order']:
    subprocess.run(['lake', '--no-cache', 'build', '+' + module + ':olean'], check=True)
PY
```

These commands create a new local `.lake/` directory. They do not reproduce the
historical native validator receipts, and may take substantial time. The exact
theorem statements and hypotheses remain in the preserved Lean files.
