# Revisable next actions

The exact pinned root remains open. Read `evidence/markov-8067e0c5/validation.json`
before relying on this invocation's modules.

The general first shifted block is now proved for the actual source:
`source_fourth_blockM806` covers c>=5 and 5<=k<=n at j=n+k, without r<=3.
`source_fourth_prefixM806` covers every j<=2n for c>=5,n>=4.
The exact remaining predicate is `InteriorCore63M806`.

The useful compilation change was to separate parameter substitutions, then
assemble gaps by columns. `MarkovBlockStageM806` first substitutes c=R+C+5,
r=R+4 while leaving N,K free. Scalar identities substitute N=J+E+5 and
K=J+5+i separately. The inherited general value/chart drafts are still not
accepted; import the new M806 modules instead. Thirty inherited split gap
modules were compiled under their unchanged original names, and checked in
this invocation. No earlier setup/finalizer needs replaying.

## Prospective entire fourth slice for c>=5

This is a research route backed by exact polynomial experiments, not a theorem.
All candidate gaps in the following files have nonnegative coefficients after
the indicated parameter substitutions:

| Range of starting j | Candidate evidence |
| --- | --- |
| 2n+k, 6<=k<=n | `second-block-probe.json` |
| 3n+k, 7<=k<=n | `third-block-probe.json` |
| 2n+k, 1<=k<=5, n>=7 | `remaining-probe.json`, block 2 |
| 3n+k, 1<=k<=6, n>=7 | `remaining-probe.json`, block 3 |
| 4n+k, 0<=k<=5, n>=7 | `tail-probe.json` |
| 2n<j<=4n+5, n=4,5,6 | `remaining-probe.json`, small runs |

Together with the proved prefix, these ranges cover all polygon-valid starting
positions for n>=4, c>=5, using the inherited bound j<=4n+5. Runs 0,1,2,3
already have their inherited source results. This range coverage does NOT turn
the candidate identities and certificates into a Lean proof.

The saved full numerators are in
`evidence/markov-6604cff8/fourth-rational-normalization.json`. The two second-block
shapes and six third-block shapes here are exact falling-factorial convolutions
of their Z^2 and Z^3 components. Their valid lower offsets are respectively
k>=6 and k>=7; do not apply them at smaller indices. The onset and tail probes
use truncated binomial convolutions instead. All coefficient formulas concern
the same uniform scaling 7560, not new position-dependent weights.

The third-block values depend only on E=n-k, c,r. The tail values at j=4n+k
are independent of n for n>=7. These exact symbolic cancellations suggest
that a stable-tail representation may simplify the source bridge. This
observation is experimental until the identities are checked in Lean.

The central missing bridge is the identification of the six full candidate
numerators with `fourthNumeratorBC` under the actual natural pattern counts.
Its universal normalized-source identity and binomial extraction are already
proved in `MarkovFourthBinomialBC`. The Z^0 and Z^1 pieces have also already
been identified by earlier workers. For the remaining pieces, a staged
coefficient decomposition of local moments is a plausible alternative to
expanding a giant whole-expression ring goal. The six chamber boundaries can
be excluded by inherited `reduced_chamber_boundary897`; the integer chart
inversions are already exemplified in `MarkovFourthThreeSourceN6604`.

Once the chamber/source identities exist, the nonnegative coefficient
certificates still require ordinary Lean proofs, followed by coefficient,
scaling, polygon and endpoint transport. The finite checks in
`experiments.json`, `second-block-checks.json`, `third-block-checks.json`,
`tail-probe.json`, and `full-fourth-checks.json` are not substitutes.

Small predecessor cycles c=2,3,4 remain separate. Higher diagonals and both
horizontal/vertical interiors remain unproved root obligations regardless of
progress on the fourth slice. Full closure still requires every source/English
correspondence obligation, a fresh source rebuild, kernel/axiom checks, and a
separate independent hash-bound audit.
