# Research checkpoint

Machine-authored request ed6bdbeb853b47bca338e8b2e6f2cdcd. Start 2026-10-17 19:33:19 UTC.
Required mission, design, contract and independent audits read. Previous completed worker reconciled.
Action: extract correction coefficients through rescaling by v and the inherited transposition. Full root remains open.

19:40 UTC checkpoint: MarkovCorrectionGeoMED6, MarkovCorrectionSumMED6 and
MarkovCorrectionExtractionMED6 compile. The last proves the exact inherited
CorrectionKernelExtractionM13E proposition, with guards and zero tails. Kernel
replay and axiom audit are still pending; successful compilation is recorded
separately. Source attachment module is under validation.

The exact finite experiment completed 104,532 correction comparisons (95,977
zeros), 99,795 source comparisons (9,000 zeros), and 264,105 valid raw triples
in the three directions without failure. It also found 6,369 negative vertical
mixed contributions and 8,555 negative diagonal mixed contributions. These
are finite computations only; separate summand LC still does not prove the sum.
Evidence: evidence/markov-ed6bdbeb/correction-experiment.json.

19:45 UTC checkpoint: the correction-column module and all four new extraction/
source modules jointly passed isolated kernel replay in 10.63 seconds, reusing
inherited imports. This resolves the predecessor's deferred local replay, not
the whole-source completion obligation. Scalar and prefix/order lemmas for the
affine correction's simultaneous parameter variation also compile. Its complete
diagonal shape is the next validation target. No full-source LC region is claimed.

The total-gap probe checked 220,878 vertical and 220,878 diagonal triples with
q<=65 and columns starting at least three. Base-gap plus the signed mixed term
was nonnegative throughout. Dropping the positive mixed term is already false
vertically at q=6, false residue, i=3,j=8 (gap -74150). The base absorbed even
the unsigned losses in the diagonal scan. These are conjectural leads only:
evidence/markov-ed6bdbeb/total-gap-probe.json.

19:53 UTC checkpoint: all 17 selected modules jointly kernel-replayed, and all
66 named theorem closures passed the permitted-axiom audit. The complete
correction diagonal shape, larger actual-source region, path transport and exact
root_iff_correction_supportMED6 reduction are now in the selected bundle. The
unchanged correction-column source was rebuilt in this run. Both residuals
remain open. Finite evidence is not a universal signed-gap proof.
