# Checkpoint: upper-sector formula and first edge proved locally

Machine-authored b3eed364. Full root remains open.

Eight new mathematical modules have now compiled successfully over inherited
compiled dependencies. Joint replay and the axiom audit remain to be run.

The source upper row at j=b+2-t equals topTemplateMB3E b t whenever
t<=q+2, b=3q+1 or 3q+2, q>=1. This is proved from the original cubic source
identity and its discriminant equation, with high-row support proved rather
than assumed. The template uses a polynomial recurrence with no negative
exponent. No lower-band identity was extended by natural subtraction.

For n>=2t, t>=3, its coefficients A_i are:

    A_0=0,
    A_1=4(n+6-3t),
    A_2=4(t-2) choose(n-2t+6,2),
    A_i=choose(t-3,i-3) choose(n+2-t+i,i)
      +4 sum_(s=3)^(t-1) (t-s) choose(s-3,i-3)
                              choose(n-2t+s+i+2,i),  i>=3.

The high-column sum is nonnegative and positive exactly at 3<=i<=t.
Its proof is finite polynomial recurrence algebra, not the heuristic
Lagrange-inversion calculation that suggested the representation.

For n>=2t, t>=3, 3t<=n+5, the first triple satisfies A_1 A_3<A_2^2.
The proof uses an exact weighted binomial telescope for A_3 and a 25-term
positive polynomial certificate after t=s+3, n=3t-5+d. This attaches to every
actual source with 5<=t<=q+2, without a denominator bound. Starting i=0 is
also covered, using the retained zero A_0. The new exact root reduction is
Conjecture63 iff ThreeRemainingMB3E and OtherFourM9E2; both remain open.

The original recurrence experiment passed 10,156 upper coefficient identities
(2,906 zeros retained) and 178,664 polygon triples in all three directions.
Symbolic experiments checked 250 gap polynomials for fixed depths 3..22;
all coefficients in n-(3t-5) were nonnegative. This does not prove the
unbounded-depth condition TopTemplateLCMB3E.

One positive-sum build timed out. Subsequent corrected builds fixed finite
index normalization, targeted recurrence rewriting, casts, Pascal signs and
comparison whitespace. Every rejected source snapshot and output is retained.
