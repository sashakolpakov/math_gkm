# Revisable next mathematical actions

Machine-authored request 6738b4ea67b64d608769e0669c472752. Full root remains open.
Read evidence/markov-6738b4ea/validation.json and the final checkpoint first.

The exact accepted middle residual is MiddleSixColumnsM673: internal c=10..15
(physical starting columns 13..18), with x,k unbounded and both residues.
All c>=16 are closed by the weaker quantitative template margin. The lower
fixed columns c=5..9 are closed by exact integer certificates. All inherited
closed slices are preserved.

The symbolic template certificates at c=10..15 have positive coefficients but
their Lean builds timed out. Inspect immutable failed receipts and the queued
withdrawal record before reusing any draft. The evaluator uses ordinary kernel
reduction. Nat.choose_eq_fast_choose gives an exact faster representation,
but both a rewrite-based attempt and an explicit equality-composition attempt
timed out in this invocation. Investigate the actual elaboration/kernel cost;
do not infer that the binomial implementation alone explains every timeout.
The remaining certificate positivity is an experiment, not a theorem.

MarkovMiddleClosedM673 and MarkovSevenRowsM673 are unaccepted drafts. The latter
explores a residual with two central and five top horizontal rows; it was not
compiled and its proposed equivalence must not be assumed. Even a full middle
closure would leave ThreeOutsideMiddleMD02 and OtherFourM9E2 open, including
the vertical and diagonal conditions and all other source families.

Preserve raw coefficients, zeros, endpoints and universal scope. Root completion
requires every correspondence bridge, a fresh whole-source rebuild and kernel/
axiom checks, and a separate independent hash-bound English/source audit.
