# Checkpoint 3 — validated linear cutoff; stronger route in progress

The seven main modules jointly passed kernel replay and 45 permitted-axiom
closure audits. See validation.json. The exact root residual is now
Conjecture63 iff ThreeFrontierMCA9 and OtherFourM9E2, both still open.
The new source row cutoff is 6t<=b+16, sharper than the predecessor's proposed
6t<=b+13; the c-dependent strict bound is 6t<=b+3c+4.

Further finite experiments checked 91,676 actual weighted antidiagonals and
309,969 base antidiagonals with the q factor removed, throughout tested
source-sector parameters. All were positive. These are experiments only.

New symbolic work on polynomial weights (r-k)(r-l) produced an exact cleared
beta expectation with 21 factorial moments and a 123-term reduced polynomial.
For a>=2,m>=2,r>=m+1,H>=3a+r+4, shifting all four parameters gives a 176-term
strictly positive coefficient certificate. The a>=1 variant has three negative
coefficients; no claim that this disproves positivity. The residual already
requires i>=1, so a=i+1>=2 is the relevant case.

MarkovTopWeightedBetaMeanMCA9 and MarkovTopLowerGroupsMCA9 are drafts under
validation. The intended conclusion is positivity of groups 2<=m<r in the
entire source-sector domain d+2>=i+r, without the linear cutoff. A first build
hit Lean's expression recursion limit; its source snapshot and diagnostics
are retained. This draft is not yet part of validation.json.

An additional exploratory shortcut using only p=k(m-k) as the base tilt fails
at a=4,r=49,m=98,H=65: its exact signed sum is -1340117822782233600.
This is not an actual Markov coefficient gap; at m=2r the true group has only
the central term. It cannot be a source-family refutation. Record this failed
shortcut before attempting a universal upper-half comparison.
