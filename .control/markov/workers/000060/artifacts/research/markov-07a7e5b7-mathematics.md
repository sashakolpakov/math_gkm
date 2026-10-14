# Degree-grouped cut aggregation

Machine-authored live request 07a7e5b715cd4825bb464f056e32ebfa. The full
pinned Conjecture63 remains unresolved. No novelty claim. Validation status
is recorded separately, by exact source hash, in the evidence directory.

## Choice of representation

The previous worker proved that each cut term is coefficient-log-concave,
but found negative pairwise mixed gaps even on actual source words. I tested
aggregation by cut position and by the individual term's polynomial degree.
Chronological accumulation fails. Degree aggregation remains a candidate,
not a theorem. All experiments retain the raw integer coefficients and zeros.

For a source a/b, write w=central28(path) followed by B. Let M_s(w) be its
exact s-cut masks, and p_m(y)=maskWeight340(y,y,1,m). Define

    G_w(s,d;y) = sum_{m in M_s(w), degree(p_m)=d} p_m(y).

No multiplicity is discarded. The inherited coefficient bridge reads

    A(i,j) = [y^j] sum_d G_w(s,d;y),  i+j=a+s.

The new degree computation does not expand p_m. Keep a gap-degree state D,
initially 1. Skipping A resets D to 0; skipping B increments D. Selecting
a letter r adds D+1_{r=B} to the total term degree and resets D to 1. The
unselected suffix contributes zero to the total degree. mask_natDegree07a7
proves this exact equality for every mask over real polynomials, using
constant coefficient one to exclude zero factors. The integer source
coefficient bridge remains exact. There is no coefficient normalization.
The generic commutative-ring identities use this structural degree statistic;
they do not assert that it equals polynomial degree in positive characteristic.
The checked real-ring interpretation and inherited coefficientwise integer-to-real
map identify the intended characteristic-zero weights.

The bound degree(m)<=1+2*length(m) proves finite exhaustion for every word,
without a denominator bound. Thus a degree prefix beyond that bound equals
the whole cut polynomial. This is a representation theorem, not an inequality.

## Positive three-state recurrence

Introduce x for cut count, z for individual term degree, and retain y as the
original coefficient variable. The marked polynomial is

    H_w(x,y,z) = sum_m x^(number of cuts) z^(degree(p_m)) p_m(y).

For each partial mask let W be its accumulated marked weight, let
H=W*z^D*(p+1), and Z=W*z^D, where p is the current skipped-gap charge.
Start from (W,H,Z)=(1,z(1+y),z). If C denotes the selected contribution,
the forward updates are

    A: C=x H;
       (W,H,Z) -> (W+C, W+z(1+y)C, W+z C).

    B: C=x z(1+y)H;
       (W,H,Z) -> (W+C, zy H+z(1+y)Z+z(1+y)C, z Z+z C).

The final W is H_w. Every matrix entry has nonnegative coefficients.
MarkovDegreeTransfer07a7 proves the equivalent backward three-state scalar
identity over every commutative ring. It also proves the marked-mask sum
and the z=1 specialization. MarkovDegreeBridge07a7 connects ordinary x
coefficient extraction to exactly s cuts and ordinary z coefficient
extraction to the structural degree layers. At z=1 the inherited source
identity gives the literal raw integer numerator coefficients.

The polynomial coefficient/nonnegative-interval support result for each
layer follows from the inherited corresponding properties of every mask.
This prevents an internal-zero-gap ambiguity in a future adjacent-to-PF2
argument, but supplies no adjacent inequality itself. Positivity of the
three-state transfer is not a proof of coefficient log-concavity.

## Two source-specific obstructions

At source 11/13, path RRRRRL, the extended word is B^5 A B^6. The first
eight single-cut positions sum to

    8+20y+20y^2+14y^3+10y^4+6y^5+2y^6.

Its j=2,3,4 triple is [20,14,10] and has gap -4. The full one-cut sum is

    12+32y+36y^2+28y^3+20y^4+12y^5+4y^6.

The corresponding original points (10,2),(9,3),(8,4) lie in the pinned
polygon and have [36,28,20], gap 64. The append identity for one-cut sums
is proved universally, so the partial sum has an exact chronological meaning.
This invalidates induction through arbitrary chronological partial sums;
it is not a counterexample to the published conjecture.

