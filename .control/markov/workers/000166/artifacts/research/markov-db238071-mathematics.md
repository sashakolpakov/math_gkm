# Mathematical progress and remaining obligations

Machine-authored live request db238071732b4d94a95826082e34e37e.
The exact pinned Conjecture63 remains open. Final validated module names and
receipts are in evidence/markov-db238071/validation.json; generated candidates
outside that selection are not admitted results.

## First correction row

For q>=2 put j=q+1, n=3q+1 when r=true and n=3q+2 otherwise,
d=q-2 when r=true and d=q-1 otherwise, and c=8 or 4 respectively.
The inherited lower-row residual is H=rowHMFFD(n,j). The new identity is

    actual row = X^2 (1+X)^d (c + X H).

MarkovCorrectionFactorMDB2 proves equality of every literal raw coefficient,
not a normalized coefficient, and the conditional transfer from CrossLC of the
augmented residual c+XH to every horizontal triple in this row. This avoids
assuming that addition preserves log-concavity. The earlier negative mixed-gap
example [4,108,412] remains valid and is not overwritten or contradicted.
The q=1 exceptional correction is explicitly excluded by q>=2; it remains
required by the full target and is not assigned a truncated binomial exponent.

MarkovCorrectionSupportMDB2 compiled and proves exact support [0,q+2], with strict positivity inside
and zero extension outside. Under that support, adjacent residual inequalities
are equivalent to CrossLC. Neither predicate is asserted universally true.

The independent exact experiment uses the original path recurrence at every
q=2,...,50 and both r values. It compares 8,379 coefficients, retaining 3,136
zeros, tests 8,183 raw triples, and checks 64,778 residual cross pairs including
zero extension. No failure occurred. This is finite evidence, not a proof of
the remaining residual shape or of a new complete source direction.

## Dense certificate continuation

New arithmetic certificates extend predecessor products 0 and 1 through step
20, product 2 through step 16, and product 3 through step 15. Only matching
successful receipts establish these claims. Complete products, the signed gap,
ReducedPairPositiveMAD5 and LowerHorizontalMFEE remain unproved in this run.
The source consequence files are candidates and must not be imported as results.

The direct conversion tactic in KernelRflMDB2 proposes ordinary Eq.refl terms
through Lean's mkAuxLemma. The kernel checks definitional equality. A valid
integer multiplication was accepted; the deliberately false 1=2 candidate was
rejected by the kernel with a declaration type mismatch. This is operational
evidence about the elaborator, not a new axiom or an external proof oracle.
The large arithmetic checks still hit bounded timeouts, including a 300-second
reversed-convolution attempt. Failed source snapshots and diagnostics remain.

## Packed alternative

The exact sparse original gap has 20,813 nonzero positive coefficients. The
independent substitution s=T+x reduces the term count but introduces 478 negative
coefficients, so coefficientwise positivity in independent (x,g,z,s) is not the
selected certificate. It does not refute any source inequality.

The Kronecker experiment uses variable order (x,g,z,T), degree bounds
(22,19,12,18), radices (23,20,13,19), exponent weights (1,23,460,5980), and
base 2^80. Each product's sum of coefficients bounds each coefficient and is
less than this base. Four packed multiplication checks and the signed aggregate
check passed in about 12 seconds; the packed gap has 8,763,921 bits. This is an
experiment, not an accepted Lean certificate.

MarkovPackedConvolutionMDB2 proves natural-list convolution evaluation and sum
identities, a coefficient bound from the product of input sums, and packed
certificate soundness using Nat.ofDigits_inj_of_len_eq. Equal lengths, base>1,
an actual convolution coefficient bound, a proposal digit bound, and equality
of packed integers are all explicit. MarkovPackedExamplesMDB2 transports the
result to rational polynomial evaluation and gives a carry obstruction: at base
10, [9,0]*[9] packs to the same integer as [1,8], although the actual coefficient
list is [81,0]. Input/proposal digit bounds alone therefore do not suffice.

Still missing for the actual four-variable candidate: a formal flattening map,
exponent/radix bounds through multiplication, variable-evaluation transport,
zero-padding/length alignment, formal coefficient bounds, and kernel-checked
packed integer identities. No such bridge is silently assumed. The existing
denominator/cut/weighting/source bridges remain reusable after positivity.

ThreeOutsideLowerMFEE and OtherFourM9E2 remain intact. LowerRowShapeMFFD is
distinct from raw lower horizontal LC and is not inferred. Every root direction,
endpoint, zero, correction band, reverse-factor range and rational family remains
required. This worker's report is not the independent hash-bound completion audit.
