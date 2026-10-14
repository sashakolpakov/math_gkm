# Independent monitoring audit: worker 000041

Request: `561123595ffe40b8aae85b885aeebd2e`.

Read-only audit of the completed worker's archived output under
`/Users/sasha/math_gkm/.control/markov/workers/000041/artifacts`,
corresponding current final source/compiled objects, and retained receipts.
No project edits, mathematical advice, proposer contact, or interference
with the active successor. No new Lean build or numerical scan was run.

## Finding

The final English and Lean statements agree. The worker proves a sharp
integer threshold for one horizontal coefficient triple in a weighted
deformation of the actual 6/7 word. It separately proves strict
log-concavity of that same triple for every nonnegative integer common
weight. It identifies weight one with the actual source, including the
three raw coefficients and polygon memberships.

The failing unequal-weight family is not a source-family counterexample.
The universal parameter in these new inequalities is a weight on one
fixed word/triple, not a source denominator or arbitrary coefficient index.
Full Conjecture 6.3 remains unresolved.

## Exact objects and source identification

The matrices are

`A=[[v,1],[uv,u+1]]`, `C_t=[[v+t,1],[uv,u]]`.

For a list `ts=[t₁,…,tₙ]` of integers, the weighted matrix is
`A C_t₁ A C_t₂ … A C_tₙ A`, with scalar functional
`(v,1) M (1,u)^T`. The final Lean recurrence `weightedFG561` and
polynomial `weightedP561` are proved equal to this matrix scalar by
`weighted_fg_matrix561` and `weighted_scalar561`.

`weighted_coeff_nonneg561` proves every raw integer coefficient is
nonnegative whenever every member of the weight list is nonnegative.
This is a genuine universal coefficient statement about the defined
weighted family; it is not deduced from numerical observations.

`weighted_source_all561 n` identifies the list of `n` weights equal
to one with the literal source numerator on `List.replicate n true`,
whose label is `(n+1)/(n+2)`. It does not identify arbitrary unequal
weights with source polynomials. With five weights the source is 6/7.

The coefficients use the protected `U,V,coeff` meanings: raw integer
coefficients in `u,v`, corresponding to `u=x²,v=y²,w=1`. No factorial
normalization, averaging, or deduplication occurs. No new full homogeneous
source interpretation for arbitrary weighted objects is asserted.

## Sharp unequal-weight threshold

At the fixed positions `(4,3),(5,3),(6,3)`, weights `[t,1,t,1,t]`
give the formally proved exact coefficients

`L(t)=2t²+12t+2`,

`M(t)=20t²+132t+112`,

`H(t)=t³+42t²+369t+592`.

The exact gap is

`G(t)=M(t)²-L(t)H(t)=-2t⁵+304t⁴+4036t³+16208t²+21726t+11360`.

`weighted_horizontal_iff561` states, with `t : ℤ` and the explicit
hypothesis `0≤t`,

`L(t)H(t) ≤ M(t)² ↔ t≤164`.

The proof is not a finite scan. For `0≤t≤164`, it uses

`G(t)=t³*((164-t)*(2t+24)+100)+16208t²+21726t+11360>0`.

For every `n : ℕ`, it proves

`G(n+165)=-2n⁵-1346n⁴-339824n³-38170072n²-1614571584n-696140800<0`.

The integer case split covers every nonnegative integer, with no missing
large-parameter range. The conclusion is strict on both sides of the
integer threshold; there is no integer equality case in this domain.
No exact real threshold or theorem for arbitrary real weights is claimed.

`nonnegative_weighted_failure561` additionally proves, for every natural
`n`, that the weight list `[n+165,1,n+165,1,n+165]` is palindromic,
the entire weighted polynomial has nonnegative coefficients, and the
displayed horizontal inequality is reversed strictly. This rules out the
specified extension to arbitrary independent site weights even with a
palindromic assignment and fixed alternating A/C pattern. It does not
establish a counterexample to the published source target.

## Common weights and the actual source triple

For weights `[t,t,t,t,t]`, the same three positions have coefficients

`5t+8t²+3t³`,

`60+120t+72t²+12t³`,

`400+450t+144t²+10t³`.

