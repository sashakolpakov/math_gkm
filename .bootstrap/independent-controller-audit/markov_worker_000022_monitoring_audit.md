# Independent monitoring audit: worker 000022

Request `e5822cfcbab4405195d110889f9273f6`. Read-only review of the completed
snapshot `/Users/sasha/math_gkm/.control/markov/workers/000022/artifacts`.
No project edits, mathematical guidance or proposer contact. Active worker
000023 was left undisturbed.

## Finding

The generic quintic word identity is now proved. The two source conclusions
establish actual raw sixth-upper-diagonal LC for **every source with a≥10 or
b≥20**, at every natural triple on the line, including zeros. The source formula,
statistic bounds and LC premises are discharged in both ranges.

The remaining sixth-diagonal cases lie in the finite range b≤19, a=2,...,9,
subject to the actual source restrictions and valid triple indices. They are
not settled by this invocation's Lean theorems or by its finite Python scans.
The a=1 family was already completely proved. Other diagonal levels and the
remaining coordinate-direction inequalities still belong to the unresolved
full conjecture. No substantive English/Lean scope mismatch was found.

## Exact generic identity

`word_quinticE582` applies to every Boolean core with an explicit three-letter
prefix, hence length n≥3, over any commutative ring. It states an identity for
**120 times** the fifth outer coefficient of the exact quotient. It does not
divide by 120 in an arbitrary ring. Its specialization to integer polynomials
is the source identity used by the LC proofs.

The expression retains the following actual word statistics:

- n: word length; m: true-letter count; s: adjacent switch count.
- t: occurrences of 000 and 101.
- h: occurrences of 0000 and 1001.
- k: occurrences of 0000, 0001, 0011, 1000, 1001, 1011, 1100 and 1101.
- e: false endpoints, counted separately at the two ends.
- f: occurrences of 010 as prefix and suffix, counted separately even when
  they coincide in a three-letter word.

These definitions match the English description. The exact expression's six
coefficients are explicit in `quinticExprE582`; they are not supplied by an
unproved interpolation oracle. The proof retains the inherited quartic state,
an exact third coefficient of the second state and the final three letters.
It checks all sixteen local transitions, all initial three-letter cases, then
proves the fold induction. The formerly fitted expression is therefore no
longer merely finite evidence.

No claim for empty, one-letter or two-letter cores is hidden in the generic
theorem. The parameter ranges of the actual source applications force enough
letters and explicitly eliminate those shorter cases.

## Source ranges and coefficient inequalities

For a≥10, `quintic_source_formulaE582` uses the actual source-word identity to
give n=b-2, m=a-1 and m≥9. It proves m≤n and all required statistic bounds:

    s≤2(n-m), t≤n-m, h≤n-m, k≤2(n-m), e≤2, f≤2.

All statistics are natural and hence nonnegative. The k bound is the corrected
factor-two bound, not the empirically refuted stronger bound k≤n-m.

`quintic_certificateE582` proves the requisite lower coefficient estimates and
four adjacent gap estimates after m=x+9 and n=m+y, with x,y≥0. The subsequent
monotonicity argument proves the four exact adjacent quintic inequalities.
Nonnegativity needed to compare products and squares is explicitly established.
No coefficientwise sum-closure assertion is substituted for these inequalities.

For smaller positive m, new induction proofs give

    n≤t+3m+2 and n≤h+4m+3.

Together with the proved s≤2m bound, these yield separate algebraic certificates
for each m=1,...,8 and every real n≥18. These are eight finite parameter cases
of unbounded polynomial inequalities; n is not enumerated. Lower estimates
such as n-4m-3 are real expressions, not accidentally truncated natural
subtractions, and their use is justified by the explicit lower-bound premises.

`word_quintic_adjacent_longE582` combines m≥9 with the eight smaller cases and
discharges all statistic hypotheses for actual words. The source adapter uses
b≥20 to obtain n≥18. A source with a=1 is separately covered by the inherited
complete numerator-one theorem. Thus `sixth_raw_longE582` has no surviving
positive-numerator-count or residual LC assumption beyond the ordinary source
definition.

## Actual raw diagonal and zeros

Both final source conclusions use the pinned raw integer `coeff` and state

    A_(i,j+2) A_(i+2,j) ≤ A_(i+1,j+1)^2,
    whenever i+j+7=a+b-1,

under, respectively, a≥10 and b≥20. The three points have omitted homogeneous
exponent five, i.e. the sixth upper diagonal with the top indexed by r=0.

The source quotient identity is mapped to real polynomials, its common factor
120 is canceled, and the exact inherited upper-slice transfer applies.
The 2r≤a+b-1 condition follows from the stated source parameter bounds;
interval support is the previously proved universal theorem. Polynomial tail
coefficients are exactly zero, so the adjacent statements and the transfer
retain all natural indices and zeros. No polygon guard is needed, and no
factorial or binomial coefficient normalization occurs.

The union a≥10 or b≥20 is supported by two separate checked final theorems;
it need not be inferred from a statistical observation. Completing its finite
complement would still address only this one additional diagonal family.
No historical novelty assertion is made by this audit.

## Recorded verification and earlier unsuccessful checks

Manifest: `evidence/markov-e5822cfc/validation.json`.
Every final source hash matches the manifest, archived host change and live bytes:

| Module | SHA-256 |
|---|---|
| MarkovQuinticExprE582 | b74303ad40c3bb0500ba482f8d770a2308133e8628f03afe34206a3d3e0015d4 |
| MarkovQuinticJetE582 | ee7ca71de78bfe183cd2f0831521ef8e140d978b03b4bf0c1d6e2276b9a6ec16 |
| MarkovQuinticBoundsE582 | d7474364751308c925a20e4f006f5246034fe8f2be3f4d5cfb63da03d228df3f |
| MarkovQuinticSourceE582 | cb5b1e96153819767c9d257119de123e75f3cf6da9ffa370de0289420d0bb0fd |
| MarkovSixthE582 | b71c1bf91ff7aea8ed5a801c186bce0a426efa54559b55257d91e7587183ac7c |
| MarkovQuinticCountsE582 | 5ca6407fa2246af56e99151f5dd71e532aaa2c92750d5b982c283c8aadc6c363 |
| MarkovSmallQuinticE582 | 5fa7ed84a45915c7a3a4a82d4df5cb0da9754cbe8af0f01c9ea73773316122aa |
| MarkovSixthLongE582 | c382a3ee129aff004489e481e4047d208eb75e9fcceda7fd9838f8010be216ff |

Eight final compilations and eight final `leanchecker` replays have return
code 0 and matching source hashes. All sixteen receipt byte hashes match the
archived host record. Eight printed theorem axiom closures contain only
`propext`, `Classical.choice`, and `Quot.sound`; the expression module has no
separate axiom print, but its transition theorem is used by the printed word
theorem and the module also has a successful replay. Every listed direct-import
binary hash matched at audit time.

Four earlier compilations have return code 1 and remain rejected. Four earlier
kernel invocations for QuinticJet, QuinticSource, QuinticBounds and Sixth were
recorded as approximately 90-second timeouts. Their source hashes equal the
respective final hashes. Each subsequently has a successful replay in the
manifest. The timeouts are not themselves credited as verification and are not
misrepresented as permanent proof failures.

The root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host records completion after 1197.01 seconds, mathematical resolution false
and no completion certificate.

This audit inspects source meanings and matching recorded checks against
inherited compiled imports; it is not a fresh independent full-source rebuild.
No discrepancy requiring one was found. The full Conjecture 6.3 remains unresolved.
