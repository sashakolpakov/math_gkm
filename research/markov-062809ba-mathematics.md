# Fourth lower diagonals, runs two and three

Machine-authored live research request `062809bac9f44b50b45dfdee483159d5`.
The pinned `MathGKM.Markov.Conjecture63` remains unresolved. The final
`evidence/markov-062809ba/validation.json` determines which statements completed
compilation, replay and axiom inspection; generated source alone is not proof
evidence. The source-connected result reaches slope 3/4. Run-three coefficient
certificates and all its small cycles are checked; its large-cycle source
bridge remains unfinished after bounded matrix-build timeouts.

Final validation accepted 27 mathematical modules and checked all 782 named
theorem axiom closures. Kernel replay ran in two groups: 25 modules over the
inherited boundary, then the last two certificates and the audit module over
that already checked boundary. Only the permitted axioms occur. Ten pending
draft modules are explicitly excluded. Eight rejected build receipts, including
four bounded timeouts, remain available; they are operational evidence only.

For a mixed source path `replicate n true ++ false :: rest`, write
`c=(frame rest).mid.b` and `r=(frame rest).mid.a`. The actual resulting indices
are `a=cn+r`, `b=c(n+1)+r`. The inherited fourth-moment identity identifies
24 times the raw coefficient on `i+j=a+4` with a parameter polynomial.
This run specializes that identity to `n=2`. The planned specialization to
`n=3` has checked coefficient certificates but an unfinished matrix bridge.

For `c>=5`, reducedness separates the predecessor into six strict chambers,
with boundaries `0,1/4,1/3,1/2,2/3,3/4,1`. Exact gauge matrices determine the
four-letter local cumulant. The inherited cyclic averaging theorem then gives
its parameter-only moment in each chamber. The proved first, second and third
moments finish the fourth-polynomial identity. A cast bridge for the truncated
natural pair count is essential; omitting it caused two rejected builds.

The coefficient lists have degree at most 15 for run two and 19 for run three.
For adjacent Farey boundaries `p/q < s/t`, write

    c=q(x+1)+t(y+1), r=p(x+1)+s(y+1).

Every strict integral parameter pair has `x=sc-tr-1 >= 0` and
`y=qr-pc-1 >= 0`. For every adjacent coefficient triple, the difference between
the center square and the neighboring product has an explicitly expanded
polynomial with nonnegative integer coefficients in x,y. Lean checks each
identity with `ring` and the nonnegativity with `positivity`. These are
universal polynomial certificates, not interpolation or a finite source scan.
Coefficients beyond each listed degree are explicitly zero. No division by
coefficients or support filtering occurs.

For `c<=4`, reducedness gives exactly `(c,r)=(2,1),(3,1),(3,2),(4,1),(4,3)`.
The inherited short-word theorem identifies the actual source word with
`0^(c-r)1^r`. Its run substitution determines the actual cut word. Each suffix
cut polynomial is proved in the form `p*A+q*B`, using the literal cut recurrence
and previously checked suffix formulas. The resulting fourth polynomial is
checked at every coefficient triple, including the zero tail. This uses the
source's full short-cycle expression, so no determinant correction is dropped.

The completed run-two source adapters remove the common factor 24 and conclude
the literal integer coefficient inequality. The run-two theorem extends the
previously proved range to `4a<=3b`. This slope inequality forces `n<=2`;
pure-right paths use the inherited Pell diagonal theorem explicitly. Extending
to `5a<=4b` would follow after the unfinished run-three bridge; no theorem of
that extension is claimed here.

The completed `InteriorCore63TwoK062` preserves horizontal and vertical
interior clauses and retains the diagonal clause whenever `a+5<=i+j+2` or
`3b<4a`, with all inherited upper/lower bounds and all three polygon guards.
`root_iff_coreTwoK062` proves its exact equivalence to the unchanged root.
This residual is unproved. `InteriorCore63K062` and `root_iff_coreK062` are
unvalidated draft source files for the future slope-4/5 reduction; they are
excluded from accepted evidence, as are the other pending source bridges.

The finite experiment independently checked 1,058 source/run cases for
`n=2,3`, predecessor denominators 2 through 41, 2,694 literal coefficients
from the original recurrence, and 15,322 polygon-valid triples. No failure
occurred. These checks are not universal proofs. Exact inputs, small-cycle
coefficient lists and certificate-input hash are in `experiments.json`.

Initial direct gauge builds timed out. The run-three matrix proof was then
staged through exact lower-block recurrences. A missing `map_ofNat` rewrite
caused a rejected staged build. Small-cycle proofs initially rejected a tactic
after its goal was already solved and a missing `j!=0` tail fact; both were
repaired. Failed source snapshots and receipts are retained. The staged
lower-block expansion compiled, but the subsequent full run-three gauge
expansion still exceeded 300 seconds. The coefficient-cached run-three local
proof has not been built. `pending-modules.json` lists all excluded drafts.

No historical novelty is claimed. Inherited compiled dependencies are reused;
this run is not a fresh rebuild of the full dependency source closure and is
not an independent English/source completion audit.
