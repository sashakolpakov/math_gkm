# Transposed lower-row formula and additional raw strips

Machine-authored live request ae9e841e98884e419ff8cadb546d21cc. Checked status is determined by the build, replay and closure receipts. Full pinned Conjecture63 remains unresolved.

For n=2j+1+d, the inherited positive lower-row formula gives the literal raw coefficient A(t+3,j). Expanding C(d+s,t) by Vandermonde and then using

    C(s,m) C(t+s+3,s) = C(t+m+3,m) C(t+s+3,t+m+3)

transposes its finite sum. The weighted hockey-stick identity evaluates the remaining sum over s. The result, proved in MarkovBinomialLiftMAE9, is

    A(t+3,j) = sum_(m=0)^t C(d,t-m) L(j,t,m),
    L(j,t,m) = C(t+m+3,m) [C(t+j+3,t+m+3)+4 C(t+j+4,t+m+5)].

This is valid for all d,j,t>=0 for the lower-row polynomial, and for every source family n=3q+1 or 3q+2 with j<=q. It retains zeros and has no coefficient normalization. Every summand is nonnegative. The summation length now depends on the column offset t, rather than j.

Replacing each ordinary binomial by its falling-factorial polynomial produces lowColumnMAE9(n,x,t). Its source identity is universal in t; no interpolation is involved. Explicit instances t=1..5 give columns 4..8. The formulas for columns 4 and 5 agree with inherited results but are derived through the new uniform route.

Exact rational polynomial gap identities give three additional horizontal starting columns i=4,5,6 when j<=q; three vertical columns i=6,7,8 when j+2<=q; and three diagonal starting columns i=4,5,6 when j+2<=q. These are weak raw inequalities on all indicated natural indices, including zeros and triples outside the polygon. The diagonal triple is (i,j+2),(i+1,j+1),(i+2,j). For q>=3 all the indicated gained triples are polygon-valid, as witnessed by lower_band_polygonMAE9.

The horizontal certificates use j=x+1 for starts 4,5 and j=x+2 for start 6, with n=3j+1+d. The finitely many omitted small rows use an inherited universal source theorem, not a scan. The direct j=x certificate had negative coefficients and is retained in column-candidates.json. Vertical and diagonal certificates use n=3x+7+d and j=x. Coefficients of the factored gap polynomials are nonnegative; Lean proves each exact identity by ring and each sign by positivity. Generated Python expressions are candidates until those Lean checks pass.

MarkovResidualMAE9 proves the exact equivalence

    Conjecture63 iff ThreeRemainingMAE9 AND OtherFourM9E2.

Both residual predicates remain unproved. The remaining numerator-three predicates still contain every unproved horizontal, vertical and diagonal clause. All correction bands, larger numerators and reverse-factor ranges remain. No complete new source direction is claimed.

The first-correction polynomial bridge is also derived for q>=2 in MarkovFirstCorrectionPolynomialMAE9. At row q+1 it adds 8*C(q-2,t+1) in the 3/(3q+1) family, or 4*C(q-1,t+1) in the other family, to lowColumnMAE9. The exceptional q=1 alternating correction remains in the inherited firstCorrectionM1BB theorem; it is not replaced by a truncated negative parameter. Twenty exact polynomial candidate gaps on this correction row/crossing have nonnegative factored coefficients, but their signs and source transports are not included as new Lean LC theorems.

For a potential uniform horizontal route, put a_j(t,r)=L(j,t,t-r) for r<=t, and zero otherwise. The source output is the transform of the binomial sequence C(d,r). Finite tests of every recorded truncation of the row generating polynomial found 509,551 nonnegative gap coefficients. Universal LC-positivity of this triangle is unproved; a literature preservation theorem cannot be used without proving its hypotheses and formal transport.

A simpler discrete midpoint condition is false: a_1(0,0)*a_1(2,1)=48 exceeds a_1(1,0)*a_1(1,1)=45. MarkovLiftObstructionMAE9 proves this auxiliary failure. The associated source 3/4 row j=1 has the polygon-valid raw triple [8,14,6], whose gap is 148. Thus this is not a source counterexample. Termwise mixed-summand inequalities also fail in exact finite probes.

MarkovLiftRatioMAE9 further proves the scaled kernel identity

    L(j,t,m)(t+m+4)(t+m+5)
      = C(j,m) C(t+j+3,j)
        [(t+m+4)(t+m+5)+4(j-m)(t+j+4)]

for m<=j, positivity of the bracket, and its exact adjacent-m ratio recurrence. These identities reduce potential kernel comparisons to rational polynomial signs, but no uniform sign theorem is claimed. A subsequent Laurent-extension probe passed all its recorded coefficient and sign-pattern checks; its universal claims remain unproved and its proposed use is explained in markov-ae9e841e-next.md.
