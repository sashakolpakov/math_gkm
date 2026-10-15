# Mathematical results, request 2532cf40

Machine-authored live experimental research. The pinned full conjecture remains
unresolved. Consult `evidence/markov-2532cf40/validation.json` for the source-bound
build, kernel replay and axiom receipts for each declaration below. Unvalidated
candidate files must not be treated as results.

Write `c=(frame rest).mid.b`, `r=(frame rest).mid.a`, and
`path=List.replicate n true ++ false :: rest`. Let `a=(frame path).mid.a`.
The fourth lower slice has total squared-variable degree `a+4`.

## Five onset inequalities

The inherited exact source adapter gives all seven raw coefficients at
`j=2*n+k`, `1≤k≤7`, with common scale 120960. Its correction for `k≤5`
is retained. This worker proves the five adjacent inequalities using four
parameter charts. Every coordinate in the following table is an integer.

| Case | Nonnegative coordinates | Reconstructed `(n,c,r,q)` |
| --- | --- | --- |
| `2r<c`, `r≥2` | `N=n−7`, `C=c−2r−1`, `R=r−2` | `(N+7,2R+C+5,R+2,0)` |
| `r=1` | `N=n−7`, `C=c−5` | `(N+7,C+5,1,0)` |
| `2r>c`, `c−r≥2` | `N=n−7`, `C=c−r−2`, `R=2r−c−1` | `(N+7,2C+R+5,C+R+3,R+1)` |
| `c−r=1` | `N=n−7`, `R=c−5` | `(N+7,R+5,R+4,R+3)` |

Here `q=(2*r-c:ℕ)` is the actual truncated pattern count. The scalar adapter
proves its correct low/high interpretation. Reduced-label coprimality and
`c≥5` exclude `2r=c`; the four cases exhaust actual predecessors in scope.

For each chart, seven polynomial value identities are checked with ordinary
Lean algebra. For each of the five starts, the gap `V(k+1)^2−V(k)V(k+2)`
has a nonnegative-coefficient certificate. The two extreme charts have 117
terms per gap. Each general-chart gap has 585 terms, assembled by univariate
coefficient convolution in `N`, then by columns in `R`, then in `C`.
The term counts describe the certificates only; they are not objectives.

`source_fourth_onsetM253` is the all-predecessor conclusion:
for every `n≥7`, every actual predecessor with `c≥5`, and all natural `i,j`
satisfying `2n<j≤2n+5` and `i+j+2=a+4`,

    coeff P i (j+2) * coeff P (i+2) j ≤ coeff P (i+1) (j+1)^2.

It cancels the same scale 120960 from all three literal source coefficients.
No coefficient positivity or nonzero hypothesis is required. Its validation
status, rather than the generated source alone, determines acceptance.

## Completed numerator-one fourth slice and exact residuals

`run_fourth_oneM253` proves `RunFourthLCM94 n rest` for every `n≥7`, `c≥5`,
and `r=1`. It combines the five new onset inequalities with the inherited
prefix, central numerator-one result, and final interval. This covers every
polygon-valid triple in the entire fourth slice for this infinite subfamily.

`root_iff_core_full_oneM253` gives an exact equivalence of the original root
with `InteriorCore63FullOneM253`. The new residual removes the completed
numerator-one fourth slice and retains all other obligations.

The all-predecessor assembly additionally provides
`run_fourth_iff_centralM253`: under `n≥7,c≥5`, the full fourth-slice obligation
is equivalent to its polygon-valid starts `2n+6≤j≤3n`. This central interval
remains unproved for general predecessors. `root_iff_coreM253` removes the
all-predecessor onset region as well as the completed numerator-one slice,
while retaining the original axial predicates, all other diagonal regions,
and the endpoint obligations through the imported exact root equivalence.
Neither residual proposition is claimed to hold universally.

## Experiments and rejected layouts

The new finite experiment covers 536 `(n,c,r)` cases, with `n` in
`{7,8,12,25}`, `5≤c≤21`, and reduced `0<r<c`. It checked 3752 value identities,
2680 polygon-valid onset inequalities and 42 literal recurrence coefficients.
All passed; there were no zero values in these seven-position samples. The
formal source inequalities nevertheless retain zeros. Counts and exact inputs
are in `evidence/markov-2532cf40/experiments.json`. These are experiments.

The first value build left inherited definitions folded and failed. Two
general definition builds timed out before Horner rewriting. A direct general
gap build and two coefficient-wise builds timed out; assembling one variable
at a time succeeded. Several scalar-adapter drafts failed on casts or match
elimination before the corrected proof compiled. Every failed source snapshot
and compiler receipt is retained. Timeouts do not refute an identity.

No fresh full dependency rebuild or independent source/English completion
audit was performed. The seven correspondence obligations and remaining
mathematical scope are detailed in `markov-2532cf40-correspondence.md`.
