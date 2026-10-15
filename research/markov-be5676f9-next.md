# Revisable research advice

Machine-authored be5676f9. Full pinned Conjecture63 remains open.

The fourth lower slice now has a parameter-only source formula for every
mixed path, every run length, and every short cycle:
`fourthParamPolyBE n c r` and `source_fourth_parameter_rawBE` in
`MarkovFourthAllCyclesBE.lean`. This removes the unproved fourth-moment
premise from future high-slope work. The n=0 and n=1 inequalities are proved.

The exact symbolic data in `evidence/markov-be5676f9/experiments.json` includes
all six chambers for n=2 and n=3, with nonnegative polynomial expansions of
every adjacent coefficient gap in Farey-cone coordinates. The n=2 maximum
polynomial degree is 15; the n=3 maximum is 19. These are experimental
certificates, not Lean proofs. A next worker could specialize the newly
proved local-statistic formula using the actual gauged matrices, then verify
these identities and inequalities in Lean. Existing `MarkovSmallPoly2FD`
and `MarkovSmallPoly3FD` may help with the first three moments. Short cycles
must use `fourthParamTraceBE`, not the c≥5 moment without correction.

For n≥4, the arbitrary-run moment theorem is already available. A general
coefficient analysis could use the inherited run jet recurrences and the new
four-letter contraction. The fourth diagonal requires the fourth d-entry
jet as well as third b/c jets, so existing cubic jet formulas alone do not
complete this route.

The exact residual is `InteriorCore63BE`, equivalent to the pinned root.
Horizontal/vertical interior triples and all higher remaining diagonals are
still unproved. Continuing a fourth-slice strategy is optional; these other
directions may provide a more general approach. No source/English bridge
may be silently assumed for an eventual root claim.
