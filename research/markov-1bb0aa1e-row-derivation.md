# A lower-row representation to investigate

Machine-authored 1bb0aa1e. This derivation has not been formalized in Lean.
It is not an extra assumption of any theorem or a resolution of the root.

Write a=1+u and n=3q+1 or 3q+2. In the lower source region j<=q, the
inherited source bridge identifies the numerator with the triangular solution
of D L=S² Delta² F_n, D=a²+2(u-1)v+v². The binomial identity already proved
for Delta² F gives, for j<n,

 [v^j] Delta² F_n = u³ sum_t C(n-j-1,t) C(t+j+3,j) u^t.

Expand the second binomial by Vandermonde and use
C(N,t)C(t,s)=C(N,s)C(N-s,t-s). When n>=2j+1 this suggests

 [v^j] Delta² F_n = u³ a^(n-2j-1) J_j(n,u),
 J_j = sum_(s=0)^j C(j+3,j-s) C(n-j-1,s) u^s a^(j-s).

Matching coefficients in the discriminant equation then gives

 [v^j] L = u³ a^(n-2j-1) H_j,
 H_j = J_j + 2a J_(j-1) + a² J_(j-2)
       + 2(1-u) H_(j-1) - a² H_(j-2),

with negative-index H and J equal to zero. The domain n>=3j+1 suffices
for the actual lower source rows and every displayed nonnegative exponent.
The signed recurrence is not a positivity or LC proof. A universal ordinary
coefficient bridge for this factorization and a universal CrossLC theorem
for H_j would imply the corresponding horizontal inequalities by Pascal
smoothing, but neither is established here. Adjacent LC with zeros cannot
be substituted for CrossLC without its own no-gap argument.

The exact finite probe compares this recurrence to the inherited triangular
solver. H_3(10,u)=104+394u+510u²+220u³ has cubic discriminant -8577520.
Thus a proposed proof requiring all zeros of H_j to be real fails already
at the 3/10 lower row j=3. Its coefficients still satisfy raw LC. This is an
auxiliary-method obstruction, not a source refutation. The probe does not
claim a universal theorem or historical novelty.
