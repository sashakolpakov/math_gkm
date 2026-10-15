# Third lower slice: two-block correction and slope at most two thirds

Machine-authored live request `8bbb934ec26943b7821334f3647f77cf`.
Full pinned `MathGKM.Markov.Conjecture63` remains unresolved.

## Completed source results

`source_third_run_poly_two8BBB` completes the two-block exception for every
natural run length n. Write c,r for the predecessor denominator and numerator,
b=c(n+1)+r for the resulting denominator, F=`firstRunPolyADB2 n c r`,
and T=`thirdRunPolyADB2 n c r`. The actual third cut polynomial C3 satisfies

* c=2: `6 C3 = T - 12 X^b (F+1+X)`;
* c=3: `6 C3 = T + 6 X^b` (inherited theorem);
* c>=4: `6 C3 = T` (inherited theorem).

The new proof does not extrapolate from small examples. Each gauged run block
has determinant `U V^(n+q+1)`. Its constant projection is diag(0,1), and its
upper-right first coefficient is one. Taking the second determinant coefficient
gives `a2-c1=-a1*d1`. In the generic two-block cubic cumulant, the extra term
therefore becomes `-12 a1 a1' (d1+d1')`. The first factors multiply to X^b,
and the first trace coefficient is F+1+X. All identities are formal ring and
polynomial coefficient proofs.

`correctedThirdRun8BBB` incorporates the three cases in one parameter-only
polynomial. `source_third_all_cycles8BBB` and its raw-coefficient companion
prove its identity for every n and every rest path, with no denominator bound.
The represented path is `replicate n true ++ false::rest`; pure repeated-right
paths are not silently included in this identity. They have separate inherited
results. `correctedThird_coeff_below8BBB` proves that neither small-cycle
correction changes coefficients at indices j<b.

`source_third_lower_twoThirds8BBB` proves

    A(i,j+2) A(i+2,j) <= A(i+1,j+1)^2

for every source path with `3a<=2b`, `i+j+2=a+3`, and all three original
polygon guards. This is the third **lower** slice, not the published third
upper slice `i+j=a+b-3`. There is no finite denominator restriction.

The n=1 parameter polynomial has nine coefficients. Its exact identification
is proved using four explicit gauged-matrix formulas and their jets, followed
by the inherited arbitrary-run source identity. The four reduced-source
chambers cover every predecessor denominator c>=4. Each adjacent gap is an
explicit polynomial with nonnegative coefficients in its two nonnegative
chamber parameters, checked by Lean `ring` and `positivity`. All zero tails
are retained. The remaining parameter pairs (c,r)=(2,1),(3,1),(3,2) use their
corrected polynomials, with scaled coefficient lists respectively

    [24,132,300,360,240,84,12]
    [120,636,1392,1614,1056,384,72,6]
    [210,1200,2904,3864,3072,1488,432,72,6].

Their all-index inequalities, including zero tails, are formally proved.
Splitting at the first false letter shows that `3a<=2b` permits only n=0 or
n=1; the inherited n=0 theorem supplies the other case. Pure-right paths in
this slope range have no applicable third-lower polygon triple.

`root_iff_interior8BBB` proves an exact equivalence between the pinned root
and `Interior638BBB`. The residual remains unproved. It still includes
horizontal, vertical, and all remaining diagonal obligations.

## Uniform-run candidate: do not conflate with the source theorem

Finite exact interpolation produces `thirdInteriorShape8BBB(n,c,r,j)`, a
polynomial intended to equal 15 times the jth coefficient of T when
4<=j<=n. Its source coefficient identity is **not proved**.
The generated candidate log-concavity proof uses the substitutions
`j=t+5`, `n=t+s+6`, `r=u+1`, `c=u+v+2`. The gap expands into 1,176
nonnegative monomials. The attempted formal proofs timed out at 120 and 180 seconds; the alternative
independent-variable certificate also timed out at 120 seconds. They are excluded from
the accepted theorem inventory. They do not count as source progress; their
individual build receipts are retained.
`ThirdInteriorFormula8BBB` is an explicit unproved proposition, not an axiom.
The conditional transfer is an unvalidated draft which keeps this missing
identification hypothesis visible. It supplies no new unconditional source
region. The two abstract candidate modules and the transfer draft are excluded
from validation.json; they remain research attempts, not accepted proofs.

The initial interpolation incorrectly included center j=4, whose left neighbor
is the exceptional coefficient 3. Nonzero high finite differences rejected
that attempt; the script and diagnostic are preserved. Moving to centers
j>=5 gave four nonnegative Newton-basis gap tables and 28 additional exact
symbolic checks. Another 162 finite checks at coefficient j=n matched the
candidate. Neither interpolation nor vanishing sampled differences establishes
a universal degree bound or source formula.

## Experiments and operations

On 236 sources, exact independent numerator and backward-cut recurrences
matched 6,644 raw positions and 6,992 backward positions. The scan checked
2,595 polygon-valid triples. It includes c=2,3 through n=18 and run-one
sources through denominator 60. These are finite experiments only.

The predecessor artifact manifest and six inherited inputs passed 127 hash
checks. Worker 76's raw event log confirms completion; its predecessor had
already reconciled interrupted workers 72–74. No earlier side effect was
replayed. Rejected Lean attempts and Python interpolation failure are retained.
Pinned compiled imports were reused, so this is not a fresh whole-source
rebuild or the required independent completion audit. Sage and SymPy are
unavailable; GAP is available. The active higher-priority sandbox denies
.scratch, so all work uses uniquely named persistent research/evidence files.

Live source search located a recent distinct symmetric (q,t) deformation in
[Bergeron, section 12](https://arxiv.org/html/2608.30979v1#S12). Its equation
has an additive constant and is not identified here with the pinned raw EVW
numerators. No source equivalence, external axiom, or novelty claim is inferred.
