# Discrete certificates for the eighth vertical column

Machine-authored request 295093095f844a1189c05bb526265c75.
Full pinned Conjecture63 remains unresolved. No historical novelty is claimed.
See validation.json for the final exact accepted source inventory and receipts.

Write A_q(i,j) for the raw source coefficient at rational 2/(2q+1), q>=1.
The source theorem establishes A_q(8,j) A_q(8,j+2) <= A_q(8,j+1)^2 for every
natural j and every actual source path with numerator two. All zeros remain.
Its four-region adapter is inherited from MarkovVerticalRegionsM0D3; the two
within-region and two crossing inequalities are all required.

Use L_i(j,d)=lowerValM58E j d i and U_i(N,d)=upperValM2B3 N d i.
The inherited source identities are used literally; there is no normalization.
The polynomial bridges identify their rational casts with choosePoly-based
expressions, where choosePoly(n,k)=C(n,k) for every natural n,k, including n<k.

For i=8 the lower gap is

    G(x,y)=L_8(x+1,y+1)^2-L_8(x,y+2)L_8(x+2,y).

Its ordinary monomial expansion has negative coefficients. Worse, its rational
continuation at x=0,y=1/4 is negative, as formally proved by the predecessor.
Thus a proof for all nonnegative real offsets is impossible. Natural offsets
are nevertheless covered by an exhaustive discrete split:

* y=0: G(x,0) has an explicit expansion sum_r c_r C(x,r) with c_r>=0. The
  exact rational polynomial identity is proved in MarkovEightZeroM295, using
  independently checked binomial expansions up through degree 28. At natural
  x every binomial is nonnegative. The zeros at small x remain in the identity.
* y=z+1: G(x,z+1) has nonnegative ordinary monomial coefficients in x,z.
  MarkovEightPositiveM295 proves that exact identity and its sign for x,z>=0.
  MarkovEightLowerM295 applies the zero/successor split, without assuming
  anything between consecutive integer offsets.

The upper gap, shifted by N=x+6, and the crossing gaps, shifted by q=x+7 and
q=x+8, have nonnegative ordinary monomial certificates. Their exact identities
are checked in MarkovEightUpperM295, MarkovEightCrossOneM295 and
MarkovEightCrossTwoM295. Intermediate polynomial expansions reduce repeated
normalization work. Python generated candidate identities but establishes none
of these universal equalities; ordinary Lean proofs check them.

The direct bivariate Newton expansion of G has 295 nonzero, nonnegative
candidate coefficients in the exact computation. Both flat and grouped Lean
attempts exceeded their build limits. The grouped candidate is retained as
MarkovEightNewtonM295 with an explicit UNVALIDATED header. It is neither an
import of the accepted source proof nor part of the final replay inventory.
The valid proof uses the discrete split above. Timeout is not a mathematical
refutation of the candidate identity.

## Uniform Newton criterion

For any f: Nat x Nat -> Int, define

    c_f(r,s)=Delta_y^s (y -> Delta_x^r (x -> f(x,y))(0))(0).

MarkovNewtonM295 proves the exact identity

    f(x,y)=sum_{r=0}^x sum_{s=0}^y C(x,r) C(y,s) c_f(r,s).

Consequently, nonnegativity of every c_f(r,s) implies f(x,y)>=0 for every
natural x,y. This theorem does not assume a degree bound, convergence, real
interpolation, or finite numerical coverage. Its sums are finite at each input.

MarkovNewtonReductionM295 defines the four integer gap functions with the
precise shifts from the inherited vertical equivalence. NewtonVerticalM295(i)
asserts nonnegativity of every mixed difference coefficient for all four gaps.
It is a stronger sufficient condition, not an asserted equivalent condition.
The file proves

    (forall i>=5, NewtonVerticalM295(i)) AND OtherVerticalCoreM0D3
      IMPLIES Conjecture63.

Both premises remain unproved. In particular the other-numerator vertical
clauses and all remaining horizontal and diagonal clauses are still present.
Earlier finite Newton probes do not discharge this universal hypothesis.
MarkovNewtonRemainingM295 further removes i=8 from the sufficient Newton
premise using the completed source-column theorem. Its remaining indices are
5, 6, 7 and every i>=9. The other residual premise is unchanged and unproved.

## A summand obstruction and its actual source

For the individual summand T_i(j,d,h) of L_i(j,d), every natural fixed shift s
fails the proposed comparison

    T_i(j,d+2,h) T_i(j+2,d,k)
      <= T_i(j+1,d+1,min(h+s,k)) T_i(j+1,d+1,max(h+s,k)-s).

The same witness i=3,j=d=k=0,h=1 works for all s: the left side is 112 and
the right side is 48. MarkovNewtonObstructionM295 proves this universal shift
failure and separately proves the corresponding actual 2/5 source triple is
[4,16,28], polygon-valid, and satisfies raw LC with gap 144. Thus the failed
comparison is a strategy obstruction, not a root refutation.

## Residual and experiments

MarkovResidualM295 proves Conjecture63 iff InteriorCore63M295, removing only
the newly proved numerator-two eighth vertical column from the predecessor's
residual. All other guards and clauses are retained. MarkovEightGainM295 gives
the unbounded family q=n+10, i=8, j=n+10 satisfying every old residual guard.
At n=0 the exact raw triple is [14090076,9165416,4672824], with positive gap
18164405158432. These explicit numbers are experimental observations; the
unbounded theorem concerns the source coefficients directly.

Finite source experiments checked 4,010 coefficient identities and 4,320
eighth-column triples, including 735 zero-containing triples. Sixteen source
polynomials also matched direct path recurrence. Another 2,624 checks matched
the four candidate Newton expansions and their gaps on finite ranges. Exact
bounds and code hashes are in evidence/markov-29509309/source-experiments.json.
None of these scans is a proof for all sources or all columns.
