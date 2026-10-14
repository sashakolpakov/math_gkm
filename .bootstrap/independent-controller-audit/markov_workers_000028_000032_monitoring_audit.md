# Independent combined audit: workers 000028 and 000032

Requests: `26ca8e85115d41ff961f5f8dc987b479` and
`654a72ea1e2f44769f8a3d78a690543a`.

This read-only audit inspected the archived worker snapshots, retained Lean
sources, mathematical and correspondence notes, successful and failed
validation receipts, host receipts, and event tails. It supplements the earlier
supervisor-only worker 000028 note; it does not rewrite that historical record.
No project edits, new proofs, proof suggestions, proposer contact, or interaction
with the active successor occurred. No new Lean build was run.

## Main conclusion

Worker 000032 completed both raw horizontal and vertical inequalities across
the first three positive-excess strips of every Pell source `a/(a+1)`. More
precisely, for every actual source path with `b=a+1` and every natural `i,j`
with `i+j=a+1`, it proves both

```
A(i,j) A(i+2,j) ≤ A(i+1,j)^2
A(i,j) A(i,j+2) ≤ A(i,j+1)^2.
```

The final theorem has no coordinate lower bounds, polygon guards, missing
small cases, numerical cutoff, or unproved fiber premise. It therefore includes
all polygon-valid triples starting on that band and retains zero coefficients
outside support. There is no claim that every horizontal or vertical triple of
the Pell family is covered: starting bands deeper than `i+j=a+1` remain outside
this theorem. The full Pell inequalities and the full conjecture remain open.

The exact ordinary generating equation for the whole Pell source family is
also proved. The proposed positive lower-excess regrading remains a mathematical
derivation supported by finite experiments, not a Lean theorem. No substantive
English/Lean correspondence defect was found at these stated scopes.

## Worker 000028: what was retained and what was not proved

The archived events end with the selected model reporting a capacity error.
The host outcome is `missing_or_malformed_report` after 648.82 seconds. This
was an operational interruption, not a mathematical counterexample.

Two final modules had successful source compilation at the interruption:
`MarkovPellLowerSum26ca` and `MarkovPellLowerFormula26ca`. Their archived
worker-28 records did not include separate successful kernel replays. A third
module, `MarkovPellLowerLC26ca`, had a compilation command started with no
successful completion in that worker's archived events.

`right_lower_sum26ca` proves an exact raw coefficient sum with `2s+3` terms:

```
A(i,j) = sum_(k=0)^(2s+2)
  choose(i-(s+1)+k,s+1) choose(s+j-k,s) choose(2s+2,k),
```

under the explicit conditions `s≤n`, `i+j=n+s+2`, `i≥s+1`, and `j≥2s+2`,
for the repeated-right source `(n+1)/(n+2)`. The formula's width depends on
the strip depth, not the denominator. Natural subtraction is safe precisely
on that stated interior region. It is not an unrestricted formula at corners.

The three specializations in `MarkovPellLowerFormula26ca` give exact coefficient
polynomials for excess depths one, two, and three, with coordinate bounds
`(i≥1,j≥2)`, `(i≥2,j≥4)`, and `(i≥3,j≥6)`. They are identities, not
log-concavity theorems. The rational casts express integer coefficients using
polynomials with rational constants; no coefficient normalization occurs.

Worker 000032 revalidated the unchanged old LC draft and obtained a genuine
failed elaboration. Its source hash
`87c3ca30e472407b8f6a64726f0c4c63c5a0280a0006aa19ccc7f97388639a49`
matches the worker-28 snapshot and the currently retained old file. The failed
receipt is `evidence/markov-654a72ea/run-1791961173739424000.json`, return code
one. Thus the old declarations remain unaccepted; a later corrected copy does
not retroactively turn that failed draft into proof evidence.

## Worker 000032: completed interior and all boundary cases

`MarkovPellLowerLC654a` proves the corrected interior gap inequalities over
the rationals and transports them back to literal raw integer coefficients.
The proof certificates reduce to polynomials nonnegative on translated
nonnegative coordinates. The inherited exact first-three-strip coefficient
identities are used within their actual hypotheses.

Those interior results alone would require `i≥1,j≥6` horizontally and
`i≥3,j≥4` vertically. The subsequent modules really discharge the omitted
cases rather than retaining these bounds in the final theorem:

- `right_sum_j654a` gives a finite sum through `q=j`, under its exact range
  assumptions. Symbolic expansions cover horizontal rows `j=3,4,5` and the
  missing vertical cases `j=0,1,2,3` with an unbounded remaining coordinate.
  These are universal polynomial proofs, not finite denominator tests.
- The horizontal `i=0` corner is treated by exact coefficient formulas for
  every sufficiently large source parameter and explicit small cases. The
  reported large-parameter triple `1,7n-3,(49n²-137n+108)/2` agrees with the
  Lean shifted-coordinate formula. The `i=0` vertical case is covered too.
