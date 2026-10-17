# Global master kernel extraction

Machine-authored request 3ae33435683c485a82b2dbaec31788a5.

The theorem master_kernel_extractionM3AE proves the inherited proposition
MasterKernelExtractionM13E. Thus the master half of the previously paper-level
two-kernel extraction is now a Lean theorem. It is not a proof of the full sum's
log-concavity or of the correction-kernel extraction.

For every n,t,j>=0, write k=n-t-1-j. The actual coefficient of u^(t+3)v^j
in the nth master-series coefficient is zero when n<t+1+j. Otherwise it is

    sum_{s=0}^{min(j,k)} w(s) binom(j-s+t+3,t+3) binom(k-s+t,t),
    w(0)=1, w(s)=4s for s>0.

The Lean statement uses lowerDiagMF88, whose inherited zero-extended sequence
definition is equivalent to that finite sum. No negative coordinate is converted
to a natural number before its guard is tested.

## Proof organization

MarkovSeriesTransposeM3AE constructs a ring homomorphism from power series of
polynomials to iterated power series. Its coefficient law interchanges the two
extractions exactly. Multiplicativity is finite Cauchy-sum commutation.

MarkovColumnSolveM3AE solves a linear denominator in the transposed variable,
using explicitly proved multiplicative inverses. MarkovMasterColumnM3AE applies
it to the source-attached master rational function and proves the column series

    z^(t+1) (1+v z^2)^2/(1-v z^2)^2
      * (1-vz)^(-(t+4)) * (1-z)^(-(t+1)).

All quotients here mean formal power series with constant-one denominators.
The Lean expression uses geometric series and their proved inverse identities.
There is no analytic convergence or imported coefficient formula assumption.

MarkovTransposeGeoM3AE transposes the geometric factors again.
MarkovRampGeoM3AE proves the exact weight extraction, over any commutative ring.
MarkovMasterSumM3AE extracts the remaining finite convolution and proves

    sum_{s=0}^j w(s) nb_(t+3)(j-s) nb_t(n-(t+1+j+s)),

where nb is the inherited negative-binomial sequence extended by zero on negative
integer arguments. Integer-to-real casts are performed after coefficient extraction.
MarkovMasterExtractionM3AE identifies this with lowerDiagMF88 by extending its
finite sum through zero terms, handles the unsupported degree case, and proves
the exact inherited MasterKernelExtractionM13E proposition.

MarkovMasterSourceM3AE attaches this extraction to every numerator-three source
and provides an actual path wrapper. The source coefficient is now unconditionally
identified with the extracted base plus the entire rational correction coefficient.
Only CorrectionKernelExtractionM13E is needed for the remaining conditional
two-kernel formula; the master extraction is no longer a premise.

MarkovCorrectionColumnM3AE additionally proves the exact correction-column
series for both residues and every column at least three. Its expression is a
product of explicit numerator, geometric inverse factors and a column power.
This completes the first (u) extraction of the correction; the remaining
two coefficient indices have not yet been identified with the guarded affine
kernel. The module compiled, but its enlarged replay timed out; it is outside the selected eight-module validation bundle.

The full root still has ThreeRationalTriangleM13E and OtherFourM9E2 open. No new
raw-LC region follows merely from this representation result. Negative mixed
contributions and boundary crossings must remain in any future gap proof.
