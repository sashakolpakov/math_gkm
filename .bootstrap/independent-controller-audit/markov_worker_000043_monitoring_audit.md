# Independent monitoring audit: worker 000043

Request: `67c3f3f5030b42499b0a8bba235e6267`.

Read-only audit of the completed worker's archived output under
`/Users/sasha/math_gkm/.control/markov/workers/000043/artifacts`,
matching current final source/compiled objects, and retained verification
records. No project edits, proposer contact, mathematical guidance, or
active-worker interference. No new Lean compilation was performed.

## Finding

The final theorems correctly prove universal neighboring-charge comparisons
for the exact Pell summand array, including both orientations and all support
zeros. They imply coefficientwise log-concavity in the excess parameter
for a fixed pair of consecutive charge classes. They also settle the linear
coefficient of the full refined gap, but not all its coefficients or its
evaluation at one.

No material mismatch was found in the final mathematics and correspondence
notes. In shortened reporting, “two-charge polynomial” must retain the
qualification **two consecutive charge indices**. Arbitrary separated pairs
are not covered. The run does not resolve the full Pell horizontal inequality
or full Conjecture 6.3.

## Exact parameters and connection to source coefficients

With positive excess `S≥1`, the English summand is

`H(a,j,S,q)=choose(a-q,S)*choose(S+q-1,q)*choose(2*S,j-q)`,

with an explicit zero when `q>j`, and zero for out-of-range binomials.
In Lean it is `horizontalTerm9a72 a j q (S-1)`. Its value is an integer;
the binomial arguments use natural numbers with their stated zero conventions.

The final array theorem uses `a,j,q,s : ℕ` and positive English excess
`S=s+1`. Thus it includes every positive excess and also includes parameter
values outside actual source support. It does not require positive summands,
an interior-support assumption, a numerator cutoff, or a denominator cutoff.
The value `a=0` is allowed for the auxiliary array; it is not presented as
an interior source numerator.

The inherited source formula `right_horizontal_sum_fixed9a72` identifies
the sum over `0≤q≤a` with the actual raw coefficient of source
`a/(a+1)` when `a=n+1`, `S=s+1`, `s≤n`, and
`i+j=n+s+2=a+S`. The new statements use that same literal summand.
They do not identify partial charge polynomials with source numerators,
nor prove a new universal source formula without its inherited hypotheses.

Changing excess at fixed `j` corresponds to changing the horizontal
source coordinate when the source formula applies. The auxiliary charge
variable records `q`; it is not a source coordinate or the omitted
homogeneous variable.

## Universal neighboring-charge inequalities

`horizontal_adjacent_pairs67` proves both

`H(a,j,S,q)*H(a,j,S+2,q+1) ≤ H(a,j,S+1,q)*H(a,j,S+1,q+1)`,

`H(a,j,S,q+1)*H(a,j,S+2,q) ≤ H(a,j,S+1,q+1)*H(a,j,S+1,q)`.

These hold for every natural `a,j,q` and every positive `S`.
They are individual ordered-product bounds, not merely a bound for their
sum.

The proof treats `q+1>j` by the summand's explicit guard and treats
`q+1>a` by its zero binomial factor. In the remaining cases the natural
subtractions `a-q-1` and `j-q-1` are justified before using the
binomial comparisons. The stride lemmas separately handle out-of-support
binomial zeros. No division by a possibly zero summand is made.

The intermediate rational identities clear positive algebraic factors.
Their positivity hypotheses are explicitly discharged in the support cases.
The final inequalities are over the unchanged integer summands. No
normalization or new mathematical assumption enters the comparison.

The inherited individual-summand log-concavity is used separately for
equal charge indices. The new theorem concerns charge separation one.
It asserts nothing universal for separation two or larger and does not
contradict the inherited obstruction at larger separation.

## Exact coefficientwise consequences

For fixed `a,j,q`, define

`P_s(T)=horizontalTerm9a72 a j q s*T^q
       +horizontalTerm9a72 a j (q+1) s*T^(q+1)`.

`adjacent_fiber_gap67` states, for every `a,j,q,s,k : ℕ`,

`[T^k](P_(s+1)(T)^2-P_s(T)*P_(s+2)(T)) ≥ 0`.

