# Fourth lower diagonal: first shifted block

Machine-authored live research request `04290504255048ec8a33fbe263ddb123`.
The exact pinned Conjecture63 remains open. Only the matching build, kernel
replay and axiom inventory in `evidence/markov-04290504/validation.json`
determines final theorem status.

## Completed mathematical scope

`source_fourth_block_smallM042` in `MarkovBlockSmallM042.lean` proves raw fourth-
diagonal log-concavity for every actual predecessor with c>=5 and r<=3, every
natural run n, and every triple starting at j=n+k with 5<=k<=n. Separate
theorems cover r=1,2,3; source-label positivity exhausts the r<=3 condition.
The result includes the final triple k=n. It does not cover offsets 1 through
4 or general predecessor numerators.

`root_iff_coreSmallM042` in `MarkovResidualSmallM042.lean` proves
`Conjecture63 ↔ InteriorCore63SmallM042`. This removes exactly the new block
region in addition to the inherited initial and first-shift regions. Its
remaining predicate is unproved. Neither this equivalence nor the new partial
inequalities close the pinned root.

For general r>=4 the grouped gap coefficients of R-degrees 4 through 8 were
checked, but the three full value decompositions and gap groups 0 through 3
did not finish. A bounded lower-concurrency retry of the value decompositions
also timed out. These missing bridges prevent any general block inequality.

## Mathematical approach

For an actual predecessor path let c be its denominator and r its numerator.
For a leading run n, put a=nc+r and b=a+c. The inherited source identity gives,
on the fourth lower slice i+j=a+4, the scaled raw coefficient

    7560 A(i,n+k) = fourthShape(c,nc+r,n+k) + shiftShape(n,c,r,k)

whenever c>=5 and 5<=k<n+3. The same positive integer scale applies at all
three positions; there is no position-dependent coefficient normalization.
Consequently a log-concavity proof for this expression transfers to the literal
integer coefficients, with all zeros retained. For a triple, 5<=k<=n ensures
the source identity holds at k,k+1,k+2, including k=n.

The gap is a polynomial of total degree at most eight in c,r. Four charts cover
c>=5, 1<=r<c: r=R+4,c=R+C+5, or r=3,2,1 with c=C+5. In all charts put
k=J+5 and n=J+E+5. C,R,J,E are nonnegative integers. The experimental expanded
gaps have 4095 terms in the general chart and 819 in each fixed-r chart.

Instead of one large expansion, each of the three coefficient values is split
by its c,r degrees. The coefficient of each monomial in their squared gap is
then proved nonnegative by an exact ordinary Lean `ring` identity followed by
`positivity`. The chart theorem combines these scalar certificates algebraically.
The general chart has 45 scalar coefficients; the fixed-r charts have nine each.
These counts describe the certificate, not an objective or measure of progress.

## Exact early-shift representation

`source_fourth_early_shapeM042` gives the analogous source identity for all
k<n+3 with n+k>=5, using the exact finite convolution of the shift polynomial
with the binomial sequence choose(k+7,7). This avoids substituting a falling-
factorial polynomial at the small indices where its equality is unavailable.
`earlyBlockValue_eqM042` recovers the inherited shape for k>=5.

The four missing offsets k=1,2,3,4 have nonnegative-coefficient candidate gaps
for every n>=4 in all four parameter charts. The exact symbolic data are saved
in `onset-probe.json`; these candidate inequalities are not proved here.

## Experiments and operational limitations

`experiment_04290504.py` checked 23,798 exact block coefficients, 8,868 shape
positions, 7,136 polygon-valid block triples, 122 run-four triples and 5,214
literal source-recurrence coefficient comparisons without a failure. Inputs
and counts are saved in `experiments.json`. This is finite evidence only.

Some large Lean builds timed out. The premature first values batch failed
because its definitions had not finished building. A proposed tactic import
was unavailable in the pinned installation and was removed; no packages were
updated. All rejected source snapshots and receipts are retained. Split scalar
files duplicate some subsequently successful grouped proofs and are excluded
from the final accepted inventory to avoid duplicate declarations.

All mathematical checking uses ordinary Lean with inherited compiled imports.
No fresh whole-source rebuild or independent English/source completion audit is
claimed. All further shifted positions, small predecessor cycles, higher
diagonals and horizontal/vertical interiors remain obligations of the exact root.

## Final validation boundary

All 27 inventoried mathematical modules compiled and all 64 theorem axiom closures are permitted. Nine modules passed separate kernel replay. Replay of the 18 fixed-r algebra modules remains incomplete: the large union and three smaller fixed-r replay groups timed out. The raw-source and residual modules replayed over those compiled imports, so this is explicitly not an end-to-end replay of the new proof chain. No fresh whole-source rebuild or independent completion audit occurred. All foreground subprocesses returned. See validation.json for exact per-module status.
