# Revisable next actions

The pinned full Conjecture63 remains open. Read the extraction report and
validation.json before reusing this run's results.

Both MasterKernelExtractionM13E and CorrectionKernelExtractionM13E now have
closed Lean proofs. The global actual-source formula for i>=3 is
source_two_kernelMED6; the low columns remain actual source coefficients.

The exact root residual is now ThreeCorrectionSupportMED6 and OtherFourM9E2.
The first retains small-column diagonals and the correction-support triangle;
the second retains every numerator>=4 path. Either is a legitimate next target.

One promising but unproved sufficient condition is signedAbsorptionMED6 for
the two explicit kernels. Both source excess directions now have closed
log-concavity proofs, so source_vertical_of_absorptionMED6 and
source_diagonal_of_absorptionMED6 can use such a bound directly. The q<=65
scan passed 441,756 valid triples for this stronger condition. This is not a
universal argument. The unsigned version is formally false vertically at 3/20.

The base parameter-diagonal case i=3 (t=0) is another possible target. A finite
j,k<80 probe passed 6,400 comparisons, while the available uniform base proof
requires i>=4. An inherited auxiliary minor obstruction prevents blindly
extending its present proof. No theorem for that missing case is claimed here.

Preserve negative mixed contributions, zero guards and all crossing triples.
Completion still requires exact-root closure, all correspondence bridges, fresh
whole-source validation and a separate independent hash-bound source audit.