- Existing complete boundary/row results cover horizontal `j=0,1,2` and
  vertical `i=1,2`. They are reused, not credited as newly proved whole rows.
- For small `n<2`, the right endpoint of either tested triple is proved zero
  using the unchanged outside-polygon theorem. Small sources are not excluded.

`lower_band_horizontal654a` and `lower_band_vertical654a` therefore quantify
over all natural `n,i,j` with `i+j=n+2`. The final
`source_near_one_lower_band654a` uses the inherited exact classification of
paths with `b=a+1`, so the result covers all actual sources in the named
family, not only a separately assumed word representation.

The final starting-coordinate restriction is exactly `i+j=a+1`. Accordingly,
the two endpoint comparisons use excess degrees one, two, and three. It would
overstate the result to call it all horizontal/vertical inequalities within
three starting bands, or a complete log-concavity proof for the Pell family.
The worker's English account uses the narrower correct meaning.

## Whole-family generating equation and unproved regrading

`pellFamily654a 0=1` is an auxiliary initial polynomial, and
`pellFamily654a (n+1)=rightP650 n` is the exact source at `(n+1)/(n+2)`.
The proved recurrence includes its initial case. With `S=1+u+v`,
`pellSeries654a` is a formal power series over the raw bivariate integer
polynomial ring, and `pell_generating654a` proves

```
(1-(u+v)(1+u+v)z+uv z²) sum_a P_a z^a = 1-vz.
```

This is an exact multiplication identity of formal series; no analytic
convergence hypothesis or unexplained division is present.

The separate lower-excess generating expression in the research note is
explicitly not yet formalized. Its treatment of negative underlying series
indices as zero is important and is not replaced by unrestricted natural
subtraction in an accepted theorem. The reported 98,760 finite checks through
`a=40` remain experiments. Likewise positivity of the proposed transfer kernel
is not claimed to establish the still-missing cross-strip inequalities or
`HorizontalFiberGoal9a72`.

## Hash and recorded verification audit

Seven selected modules have successful worker-32 compilation and separate
Lean 4.32.2 `leanchecker` receipts. The first two are recovered unchanged
worker-28 sources; the other five are new worker-32 modules.

| Module | Final source SHA256 |
| --- | --- |
| MarkovPellLowerSum26ca | `96eefeee6b90f9e113bcdecece026d9c35555e52c611a7e275e994158efe6a70` |
| MarkovPellLowerFormula26ca | `e22119248a72d8bedf55f28b3e09254f5c9a3fef9d919de408d6e1f416f1bf89` |
| MarkovPellLowerLC654a | `d4d24635d8aaffdaab1d4a3ca0fab9ed81b4d2acb82d847b998ea6c25fd0cd2a` |
| MarkovPellLowerSmall654a | `03006d69df3e0636690d49fbf69c7649f28e7ea40319af3d669d0c21474b549f` |
| MarkovPellCorner654a | `21781c2f3b81a6888c6633fb44ca60f3f1aea418d41feb7b56ea30fff697456e` |
| MarkovPellLowerBand654a | `58757855dc310704894ef4cc7137c19f8e6f10f3e7fd1eaada733dc0a4d39cfe` |
| MarkovPellGenerating654a | `b61554830dfa978b756bbe3739a56a613e5a04d37732891833539fa783b5a1ed` |

All hashes match the archived source, current source, validation manifest,
and the source's originating host receipt. All 14 successful worker-32 build
and replay receipts bind the matching source hash and themselves match the
archived host receipt hashes. All 19 printed dependency closures contain
only `propext`, `Classical.choice`, and `Quot.sound`.

The final band replay is
`evidence/markov-654a72ea/run-1791962092000811000.json`, return code zero.
Its timestamp and recorded duration place completion at approximately
07:15:04.142 UTC on 14 October 2026. The worker's host timeout occurred at
07:16:53.335 UTC. The event tail records successful manifest/report finalization
after the replays, and the retained manifest includes all seven successful
replays. No late result needs to be inferred from compiler success or an
unfinished command. The host still reports `timeout` and no returned final
report; durable local records independently preserve the completed checks.

Five worker-32 failed elaborations remain correctly rejected: the unchanged
worker-28 LC draft, two LowerSmall drafts, and two Corner drafts. Worker 28
also retains its earlier failed formula elaborations. None is counted as a
successful result.

The recorded checks reuse inherited compiled imports. The worker-32 manifest
does not provide the direct-import binary hash table used in some previous
rounds; this audit therefore reports matching named-source compilation and
replay receipts, not an independently rebuilt or fully hash-audited transitive
dependency closure. This agrees with the explicit verification limitation.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
No full conjecture proof or refutation has been established.
