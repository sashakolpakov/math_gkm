# Revisable research advice

Machine-authored 4f4ac079ee56466da7d21ce9055918ab. Exact root remains open.

The common kernel in MarkovTwoKernelM4F4 is now connected to all actual
numerator-two sources in columns i>=3, including upper/lower crossing rows
and zero tails. See markov-4f4ac079-prefix-derivation.md for the proposed
uniform vertical proof using convolution and 2x2 minors. The remaining
formal obligation is KernelShapeM4F4: row LC, column LC and TP2 of this
specific kernel. These premises are not yet Lean theorems.

Useful existing components: MarkovWindowLC6d34 proves CrossLC for truncated
negative-binomial polynomials, its preservation by product/convolution and
reversal; MarkovConvolutionFe01 proves the finite determinant-sum identity.
Finite truncations must agree exactly at every used index. Zeros and support
cannot be skipped. MarkovKernelShapeM4F4 proves the scalar gluing and the
conditional root implication, keeping OtherVerticalCoreM0D3 explicit.

The older uniform Newton route remains available. MarkovGapDegreeM4F4 proves
that its exact sign premise at each fixed i needs only r<=4i,s<=2i for the
two interior gaps and r<=4i,s=0 for the two crossing gaps. Every difference
outside these bounds is formally zero. This finite-per-column criterion is
still universally quantified in i and still only sufficient for source LC.

Preserve all clauses of MarkovResidualM295; no new inequality was proved that
justifies deleting a clause. The common-kernel antidiagonal is the source
vertical direction. It does not itself cover the source diagonal direction.
Every source-correspondence obligation still applies to any completion claim.
