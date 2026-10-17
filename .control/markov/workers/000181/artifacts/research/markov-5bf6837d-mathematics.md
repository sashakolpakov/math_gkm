# Universal outward-shift comparison and the completed correction band

Machine-authored request 5bf6837d0c5b4b818f68c99f57ad498a.
The full pinned MathGKM.Markov.Conjecture63 remains open. No novelty claim.

## The auxiliary inequality is now proved universally

Use the inherited reversed kernel

    K(j,s,r) = w(r) (j)_r / (s+j+3)_r,
    w(0)=1, w(r)=4r for r>0,

where parentheses denote descending factorials. For 0<=h<=j let

    S_h = sum_(r=0)^h K(r)K(h-r),
    T_h = sum_(r=0)^h (r-h/2)^2 K(r)K(h-r),
    v_h = T_h/S_h,  z=s+j+4-h/2.

The new theorem variance_drift_nonnegM5BF proves, for every natural j,s,h
with 1<=h<=j,

    D=(z+1)v_h-z v_(h-1)+z/4 >= 0.

The separate variance_drift_positiveM5BF actually proves D>0 on this entire
domain. No restriction to finitely many s, h or j remains. In particular
PositiveParameterTailM1C6 is closed. The strict statement is auxiliary; the
source result below remains non-strict and retains zeros.

## Exact finite proof

Set N=s+j+3, y=N+1, H=h-1. Define a birth rate

    b(0)=4j,
    b(t)=j-t-1+j/t=(t+1)(j-t)/t for t>0.

MarkovOutwardRatesM5BF proves the exact kernel relation

    (N-t)K(t+1)=b(t)K(t)  (t<j).

Consider the centered total-h distribution with mass proportional to
K(r)K(h-r). Its outward-biased shift by plus/minus 1/2 uses probabilities
1/2 plus/minus (r-h/2)/(2z). Its second moment is
(1+1/z)v_h+1/4. This probability interpretation motivates the proof; the
Lean proof uses only explicit finite sums and positive real arithmetic.

At each position t=0,...,H of the old total-H distribution, the unnormalized
likelihood ratio of the new measure to the old measure is

    B(t)=b(t)+b(H-t).

The parameter s cancels. For interior indices 0<t<H,

    B(t)=2j-H-2+j H/[t(H-t)].

Because t(H-t)=H^2/4-(t-H/2)^2, B is nondecreasing as a function of squared
distance from the center. The exceptional endpoints are essential:

    B(0)=B(H)=5j-H-1+j/H  (H>0).

Every interior value is at most 4j-H-2, since t,H-t>=1. Thus the endpoints
also obey the required radial order. H=0 is handled directly. These formulas
and the full radial-order theorem are kernel checked; no continuous
approximation or asymptotic monotonicity is assumed.

Let

    R = sum_(t=0)^H B(t)K(t)K(H-t),
    Q = sum_(t=0)^H B(t)K(t)K(H-t)(t-H/2)^2,
    E = 2y K(0)K(h).

The weighted covariance theorem in MarkovRadialCovarianceM5BF proves

    T_H R <= S_H Q.

It expands the double sum of
w_t w_u (x_t-x_u)(B(t)-B(u)), where x_t=(t-H/2)^2; every summand is
nonnegative by radial order. MarkovOutwardMomentsM5BF proves the exact
mass and second-moment equations

    R+E = 2z S_h,
    Q+E(H/2+1)^2 = 2(z+1)T_h+(z/2)S_h.

The two external endpoints of the shifted measure contribute E, not zero.
Each has squared distance (H/2+1)^2. Since T_H/S_H<=H^2/4, their inclusion
preserves the comparison. Substituting the two equations gives

    2 S_h S_H D >= 0.

Both masses are proved strictly positive. Moreover E>0 and
(H/2+1)^2>H^2/4, giving the strict version. This closes the inherited
variance-drift characterization without needing the former proposed
monotonicity-in-s/limit route or more fixed-parameter polynomial certificates.

