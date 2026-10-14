# Independent monitoring audit: worker 000046

Request: `77c26ca3420f4eb0bd2b89f7946d1a23`.

Read-only audit of the completed worker's archived output under
`/Users/sasha/math_gkm/.control/markov/workers/000046/artifacts`,
matching current final source/compiled objects, and retained receipts.
No project changes, mathematical advice, proposer contact, interference
with the active successor, fresh builds, or experiment reruns.

## Finding

The new unconditional Lean results prove the stronger ambient-binomial
horizontal inequality for every polygon-admissible triple in row `j=1`
of every source, and for every polygon-admissible horizontal triple of every
numerator-one source. The source and range hypotheses needed by the formulas
are discharged from the stated premises.

The all-source ambient predicate remains an explicit unproved hypothesis.
Its implication to raw horizontal log-concavity is proved; the other two
directions are unaffected.

The 2/7 refinement example is explicitly Python experimental evidence in
the final mathematics note, not a new Lean theorem establishing that
particular deformation or its source identification. This distinction
matters when reporting its verification status. No material mismatch was
found between the detailed final English and the accepted Lean results.

## Exact proposed inequality and conditional implication

For a source with labels `a/b`, put `N=b-1` and
`S=i+j-a`. The proposition `AmbientHorizontal77` requires

`(S+2)(N-S) A(i,j) A(i+2,j)
 ≤ (S+1)(N-S-1) A(i+1,j)^2`

for every path and natural `i,j` whose starting and ending points are
in the protected polygon.

The proof of `ambient_implies_horizontal77` derives `a≤i+j` and
`S+2≤N` from the exact source-label and polygon facts. Thus the natural
subtraction defining `S` is the intended difference. The right scalar
is strictly positive; the left scalar exceeds it by `N+1=b`.
The product of the two raw endpoint coefficients is proved nonnegative.
These facts justify weakening the scaled inequality and cancelling the
positive scalar without dividing by a source coefficient.

The conclusion is the literal raw horizontal inequality, under the
explicit premise `h : AmbientHorizontal77`. The predicate is not an
axiom, a theorem, or a replacement for the root. Even a proof of it would
still leave the root's other directions to be established.

The auxiliary normalization is division by `choose(N,S)`, with the
binomial index shifting along the row. All binomial denominators used
in the range are proved positive. The source degree/coefficient convention
and root remain unchanged.

## Unconditional row j=1 bound

The generic polynomial is

`(1+x)^n(A+Bx)`, with `A,B≥0`.

The formal normalization identity, valid for `0≤k≤n+1`, is

`c_k/choose(n+2,k+1)
 =(k+1)*(A*(n+1-k)+B*k)/((n+2)*(n+1))`.

The numerator is a quadratic of the form `s(C+Ds)`. The checked
comparison permits a decreasing affine factor; it does not assume that
all its coefficients are nonnegative. The source instances supply the
needed endpoint nonnegativity. Positive common denominators and exact
binomial identities convert the normalized comparison back to the
integer-scaled statement.

The inherited literal source identity is

`[v]P = u^a(1+u)^(b-3)*((3a-1)+(a+b-1)u)`

for `b≥3`. The new source bridge explicitly maps the integer polynomial
to real coefficients and removes the monomial shift. Here
`n=b-3`, so the ambient degree `n+2=b-1` and the normalized binomial
index `k+1=i+1-a` agree with the candidate.

The final theorem `source_first_ambient77` quantifies every source path
and natural `i`, with only the two polygon premises at
`(i,1)` and `(i+2,1)`. It derives `i≥a`, sets `k=i-a`, and
derives the required denominator/range conditions. No extra formula
hypothesis or small-denominator exception remains.

This is exactly row `j=1`, not all rows. It retains polygon guards;
it should not be described as a normalized inequality at every natural
index outside that range.

## Entire numerator-one horizontal family

For source `1/b`, let `N=b-1` and `S=i+j-1`. In the valid range
with `i≥1`, the inherited Fibonacci coefficient formula yields the
formally proved normalization

`A(i,j)/choose(N,S)
 = choose(S,j)*choose(S+1,j)/choose(N,j)`.

At fixed `j`, the numerator factors satisfy the upper-index binomial
log-concavity inequalities. Their product and the positive fixed
denominator give the normalized comparison. The generic scaling theorem
then returns an integer inequality.

The final `source_one_ambient77` assumes an actual source path,
`a=1`, natural `i,j`, and the starting/ending polygon memberships.
It proves

`(i+j+1)(b-i-j) A(i,j) A(i+2,j)
 ≤ (i+j)(b-i-j-1) A(i+1,j)^2`,

which is precisely the proposed ambient inequality at `a=1`.
The source classification, Fibonacci identity, and padding parameter
are explicitly used. The proof derives `i≥1` from the two polygon
premises; it does not silently exclude an admissible `i=0` case.
There is no denominator cutoff or remaining source-formula premise.

Both final source theorems preserve their zero cases and do not assume
strictly positive raw coefficients. The separate endpoint sources 0/1
and 1/1 are not generated by the interior path quantifier; their polygons
have no horizontal triples, as already handled in inherited root reductions.
The run makes no new endpoint or other-direction claim.

## Progress relative to inherited results

