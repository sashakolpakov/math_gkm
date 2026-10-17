# Second research checkpoint

Request 50c262c5afce4cf0a717cbef7a352e92, machine-authored. Completion remains null.

The broader identity has compiled in MarkovTemplateDiagonalM50C:

    coeff(topTemplate(c+d+2k+1, c+k+3), c+3) = D_c(k+d,k),

where c,d,k are arbitrary natural numbers and D is the inherited positive ramp
convolution. The proof establishes the leading coefficient and first defect
coefficient, then solves the exact diagonal recurrence from those initial data.
It does not extrapolate the old nonnegative-offset formula.

MarkovMiddleCrossingM50C and MarkovMiddleCrossingDegreeM50C extend the complete
signed correction formula and degree bound to depth k<=q+delta, delta=1 or2,
which reaches the row j=q-1. This retains the lower boundary-crossing triples.

MarkovMiddleTriangleModelM50C and MarkovMiddleTriangleLCM50C have compiled.
Writing b=3q+delta, the new source coefficient model holds for i>=3,
q<=j+1, b<i+j+q, i+j<=b+2 and b+2<=i+2j. Consequently:

* Vertical triples hold when q<=j+1, b<i+j+q, b+2<=i+2j, all i.
* Diagonal triples hold when i>=4, q<=j+1, b<i+j+q+2, b<=i+2j.

These include middle rows below b/2 and crossing triples, with degree tails
handled explicitly. The earlier upper-half result also covers diagonal start3.
The exact root residual and path/polygon wrappers are being compiled. Joint
kernel replay and axiom audit are not yet complete at this checkpoint.

The source experiment passed 71,648 coefficient comparisons, 166,250 new-region
transverse tests, and 668,315 polygon-valid triples across all directions, with
both endpoint polynomials included. See source-experiment.json in the evidence
directory. These finite checks do not establish a universal statement.

A second finite experiment tested 164,500 coefficients of actual source minus
the D model. No negative difference or support failure was found; nonzero
differences lay in q<j and i+j<=b-q. Adjacent log-concavity tests of this difference
also passed. However the mixed terms in the sum's gap can be negative in every
direction. The first vertical example has mixed gap -32 at q=2,r=false,i=3,j=1;
the corresponding full source gap is +292. The first diagonal example has mixed
gap -520 and full source gap +18001. A source-attached Lean diagnostic is pending.
See evidence/markov-50c262c5/correction-probe.json. Positivity or compatibility of
the global difference remains unproved, and simple nonnegative-mixed-term gluing
is not a valid approach.