## Closed consequences and actual source attachment

MarkovDriftClosedM5BF proves these formerly open propositions without extra
mathematical hypotheses:

- PositiveParameterTailM1C6;
- UpperAdjacentMA45;
- UnshiftedAdjacentM09F and UnshiftedRatioM09F;
- SharpCompleteMarginMBE3.

The inherited ratio transport includes the lower/cutoff/final adjacent steps,
interval positivity and zero tails, so the ordered coefficient comparisons
are not inferred from adjacent inequalities while silently ignoring zeros.
The previously proved SharpTopScalarsMBE3 and the sharp-margin transport
then close every horizontal correction-band inequality.

For q>=2, both residues r, j=q+k+1, and 2j+1<=b=sourceNME9C(q,r),
source_band_allM5BF states for every natural column i:

    threeRaw(q,r,i,j) threeRaw(q,r,i+2,j)
      <= threeRaw(q,r,i+1,j)^2.

Here b=3q+1 for r=true and b=3q+2 for r=false. The source attachment is the
unchanged cubic/Farey recurrence identity. No coefficient normalization is
made. MarkovFullBandRegionM5BF attaches this to every actual path whose
numerator is three. Combining it with the inherited lower rows gives the
particularly transparent theorem source_lower_half_pathM5BF:

    if (frame path).mid.a=3 and 2j+1<=(frame path).mid.b,
    then A(i,j)A(i+2,j)<=A(i+1,j)^2 for every natural i.

This includes all reduced numerator-three sources, with no denominator bound.
It does not cover all horizontal rows or either remaining direction.

## Exact residual and full-root limitation

Two root equivalences are proved. root_iff_beyond_full_bandM5BF replaces the
old partial-band exclusion by the entire band. The simpler
root_iff_upper_residualM5BF in MarkovHalfPlaneM5BF proves

    Conjecture63 <-> ThreeUpperResidualM5BF AND OtherFourM9E2.

ThreeUpperResidualM5BF retains horizontal rows satisfying j>q+3,
2j+1>sourceNME9C(q,r), j!=5, and retains verbatim the predecessor's
vertical and diagonal residual clauses. OtherFourM9E2 remains unchanged
for every path with numerator at least four. The exceptional row j=5 and
the first three correction rows were already proved before this work.
Neither residual proposition is proved here. This is a genuine removal of
the previously open band portion, not closure of the full root.

## False simpler shortcut

The stronger inequality v_(h-1)<=v_h+1/4 is false. MarkovDropObstructionM5BF
formally proves the actual auxiliary witness

    v(22,5,21)=2668474283/272959244,
    v(22,5,22)=4129805/433571,
    v(22,5,22)-v(22,5,21)+1/4=-29452398023/29586803095081.

Its required drift is nevertheless
281228064706395/29586803095081>0. This is not a source-family counterexample
and does not refute Conjecture63. The outward bias supplies the needed v_h/z
term; dropping it loses the universal inequality.

## Experiments and validation

The corrected outward experiment passed 4774 cases, 70800 birth identities,
66026 radial-order comparisons and 9548 moment identities. Its initial
helper-return mismatch and failed output are preserved separately. The
quarter-drop probe made 40392 checks and saved its first 20 failures.

The source experiment covered 52 distinct labels, including both endpoints,
18334 band coefficient comparisons with 8181 zeros retained, and 170491
polygon-valid triples across all three directions. No source failures.
All these are finite experiments, not universal proofs.

Eight new modules compiled and jointly kernel-replayed; 39 named theorem
axiom closures used only propext, Classical.choice and Quot.sound. Exact
receipts and hashes are in evidence/markov-5bf6837d/. These local checks use
inherited compiled dependencies. They are not a fresh rebuild of the entire
source closure or an independent hash-bound English/source completion audit.
