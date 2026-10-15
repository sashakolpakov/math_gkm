# Third lower-slice certificates and a common projection

Machine-authored live request 75ad68f9fceb45ac8c98b66f8abbd207.
Full pinned Conjecture63 remains unresolved. No novelty claim.
Formal acceptance status is in evidence/markov-75ad68f9/validation.json.

## Candidate coefficient formula and proved inequalities

Consider a source path L::rest. Put c=(frame rest).mid.b, r=(frame rest).mid.a.
Then the original labels are a=r,b=c+r. For c>=4, the newly investigated
candidate for its third lower slice (cut count 3, original total degree a+3)
is the following list, uniformly multiplied by SIX:

    C0 = (c+r)^3-6(c+r)^2+11(c+r)-6
    C1 = -18-3c+87r+3c^2-51cr-54r^2+9c^2r+18cr^2+9r^3
    C2 = -18+6c+33r+3cr-114r^2+27cr^2+27r^3
    C3 = -6+21r-18r^2+27r^3+24q(c+r-7)
    C4 = 24((3r-5)q+t)
    C5 = 24u
    Cj = 0 for j>=6,

where q=max(2r-c,0), t=min(c-r,max(3r-c,0)), u=max(3r-2c,0).
This is a candidate SOURCE IDENTITY, not a proved source theorem.
No coefficient-index-dependent normalization is introduced: all six entries
are multiplied by the same positive integer, which cancels in inequalities.

MarkovThirdCandidate75 defines this integer sequence. The four chamber modules
prove all-index adjacent log-concavity in the following parameter regions,
with arbitrary nonnegative integers x,y (in fact integer variables bounded below
by zero), including zero tails:

    (c,r)=(3(x+1)+y,x+1),                      (q,t,u)=(0,0,0)
    (c,r)=(2(x+1)+3(y+1),x+y+2),               (q,t,u)=(0,x+1,0)
    (c,r)=(3(x+1)+2(y+1),2(x+1)+(y+1)),        (q,t,u)=(x+1,x+y+2,0)
    (c,r)=((x+1)+3(y+1),(x+1)+2(y+1)),         (q,t,u)=(x+y+2,y+1,x+1).

Every gap is an explicitly checked polynomial with nonnegative coefficients
after this substitution. MarkovThirdRegions75 covers 1<=r<c excluding the
three stated equalities c=2r,c=3r,2c=3r, and substitutes the max/min formulas.
The exceptional rational boundaries and tiny source denominators have NOT been
silently included in a source theorem. MarkovThirdTransfer75 proves the exact
conditional transfer to original integer coefficients from ThirdFormula75 and
ThirdChamber75. ThirdFormula75 remains unproved universally.

## Exact structural results toward the missing formula

MarkovThirdTransfer75 proves for EVERY path and EVERY cut count s:

    [x^(s+1)] tr T(sourceWord) = C_(s+1)(y)+(1+y) C_s(y).

This identifies the full ordinary cut polynomials, not scalar evaluations.
The original raw bridge is A(i,j)=[y^j]C_s when i+j=a+s.

MarkovRunGauge75 supplies a useful common-projection change of basis.
For S(b)=[[1,0],[-b,1]], define G(a,b;M)=S(a)^(-1) M S(b).
It proves G(a,b;M)G(b,c;N)=G(a,c;MN), telescoping for EVERY finite list,
and trace preservation for a closed cycle. For a run block A B^n, take
b=2(y+...+y^n). Its transformed constant x-coefficient is exactly
P=diag(0,1), independently of the incoming gauge a. These are checked ring
identities and polynomial coefficient identities, with no LC premise.

The following derivation is not yet formalized. Write transformed block i as
P+x M_i+x^2 N_i+x^3 O_i+..., and write a_i,b_i,c_i,d_i for the entries of M_i,
and b2_i,c2_i,d2_i,d3_i for the relevant higher entries. For a cycle of length
at least four, expanding by connected strings of nonconstant factors gives

    trace3 = e3(d) + sum_i d2_i(D-d_i) + sum_i d3_i
      + sum_i (c_i*b2_(i+1)+c2_i*b_(i+1))
      + sum_i c_i*b_(i+1)*(D-d_i-d_(i+1))
      + sum_i c_i*a_(i+1)*b_(i+2),   D=sum_i d_i.

Indices are cyclic. Separated factors are split by P; a connected triple
contributes the additional c_i*a_(i+1)*b_(i+2). Lengths two and three need
separate corrections. This explains the c>=4 condition; they cannot be
handled by merely extrapolating the generic formula.

For n=0, the blocks are A and AB. Their substituted formula depends only on
length c, one-count r, and cyclic pattern counts q=#11,t=#101,u=#111.
Subtracting (1+y)trace2, adding (1+y)^2 trace1, and subtracting (1+y)^3
gives the displayed six coefficients. Exact interpolation has full rank 15
and was checked on all 1008 binary cycles of lengths 4 through 9. This is
finite validation, not a proof of the connected-string expansion or the
universal coefficient formula. The source q identity is inherited; the t,u
source identifications and the general cubic expansion remain formal work.

## Experiments and an enlarged-family obstruction

third-verification.json records 126894 coefficient positions on all listed
reduced low-slope sources through denominator 100, using an independent
backward cut recurrence. There were no formula mismatches. A separate literal
pinned numerator recurrence matched 1242 positions through denominator 30.
These are finite experiments only.

The larger adjacent-run class suggested by earlier workers does not satisfy
unrestricted diagonal LC in the exact test below. Let
z=(AB)^29 ABBB (AB)^29. Substitute A->A, B->AB and remove the initial A.
The resulting 180-letter cut word lies in the n=0 adjacent-run class.
Its third-cut y^3,y^4,y^5 coefficients are [1012204,2012,4], gap -672.
Forward and backward recurrences independently agree. The synthetic labels
are 61/181; the original positions are (61,3),(60,4),(59,5).
The last point is OUTSIDE the canonical source polygon. The word's core is
not palindromic and is not claimed to be a source word. The actual 61/181
source gives [1011856,1660,0], gap 2755600. Thus neither this observation nor
the earlier finite adjacent-run tests resolve any pinned source inequality.
The witness rejects the unrestricted enlarged hypothesis; a polygon-guarded
enlargement remains distinct and unrefuted by this witness.

Restricted pair-transport experiments separately failed for fixed sum (2/7),
fixed minimum (3/4), and componentwise degree increase (11/15). Full min-and-sum
transport was not refuted. The horizontal Sturm test rediscovered the inherited
2/5 nonreal-row example; no new result is claimed for that rediscovery.

## Operational scope

All 98 predecessor artifact hashes and six inherited input hashes matched.
The immediate predecessor completed, including repair of its finalizer error;
earlier interruption reconciliation was already recorded by 320fe46f. No side
effect was replayed. Sage and SymPy are unavailable; GAP was discoverable but
not used. Higher-priority policy prohibits .scratch, so unique research/evidence
files were used. No packages, controller records, roots, or prior artifacts
were modified. Builds reuse inherited compiled imports and do not constitute
a fresh whole-source rebuild. No independent completion audit occurred.

The live [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was consulted. No retrieved assertion was introduced as a Lean axiom.
