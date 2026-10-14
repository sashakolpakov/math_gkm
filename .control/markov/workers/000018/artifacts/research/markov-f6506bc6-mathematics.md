# Right-spine column and horizontal normalization obstruction

Machine-authored live request f6506bc615574382b93e600ac6a368f9. Partial research;
no resolution of the full published conjecture or historical novelty claim.

Let P_a be the exact source numerator at a/(a+1), a>=1. The canonical path
is a-1 right steps. The checked source recurrence is

    P_(a+2)=(u+v+1)(u+v)P_(a+1)-uv P_a.

The same recurrence yields simultaneous exact formulas for columns 0,1,2.
For a>=5 the new formula is

    2[u^2]P_a=v^(a-1)(1+v)^(a-5) R_a(v),
    R_a=16+(32a-16)v+(9a^2+29a-26)v^2
                 +(12a^2+2a-6)v^3+(4a^2-2a)v^4.

The factor 2 clears the coefficient formula uniformly; it is removed again
from the final raw inequality. No factorial or binomial normalization is
used by this positive result. MarkovRightJetsF650 proves the recurrence,
actual low-column computation, and unbounded identity by two-step induction.

Put a=n+5. The residual coefficients are

    16, 32n+144, 9n^2+119n+344, 12n^2+122n+304, 4n^2+38n+90.

They are positive for n>=0. Their three adjacent LC gaps are respectively

    880n^2+7312n+15232,
    81n^4+1758n^3+14721n^2+54576n+74560,
    108n^4+2110n^3+15472n^2+50394n+61456.

The exact real polynomial identities and positivity are checked in Lean.
The finite support is an interval, so the inherited adjacent-to-CrossLC
bridge applies with its support hypothesis discharged. Monomial shifts and
Pascal smoothing preserve this predicate. The resulting theorem covers every
natural j, including zero coefficients. Small a=1,2,3,4 are handled separately
by exact jets and the source outside-polygon-zero theorem.

MarkovRightSourceF650 proves that a source path with b=a+1 consists entirely
of right steps, using the strict lower-endpoint and middle label inequalities.
Thus source_near_one_vertical_two650 covers every source path satisfying
b=a+1, with no denominator bound. It proves only vertical column i=2.

## Obstruction to a stronger horizontal strategy

The exact finite strengthened scan of 307 reduced fractions with b<=31 found
that horizontal binomial normalization does not always preserve LC. The actual
source 12/13 has degree 24, and on row j=14 the coefficients at i=0,1,2 are

    11, 510, 10680.

All three positions are in its polygon. Dividing these by choose(10,i) gives
11,51,712/3, with 51^2=2601 < 7832/3. However the raw inequality is
11*10680=117480 <= 260100=510^2. MarkovHorizontalObstructionF650 proves the
exact coefficients from the universal jets, the source labels, polygon guards,
the strictly reversed normalized inequality and the valid raw inequality.
This is a proof-strategy obstruction, not a refutation of Conjecture 6.3.

The same finite scan found both signs among neighboring coefficient-matrix
minors; neither uniform TP2 sign is an available general invariant. No failure
of the tested positive-slope adjacent inequality was found. That observation
is finite only and is not an additional proved source direction.

The publisher source was consulted live:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html
Hosted searches supplied no external theorem used as an axiom. Retrieval of
a related ScienceDirect article returned HTTP 403. The literature search was
not an exhaustive novelty audit.