The possible nonzero gap degrees are `2q,2q+1,2q+2`. The two outer
coefficients follow from individual-summand log-concavity; the middle
coefficient follows from the sum of the two new ordered-product bounds.
All other coefficients, including zeros, are retained by the universal
`k` quantifier.

This is coefficientwise log-concavity of a polynomial sequence as `s`
varies. It is not a claim that an arbitrary two-charge restriction, or the
full sum over charge classes, has the same property.

For the full refined polynomial

`F_s(T)=Σ_(q=0)^(n+1) horizontalTerm9a72 (n+1) j q s*T^q`,

`full_fiber_linear67` proves, for every `n,j,s : ℕ`,

`[T^1](F_(s+1)(T)^2-F_s(T)*F_(s+2)(T)) ≥ 0`.

Only ordered pairs of charges 0 and 1 contribute to this coefficient.
The proof retains the full finite polynomial and its zero conventions;
it does not substitute a smaller polynomial for the full object.
Its all-parameter quantifiers are genuine and need no `s+2≤n` assumption.

The theorem fixes auxiliary degree `k=1`. It does not establish the
universal-`k` premise `HorizontalFiberGoal9a72`, the corresponding
truncated goal, or nonnegativity after evaluation at `T=1`. Consequently
the inherited conditional transfer to full source horizontal LC remains
conditional. Other source rationals, vertical/diagonal inequalities, and
root endpoints are not newly discharged here.

## Finite experiments and their limits

Retained records report:

- 855,442 mixed adjacent-product tests without a failure;
- 168,147 ordered adjacent-product tests without a failure;
- 9,244,313 ordered local-midpoint tests without a failure.

The last count includes distances `0,+1,-1,+2,-2`; it is not a count
of distance-two tests alone. The retained `local_pairs_67c3.py` uses

`3≤a≤54`, `0≤j≤2a`, `1≤S≤a-2`,
`0≤q≤min(j,a-S)`,

and skips choices with `q+d<0`. It compares the ordered endpoint product
at charges `q,q+d` with the middle product at the two integer midpoint
charges. I independently counted these loop indices, without rerunning
the mathematical comparisons, and obtained exactly 9,244,313.

The recorded absence of failures is finite experimental evidence.
Distance-two comparisons remain unproved. These finite checks are neither
an all-source coverage argument nor proof of the full sum inequality.

The documentation cites the published target and a related log-concavity
framework, but no external mathematical theorem is introduced as a Lean
premise. This audit makes no historical novelty claim or new literature
status claim.

## Final verification evidence

Final manifest: `evidence/markov-67c3f3f5/validation.json`, timestamp
`2026-10-14T17:08:45.497701+00:00`. The host records a completed attempt
lasting approximately 1196.89 seconds, with mathematical resolution false
and completion null.

| Module | Final source SHA-256 | Build receipt | Kernel replay receipt |
|---|---|---|---|
| MarkovAdjacent67c3 | `52f241d7d0572b80422e9e68a8e142f78d7c269d39ab113ad3026517ca1b1199` | `run-1791997308901126000.json` | `run-1791997394756730000.json` |
| MarkovSummandPairs67c3 | `931b8fbdcaaf6ae0e1a127a1c6ae905c73309e54f2c4d5b9c3c45c7d1da9b8a5` | `run-1791997439663976000.json` | `run-1791997526584699000.json` |
| MarkovFiberAdjacent67c3 | `90dbb1c8dd45f6762d96f188e53548a4b698ad28bf8c216942fb88e3c1a013c6` | `run-1791997674612879000.json` | `run-1791997695575774000.json` |

All three final source hashes agree among current source, archived source,
manifest, host change record, and build/replay snapshots. All six listed
records return zero and refer to those same final source hashes. The replay
commands invoke pinned Lean 4.32.2 `leanchecker` on the matching modules.
Archived receipt hashes agree with the host record. Archived/current
compiled-object hashes agree with the manifest and host record.

The seven printed final axiom closures agree with successful build output
and contain only `propext`, `Classical.choice`, and `Quot.sound`.
Six failed elaborations are retained separately: two adjacent-comparison
drafts, one summand-pair draft, and three fiber drafts. They are not accepted
proof evidence.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected matching recorded compilation/kernel replay, rather
than performing a fresh transitive source rebuild. Inherited compiled
imports remain part of the verification boundary. Full Conjecture 6.3
remains open within the project.

