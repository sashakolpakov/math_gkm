# A wider correction-band representation

Machine-authored request 1bb0aa1ee066482294f620401d001bf2. Everything here
beyond t=0 is a proposed derivation supported by finite tests, not a Lean
source theorem. It must not be admitted as an axiom or treated as root closure.

Let a=1+u and define

 R_t(m,u)=sum_(s=0)^t C(t+1,t-s) C(m-t-1,s) u^s a^(t-s).

For 0<=t<m and m>=2t+1, binomial expansion suggests the Fibonacci row
identity [v^t]F_m=u a^(m-2t-1)R_t(m,u). Negative-index R are zero.
Let E=P-L be the actual numerator-three source minus its inherited lower
auxiliary solution. The exact discriminant equation for E has right side
4u v^(q+1)G. Proposed correction rows are

 [v^(q+1+t)]E = 4u² a^(q-2t-2) T_t^+(q,u)  (true branch),
 [v^(q+1+t)]E = 4u² a^(q-2t-1) T_t^-(q,u)  (false branch).

For t<=q-1 and the displayed exponents nonnegative, coefficient comparison
suggests the recurrences

 T_t^+ = R_t(q)+R_t(q+1)+a R_(t-1)(q)
         +2(1-u)T_(t-1)^+ -a²T_(t-2)^+,
 T_t^- = R_(t-1)(q)+R_t(q+1)+a R_(t-1)(q+1)
         +2(1-u)T_(t-1)^- -a²T_(t-2)^-.

Negative-index T are zero. Initial residuals are

 T_0^+=2, T_0^-=1,
 T_1^+=9+(2q-2)u, T_1^-=6+qu.

Only t=0 has a complete Lean source proof in MarkovFirstRowM1BB, including
the exceptional q=1 true branch, where an inverse rather than a polynomial
power is necessary. The experimental band uses q>=2t+2 for the true branch
and q>=2t+1 for the false branch, so it never truncates negative exponents.
There are 819 tested rows and 72,569 tested coefficients; residual positivity
and 4,389 adjacent-LC tests passed. The comparison uses two exact triangular
solvers, so these are not additional direct protected-recurrence checks.

The recurrence is signed. Finite positivity/LC cannot be used as a universal
closure rule. Even proving LC of both L and E would not establish LC of their
sum without an appropriate mixed inequality. This is a promising explicit
representation to investigate, not a proved sufficient global certificate.

The first unproved low-column extension suggested by t=1 is, at j=q+2 and
q>=2, an addition to the lower expression of

 column 2: 36 (true), 24 (false);
 column 3: 44q-152 (true), 28q-72 (false);
 column 4: (q-4)(26q-98) (true), 16(q-3)^2 (false).

The q=1 case lies outside this derivation and must be handled separately.
No source bridge or crossing inequality for this next row is proved here.
