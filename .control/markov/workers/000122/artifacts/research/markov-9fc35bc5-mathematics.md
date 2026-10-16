# Third-column source region

Machine-authored request 9fc35bc50ae14db198b964755648474b. Full pinned
Conjecture63 remains unresolved. Validation is recorded in
evidence/markov-9fc35bc5/validation.json, with separate build/replay receipts.

The connected theorem vertical_third_third_remainderM9FC in
MarkovThirdThirdSourceM9FC.lean states, for every finite path with middle
label (a,b,P), a>=7 and a<=3*(b mod a), and every natural j,

    coeff P 3 j * coeff P 3 (j+2) <= coeff P 3 (j+1)^2.

There is no denominator, run-length, or coefficient-index bound. This is the
literal integer coefficient of u^3*v^j. Zero coefficients remain in the
sequence. vertical_third_third_regionM9FC also includes the inherited b<5*a
region. This extends the preceding a<=2*(b mod a) region.

The source decomposition has a=L, b=L*(n+1)+(L-T), with 0<T<L. Thus the
new condition corresponds to 3*T<=2*L. The strict half is handled by the
new count certificates. In the interval L/2<T<2*L/3, set x=2*T-L and
y=2*L-3*T. Then x>=0, y>=1, L=3*x+2*y, T=2*x+y. The condition L>=7 is
covered by three translated quadrants: (x>=0,y>=4), (x>=1,y>=2), and
(x>=2,y>=1). Each is checked over all twenty inherited run/index chambers.
The two largest chambers use explicit cubic coefficient certificates.

The equality a=3*(b mod a) is impossible for a>=7: r=b mod a divides a
and b, so coprimality gives r=1, which would force a=3. This arithmetic
argument is checked in MarkovThirdRemainderM9FC.lean. It is what permits
the inclusive source-region hypothesis without silently omitting a boundary.

The checked bounds enter vThird_seed_cross_of_boundsM03. That theorem uses
actual support and nonnegativity to obtain CrossLC, and transports forward
through the exact monomial/binomial source factorization. The proof does not
infer log-concavity by dividing by a binomial factor or deleting zeros.

MarkovResidualThirdM9FC.lean proves the exact equivalence

    Conjecture63 <-> InteriorCore63ThirdM9FC.

The remaining third-column clause includes a<=6, or a>=7 with b>=5*a
and 3*(b mod a)<a. All previously unresolved higher horizontal lines,
other vertical lines and deeper diagonals remain. The residual is unproved.

A separate arithmetic theorem third_high_chart_coverM9FC identifies a
shorter route for the remaining source cone. For coprime T,L, L>=7 and
3*T>=2*L, equality is impossible. Put x=L-T>=1, y=3*T-2*L>=1. Only
the two charts (x>=1,y>=4) and (x>=2,y>=1) are needed. The corresponding
high-cone coefficient candidates are not proved by this run.

The exact experiment checks 135 fractions, 79,633 raw coefficient identities
against the factored seed, and 79,363 adjacent inequalities; it retains
64,040 zeros. These finite observations are not a proof.

The source theorem reuses 214 MAE2 compiled dependency modules, in addition
to earlier imports. This run's selected new declarations are separately
kernel-replayed with explicit import-isolation checks; it does not freshly
rebuild or replay that entire inherited dependency closure. No independent
English/source completion audit has occurred. See the correspondence record.
