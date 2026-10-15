# Fourth horizontal row and uniform horizontal residual

Machine-authored request 5110b3fa. The pinned full Conjecture63 is unresolved.
Only declarations with successful source-bound build/replay/audit receipts in
evidence/markov-5110b3fa/validation.json are accepted results.

For actual labels a>=3,b>=9, the fourth horizontal row satisfies

    24 [v^4]P(u,v) = u^(a-3)(1+u)^(b-9) Q_4(u).

The eight ascending coefficients are h4c0M511 through h4c7M511. The additional
four-letter source counts are v=min(b-2a,(4a-b)_+) when 2a<=b, else zero;
w=0 when 2a<=b, w=2a-b when b<2a and 3a<=2b, and w=b-a otherwise;
z=(4a-3b)_+. The older q,t,u counts are retained as in the third-row theorem.
Twenty nonnegative polynomial charts cover six adjacent rational-slope cones.
They prove nonnegativity, six adjacent gaps, and monotonicity of the first three
coefficients. The last five coefficients are positive. This supplies interval
support even when the first three vanish, hence CrossLC. Pascal smoothing and
the exact raw coefficient bridge yield horizontal_fourth_rawM511 for every i.
The uniform factor 24 clears denominators; no individual coefficient is normalized.

The fourth source moment is derived from the general projection-product jet
formula and actual four-letter source counts, not fitted from data. A polynomial
identity over positive real u is lifted to the integer-polynomial identity.

The all-order representation uses h=1+u and v=h^2 Y. Its integral matrices are

    K_A = [[Y,Y],[uY,1+uY]],
    K_B = [[Y+h^2Y^2,(u+2)Y+h^2Y^2],
           [u(u+2)Y+uh^2Y^2,u+u(2u+3)Y+uh^2Y^2]].

For the actual source word W, let T=tr(product K_W) and set
R_0=[Y^0]T, R_(j+1)=[Y^(j+1)]T-h R_j. The uniform source identity under
formalization (now compiled and replayed) is

    h^(2j) [v^j]P = h^(b-1) R_j.

Consequently, when 2j+1<=b, [v^j]P=h^(b-2j-1) R_j, with R_j in Z[u].
For arbitrary j the prescribed nonnegative exponent gives a divisibility theorem.
This factor is prescribed, not claimed maximal.

The positive expression is D(M)=M.b+M.d-M.a-M.c. Conjugation gives
P(u,h^2Y)=h^(b-1)D(product K_W). On source words R_j=[Y^j]D(product K_W).
Every source word ends in B. For any prefix matrix M,

    D(M K_B) = (M.a+M.c) hY + (M.b+M.d) u(1+hY).

All entries of both K letters are coefficientwise nonnegative. This identity
therefore supplies a uniform residual nonnegativity argument. The source
identification hresidual_diffM511 and hresidual_coeff_nonnegM511 are compiled,
kernel-replayed and axiom-audited. horizontal_positive_factorM511 supplies
the integral nonnegative factor for every path and row with 2j+1<=b.
It does not supply residual log-concavity.
For j>(b-1)/2 the relation has R_j=h^(2j-b+1)[v^j]P; LC cannot be transported
backwards through this extra binomial factor without another argument.

Finite observations, not proofs: the fourth-row checks covered 630 fractions,
35,630 coefficient identities, 18,395 valid triples and 15,975 zero positions.
The uniform quotient scan covered 1,101 fractions with b<=60 and 22,479 rows,
testing 1,020,928 adjacent residual inequalities with no failures. A separate
full matrix/source identity experiment passed 168,290 source coefficient checks
and 4,729 residual row comparisons across 179 fractions. No finite
denominator bound appears in accepted mathematical theorem statements.

root_iff_horizontalM511 removes checked rows from the inherited exact residual,
while preserving small exceptional cases, vertical interiors, higher diagonals,
both endpoints and all polygon guards. The residual remains unproved.
