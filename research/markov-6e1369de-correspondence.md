# Source correspondence and exact remaining scope

Machine-authored request 6e1369de81764210b3799e9af43f1bb5. Completion is null.
This is a local source/scope account, not the required independent completion audit.

The root remains MathGKM.Markov.Conjecture63, source SHA256
8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
Canonical contract SHA256 is
6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.
The live publisher source was read, including definitions 6.1–6.2 and
Conjecture 6.3:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .

## Coverage

source_two_rowM6E1 quantifies over every finite Boolean path, every natural
row j, and every natural starting column i, subject only to the actual label
having a=2 and b=2j+1. It has no finite denominator, depth, or column bound.
This covers the full central horizontal row of the entire numerator-two
family. It does not cover all reduced rationals. Existing universal indexing
and coverage modules are inherited and are not freshly rebuilt or independently
re-audited in this invocation.

## Source family

The conclusion uses exactly coeff (frame path).mid.p. The inherited theorem
source_two_squares3556 identifies every numerator-two source with
F_(j+1)^2+V F_j^2 and supplies j≥1. The new proof derives a global below-axis
coefficient formula from fib_formula_aux6 and fib_degree6, both proved from
the actual source recurrence in inherited modules. The square convolution,
finite summation, zero tails, and source-row adapter are now proved in new
modules. No paper formula or finite interpolation is assumed.

## Homogeneity and coefficients

The pinned coeff function is unchanged: it extracts the ordinary integer
coefficient of u^i v^j after w=1. All final inequalities compare these raw
coefficients. Multiplicative identities clear positive factors internally;
there is no position-dependent normalization of the target. Homogeneity
identifies the omitted exponent as a+b-1-i-j. The complete existing source
homogeneity bridge remains inherited rather than newly independently audited.

## Polygon

central_polygonM6E1 identifies the pinned polygon section at a=2,b=2j+1,
row j with precisely 2≤i≤j+2. source_two_row_supportM6E1 proves positive
raw coefficients exactly on that section; source_two_row_zeroM6E1 proves
zero outside it. The inequality itself is proved for every natural starting
column, hence applies whenever its three polygon guards hold. This section
result is not a new full Newton polygon proof for arbitrary sources.

## Directions, zeros, endpoints

Only the horizontal direction is newly discharged. All zero entries are
retained, including columns 0 and 1 and every column beyond j+2. The proof
does not divide by a coefficient. The full all-path root equivalence
root_iff_interiorM6E1 removes the condition a=2,b=2j+1 from the remaining
horizontal obligation; it retains every other horizontal guard and the
entire vertical and diagonal residual clauses, including reverse-factor
ranges. Endpoint clauses 0/1 and 1/1 remain accounted for by the inherited
exact root equivalence; they are neither deleted nor redefined.

## Assumptions and validation

Pinned Lean 4.32.2 and read-only pinned Mathlib are used. No new axiom,
admission, native_decide, package update, or dependency edit is permitted.
Final source-bound compilation, joint isolated kernel replay, and explicit
axiom closures are recorded in evidence/markov-6e1369de/validation.json once
all checks pass. Only propext, Classical.choice and Quot.sound are permitted.
Inherited compiled imports are reused. There is no fresh whole-source rebuild,
controller admission, or independent hash-bound English/source completion audit.

## Proof scope

InteriorCore63M6E1 remains unproved. The gain witness concerns an unbounded
actual source family at starting column three, satisfying the preceding
residual guards. It demonstrates proper additional coverage, not universal
closure. Experiments and capability failures supply no mathematical premises.
The full central-row derivation is in markov-6e1369de-derivation.md. Full pinned
Conjecture63 and its negation remain unresolved.
