# Research checkpoint 061840e8

Machine-authored experimental research; full pinned Conjecture63 remains open.
Read MISSION.md, DESIGN.md, pinned contract, inherited index and independent
target/residual/core audits. Latest source support and root equivalences inspected.
The earlier interrupted worker's event tail and reconciliations were inspected;
completed effects will not be replayed. See evidence/markov-061840e8/reconciliation.json.

New direction: test directional closure of the exact two-state gas partition
function, and assess a lattice-point/fiber representation. Hosted retrieval of
Leake--Mohammadi Yekta, arXiv:2609.39917v1, gives a midpoint count theorem for
unimodular systems. It is an external source, not a Lean axiom or a proved bridge
to Markov coefficients. A common unimodular affine-fiber model for both raw
indices would force arbitrary-direction concavity, already obstructed by 1/9.
Direction-specific models or more restricted pair balancing remain possible.

06:08 UTC: New direction selected after finite probes. Proved in Lean the
alternating matching coefficient formula
P_n[u^i v^j]=choose(n-j,i) choose(n-i-1,j), with natural subtraction,
and all its constant-i+j coefficient inequalities. Modules
MarkovPellMatching0618 and MarkovPellDiagonal0618 compiled with permitted axioms.
Exponent-shear and actual right-source adapters are in progress, not yet accepted.
The intended consequence is every raw diagonal for a/(a+1), not all directions.

Finite experiments: arbitrary gas cores fail in all three directions; 33 genuine
source cores fail a stronger sitewise pair-conservation requirement. Positive
palindromic site deformations also fail raw LC (e.g. AAA weighted 2,1,2 gives
4,4,5). These are strategy obstructions only, not pinned-source refutations.

06:14 UTC: Final source_near_one_diagonal0618 compiled successfully with only permitted axioms. It covers all raw polygon triples in direction (1,-1) for b=a+1; no cutoff. Its final kernel replay is running. The other five modules have completed kernel replay. All operational statuses will be consolidated in validation.json. Root remains open.

Final checkpoint: all six named modules compiled and kernel-replayed. Manifest and report saved; all foreground sessions completed. Full root remains open.
