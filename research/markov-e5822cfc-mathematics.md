# Exact quintic residual identity and sixth-diagonal inequalities

Machine-authored live research for request e5822cfcbab4405195d110889f9273f6.
The full pinned Conjecture63 remains unresolved. No novelty claim is made.

The formerly interpolated quintic expression is now derived by induction in
`MarkovQuinticExprE582.lean` and `MarkovQuinticJetE582.lean`. For a Boolean core
word w of length at least three, let n be its length, m its true-letter count,
s its number of switches, and t the count of 000 and 101 triples. Let h count
0000 and 1001, and k count 0000, 0001, 0011, 1000, 1001, 1011, 1100, 1101.
Let e count false endpoints, and f count prefix/suffix occurrences of 010.
Over every commutative ring, `word_quinticE582` identifies 120 times the fifth
coefficient of the exact two-state word quotient with `quinticExprE582`.
The six explicit coefficients are in that definition; no fitted values are
assumed. Prefix and suffix occurrences are counted separately, including
when they coincide in a length-three word.

The proof retains the previous quartic row invariant, an exact third
coefficient for the second state, and three terminal letters. The latter
coefficient follows from the cubic scalar and second-state quadratic at the
previous step. `quintic_transitionE582` proves the sixteen local append
identities by ring normalization. Initial cases and fold induction then prove
the universal word formula. The earlier interpolation is thus motivation,
not a premise.

The source identification uses the existing exact source_word774 theorem:
n=b-2 and m=a-1. `quintic_source_formulaE582` includes the new local-count
bounds, and identifies the literal quotientSlice774 path 5. This is an
integral polynomial identity, with 120 only clearing denominators.

For m>=9, the bounds s<=2(n-m), t,h<=n-m, k<=2(n-m), and e,f<=2 give
upper/lower coefficient bounds. Substitution m=x+9 and n=m+y leaves
nonnegative coefficients in the four lower estimates for the adjacent gaps,
and in the required positivity estimates. Lean checks the identities and
nonnegativity in quintic_certificateE582, then transfers them by monotonicity.
`sixth_raw_logConcaveE582` proves the raw sixth-upper-diagonal inequality
for every source path with a>=10.

For small m, the new counting inequalities are n<=t+3m+2 and n<=h+4m+3.
Their proofs charge each missing all-zero local window to a true letter and
retain boundary corrections. Together with s<=2m, they yield polynomial
certificates for each m=1,...,8 when n>=18. These are eight cases of an
unbounded algebraic theorem, not a finite denominator scan.
`sixth_raw_longE582` consequently proves, for every source path with b>=20,
all natural i,j satisfying i+j+7=a+b-1,

    coeff P i (j+2) * coeff P (i+2) j <= coeff P (i+1) (j+1)^2.

The numerator-one case uses its inherited full theorem. The transfer for
other numerators uses the exact upper-slice factorization, already-proved
interval support, and raw binomial smoothing; it does not normalize the
coefficient sequence. Zero coefficients remain included.

This leaves only a finite range for the sixth diagonal: b<=19 and a=2,...,9
(subject to the source restrictions). That finite gap has NOT been closed by
the present Lean theorems. Earlier first-five-diagonal theorems are unchanged.
Other diagonals and the remaining horizontal/vertical interiors remain
unresolved, so even completing this finite gap would not prove the root.

The exact Python cross-check in quintic-check.json compares the formula and
all stated count bounds with independently evaluated truncated word products,
and checks actual-source raw sixth-diagonal triples. These are finite
experiments only. An initially proposed bound k<=n-m is false: core 11011
has k=2 and one false letter. The proof uses k<=2(n-m). This is a failure of
an enlarged-word statistic bound, not a source-conjecture refutation.

Validation records retain rejected attempts, source snapshots, hashes,
successful compilation/axiom outputs, kernel replays and timeouts. Validation
uses inherited compiled imports and is not a fresh independent full-source
root audit. See validation.json for the exact per-module status.
