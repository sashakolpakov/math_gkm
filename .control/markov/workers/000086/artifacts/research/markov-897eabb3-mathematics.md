# Fourth lower diagonal for every low-slope source

Machine-authored live research, request `897eabb33b1e4aa8848c530bea99c83d`.
The exact pinned `MathGKM.Markov.Conjecture63` remains unresolved.

The principal new statement is `source_fourth_lower_low897`: for every source
path, every natural i,j, the original three polygon guards, and

    2a ≤ b,   i+j+2 = a+4,

the literal integer coefficients satisfy

    A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)².

This covers a complete lower diagonal on an infinite source subfamily. It is
not a result for all fourth diagonals, other directions, or the full root.
Final local build, kernel replay and axiom status is in validation.json.

## Exact four-letter statistics

For a four-Boolean function f valued in any commutative ring, assume f vanishes
when its first or last bit is false. Write A=f(1001), B=f(1101), C=f(1011),
D=f(1111). For the actual source word with length c and r ones, the proved
`source_four_moment897` gives its cyclic sum as

| Condition (in order) | Cyclic sum |
| --- | --- |
| 2r≤c | min(c−2r, max(4r−c,0)) A |
| 2r>c and 3r≤2c | (2r−c)(B+C) |
| 3r>2c and 4r≤3c | (c−r)(B+C) |
| 4r>3c | (c−r)(B+C)+(4r−3c)D |

Natural subtractions in the Lean statement implement the displayed truncation.
The formula includes equality boundaries and the source words of lengths two,
three and four. In particular it resolves all four count formulas conjectured
by the interrupted worker. The two asymmetric triple counts are obtained by
distinct functions f, not by assuming a reversal symmetry.

The proof uses the inherited exact source substitution
0 ↦ 0 1^n, 1 ↦ 0 1^(n+1), after decomposing a path at its first false branch.
For n=0, a four-letter scan reduces to the existing 101 predecessor count.
For n=1 it reduces to two one-letter counts, one for each asymmetric triple.
For n=2 the number of predecessor letters suffices. For n≥3, the additional
ones contribute copies of f(1111). Pure-right source words are computed
separately. Every step is list induction and ring arithmetic in Lean.

`fourCyclic897` initializes its scan with a dummy false and the actual final
two letters. For words beginning false, the dummy first letter contributes
nothing for the endpoint-vanishing functions used above. The cyclic rotation
bridge is proved separately; short words are retained, including repeated
positions in a cyclic four-letter window.

## Closing the previously missing fourth moment

`source_fourth_cyclic897` connects the pinned trace to the actual cyclic sum
of the inherited `fourthCanonical01F`. It uses the checked five-bit
coboundary, telescopes its potential exactly, and accounts for the last/first
three matrices. This is a formal matrix/list bridge, not an inferred count.

`source_canonical_moment897` splits that canonical function into a constant,
a three-letter function with inherited exact counts, and an endpoint-vanishing
four-letter function handled by the new universal source formula. Consequently
`source_fourth_moment897` proves the previously open fourth-moment identity
for every `false::rest` with predecessor denominator c≥5.

The six algebraic chamber identities in `MarkovFourthChambers897` identify
this proved expression with the six polynomials from the preceding worker.
Their already checked coefficient gap certificates now transport
unconditionally to actual source coefficients. No experimentally fitted
formula remains as a premise in these new source inequalities.

For c≥5, reducedness excludes the boundary fractions 1/4, 1/3, 1/2, 2/3,
3/4: an equality kr=lc with k≤4 forces c to divide k. Thus the six strict
chambers cover every such predecessor. For c≤4, the resulting source has
b≤7, and its fourth lower slice lies among the inherited upper slices whenever
the polygon guard holds. This avoids dropping determinant corrections for
small cycles. Finally, every source with 2a≤b is a false-first source or a
pure-right case covered by the inherited Pell theorem.

## Exact residual and experiments

`root_iff_core897` states `Conjecture63 ↔ InteriorCore63897`. The preceding
horizontal/vertical interior predicates are unchanged. The remaining diagonal
predicate keeps its old bounds and adds

    a+5 ≤ i+j+2  OR  b < 2a.

Thus fourth lower diagonals remain required at high slope; all still-open
middle diagonals and directions remain present. The residual is unproved.

The separate exact experiment checks 7,805 reduced source words through
c=160, all 31,220 new pattern instances, and the Lean scan convention against
literal modulo-indexed cyclic windows. It also checks 387 low-slope raw source
polynomials through b=50, 5,198 raw coefficient positions and 1,566 valid fourth
lower-diagonal triples. No failures occurred. These finite checks are not
universal proofs. Program and output: `research/experiment_897eabb3.py` and
`evidence/markov-897eabb3/experiments.json`.

No historical novelty is claimed. The source theorem still covers only one
slice and one slope range. Inherited compiled imports are reused; no fresh
whole-source rebuild or independent completion audit is claimed.

## Finite probe for the next unresolved runs

`high-fourth-probe.json` records fitted fourth trace moments for n=1,2,3 in
the same six predecessor chambers. For each fixed n and chamber the candidate
moment is linear in c,r with integer-polynomial coefficients in X. Exact
checks passed for 816 source/run instances with 5≤c≤30, and 735 independent
literal recurrence positions for c≤7. These are candidate identities only:
their general run-matrix-to-count bridges and coefficient inequalities have
not been proved. Do not promote the fits to premises.

The probe records concrete remaining-core triples at a/b=6/11, with the first
raw diagonal sequence beginning 210,1400,3980,6272,5954,3456,1184,216,16.
This supplies reproducible next examples, not a refutation or universal proof.
