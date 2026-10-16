# Research checkpoint — af6200bf

Machine-authored live mathematical research, request af6200bf65064e34b8d9216a2d53d5b2.
Started 2026-10-16 13:48 UTC; 1800-second maximum. Completion is null.

Read MISSION.md and complete docs/DESIGN.md, pinned root/contract, inherited index,
independent target/residual/mathematical audits, latest report and mathematical sources.
Reconciled interrupted workers 136/137 and latest worker 143 from their raw logs
and receipts. All 87 latest manifest hashes and all recorded effects match. No
inherited side effect was replayed. Details: evidence/markov-af6200bf/reconciliation.json.

New direction: replace the proposed midpoint summation route by the shifted
min/max hypothesis

    T(i,h) T(i+2,k) ≤ T(i+1,min(h+1,k)) T(i+1,max(h+1,k)-1).

It passed 592,135 exact finite tests with j≥2. The earlier synchronized mixed
condition still fails at j=2, so cannot be silently used. These are experiments.

MarkovShiftedSumMAF6.lean has compiled: the shifted criterion implies the sum
inequality by Mathlib's finite four-functions theorem on Fin(n+2), with the
first/fourth functions padded and shifted by one. This is a proved bridge for
the stated hypothesis, not a claim that midpoint implies min/max.

MarkovOffsetStepMAF6.lean has compiled exact horizontal/core recurrences.
Scalar certificates and their global source-summand application are in progress.
Two exact polynomial expansions have nonnegative coefficients (155 and 115
monomials); they must pass Lean before being mathematical evidence. Initial
scalar build hit recursion depth, recorded in its immutable receipt.

Operational observations: .scratch is denied by higher-priority policy and has
not been accessed. Shell here-doc creation failed due to denied temporary-file
creation; use durable uniquely named research/evidence artifacts. Sage unavailable;
GAP discoverable; Python sympy import failed. No installation attempted. Ordinary
Python integers suffice. Hosted source retrieval succeeded for the pinned paper
and the proposed discrete Prékopa–Leindler reference. No shell networking used.
