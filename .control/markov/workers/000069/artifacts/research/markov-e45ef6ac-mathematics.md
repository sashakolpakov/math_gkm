# Weighted repeated-right aggregation and source-order limits

Machine-authored live request e45ef6ac30ce4842a691636495cdec9e.
Full pinned Conjecture63 remains unresolved. No historical novelty claim.
Final build and replay status is recorded separately in validation.json.

## A universal weighted source theorem

Let the source path be R^n, hence its reduced label is (n+1)/(n+2).
Fix positive cut count s+1, with s<=n. Its active mask degrees are exactly
contained in [2s+2,n+s+2]; degrees outside this interval give zero layers.
The new vanishing theorem proves this without discarding any masks.

Write N=n-s. The inherited exact degree-layer formula gives

    L_(2s+2+r)(y) = (1+y)^(2s+2)
      sum_(q=0)^r binom(q+s,s) binom(r-q+s,s) y^q.

Let W be ANY real polynomial with nonnegative, zero-extended CrossLC
coefficients. Weight layer 2s+2+r by [y^(N-r)]W. Then the exact residual
coefficient at q is

    binom(q+s,s) [y^(N-q)] (NB_s,N(y) W(y)),
    NB_s,N(y)=sum_(r=0)^N binom(r+s,s)y^r,

for 0<=q<=N, and zero outside that interval. This is proved by a finite
coefficient identity, including all guards and truncated-index cases.
Convolution preserves CrossLC; reversal and pointwise multiplication preserve
CrossLC; multiplication by (1+y)^(2s+2) preserves it. Consequently the full
weighted cut polynomial is log-concave at every coefficient index.

No increasing-weight hypothesis is needed. Decreasing geometric weights,
binomial weights, and weights supported on any consecutive subinterval are
allowed. CrossLC explicitly controls internal zeros: arbitrary adjacent-LC
arrays with separated positive blocks are NOT silently admitted. The zero
polynomial is allowed. Only finitely many coefficients of W are observed.

MarkovWeightedRunE45e proves the coefficient identity and convolution result.
MarkovWeightedSourceE45e proves the actual source-layer identity, the bounds
on vanishing layers, and integer-coefficient transport.
MarkovWholeWeightsE45e proves equality with weightedCut89, the sum over EVERY
original cut mask with its original multiplicity. Its full theorem
weightedCut_run_lcE45 has no word-length bound and covers every s<=n and j.
The version with N<=n-s also covers initial active-degree windows.

These weights are an auxiliary operation on mask degrees, not a factorial
normalization of the published coefficients. With all observed weights one,
the polynomial is the complete literal cut polynomial. Its all-source raw
coefficient bridge is inherited. This extends weighted aggregation on this
infinite family; its unweighted diagonal inequalities were already known and
formalized. It does not establish general-source pair transport, horizontal
inequalities, or vertical inequalities.

The extension to arbitrary decreasing LC degree weights fails for mixed
sources: inherited source27_deformed_failure7d already gives a failure at
source 2/7 and geometric weight z^d with z=1/100. Thus the stronger weight
class proved here must remain restricted to the repeated-right family.

## Mechanical order cannot be dropped from all directions

Consider words

    B^n A (B^(n+v1) A) ... (B^(n+vL) A) B^(n+1), vi in {0,1}.

The inherited source substitution theorem places mixed source words in this
class, with a specific mechanical interior order. Finite experiments on the
larger class suggest that diagonal pair transport may not need that order.
They do not prove this suggestion. Horizontal and vertical directions must
be treated separately.

For n=0 and v=(0,0,0,0,1), the word A^5 B A B has synthetic coprime labels
2/9 but is not a source word. Its vertically aligned cut coefficients are
[6,8,12] with gap -8. MarkovRunOrderE45e proves the exact polynomial formulas
and this gap. It proves that the word cannot equal central28(path)++[B] for
ANY path, because its core is not palindromic. For the actual source 2/9,
path [L,L,L,R], the literal raw triple at (1,5),(1,6),(1,7) is [4,8,12],
with gap 16. The source labels, coprimality, polygon guards, coefficient
identification, and positive gap are proved. There is no root refutation.

Even adding palindromicity is insufficient for the enlarged word class.
The palindromic core A^4 B A B A^4, followed by B, has synthetic coprime
labels 3/13 and vertical triple [20,28,40], gap -16. The exact source 3/13
instead has word A^3 B A^3 B A^3 B and triple [16,28,40], gap 144, at
(1,10),(1,11),(1,12). MarkovPalindromeOrderE45e proves the polynomial identities,
both gaps, and all three polygon guards for the actual source. Its source exclusion uses the
inherited mechanical prefix-floor theorem, not merely a scan over paths.

## Experiments

All experiments are exact integer arithmetic and finite evidence only.
The input lists and the code are saved, including truncation/termination rules.

* weighted-formula.json checks 56,550 coefficient identities and 52,650 weighted
  inequalities on every repeated-right source n=0..24 and every positive cut
  count. Independent literal numerator recurrence matches 8,800 positions.
* probe-equal.json records 7,706 equal-total-degree transport certificates on
  B^n for n=2..44, cut counts at most seven. 6,558 involve negative pair terms.
  This is not a universal existence theorem for such certificates.
* probe-runs.json records 2,218 transport checks on 23 adjacent-run words,
  with 1,956 nontrivial certificates and no failure. The time cap is tested
  after each word, so the final elapsed time exceeded the nominal 90 seconds.
* run-order.json records 103,546 diagonal inequalities on 420 seeded and
  structured adjacent-run words, with no failure.
* run-exhaustive.json checks every n=0..3 and every interior Boolean word
  of length at most six, at ALL cut counts: 277,990 diagonal inequalities.
  On interior lengths at most three it also checks 11,638 pair transports
  and compares degree aggregation to a separate scalar transfer. No failure.
* directions.json and palindrome.json test all three directions on explicitly
  saved arbitrary words, retaining polygon guards and zeros. The vertical
  failures are outside the source family. Once a direction fails, that
  direction is not tested on subsequent inputs; the separate counts record
  exactly what was checked. The palindromic run is time bounded.

The finite certificate routine checks the computed flow's nonnegativity,
order and residual equations independently. Certificate digests are stored
per word; deterministic scripts regenerate each full certificate. Neither
the flow solver nor its checker is a proof of universal source transport.

## Operational boundaries

All 86 predecessor artifact hashes and six inherited inputs matched before
research. The immediate predecessor completed and had reconciled the earlier
interrupted worker; no prior mutations were replayed. Pinned inputs and prior
artifacts are checked again at finalization. Current-source builds and separate
explicit-module replay reuse inherited compiled imports. No fresh whole-source
rebuild or independent hash-bound completion audit occurred.

The sandbox forbids .scratch; uniquely named research/evidence files were used.
Sage was not found; GAP was discoverable but unnecessary. Rejected elaborations
are retained as operational evidence, not accepted mathematical declarations.
The published source was consulted live at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . No retrieved
claim was added as an axiom. No packages, controller records, or pinned roots
were altered.