At source 2/7, path LLR, w=AAB AAB, the two-cut degree layers are

    G(2,0)=1, G(2,1)=3+3y, G(2,2)=11+25y+14y^2.

The constant coefficients [1,3,11] fail log-concavity in d. Thus the refined
array is not jointly discrete-midpoint-log-concave in (d,j), even on a source.
The d direction is auxiliary, not one of the three pinned directions.
The complete source diagonal has [15,28,14] at (4,0),(3,1),(2,2), all
polygon-valid, with gap 574. These distinctions are explicit in the Lean
statements; no enlarged-family or auxiliary-direction failure is called a
root refutation.

An additional exact experiment marks these same 2/7 layers with z=1/100.
After multiplying every coefficient by the common denominator 10000, the
triple is [10311,325,14], with gap -38729. Algebraically the marked polynomial
is 1+3z(1+y)+z^2(11+25y+14y^2), and its adjacent gap is
z^2(-5+108z+471z^2). Thus coefficient LC for every positive degree marker
is too strong. degree-weight.json records this as an exact auxiliary
experiment, not an additional Lean theorem or a raw-source counterexample.
At the required marker z=1 the raw gap is still 574.

The A update also has the W/H minor x(z(1+y)-1). Its negative monomial
coefficient prevents a direct appeal to coefficientwise total positivity of
this displayed transfer matrix. This algebraic observation does not exclude
a different ordering, transformation, or more restricted source invariant.

## Exact experiments

- group-cuts.json: 63 source words, 121307 masks; the first chronological
  prefix failure is the 11/13 example above. Degree/first/last pairwise
  compatibility already fails at 3/4, as inherited work predicted.
- degree-groups-source-40.json: all 489 reduced interior sources with b<=40;
  2911174 individual-layer, 2911174 degree-prefix, and 3753422 degree-suffix
  adjacent inequalities checked without failure.
- degree-intervals.json: all 277 interior sources with b<=30; 4744368 tests
  of sums over consecutive degree intervals, without failure.
- degree-groups-arbitrary-13.json: all 16383 binary words of length<=13;
  8181945 individual-layer tests without failure. Degree-prefix and suffix
  sums fail for arbitrary words. This family is not identified with sources.
- degree-stress.json: 48 structured/seeded words of length up to 40;
  366434 individual-layer tests without failure, with actual inputs saved.
- degree-transfer.json: the new three-state implementation matched the
  independent last-cut renewal on 1222 words/source inputs and 533536
  coefficient entries. The renewal was also matched to explicit masks.
- joint-groups.json: source 2/7 refutes the stronger degree-coordinate and
  joint-midpoint assertions; no published direction is refuted.
- marked-gaps.json: 37405 polygon-guarded triples over 101 sources with
  b<=18 were tested as polynomials in the marker after z=1+t. The 13285
  diagonal tests had nonnegative coefficients, but the cross-cut directions
  fail already at source 1/3. Its horizontal marked gap is z^2(4-z), and
  its vertical marked gap is z^2(4-3z); both are positive at z=1. Thus an
  all-directions assertion for every z>=1 is false. The marked-diagonal
  strengthening alone remains an experimentally supported candidate.

These are exact finite computations, not universal proofs. The first
candidate is all-word log-concavity of each G(s,d;y). The more source-specific
candidate is log-concavity of every degree-interval sum. Even proving all
individual layers would not justify their sum. Horizontal and vertical
root clauses also compare different cut counts s and remain outstanding.

## Source and operational boundaries

The [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was reread with hosted browsing. A hosted search of fence-poset literature
supplied no theorem used in the proofs. No external mathematical assertion
was adopted as an axiom.

The latest completed worker's raw final events and 81 artifact hashes were
reconciled; six inherited-index hashes also matched. Earlier timeout effects
had been reconciled by that worker and were not replayed. .scratch is denied
by higher-priority policy, so all new files are durable research/evidence
artifacts. Sage and SymPy were unavailable; GAP was discoverable but not
needed. Failed elaborations and replay timeouts are operational observations,
never mathematical evidence. No protected root or controller record changed.
