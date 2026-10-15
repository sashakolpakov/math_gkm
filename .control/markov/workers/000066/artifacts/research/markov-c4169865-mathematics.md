# Weighted layer aggregation and one-cut grading

Machine-authored live request c4169865f3444727be49165831b91f73.
Full pinned Conjecture63 remains unresolved. Final build and replay status
is recorded in evidence/markov-c4169865/validation.json; this document is
not an independent completion audit or a historical novelty claim.

## Uniform weights on whole repeated-B degree layers

Let G(n,s,d;y) denote the exact degree layer of the word B^n, with s cuts.
Every mask has its actual multiplicity one. The inherited formula is

    G(n,s+1,2s+2+L;y) = (1+y)^(2s+2) K(s,L;y),
    [y^j] K(s,L;y) = choose(j+s,s) choose(L-j+s,s)  (0<=j<=L).

Let q be any real polynomial with nonnegative coefficients whose zero-extended
coefficient sequence satisfies CrossLC. No missing-support entries are deleted.
For s+N<n the new weighted source-layer sum is

    W(y) = sum_(r=0)^N q_r G(n,s+1,2s+2+N-r;y).

MarkovWeightedWindowC416 and MarkovWeightedRunC416 prove coefficient
log-concavity of W at every natural index, with no bound on n,s,N or degree(q).
Coefficients q_r beyond N have no effect. Both real and integer source versions
are supplied, with source word central28(R^n)++B=B^(n+1) and the corresponding
bound s+N<=n. The integer version changes coefficient ring without normalizing.

The proof supplies the exact aggregation identity, not an inference that a sum
of LC terms must be LC. Set B(s,N;t)=sum_(k=0)^N choose(k+s,s)t^k. After removing
the common binomial factor, the coefficient at j is

    choose(j+s,s) [t^(N-j)] (B(s,N;t) q(t))  (0<=j<=N),

and zero elsewhere. The first factor is a truncated negative-binomial sequence;
the second is a reflected convolution. The inherited determinant proof gives
CrossLC for convolution. Reflection, pointwise multiplication of nonnegative
CrossLC sequences, and binomial smoothing preserve it. This proves the new
weighted result. The exact condition is CrossLC; ordinary adjacent LC is a
sufficient alternative only together with nonnegativity and interval support.

This includes interval weights, binomial weights and geometric weights of
either orientation. It is restricted to repeated-B sources. It does not prove
any new full direction on all reduced rationals.

## Precise failure of the general-source weighting extension

MarkovWeightedObstructionC416 uses the actual path [false,false,true], source
2/7, and two cuts. Its inherited layers at degrees 0,1,2 are respectively
1, 3+3y, and 11+25y+14y^2. The weight polynomial q=1+100t+10000t^2 is nonnegative
and CrossLC, proved in the module. Weighting the layers in descending degree
order produces 10311+325y+14y^2, whose gap is -38729. This is exactly the previous
worker's geometric obstruction rescaled to integral coefficients, now used to
refute the explicit universal PF2-weighted aggregation statement. It is not
presented as a newly discovered raw witness. The actual raw polygon triple
remains [15,28,14], with gap 574.

## Infinite obstruction already with one cut

The new experiment identifies source 7/9 as a one-cut example. More generally,
take the actual source R^n L, indexed by (2n+1)/(2n+3), n>=3. Its extended word
is B^n A B^(n+1). Define R_k=1+2y+...+2y^k and P_k=R_k+y^(k+1). Exact one-cut
enumeration gives the degree-marked polynomial

    sum_(k<n) z^(k+2)(1+y)P_k
      + z^(n+1)P_n + sum_(k<=n) z^(k+1)(1+y)R_k.

This identity is formalized in MarkovMarkedOneCutC416, by the graded one-cut
append law and the exact skipped-run state. The coefficient calculation in
MarkovOneCutTailC416 gives, at indices n-1,n,n+1,

    z^(n-1)(3+7z+10z^2), z^n(3+9z), 4z^(n+1).

Their gap is z^(2n)(-3+26z+41z^2), negative at z=1/100 for every n>=3.
Thus even the universal one-cut fixed-degree theorem cannot be extended to
arbitrary positive geometric weighting of degrees on actual sources. The
coefficientwise degree-gap strengthening also fails, with coefficient -3 at
degree 2n. Its nonnegative suffix sums are 64,67,41 (after the degree shift),
so this obstruction does not contradict the proposed source suffix criterion.

At z=1 the raw coefficients are [20,12,4], with gap 64, at points
(n+3,n-1), (n+2,n), (n+1,n+1). MarkovOneCutRawC416 connects these to the exact
root coefficient function and proves all three polygon guards. The displayed
formulas are universal claims only to the extent confirmed in validation.json.

## Actual finite experiments

* tails-words.json: all 8190 nonempty Boolean words through length 12;
  3763099 fixed-layer inequalities had no failure. The broader full-word
  suffix and raw inequalities fail, already at B A B^6 with one cut.
  This is an auxiliary word, not an asserted source counterexample.
* tails-source.json: 49 listed higher-denominator sources, cuts at most five,
  2224339 suffix sums and 1057590 fixed-layer inequalities, no failure.
  The shuffled list stopped after its time budget; no exhaustive denominator
  coverage is claimed.
* increasing-weights.json: 602 sources through denominator 44; 2559660
  polygon-guarded checks for sampled intervals and five families of increasing
  log-concave degree weights, no failure. This suggests testing increasing
  weights separately from the disproved arbitrary-weight extension.
* onecut-weights.json: stopped at the first failure, source 7/9; its descending
  geometric weights give [30710,309,4] with gap -27359.
* independent-checks.json: literal pinned numerator recurrence verifies the
  [20,12,4] raw triple and guards for n=3,...,18, independently of the mask
  representation. Also checks 54880 weighted convolution coefficient positions
  and 50400 inequalities on repeated-B words through length 14.

These are finite experiments, never proofs. All files and exact inputs are
retained under evidence/markov-c4169865/; source scripts are under research/.

## Source and operational boundaries

The published source was opened live and its Definitions 6.1–6.2, Conjecture
6.3 and nearby theorem statements consulted. No external theorem was imported
as an axiom. The hosted search did not supply a solution used in this work.
Source: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html.

All 66 predecessor artifact hashes and six inherited-index hashes matched.
The predecessor event log ends with turn.completed; older interrupted effects
had already been reconciled in that completed chain. No mutation was replayed.
Sage is unavailable; GAP is present and was not needed. Higher-priority policy
denies .scratch, so durable unique research/evidence paths were used instead.
Misspelled inherited file lookups and rejected Lean builds are recorded as
operational failures, not mathematical evidence.

Separate replay uses the inherited explicit-module driver, whose replay body
was compared with the pinned LeanChecker source this run. It substitutes
explicit module names for recursive module discovery. Inherited imports are
reused; no fresh whole-source rebuild or independent root completion audit is
claimed. Final failed-build snapshots remain rejected and are not imported.
