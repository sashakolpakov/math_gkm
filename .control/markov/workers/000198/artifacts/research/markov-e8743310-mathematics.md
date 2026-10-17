# Centered variance and the complete middle strip

Machine-authored live research request e874331060f545c891d1edabfa5a4db3.
The pinned full Conjecture63 and its negation remain unresolved. Final local
validation is controlled by evidence/markov-e8743310/validation.json.

## Retaining the weighted mean

Use the inherited actual template mass M, spectral excess E, variance numerator
V, and second deficit G at column i, endpoint T=i+r, parameter d. Write
H=2i+r+d+9, R=rH, Q=H+r, I=i+3, J=i+4. The inherited second-deficit estimate is

    I J G <= S M,     S=i(i+1)+6r(i+1)+6r^2.

The old variance estimate discarded a nonnegative square. The new exact
centered identity instead gives

    V + (R M-E)^2 <= Q^2 M G.

This uses the actual source weights, including their modified endpoint. It is
proved from the inherited centered second-moment identity and pointwise bound,
without a hypothetical arbitrary-weight assumption.

Set A=(i+1)(8(i+4)+1), B=15i+47 and D=H-r+1. The desired weak template margin
is equivalent to B E^2+A D M E-A V>=0. The scalar sufficient condition is

    C=4 I J B R^2+4 I J A D R-I J A D^2-4(A+B)Q^2 S >=0.

The proof multiplies the desired inequality by 4(A+B)IJ and identifies it with

    IJ[2(A+B)E+A(D-2R)M]^2
      + A C M^2
      + 4(A+B)A[Q^2 S M^2-IJ(V+(RM-E)^2)].

All three terms are nonnegative under the explicit hypotheses. The expansion
of C after i=10+x, r=3+y, H=r+2i+9+z has 64 positive monomial coefficients.
Lean's ring and positivity tactics check this identity and sign for all real
x,y,z>=0. The actual-weight attachment yields the weak margin for all natural
i>=10 and T>=i+3, with d unbounded.

The complete middle correction satisfies the inherited exponential bound.
The existing positive-perturbation theorem therefore transports the weak
margin to the raw middle coefficients, retaining negative mixed contributions
in the total gap. The case T=i+2 uses the existing exact last-triple inequality;
T<i+2 uses the exact zero-tail theorem. All x,k and both residues remain
universally quantified.

MarkovMiddleClosedME87 combines this with the previously checked lower columns
and rows. It proves MiddleShortLCMD02, source_middle_allME87, and the path and
polygon versions. In source notation b=3q+1 or 3q+2, q>=1, its row is
j=b-q-k-1, with k<=q and 2(q+3+k)<=b. Every horizontal starting index is covered,
including zero coefficients. No denominator or depth bound remains in this strip.

It also proves the exact equivalence

    Conjecture63 iff ThreeOutsideMiddleMD02 and OtherFourM9E2.

These remaining conditions are not assumed or solved by the middle theorem.

## Top five rows

MarkovTopFiveFormulaME87 derives the following raw row coefficient lists for
topTemplateMB3E n t, retaining zero extension outside each displayed list:

    t=0: [1]
    t=1: [2,n+2]
    t=2: [1,3n-1,choose(n+2,2)]
    t=3: [0,4(n-3),4 choose(n,2),choose(n+2,3)]
    t=4: [0,4(n-6),8 choose(n-2,2),
          choose(n+1,3)+4 choose(n,3),choose(n+2,4)].

The identities hold for n>=2. The nontrivial raw gaps are proved by explicit
positive polynomials after n=4+x for t<=3 and n=7+x for t=4. Source transport
uses t<=q+2, which supplies the required bounds. The combined LC and final residual modules have also compiled. Their final
replay and axiom status is recorded in validation.json.

The proved exact final residual ThreeCentralRowsME87 retains only j=(b+1)/2 or
j=(b+1)/2+1 among still-open numerator-three horizontal rows, together with
the unchanged vertical/diagonal clauses and OtherFourM9E2. Its exact accepted
status is recorded in the final checkpoint and validation.json.

## Auxiliary obstruction and experiments

centered_cutoff_nine_failsME87 proves centeredScalarME87 9 399 426<0.
This rejects extension of this particular sufficient scalar certificate to
column nine; it does not refute raw log-concavity. Column nine was already
closed by a different accepted certificate.

The staged dense-expression certificate for column ten timed out. Its
positive Python coefficient data and unaccepted Lean source are not part of
the centered-variance proof. Actual source and moment experiments, including
zeros, are recorded separately and are not universal proof evidence.
