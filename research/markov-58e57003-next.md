# Revisable next actions

Machine-authored request 58e5700333bc4922a9949ab13f9bac6f. Completion null.

The inherited lower-row convolution formula is now proved, including the axis
and all zero columns. Use source_two_lower_formulaM58E rather than treating
the earlier experimental formula as an assumption. lower_source_iffM58E
identifies the exact proper-subfamily arithmetic target LowerBinomialLCM58E.

A potential next action is to prove the global floor/ceiling midpoint inequality
for lowerTermM58E when j≥2. lower_term_localM58E proves its k=h+1 instance
for arbitrary natural indices, including zero tails. lower_core_scaledM58E and
lower_core_diagonalM58E give exact algebraic tools. Experiments support the
global statement, but it remains unproved. The h=k and k=h+2 local cases and
a justified balancing argument may be useful; this is a suggestion, not a recipe.

To infer log-concavity after summation, a second separate obligation is a
formal discrete Prékopa–Leindler theorem with zero extension and finite support.
Theorem 3 in https://arxiv.org/pdf/1905.04038 gives the relevant published
statement, but no result from that paper is a Lean axiom or an available proved
adapter. Mathlib's finite-lattice four-functions theorem was found; its meet/join
hypothesis is not the floor/ceiling hypothesis and cannot be substituted silently.

Do not impose the global midpoint condition on j=1: lower_term_midpoint_failsM58E
refutes it for every d≥1. The source row can still be log-concave, as formally
checked for the 2/5 triple [5,16,17]. The synchronized mixed-gap alternative
also fails. Existing source boundary theorems remain available for small j.

Even closing this lower-horizontal subproblem would leave upper numerator-two
rows, other directions and higher-numerator sources. Preserve every clause of
research/MarkovResidualM6E1.lean, including reverse-factor ranges, until new
proofs explicitly discharge them. Full root closure also requires the complete
source/English correspondence obligations and independent hash-bound audit.
