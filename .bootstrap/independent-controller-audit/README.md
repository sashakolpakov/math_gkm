# Compact independent controller audit bundle

This bundle preserves reports, logs, JSON receipts, probe scripts and the final reviewed controller-source snapshot. It excludes temporary Lean builds, third-party imports, full worker directories and giant source copies. No active project source was changed by this audit.

Read REVIEW.md and reviewed-source-hashes.json first. The initial suite's 7/8 result includes an environmental failure; it was not relabeled as a pass. Revised compiler rejection, toy API positives, rollover and round7 regression results have distinct artifacts and scope labels. Historical evidence/FINAL_REVIEW.md and FINAL_SUMMARY.json describe the earlier snapshot; top-level REVIEW.md and reviewed-source-hashes.json incorporate round7.

The full local evidence remains at /private/tmp/math_gkm_autonomy_audit_20261014/. The compact evidence paths mirror that directory. evidence/rollover-check-1/rollover_probe.py and evidence/toy-completion-check/probe.py are audit fixtures, not engine implementations or research proofs. The toy Markov-named module contains only isolated True/False API fixtures and must never replace the actual project root.

To reproduce the focused round7 test, copy the repository to an isolated temporary directory, retain its current machinery/, contracts/markov-goal.json and test file, create .scratch, and run:

```
/opt/homebrew/bin/python3 -B -m unittest discover -s tests -p test_controller_history.py -v
```

This focused test uses simulated compiler output and no model or Lean invocation. Existing controller tests and preserved full local probes have separate real Lean and process coverage. Run long fixture probes in an isolated repository copy; no live transport is needed or authorized by these scripts.

The audit did not activate Codex/Astra. Actual live continuation must be reported separately. Markov Conjecture 6.3 is not proved or refuted by any artifact in this bundle.
