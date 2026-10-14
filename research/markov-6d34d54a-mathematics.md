# Higher-cut aggregation on repeated-B source words

Machine-authored live request 6d34d54ad28c46a8a04b48ac176196b1.
The full pinned Conjecture63 remains unresolved. No novelty claim.
Final acceptance status, source hashes and separate kernel-replay receipts are
recorded in evidence/markov-6d34d54a/validation.json. Drafts and failed builds
are not mathematical evidence.

## Exact multiplicities, rather than arbitrary reweighting

Let B denote true. For the word B^n and c positive cuts, let G(n,c,d;y)
be degreeLayer07a7: the sum of every actual c-cut mask of individual degree d,
each counted once. Equal polynomial weights retain their mask multiplicities.
For 0<=m<=n-c the derived and formalized formula is

    G(n,c,2c+m;y) = (1+y)^(2c) *
      sum_(j=0..m) choose(j+c-1,c-1) choose(m-j+c-1,c-1) y^j.

The final formula theorem is run_layer_formula6d34. Its Lean parameters are
c=s+1 and m=k-s, with s<=k<n. Its status must be read from validation.json.

Here is the combinatorial explanation. Write the skipped gaps before the
c selected sites as g_1,...,g_c. Each selected B contributes
(1+y)^2(1+y+...+y^g_i). The suffix after the last selected site contributes
one. The term degree is 2c+sum g_i. For fixed m=sum g_i, expansion into a
y-degree j chooses c nonnegative exponents of total j and c remaining
capacities of total m-j. Stars-and-bars gives the two binomial factors.
This paragraph explains the formula; the Lean proof instead uses the exact
last-cut enumeration and the inherited literal raw source formula.

## Checked route to the formula

MarkovRunDegree6d34 proves the last-cut degree and an arbitrary-weight snoc
enumeration identity. MarkovRunLayer6d34 then identifies a fixed layer with
the exact difference between the complete cut polynomials for lengths k+1
and k. Appending an unselected site changes neither weight nor degree.
Appending a selected B gives degree k+s+2 to every s-cut prefix, regardless
of its earlier selected positions. Thus no polynomial weights are discarded.

MarkovRunPrefix6d34 proves the complete repeated-B cut-polynomial formula,
including coefficients beyond its degree. It uses the inherited source
coefficient identity and horizontal positive-sum formula, not a numerical
interpolation. The new mask-degree bound supplies the zero tail. Pascal's
binomial identity turns the difference of two complete prefixes into the
displayed fixed-degree formula in MarkovRunLayerLC6d34.

## Consecutive degree intervals

For 0<=L<=H<=n-c, sum the displayed formula over m=L,...,H. After removing
the common factor (1+y)^(2c), its coefficient at 0<=j<=H is

    choose(j+c-1,c-1) *
      sum_(r=0..H-L, j+r<=H) choose(H-j-r+c-1,c-1).

Let b_j=choose(j+c-1,c-1) for j>=0 and zero otherwise. The second factor
is the reflection, at H, of the convolution of b with the indicator of
[0,H-L]. Both b and the indicator are log-concave with interval support.
Convolution preserves this property, as do reflection and pointwise products.
Multiplication by (1+y)^(2c) preserves it by the inherited Pascal theorem.

The proof is made finite in Lean: nbPoly6d34 truncates b at H, a bound
sufficient for all coefficients involved. CrossLC is converted to all
Toeplitz two-by-two minors using a repeated balancing inequality. The
inherited finite determinant identity proves convolution preservation.
The new window coefficient theorem and intervalPoly_sum6d34 identify the
explicit polynomial and the exact sum of the individual layers.

The final target sourceRun_degreeInterval_integer_lc6d34 uses the literal
source word central28(replicate n true) followed by B. Its parameters cover
every consecutive interval of the nonempty degrees for every positive cut
count in this source subfamily. All natural coefficient indices, including
zeros and tails, are tested. Integer coefficients are transported by a proved
ring map, with no normalization. Final build/replay status is in validation.json.

This settles an actual-multiplicity aggregation question on the same Pell
source family in which earlier weighted same-degree counterexamples occurred.
It does not contradict those counterexamples: they assign arbitrary weights
to selected masks. It does not establish aggregation for mixed mechanical
words. Full Pell diagonals already had an inherited proof; the additional
result here is the degree-interval refinement at arbitrary cut counts.
The full horizontal and vertical clauses remain separate obligations.

For the inherited obstruction at source 17/18, cuts=3 and degree=20,
the entire degree layer has the j=5,6,7 triple [35160,48840,61272],
gap 231022080. At source 21/22, cuts=3 and degree=24, the entire layer
has j=6,7,8 triple [87016,113592,138216], gap 876139008.
layer-witnesses.json checks these exact finite values by both the transfer
and the new formula. The universal interval theorem covers both layers;
the values themselves are experimental receipts. The inherited negative
mixed or reweighted gaps concern selected summands, not these complete layers.

## Executed finite experiments

aggregation-source.json records 534 source inputs, 89,888,933 inequalities
for consecutive degree intervals, with cut counts at most five; no failure.
The actual input list is saved. The source set was stopped by the script's
140-second bound, so no larger exhaustive denominator claim is made.

aggregation-arbitrary.json records 274 structured or deterministically seeded
arbitrary words and 536,015 single-degree layer inequalities, with cuts at most
five; no failure. Arbitrary words are not identified with source numerators.

run-formula.json checks all repeated-B lengths 1 through 32: 5,984 layer
identities, 52,360 interval identities, and 1,612,688 coefficient identities.
These computations are exact integer experiments, not universal proofs.

## Operational reconciliation and boundaries

All 73 latest predecessor artifact hashes and six inherited-index hashes match.
The predecessor's raw final event records completion. Its interrupted
predecessor had already been reconciled in tail-reconciliation.json; no prior
side effect was replayed. reconciliation.json preserves the actual checks.

The published source was opened with hosted browsing, and a hosted literature
query was executed. No retrieved mathematical assertion was added as an axiom.
The source remains https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html.
The higher-priority filesystem policy denies .scratch; durable research and
evidence paths were used. Failed elaborations and failed path probes are
operational observations only. No package, protected root, controller record,
machinery file, independent evidence, or permission was changed.