Their gap is exactly

`3600+12400t+17590t²+13200t³+5512t⁴+1216t⁵+114t⁶`.

`uniform_horizontal_strict561` proves this gap is strictly positive
for every integer `t≥0`. It includes `t=0`, where the left endpoint
coefficient is zero. The conclusion is about this fixed triple and five
sites, not every horizontal triple or arbitrary word length.

At `t=1`, `actual_raw_triple561` proves the literal source coefficients
are `[16,264,1004]`. Their gap is `264²-16*1004=53,632>0`.
`source_horizontal_strict561` proves the source inequality and
`source_polygon561` proves all three positions are in the protected
polygon of the five-right-step source. The label is 6/7; these are genuine
source triples, not polygon claims about a substituted weighted polynomial.

The English text correctly does not present this one source instance as
new coverage beyond all inherited partial results. Other horizontal triples,
all remaining vertical/diagonal obligations, and root endpoint clauses are
not discharged by this run.

## Finite experiments

The retained scripts test coefficientwise nonnegativity of the common-weight
gap as a polynomial in a formal weight. This is stronger than evaluating
the gap at weight one, but these checks remain finite observations.

| Scan | Objects | Nontrivial horizontal triple tests |
|---|---:|---:|
| All A-ended words of lengths 1–17 with no adjacent C letters | 4,180 | 401,611 |
| Pell source cores `a/(a+1)`, `2≤a≤90` | 89 | 360,361 |
| Seeded uneven no-CC words, length at most 101 | 250 | 784,502 |
| Sum of executed tests | — | 1,546,474 |

I checked the retained totals and the scripts' loops/predicates. The total
is a sum of executed tests, not a count of distinct mathematical triples.
In particular, short Pell cores occur in the exhaustive short-word scan,
and no cross-scan deduplication is performed. Both the final mathematics
note and report expressly acknowledge possible repetitions.

The loop retains a possibly zero middle polynomial. It omits a triple from
its nontrivial count when an endpoint polynomial is zero; then the gap is
a square of a polynomial with nonnegative coefficients. No finite scan
establishes a universal no-CC statement or any whole source direction.

The further independent-site polynomial experiment reports two negative
gap coefficients at the 6/7 word. The English text correctly does not infer
failure at nonnegative weights from that fact alone; the evaluated family
and its threshold are separately proved in Lean.

## Matching final proof evidence

Final manifest: `evidence/markov-56112359/validation.json`, timestamp
`2026-10-14T16:28:53.672483+00:00`. The host reports completed,
approximately 1134.15 seconds, mathematical resolution false, completion null.

| Module | Final source SHA-256 | Final build receipt | Final kernel replay receipt |
|---|---|---|---|
| MarkovWeighted5611 | `8f0aaa4ad5a558fa4d733ecc9acda9dec812e2c2dd38429915bd8e3f0ea87c94` | `run-1791995072944876000.json` | `run-1791995116045792000.json` |
| MarkovWeightThreshold5611 | `8ac940451b5ae4f6d181bf0596a6e079f6e8a929f3941527c5f1e84370b8effb` | `run-1791995222679244000.json` | `run-1791995279625090000.json` |

Both final source hashes agree among archived/current source, final manifest,
host changes, and the source snapshots attached to the listed build/replay
records. All four records return zero; the replay command is pinned Lean
4.32.2 `leanchecker` on the corresponding module. Receipt hashes agree
with the host archive. Both archived/current compiled-object hashes agree
with the manifest and host record.

The eleven printed final axiom closures match successful build output and
contain only `propext`, `Classical.choice`, and `Quot.sound`.
Six failed elaborations are retained separately: three drafts of each module.
Other successful earlier versions also exist, but the final acceptance
claim is supported by the listed matching final records, not those earlier
versions. Failed diagnostics mentioning generated placeholders are not
accepted final proof evidence.

The protected root hash is unchanged:
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This was an inspection of recorded source-bound compilation and kernel
replay, not an independent fresh transitive rebuild. Inherited compiled
imports remain part of the verification boundary. No historical novelty
claim or proof/refutation of full Conjecture 6.3 is supported by this run.

