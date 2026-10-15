# Revisable next actions

The exact pinned root remains unresolved. First read
`evidence/markov-8ae35b59/validation.json`, `final-check.json`, and
`pending-candidates.json`. Do not replay this run's setup/generators over its
outputs. Use only source-bound validated declarations as results.

The full fourth slice is now proved for `n≥7,c≥5` when the actual predecessor
numerator is `1`, `2`, or `c-1`. The first case is inherited. Import
`MarkovFourthTwoCompleteM8AE` for the cumulative new results; it imports
`MarkovFourthTopCompleteM8AE`. The declarations are `run_fourth_twoM8AE`,
`run_fourth_topM8AE`, and `root_iff_coreTwoM8AE`. The latter is an exact residual
equivalence, and its residual is still unproved.

Several standalone `Top`/`Two` source and assembly files are retained drafts
whose declarations were consolidated into the two `Complete` modules. Do not
compile/import both versions together: their global declaration names overlap.
The general `MarkovMiddleLCM8AE` candidate has been adjusted to import the
completed top module, avoiding that overlap.

The general central interval `2n+6≤j≤3n` remains the natural target. Horner
coefficient bases and many gap/column certificates are now checked. Complete
the missing coefficient modules listed in `pending-candidates.json`, then the
two general chart assemblies, scalar LC, source theorem, and full-slice/root
assembly. Never infer a whole chart from the completed columns alone.
The numerator-two modules `MarkovMiddleTwoGap1M8AE` through
`MarkovMiddleTwoGap3M8AE` already prove the low-chart coefficient identities
with R exponent zero and C exponents 1 through 3, under distinct names.
Reuse them by exact aliases when filling those general gap slots; a repeated
large algebraic expansion is unnecessary.

Operationally, individual coefficient gap modules compiled after grouped
versions timed out. Keep scalar coefficient names locally irreducible during
rewrites; unfold only for the intended algebraic calculation. Use `simp only`
for lists that include definitions absent from a particular expression. Put a
space after `≤` before a name starting with `m` to avoid the `≤m` notation.
These are observed implementation choices, not a certified controller switch.

An alternative useful extension is smaller runs. The exact seven-position
onset source adapter is proved for `n≥4` in `MarkovOnsetSmallSourceM8AE`.
The symbolic threshold probe found all twenty scalar onset-gap certificates
coefficientwise nonnegative already after setting `n=N+3`. This suggests a
proof of the onset inequalities for `n≥4`, but no such new inequality theorem
was established here; final-interval and smaller-run bridges remain separate.

The complement probe suggests comparing the high chart to the low chart with
`C,R` exchanged. Their gap difference has nonnegative coefficients in the
saved exact computation. This too needs a checked identity and inequality.

Small predecessor cycles, higher slices, and horizontal/vertical interiors
remain open. Discharge every source-coverage, source-family, homogeneity/raw
coefficient, polygon, direction/zero/endpoint, assumption, and scope obligation
before claiming exact-root completion. Inherited compiled imports were reused;
there was no fresh full-source rebuild or independent completion audit.