The raw row-`j=1` inequality for all paths was already proved by worker
000011 as `horizontal_one_raw46`, with all natural indices.
Worker 000015 already proved all three raw directions for the numerator-one
family in `source_one_weakLC6`.

Thus this run strengthens inequalities on previously covered regions.
It does not expand the set of root triples with a raw proof. The stronger
scaling is substantive, but no historical novelty claim is established.

## The 2/7 example: experimental scope

The retained common-C-parameter experiment reports, at source word 2/7
and positions `(5,1),(6,1),(7,1)), the deformed coefficients

`64+4t,quad36+t,quad8`.

Here `N=6`, `S=4`; the scaled gap is

`5(36+t)^2-12(64+4t)*8 = 336-24t+5t²`.

Its coefficient of `t` is negative, while the polynomial is strictly
positive for every real `t`, as the displayed square identity
`5G(t)=(5t-12)^2+1536` shows.

At `t=1`, the reported actual raw triple `[68,37,8]` has raw
gap 825 and scaled gap 317. These positions are compatible with the actual
source row and polygon. The newly proved universal first-row inequality
applies to actual source triples of this kind.

However, none of the six new Lean modules defines or proves this particular
deformation, the negative coefficient, or its dedicated source witness.
The final mathematics note correctly labels those identifications as finite
Python evidence. The example concerns the common C-site refinement, not
the inherited Pell charge variable, and refutes neither the unrefined
ambient candidate nor raw Conjecture 6.3.

## Finite scans and a counting qualification

The archived source scan lists exactly the 773 reduced interior fractions
with denominator at most 50; I independently checked that list. It records
824,919 raw ambient comparisons without a failure. For denominator at most
24 it records 342,074 coefficientwise refinement comparisons, including
the negative coefficient above.

The weighted scan covers 383 reduced source words with denominator at most
35. I checked that object count and the loop structure. It records
1,365,665 evaluations, comprising seven evaluations per eligible triple
at `t∈{0,1,2,5,10,100,1000}`, without a failure. Only `t=1` is
identified as the original source family.

Minor numerical-description qualification: the script skips identically
zero endpoint **polynomials** before selecting a triple, but it still
counts all seven subsequent evaluations. An endpoint may evaluate to zero
at `t=0`. Thus the weighted total is not exclusively a count of
nonzero-endpoint evaluations. This has no effect on the proved theorems
or the recorded absence of a failure.

All experiment records inspected match their host archive hashes. The
comparison counts were read from records, not independently rerun; only
source-list/object-count consistency and loop meanings were checked.
Overlapping scans are not presented as independent universal evidence.

The formal generating-function expression in the mathematics note is
explicitly retained as an unformalized derivation. It is not an accepted
Lean theorem or a completed aggregation proof.

## Matching final proof evidence

Final manifest: `evidence/markov-77c26ca3/validation.json`, timestamp
`2026-10-14T18:05:48.410055+00:00`. The host reports completed,
approximately 1098.49 seconds, mathematical resolution false, completion null.

| Module | Final source SHA-256 | Build receipt | Kernel replay receipt |
|---|---|---|---|
| MarkovAmbient77c2 | `2ecbcf7ab964a051b2532f48106d57492d3ab7913010390203ddb22285df2a7b` | `run-1792000525125148000.json` | `run-1792000554121036000.json` |
| MarkovRowNormalization77c2 | `0fa819d7c1e3a1566882405ea119521777cf44503c2b60d14e1dd30bcd98fdef` | `run-1792000593347700000.json` | `run-1792000672108742000.json` |
| MarkovSourceAmbient77c2 | `77ccd749219ebe21f4e2e2f38665b1ea295d21e07ad1c22dd5b5f76a8029fd4e` | `run-1792000728984623000.json` | `run-1792000819728868000.json` |
| MarkovAmbientScaling77c2 | `f7b6991378d1298dcf62680d08351307ccc4449e24d4ce2aa6ac161c0a03b2ba` | `run-1792000673443089000.json` | `run-1792000818551820000.json` |
| MarkovFibonacciAmbient77c2 | `7fee8d22859a224aac3d99d88ebc6c0b6187b0b67717925f88121fb927276da3` | `run-1792000796420395000.json` | `run-1792000873325989000.json` |
| MarkovAmbientSourceBounds77c2 | `380be3409a24b6b3ba243d8fd73760b0c099202d63f89f7264ce6cb0ead7e671` | `run-1792001029057183000.json` | `run-1792001089699718000.json` |

All six final source hashes agree among current/archived source, manifest,
host changes, and final build/replay snapshots. All twelve listed receipts
return zero and refer to the same final hashes. Replay invokes the corresponding
pinned Lean 4.32.2 `leanchecker` module command. Receipt hashes and
archived/current compiled-object hashes match the manifest/host record.

The ten printed final axiom closures match successful build output and
contain only `propext`, `Classical.choice`, and `Quot.sound`.
Five rejected elaborations remain separate: one ambient draft, one generic
row-normalization draft, one source-row draft, and two final-source-bridge
drafts. None is counted as accepted evidence.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This review inspected recorded source-bound compilation/kernel replay.
It did not perform a fresh transitive rebuild; inherited compiled imports
remain part of the verification boundary. Full Conjecture 6.3 remains open
within the project.

