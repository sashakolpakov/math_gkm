# Revisable next actions

The full pinned Conjecture63 remains unresolved. Read the source-bound inventory
in `evidence/markov-96dea62b/validation.json` before using new modules.

The four early shifted offsets are now connected to raw source coefficients:
`source_fourth_onsetM96` covers n>=4,c>=5,k=1,2,3,4, with arbitrary actual
predecessor numerator. `source_fourth_prefixM96` gives a contiguous prefix through
j=n+4 for all predecessors c>=5, and through j=2n when the predecessor numerator
is at most three. The exact remaining predicate is `InteriorCore63OnsetM96`.

The general first-block region 5<=k<=n, r>=4 remains open. The inherited
`source_fourth_block_shape_extendedCC` is already its exact source bridge.
The present column-wise assembly avoids a real elaboration bottleneck: prove
value coefficient identities, prove scalar gap coefficients, assemble by one
variable at a time. Do not rerun the abandoned direct bivariate assemblies with
unchanged limits. In this invocation their large expressions timed out even
though every scalar identity passed. The two-stage column assembly passed.
The older general-block value substitutions may likewise benefit from separating
the c,r substitutions from n,k substitutions and proving each coefficient identity
before recombining. That extension is advice, not a completed proof.

For higher shifts, `second-shift-probe.json` shows why the current formula cannot
simply be continued. The saved numerator's Z^2 component changes across r/c=1/2,
starting at X^3, whereas Z^0 and Z^1 are chamber-independent. The Z^3 and Z^4
components change across further rational thresholds. Recover these terms from
the exact `fourthNumeratorBC` identity and actual source pattern counts before
claiming an extended shape. This probe is symbolic experimental evidence only.

`source_fourth_polygon_boundM96` proves the uniform bound j<=4n+5 for any valid
fourth-slice triple in a run source, without a c>=5 assumption. It can bound the
remaining shift blocks, while retaining their endpoints and zeros. Small cycles
c=2,3,4 still need their exact coefficient corrections. Higher diagonals and
horizontal/vertical interiors remain independent unproved parts of the root.

All 18 algebra-module kernel replays left unfinished by worker 94 passed in this
invocation. No inherited validation write or setup was replayed. The original
abandoned sources remain available; `MarkovOnsetLChecked4M96` did compile, but it
is excluded because it duplicates the accepted `MarkovOnsetLFinal4M96` theorem.
Do not import both declarations or blindly rerun generators over existing files.

Any root closure still requires universal rational coverage and all source-family,
homogeneity/raw-coefficient, polygon, direction/zero/endpoint, assumption and
scope bridges, a fresh source rebuild, and an independent hash-bound English/source
audit. Current local validation is not that completion audit.
