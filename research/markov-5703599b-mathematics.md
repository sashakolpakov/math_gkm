# Mathematical record

Machine-authored request 5703599b8b9a4638b67a688a6b77e4cb. Full pinned
Conjecture63 remains unresolved. Final validation.json gives the accepted
module bytes, replay receipts and axiom closures.

The new middle-cone theorem `source_strip_thirdconeM570` proves

    A(i,2) A(i,4) <= A(i,3)^2

for every actual source path with b>=3a and every natural i, with zeros
retained. The next-cone assembly `source_strip_halfconeM570` proves the same
statement under b>=2a. Both source assemblies compiled; their final replay
and axiom-audit receipts are bound in validation.json. Both use actual raw
integer coefficients.

The inherited middle-cone certificate had timed out in three representations.
This run splits it into coefficients in t=4a-b. Put k=i-a, l=b-2-k and
N=k+l. In the nonzero interior l>=3 and N>=7. With the inherited J,H,I, set

    I_mid=(k+1)I+96t falling(l-3,5),
    G_mid=4(N-5)(N-6)(l-1)(k+1)H²
          -3(N-3)(N-4)(l-2)J I_mid.

For l=L+7, substitute a=(k+L+9+t)/4. Scale J,H,I_mid by 16,64,256;
they have degrees 2,3,4 in t. The seven coefficients of 4096 G_mid have
positive rational/integer certificates in k,L. Their identities and signs are
checked separately and then assembled by a small polynomial identity. For
l=3,4,5,6 the correction vanishes, reducing to (k+1) times the inherited gap.

The exact raw clearing identity uses the positive scalar

    144 falling(N,5)^2 (N-5)(N-6)(k+1)

on A(i,3)^2-A(i,2)A(i,4), with right side C² l²(l-1)G_mid, where
C=choose(N,k). No division by a coefficient or suppression of zero entries
occurs. The a=1 family is inherited; the small 2/7 source uses its literal
polynomial, and other outside-interior columns use polygon support.

For the adjacent cone 2a<=b<=3a, put t=3a-b and

    H_next=(k+1)H+24t falling(l-2,4),
    I_next=(k+1)I+(-480t+288at+96(b-2a)) falling(l-3,5)
             +(96a+96b-864)t(k+1) falling(l-3,4),
    G_next=4(N-5)(N-6)(l-1)H_next²
             -3(N-3)(N-4)(l-2)(k+1)J I_next.

The fourth-row source seed is explicitly factored as

    X² [C(c0)+X (stripQuartic+C(c1))],
    c0=-480t+288at+96(b-2a), c1=(96a+96b-864)t.

This follows from the actual fourth-row source statistics. Cancellation of
X³(1+X)^9 yields the source row formula without subtracting three from a in
the final exponent. The additional constant and quartic corrections are
transported by zero-inclusive seventh-order binomial identities.

The large chart substitutes a=(k+L+9+t)/3 and scales J,H_next,I_next by
9,27,81. All seven coefficients of 729 G_next have positive certificates.
The four small-l charts are checked directly after shifting k by 7-l and
a by one. The raw clearing scalar has (k+1)^2 instead of (k+1).
The all-source assembly additionally handles 2/5,3/7,3/8 by their literal
polynomials, and uses coprimality to exclude b=2a when a>=2.

The exact residual `InteriorCore63HalfM570` is connected to Conjecture63 by
`root_iff_interior_halfM570`; it only removes the newly proved row-two region
b>=2a. It retains
horizontal j>=5, vertical j>=3 and the row-two region b<2a, the deeper
diagonal clauses, all polygon guards, zeros and endpoints. The residual
itself is unproved.

Independent finite experiments for the two new cones used all 711 source
fractions with denominator at most 48. Among the relevant fractions they
checked 15,153 scaled coefficient identities and 8,411 raw inequalities,
including 3,360 zero-containing triples; no failure occurred. Separate
high-cone candidates passed 3,477 identities and 2,678 raw inequalities
at denominator at most 24, including 1,519 zero-containing triples. These
are reproducible exact computations, not universal proofs.

The remaining high-cone symbolic candidates and the repaired chart split are
documented in markov-5703599b-next.md. No high-cone Lean theorem is claimed.
