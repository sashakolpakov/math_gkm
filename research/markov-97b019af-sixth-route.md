# Exact sixth-moment route

Machine-authored 97b019af. Acceptance is controlled by final validation.json;
the symbolic observations below are not independently theorem evidence.

Set a=i+1, H=d+2i+9, x=k-m/2, W=steinPair*steinCut. Use the actual
birth/death rates B=(a+k)(H+k)(m-k)(H-a-3+m-k),
D=k(H-a-3+k)(a+m-k)(H+m-k). Let L1=L(-x²) and L2=L(-x⁴).
Both cut-weighted expectations are nonpositive by exact summation by parts,
because the cut and both test functions increase toward the center. The
new general finite-generator lemma treats k=0 and k=m explicitly.

The scalar F=steinScalar and both generators are polynomials in x². Solve
the two-by-two system eliminating x² and x⁴:

    delta F + A L1 + C L2 = J + K x⁶.

The exact coefficient polynomials and ring identity are in
MarkovTopSixthCertificateM97B. These are auxiliary quantities, never raw
coefficient normalizations. Delta, A, C and -K have positive shifted
coefficient expansions for a>=3,m>=2,H>=3a+m/2+4.

The symmetric beta-binomial sixth central moment is N6/B6, where
B6=64(2a+1)(2a+3)(2a+5) and

N6=15m⁶+16am²-60am⁴+90am⁵+32a²m+64a²m²-240a²m³
   +180a²m⁴+128a³m-240a³m²+120a³m³.

It follows exactly from mixed falling moments (1,1),(2,2),(3,3), including
totals below six. The actual inward likelihood decreases the sixth moment;
the radial covariance comparison retains all endpoints and zeros.

The resulting scalar certificate is

    B6 J + K N6 = a*m*(m-1)*R(a,m,H).

R(a,m,H) has a completely positive coefficient expansion after
a=x+7,m=y+2,H=3a+m/2+4+z. Thus the route can give positive actual groups
for every i>=6 in the full upper-sector domain i+r<=d+2,2<=m<=2r.
For a=6 the analogous shifted expansion still has a negative m^6 coefficient;
the method's threshold cannot simply be decreased by ignoring that term.

Fixed i=2,3,4,5 gap certificates use the inherited exact short binomial sum.
Their common positive factors are product_{j<i}(T-j)^2*(T-i), with T>=i+2.
The remaining polynomials have 156,195,238,285 positive terms respectively.
These are universal polynomial identities if successfully checked, not finite
scans in T or d. Combined with the inherited i=0,1 and short-tail results and
the i>=6 group theorem, they imply TopMomentBoundM55C.

The exact sixth experiment passed 720 cases, including the beta moment and
actual moment bound, 1,440 generator checks and 720 scalar identities.
There were 280 full-sector positive-group cases, 104 outside the fourth-moment
quadratic condition. See evidence/markov-97b019af/sixth-exact-experiment.json.
These counts are experiments, not proof of any universally quantified statement.
