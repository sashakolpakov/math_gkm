# Local source correspondence and scope

Machine-authored request 9c28b628c1484db6806fcccfa00538d5. This is a local
scope argument, NOT the independent hash-bound audit required for completion.
Actual source hashes, builds, replay and axiom results are in
evidence/markov-9c28b628/validation.json and manifest.json.

The protected root is MathGKM.Markov.Conjecture63 in MathGKM/Markov.lean,
SHA256 8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
The goal contract and root are unchanged. MISSION.md and docs/DESIGN.md were
read completely, together with the inherited index and all three required
independent Markov audits. The publisher page was retrieved using hosted web:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html.

Coverage: the new unconditional vertical result is universal in q>=1, both
residues, and every natural row j. path_four_verticalM9C28 applies to every
actual path with middle numerator three. No finite q bound appears in these
theorems. The suppression theorem is universal in i>=3 and all source rows.
General rational coverage is inherited, not freshly rebuilt. Every numerator
at least four remains in OtherFourM9E2.

Source family: all new mass identities start from source_two_kernelMED6 for
threeRawM9E2. These are the actual recurrence coefficients through the inherited
three_raw_formulaM9E2 and source_three_rawM9E2 bridges. The short sums do not
replace the source family by arbitrary positive polynomials. The new exact
high-diagonal equivalence explicitly proves that its chambers exhaust the
remaining rows; crossing rows and zeros are not inferred from samples.
The global Laurent/source bridge remains inherited.

Homogeneity and coefficients: all inequalities concern raw integer coefficients
in the squared-variable numerator at w=1. Integer, rational and real casts in
the evaluator and sum proofs are exact. Binomial expressions are exact formulas,
not factorial normalization. The source's homogeneous degree and recovery of
the omitted coordinate remain inherited correspondence obligations; no new
normalization or claim of fresh global homogeneity verification is made here.

Polygon: the new vertical theorem holds for all j and thus for every
polygon-valid triple (4,j),(4,j+1),(4,j+2). The root's InPolygon is unchanged.
The global Newton-polygon bridge is inherited. The recurrence experiments count
polygon membership separately and do not supply that bridge as a proof.

Directions, zeros and endpoints: the new closed raw region is vertical column
four for numerator three. Its proof covers two interior chambers, two entry
rows, two exit rows, and the case in which only the center has a correction.
The base theorem handles lower rows and regions wholly above correction support.
All zero tails remain in the theorem. The diagonal chamber identities are
universal but their general LC remains open. The suppression theorem is a
comparison of the full correction and base, not an assertion that addition
preserves LC. BaseCurvatureM9C28 is explicitly open. Its conditional theorem
preserves the constant-i+j direction, including degree tails. Both endpoints
and all other directions are retained by the exact root equivalence.

Assumptions: mathematical sources use ordinary Lean proofs, exact polynomial
identities, and ordinary kernel reduction for finite coefficient certificates.
No sorry, admit, custom axiom or native_decide is used. The operational replay
checker is unsafe Lean IO, separately from the mathematical declarations.
The selected module union is replayed over inherited imports, with the run's
mathematical names required absent from the imported environment. Compiled
inherited dependencies are reused. This is not a fresh whole-source rebuild.

Proof scope: root_iff_remainingM9C28 proves

    Conjecture63 <-> ThreeRemainingM9C28 and OtherFourM9E2.

Both residuals remain OPEN. The first retains vertical columns >=5 in the
unresolved support and all still-open small and higher diagonal starts. The
conditional curvature route would close diagonal starts >=3 if its stronger
base inequality were proved. It does not close the other residuals. No closed
theorem of the pinned root or its exact negation, and no independent completion
audit, is supplied. Completion is null.
