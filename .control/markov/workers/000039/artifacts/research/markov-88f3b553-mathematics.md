# Exact counting and a path-swap obstruction

Machine-authored request 88f3b55352d94aa995ace708cad23b17. The full pinned
Conjecture63 remains unresolved. No historical novelty claim is made.

## All-source counting interface

The inherited positive gas model uses A=[[v,1],[uv,u+1]] and
C=[[v+1,1],[uv,u]], with source numerator (v,1) M (1,u)^T for its canonical
gas core. The new `objectPair88` enumerates exponent pairs with multiplicity.
It starts with two singleton lists [(0,0)]. Given lists f,g for a suffix,
let h be the concatenation of v-shift(f) and u-shift(g). A prepended A gives
(h,h++g), while C gives (h++f,h). The final list is v-shift(f)++u-shift(g).

This is a finite object model: repeated exponent pairs represent distinct
occurrences; they are not deduplicated. `object_pair_coeff88` proves the
count equals the exact corresponding polynomial coefficient by induction.
`objects_coeff88` identifies the scalar count with the actual gas polynomial.
`source_multiplicity88` identifies it with the protected raw source coefficient
for every path and every natural i,j. No positivity test filters the list.

`root_iff_objects88` is an equivalence between the unchanged pinned root and
the three literal raw count inequalities on canonical source lists, with no
path or index bound. It uses the inherited outside-polygon-zero reduction
and endpoint proofs. This equivalence does NOT prove either side. It is a
concrete interface for future injections between pairs of counted objects;
no such universal injection was found in this run.

## Testing ordinary common-vertex switching

Expand every matrix entry into its monomial edges. For two paths, switching
the two segments between consecutive common vertices preserves their joint
edge multiset. A possible proof would send an endpoint pair to a middle pair
by selecting such components. This necessary existence condition already
fails on the actual source 1/4, whose gas core is AAA.

Using states 0 and 1, the high path has internal states [1,0,1,1], and its
three A-edge weights are uv,1,u. Its boundary weights are 1,u, so its charge
is (3,1). The low path has internal states [1,1,1,0], with weights 1,1,uv
and boundary weights 1,1, so its charge is (1,1). Both paths are valid.

They agree at internal times 0 and 2, and meet again at the terminal exterior
vertex. The initial boundary is identical. The two nontrivial switchable
components have high-minus-low charges (1,1) and (1,-1). Their subset sums
are (0,0),(1,1),(1,-1),(2,0); none is (1,0). Thus the four switch choices
give first-path charges (3,1),(2,0),(2,2),(1,1), never (2,1).

`MarkovSwapObstruction88f3` checks the edge validity, exact path charges,
state lists, component charges, all four switch choices, and the orbit's
horizontal multiplicities [1,0,1]. The formal exhaustion is over the two
explicit component switches. The identification of these with *every*
common-vertex exchange follows from the displayed state lists; no theorem
about arbitrary notions of path transformation is asserted.

The same module proves the literal source identity at path [false,false],
its labels 1,4, all three polygon memberships, and actual raw coefficients
[2,6,4]. Therefore 6^2>2*4. This is an obstruction to an orbit-preserving
proof strategy, NOT a counterexample to Conjecture63. It does not obstruct
injections which change the joint decorated-edge multiset.

## Exact finite orbit inventory

The independent Python enumeration in orbit-inventory.json has 34 weighted
paths at 1/4. For total pair charge (4,2), it groups pairs by the unordered
pair of decorated edges at each layer. There are 34 overlay classes. Two
have gap -1; eleven have gap 0; twelve have gap 1; nine have gap 2. Summing
gives 36 middle pairs minus 8 oriented endpoint pairs, hence gap 28.
This complete small inventory is an experiment. It is not a formal global
classification of overlays or an all-source positivity argument.

## Operational evidence

The predecessor's raw event log records completed compilation of its last
monotonicity module, but no completed replay. Its manifest likewise says
replay=null. This run did not relabel that work as replayed or rerun its
finalizer. New files have a unique request prefix. The root hash is unchanged.

Successful builds/replays and source hashes are in validation.json. Rejected
elaborations remain in timestamped source snapshots and run receipts. Initial
failures included an unnecessary unavailable compiled import, a nonexistent
antidiagonal lemma, a tactic heartbeat limit, and list-count simplification.
The failed elaborations are excluded from accepted mathematical evidence.
The shell could not create a here-document temporary file; Python scripts were
instead retained in research/. The higher-priority permission rule denies
.scratch reads. Sage was not on PATH; GAP was present but not needed.

The publisher was retrieved live, and searches on Riordan arrays and path/fence
log-concavity supplied no theorem used here. No external assertion is an axiom.
Primary target: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html

The next mathematical task is an aggregate comparison that can mix overlay
classes, retaining the canonical source-word restriction. The inherited Pell
total-fiber positivity question remains another unproved aggregate comparison.
