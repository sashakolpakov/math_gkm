# Fixed-degree one-cut aggregation and its limits

Machine-authored live request 9c20fccd3a9f4f1c9c9c9f443ef6f04b.
The full pinned Conjecture63 remains unresolved. This report makes no novelty
claim. Current-source compilation and kernel-replay receipts are authoritative
in evidence/markov-9c20fccd/validation.json.

## Universal aggregation result

The inherited degree layer G_w(s,d;y) sums exactly those s-cut mask weights
whose individual degree is d. Multiplicity is retained. The new theorem
single_degree_layer_lc9c20 proves ordinary coefficient log-concavity of
G_w(1,d;y) for every finite Boolean word w, every natural degree d, and every
natural starting index k. There is no word-length or denominator bound.
The integer version single_degree_layer_integer_lc9c20 and exact marked-source
specialization are in MarkovSingleLayerInteger9c20; consult validation.json
for final status. Zero layers and coefficients beyond the degree are included.

The proof is an aggregation argument, not an inference from individual-term LC.
Write

    R_n(y)=1+2y+...+2y^n,
    P_n(y)=R_n(y)+y^(n+1).

A mask with one selected cut has weight equal to its preceding gap weight,
times either 1 or 1+y according to the selected letter. Skipped letters
after that cut contribute one. The checked gap classification says the
preceding gap weight is some R_n or P_n. Exact degree computation therefore
restricts every degree-d one-cut term, for d>=2, to four shapes:

    R_d, P_(d-1), (1+y)R_(d-1), (1+y)P_(d-2).

For arbitrary nonnegative real a,b,c,e the mixture of these shapes is LC.
For d>=3 its coefficient list is

    a+b+c+e,
    2a+2b+3c+3e,
    2a+2b+4c+4e  (at indices 2 through d-2),
    2a+2b+4c+3e,
    2a+b+2c+e.

The middle range may be empty. The first and final nontrivial gaps are
nonnegative polynomial expressions in a,b,c,e; the middle plateau and
transition inequalities are checked as well. Degree two is the separate
quadratic with coefficients [a+b+c+e,2a+2b+3c+2e,2a+b+2c+e].
For d<2 every product of coefficients two positions apart has a zero factor.
The proof uses no coefficient division and no root-location assumption.

singleMaskSum_shape9c20 supplies the missing combinatorial bridge: the sum
of ANY finite list of one-cut masks of one degree has the displayed mixture
form with nonnegative parameters. Applying it to the exact filtered mask list
gives the theorem. Integer-to-real transport is by a proved polynomial ring map,
not a normalization. degreeCoeff_layer07a7 identifies the same layer by ordinary
coefficient extraction in the auxiliary degree marker.

This result does not justify summing different degrees. It also does not
establish any complete pinned direction for arbitrary sources. The first and
second complete lower diagonals already have separate inherited source proofs;
the present result addresses a proposed aggregation mechanism for higher slices.

## Equal degree and cut count do not suffice at higher cut counts

At actual source 17/18, take its extended word B^17 and three-cut masks
S={0,1,16}, T={3,9,16}, with zero-based sites. Both weights have degree 20.
Their j=5,6,7 coefficient triples are [63,64,64] and [423,648,887].
Their mixed gap is

    2*64*648-63*887-423*64 = -9.

MarkovSameDegreeObstruction9c20 checks membership in the exact source mask
list, equal degrees, the polynomial formulas, and this failure. It separately
proves the corresponding complete raw source triple is polygon-valid and LC,
using the inherited universal Pell diagonal theorem. The exact experimental
complete triple is [168840,221200,259800], gap 5064808000. Those numerical
values are experimental; the formal complete-source theorem asserts the
inequality, not these particular values.

A stronger obstruction occurs at source 21/22, extended word B^21.
Take S={0,1,20}, T={6,13,20}, each with three cuts and degree 24. Their
j=6,7,8 triples are [64,64,64] and [688,1005,1365]. Their weighted sum 26p+q
has [2352,2669,3029] and gap -647. MarkovWeightedDegree9c20 checks this exact
failure and the source membership. Thus even arbitrary nonnegative reweighting
within one fixed-degree, fixed-cut source layer is too strong. The original
layer uses each mask once and is not replaced by this reweighted sum.
The full raw source triple is separately proved polygon-valid and LC.
Its experimentally computed values are [508560,630648,725568], gap 28722037824.
raw-witness-check.json independently reproduces both complete raw triples
using the literal numerator recurrence, without the cut representation, and
checks all polygon guards. These remain finite numerical observations.

These are auxiliary aggregation obstructions, not counterexamples to the root.
They show why an extension beyond one cut must exploit actual multiplicities
and cannot use an unrestricted cone of equal-degree cut terms.

## Exact experiments and validation boundaries

same-degree.json records 1104703 pairwise tests over 101 source cases before
the first failure above. degree-limited.json tests 108097 individual-layer
inequalities on 84 structured/seeded word inputs, cut counts at most five,
without failure. These include enlarged words that are not asserted to be sources.

marked-source.json tests 24803 polygon-guarded diagonal triples on 430 source
inputs (408 distinct sources), with cut counts at most five. After forming each
degree-marked gap and substituting marker=1+t, every tested coefficient is
nonnegative. This remains finite evidence for the source marked-diagonal
candidate. It proves neither that candidate nor any pinned root clause.

limited-validation.json compares the new truncated transfer directly with
76821 explicit cut masks on all 511 words of length at most eight, checking
51811 coefficient identities. The actual inputs,
integer coefficients, seeds, and counts are retained. gap-cone.json and
two-cut-cone.json record separate finite shape-cone probes; no universal
source identification is inferred from them.

The published source was reread live at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . A hosted
literature search supplied no theorem used in these proofs. All formal proofs
use only pinned dependencies. Sage and SymPy are unavailable; GAP is present
but not needed. Shell here-document temporary-file creation was denied, and
higher-priority policy denies .scratch; new artifacts are durable files under
research/ and evidence/. Failed elaborations are preserved and rejected.

## Interrupted predecessor reconciliation

The previous worker timed out after saving a report. Its summary listed only
two successful replays, whereas the individual raw receipts show four.
Two of its 80 manifest entries changed afterward: replay-progress.json and
replays.log gained the final prefix timeout and completion entry. Every final
progress entry agrees with its individual receipt. Prefix replay timed out
twice; it is not counted as passed. All other manifest entries and all six
inherited-index entries matched. No prior side effect was blindly replayed.
See reconciliation.json and its explicit correction tail-reconciliation.json.
