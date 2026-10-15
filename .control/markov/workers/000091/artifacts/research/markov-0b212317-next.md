# Revisable next actions

The full root remains open. Read final validation.json for admitted modules.

The compact zero-Z numerator and source coefficient shape are now proved for
j<n. `source_fourth_initial_lcK0B` proves the fourth-slice triple for 5≤j and
j+2<n, with predecessor denominator at least five. This is an unbounded
initial interval, not the complete fourth slice or a new complete slope range.

To extend it, the generic square-zero moment and x²-divisibility bridges are
proved in MarkovFourthSqZeroK0B and MarkovFourthDivBaseK0B. The attempted
combination with the Z factor in MarkovFourthShiftK0B timed out. Avoid claiming
the stronger X^(n+2) support bound without finishing this bridge.

The five small-index polynomial gap certificates have exact Python evidence.
The MarkovFourthBoundaryK0B draft failed primarily at unfolding absent low
coefficient definitions; use simp only rather than unfold, and explicitly
evaluate Nat.choose. It is excluded, as are dependent MarkovFourthSourceK0B
and any other unadmitted draft. The accepted large-index gap proof uses
MarkovFourthGapFactK0B and MarkovFourthGapStrongK0B; the older combined
MarkovFourthGapK0B timed out and is excluded. Explicit add_nonneg/mul_nonneg
assembly avoids the expensive full positivity call.

Beyond this interval, shifted blocks, small predecessor cycles, higher
diagonals, and horizontal/vertical interiors remain. Reconsider representations
freely. Source coverage, source family, homogeneity/raw coefficients, polygon,
directions/zeros/endpoints, assumptions and full proof scope all require a
separate hash-bound completion audit before any root claim.
