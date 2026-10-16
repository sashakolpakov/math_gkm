# Mathematical checkpoint

Machine-authored request d11e335ef8db44b282c73b02009fc529.
Full pinned Conjecture63 remains unresolved. Admission status is recorded in
the final validation.json, not inferred from this running checkpoint.

For source indices a,b with b>=4a, the new source_strip_allMD11 proves
A(i,2) A(i,4)<=A(i,3)^2 for every natural i, retaining zeros. Its source build
has passed. Isolated kernel replay passed for all nine admitted modules, and
all 24 theorem closures passed the permitted-axiom audit; see validation.json.

Put k=i-a, l=b-2-k, N=k+l, C=choose(N,k). In the nonzero interior l>=3,N>=7.
J,H are the inherited raw second- and third-row polynomials. Write c3,...,c7
for h4c3M511,...,h4c7M511 evaluated with the six source statistics zero, and
I=sum(r=0..4) c(r+3) falling(k,r) falling(l-3,4-r).
The new source and binomial bridges give

24 falling(N,7) A(i,4)=C l(l-1)(l-2) I.

The gap is G=4(N-5)(N-6)(l-1)H^2-3(N-3)(N-4)(l-2)JI.
The checked clearing identity is

144 falling(N,5)^2 (N-5)(N-6) [A(i,3)^2-A(i,2)A(i,4)]
 = C^2 l^2(l-1)G.

The scalar on the left is positive. G is nonnegative in five covering charts:
a=A+1 and either l=L+7,k=K, or l=3,k=K+4, l=4,k=K+3,
l=5,k=K+2, l=6,k=K+1. Ring normalization and positivity certify these.

The fourth-row source formula is derived from hfourth_eval_clearedM511 by
canceling X^3(1+X)^9 after the zero-statistic seed is factored. This works
without a>=3: the numerator a is never naturally subtracted by three in the
final low-cone identity. The a=1 source family uses its inherited global
theorem; a>=2 and b>=4a imply b>=9 by coprimality. Outside the interior,
source polygon support makes A(i,2) or A(i,4) zero. No coefficient is filtered.

For 3a<=b<=4a, let t=4a-b. Only the fourth-row statistic v=t survives.
The fourth-row residual is C(96t)+X*stripQuartic, with monomial shift a-1.
The candidate correction is I_mid=(k+1)I+96t falling(l-3,5).
Its scaled formula has the additional positive factor k+1 on the left.
G_mid=4(N-5)(N-6)(l-1)(k+1)H^2-3(N-3)(N-4)(l-2)J I_mid.
Substituting a=(N+2+t)/4 yields nonnegative rational coefficients in the same
five charts. The first direct Lean normalization timed out; replacement
integer certificates multiply the gap by 4096. Both expanded and factored
versions also timed out. The actual-source identity compiles. A draft would
handle the exceptional 2/7 source by its literal polynomial; it is not admitted.

Neither strip closes horizontal rows, the other vertical strips, the remaining
slopes at j=2, or deeper diagonals. The exact residual preserves them all.

Final scope decision: three middle-gap proof attempts timed out (direct ring
normalization, expanded integer certificate, and factored integer certificate).
No middle-cone log-concavity theorem is admitted. Its actual-source identity
and seventh-order binomial correction are included in the checked module set,
but the gap and downstream assembly drafts are excluded explicitly in
evidence/markov-d11e335e/excluded-drafts.json. The authoritative new root
reduction is root_iff_interior_lowMD11 in MarkovResidualLowMD11.lean. It removes
only vertical starting j=2 with b>=4a. No b>=3a strip theorem is claimed.

The next-cone probe for 2a<=b<=3a found positive rational expansions in the
same five charts. This is symbolic evidence only. Its source identities,
integer clearing and finite checks are recorded as candidates for a later
invocation, not as checked Lean theorems or a root resolution.
