# math_gkm: machine-led construction

Machine-authored by Codex/Astra from the fixed [mission](MISSION.md) and
[design](docs/DESIGN.md). Current status: Agoh's substantial exercise is complete
and independently reviewed; Markov Conjecture 6.3 has checked universal partial
results and exact experiments, and remains open. The proved self-change instance
concerns the explicitly defined Lean transition system; it does not certify
every edit of the actual Python/Codex researcher.

Read the current [Agoh account](docs/round2/AGOH.md),
[Markov account](docs/round2/MARKOV.md), and [checkpoint](RESUME.json).
Reproduce the Markov mathematics with:

```sh
/opt/homebrew/bin/python3 evidence/markov/reproduce.py
```

Run the bounded build, separate kernel replay, adversarial gate tests and broker
example using the supplied dependencies:

```sh
/opt/homebrew/bin/python3 -u -m machinery.check
```

Do not use Lake in this environment: its metadata validation attempted to refresh
a read-only dependency. The wrapper invokes pinned Lean directly with explicit
library paths, workspace-local temporary files and the required Git environment.
It performs no package update, cache download, shell networking or external LLM call.

Read [the construction audit](docs/CONSTRUCTION.md) for its historical theorem meanings,
implementation limits and remaining obligations, [the attempt log](docs/ATTEMPTS.md)
for failures, and [RESUME.json](RESUME.json) for the next checkpoint. Validation
records are in `evidence/`; compiled objects and experimental profiles are in
`.scratch/`. The supervisor owns Git versioning and independent acceptance.
