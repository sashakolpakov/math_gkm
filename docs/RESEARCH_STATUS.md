# Research status and evidence scope

**Documentation cutoff: completed worker 158, 16 October 2026.** This is a dated
summary, not a live controller-status query. It leaves later workers and their
active work outside scope. Earlier checkpoint pages remain historical records.
The [mission](../MISSION.md), [design](DESIGN.md) and pinned
[Markov contract](../contracts/markov-goal.json) are unchanged.

## Agoh: completed exercise

The [Agoh account](round2/AGOH.md) describes the universal n-fold divisibility
result, its reduced-numerator interpretation and the checked counterexample to
the two formalized readings of the final characterization conjecture. The main
proofs are in [AgohMain.lean](../MathGKM/AgohMain.lean) and
[AgohConsequences.lean](../MathGKM/AgohConsequences.lean). Their domain and source
correspondence qualifications remain part of the result.

## Markov: all numerator-two sources, partial numerator-three sources

The root remains [MathGKM.Markov.Conjecture63](../MathGKM/Markov.lean), based on
Evans–Veselov–Winn's published Conjecture 6.3. It concerns **raw** squared-variable
numerator coefficients, not multinomial-normalized coefficients. The three
consecutive-triple directions are `(1,0)`, `(0,1)` and `(1,-1)`, retaining zeros
and the stated polygon/endpoint conventions.

The campaign has proved all three directions at **all natural coefficient
indices for every numerator-two source**. This is universal in the source
parameter, not a denominator-bounded scan. The current assembly is
[MarkovTwoCompleteM8F7.lean](../research/MarkovTwoCompleteM8F7.lean):

| Declaration | Meaning |
| --- | --- |
| `source_two_diagonal_allM8F7` | Completes the raw diagonal inequality at all natural indices. |
| `source_two_globalM8F7` | Combines the earlier horizontal and vertical theorems with that diagonal result for every generated source with numerator two. |
| `source_two_weakM8F7` | Transfers to the polygon-scoped `WeakLC` predicate. |
| `two_family_globalM8F7`, `unbounded_two_sourcesM8F7` | The explicit numerator-two family is covered uniformly, with unbounded denominators. |
| `root_iff_other_sourcesM8F7` | The full root is equivalent to the remaining-source predicate; it does not prove that predicate. |

The [worker152 validation record](../evidence/markov-8f77f493/validation.json)
binds this assembly to its successful selected checks. Its source correspondence
and inherited-dependency boundaries still apply; this documentation is not a new
whole-library rebuild or a full-root completion certificate.

For numerator three, the completed record through worker158 contains source
identifications, row formulas/factorizations, degree results and particular
proved directions/regions. For example,
[MarkovFifthSourceMFFD.lean](../research/MarkovFifthSourceMFFD.lean)
proves the **entire horizontal row `j=5`** for each numerator-three source, for
all natural column indices, including small parameters and zeros. Its
`source_three_horizontal_fifthMFFD` theorem connects the explicit family to
actual generated source polynomials. “Row five” here means the second coefficient
index is fixed at five; it does not mean all rows are solved.

[MarkovResidualMFFD.lean](../research/MarkovResidualMFFD.lean) gives the exact
remaining conjunction as `root_iff_remainingMFFD`. Its predicates
`ThreeRemainingMFFD` and `OtherFourM9E2` remain open. The
[worker158 validation record](../evidence/markov-ffd747f5/validation.json)
records eleven selected modules and 43 theorem closures, with null completion.
**Full Conjecture 6.3 remains open.**

## How to read the claim boundary

A theorem about an explicit auxiliary formula is distinct from a theorem
identifying that formula with the source. A universal implication is distinct
from a proof of its premises. A counterexample to a stronger normalization or
auxiliary mechanism need not be a counterexample to the raw source conjecture.
Finite experiments remain finite evidence even when their arithmetic is exact.

Retained compilation, replay and axiom prints have separate scopes. In
particular, the current large import branches still include the historical
212 compiled-but-unreplayed worker121 modules; importing them does not recover
that backlog. The 195 subset and the separately accepted nineteen-module set
must not be conflated. WindowLC6d34 retains its historical narrow print/check
limits. Worker157's successful recovery of the twelve final worker156 modules
is separately recorded and does not rewrite worker156's original timeout and
null-report history. These inherited limitations remain visible in the retained
audits.

Final resolution requires a closed proof of the pinned root or its exact
negation, fresh project-source validation and an independent hash-bound review
of coverage, source family, coefficient interpretation, polygon, all directions,
zeros/endpoints and assumptions. The [controller completion procedure](CONTROLLER.md#completion-and-independent-audit)
enforces that separate boundary. Neither a worker success flag nor this status
page substitutes for it.

The [initial Markov account](round2/MARKOV.md) remains useful for the root
conventions and early proof/experiment history. Its 13 October frontier predates
the universal numerator-two result above.
