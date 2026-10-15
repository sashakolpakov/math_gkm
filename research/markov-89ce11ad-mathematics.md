# Degree-pair transport for Markov diagonals

Machine-authored live request 89ce11adb69243f8836fc68470d6d524.
Full pinned Conjecture63 remains unresolved. No historical novelty claim.

The new approach keeps both individual degrees in each quadratic gap term,
instead of collapsing them immediately to their sum. See
research/markov-89ce11ad-transport-derivation.md for the formulas.

## Formal results

MarkovPairOrder89ce proves that nonnegative increasing adjacent-log-concave
weights satisfy cross inequalities, including zeros, and that a degree-pair
product increases when its minimum and sum both increase. No division by a
possibly zero weight is used.

MarkovPairTransport89ce proves the finite nonnegative mass-transport theorem.
MarkovPairGap89ce expands the weighted coefficient gap exactly and connects
the certificate to the literal integer raw source coefficient function.
MarkovSourceTransport89ce proves the exhaustive bound 1+2*word.length on the
marked degree and removes the extra bound premise. Its proposition
SourcePairTransport89 quantifies over every source path, cut count and index.
The theorem source_diagonal_clause_of_transport89 shows that this proposition
implies the entire polygon-guarded diagonal clause for every generated source.
SourcePairTransport89 is an UNPROVED hypothesis, not an axiom or a theorem.
It does not imply the horizontal or vertical clauses by anything proved here.

MarkovSource27Weights89ce is an unconditional example on actual source 2/7,
path [false,false,true], at two cuts. Every nonnegative increasing LC weight
sequence gives a polynomial with CrossLC coefficients at all indices. All
15 masks and their original multiplicities are retained. The exact polynomial is

    (w0+3w1+11w2)+(3w1+25w2)y+14w2 y^2.

Its gap is

    9(w1^2-w0w2)+5(w1w2-w0w2)+103w1w2+471w2^2.

Each term is nonnegative under the stated hypotheses. The coefficient sequence
is extended by zero, and the all-index theorem does not suppress these zeros.
At constant weight one the polynomial is the literal cut polynomial; inherited
full27_raw07a7 proves the polygon-valid raw triple [15,28,14], gap 574.
This does not enlarge raw source coverage already established by inherited work.

MarkovTailSeparation89ce and MarkovTransportSeparation89ce distinguish the
new hypothesis from scalar graded-tail positivity. Pair transport implies
nonnegative scalar total-degree tails. Conversely, the auxiliary arrays with
weighted values (w2,w0+w4,3w2) have geometric gap 1-z^4+z^8, all of whose
coefficient suffix sums are nonnegative. The globally increasing LC weights
[1,10,100,100,100,...] give [100,101,300], gap -19799. Thus those arrays admit
no pair transport certificate. These arrays are NOT claimed to be source layers;
their degree-two layer itself has an internal zero. This only separates two
general sufficient criteria; it is not a source counterexample.

Final compilation, replay and permitted-axiom status is in
evidence/markov-89ce11ad/validation.json. Failed elaborations remain rejected.

## Exact experiments

* weights-source.json: 1,462,468 sampled-weight inequalities on 444 listed
  sources, with increasing LC integer degree weights; no failure.
* weights-arbitrary.json: a non-source Boolean word has complete two-cut
  raw triple [3378,2516,1896], gap -74432. Its sampled increasing LC weighting
  also fails. The a,b entries in this mode are random-word generation labels,
  NOT a claim that the word is the corresponding mechanical source word.
* transport.json: 20,018 exact transport certificates on 321 listed sources;
  16,392 involve negative pair coefficients. No failure.
* transport-full.json: 79,505 certificates on ALL 240 reduced interior sources
  with 3<=b<=28, ALL cuts 1,...,b-1 and all natural coefficient starts with
  j+2 within the support extent. 37,326 involve negative pair coefficients.
  Zero terms remain in the arrays. Starts beyond that extent have vanishing
  right neighbor, but were not counted as experiments. Independently computed
  literal pinned recurrence agrees at 88,357 coefficient positions.
* transport-stress.json: 1,893 certificates on 23 explicitly listed larger
  sources, cuts at most six; 1,708 have negative pair terms. No failure.

These certificate counts overlap and are not counts of distinct inequalities.
The full and stress runs record a SHA256 digest of each exact certificate and
gap array; the programs regenerate the data deterministically. The max-flow
algorithm is followed by an independent arithmetic check of the transport
equations, nonnegative residual and degree order. These remain Python finite
computations, not kernel-checked source instances or universal theorems.

## Operational status

All 102 predecessor artifacts and six inherited-index inputs matched before
research. The predecessor completed; it had already reconciled the earlier
c416 interruption. No previous mutation was replayed. Protected inputs and
prior artifacts are checked again in preservation.json.

The sandbox denies .scratch and shell heredoc temporary-file creation; unique
research/evidence paths were used. Sage is unavailable; GAP is present but was
not needed. Rejected builds, a failed patch, and nonexistent guessed file paths
are operational failures only. The PairGap source was changed while an old
failing build finished; that build was rejected, and a subsequent current-source
build and separate replay succeeded. No mathematical result relies on the
overlapping rejected attempt.

Replay uses the inherited explicit-module driver, whose replay body was compared
with the pinned LeanChecker.replayFromImports implementation during this run.
Inherited imports were reused. No fresh whole-source rebuild or independent
hash-bound root-completion audit occurred. The protected root remains unchanged.

The publisher source was consulted live for equations (5),(7), the numerator
representation and Definitions 6.1–6.2/Conjecture 6.3:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html
No retrieved mathematical result was added as an axiom.

## Revisable next actions

Investigate universal existence of degree-pair transport for actual mechanical
source words, using the min-and-sum order rather than scalar grade alone.
The repeated-run decomposition may help construct flows; no construction is
prescribed or yet proved. Retain actual mask multiplicities and word order.
Keep the horizontal and vertical inequalities separate: inherited source 1/3
already disproves their unrestricted geometric degree deformation. Full source
correspondence, all directions, zeros, endpoints and universal scope remain
mandatory before root closure.
