# Source correspondence and remaining scope

Machine-authored request 5bf6837d0c5b4b818f68c99f57ad498a.
This is a self-review, not the independent audit required for completion.
Completion is null; construction and Agoh stand.

**Pinned target.** MathGKM.Markov.Conjecture63 and its defining file were not
edited. The root still quantifies over all finite Farey paths, both endpoints,
all three principal directions and every polygon-valid consecutive triple.
Its root hash is 8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe;
the canonical contract hash is
6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.

**Coverage.** The auxiliary drift is now universal in all j,s,h with
1<=h<=j. The source theorem is universal in q>=2, both residues and all
columns in its explicitly delimited correction band. The lower-half theorem
covers every path with numerator three on rows 2j+1<=b. The explicit
source paths threePathM9E2, together with b=3q+1 or 3q+2, account for reduced
numerator-three rationals. This does not establish the whole conjecture's
universal rational coverage or any other unproved global bridge. The exact
new residual equivalence retains every unproved numerator-three clause and
all numerator>=4 paths through unchanged OtherFourM9E2.

**Source family.** New conclusions use inherited source_band_of_upperMA45
and source_three_rawM9E2, attached to the actual recurrence/cubic source
polynomials. The q polynomials and conditional kernel distributions are
auxiliary representations. The quarter-drop obstruction is only an
auxiliary counterexample; it is not a source-family refutation. No new
global Laurent/source correspondence is asserted.

**Homogeneity and coefficients.** The source numerator has squared variables
u=x^2,v=y^2,w=z^2 and degree a+b-1. The pinned representation sets w=1;
the omitted exponent is a+b-1-i-j. The new source conclusions use the literal
raw integer coefficient function, with no factorial or binomial normalization.
The kernel/mass scales are auxiliary and canceled only after positive-mass
proofs. Existing source attachments, not a specialization experiment, connect
the inequalities back to those raw coefficients. No new global homogeneity
theorem is claimed.

**Polygon.** InPolygon remains unchanged. The proved horizontal inequalities
hold for every natural starting column in the stated rows, hence in
particular for all polygon-valid horizontal triples there. The source
experiment checks membership at all three positions. It does not establish
universal equality between the published Newton polygon and a formal
support predicate. All global polygon correspondence obligations remain.

**Directions, zeros, endpoints.** This work removes a horizontal region only.
Vertical and constant-i+j diagonal residual clauses are copied verbatim into
ThreeUpperResidualM5BF. Zero source coefficients are retained. The proof
explicitly treats w(0)=1, the exceptional radial rates, and both outside
endpoints of the outward shift. The inherited adjacent-to-ordered argument
retains interval positivity and zero tails. The 0/1 and 1/1 source endpoints
remain part of the unchanged root, and were included in the finite source
experiment. Strictness is asserted only for the auxiliary drift and reverse
gap, not for all source triples.

**Assumptions.** Pinned Lean 4.32.2 and read-only dependencies. Ordinary
proofs, no admissions, custom mathematical axioms or native_decide. All 39
new named theorem closures were audited with only propext, Classical.choice
and Quot.sound. Joint kernel replay isolates the 47 explicit new mathematical
constants before replaying the union over inherited imports. Imported source
dependencies were not freshly rebuilt in this invocation; this limitation
precludes treating the local receipts as a whole-root completion audit.

**Proof scope.** The strongest root statement is the equivalence
root_iff_upper_residualM5BF, not either side by itself. Both
ThreeUpperResidualM5BF and OtherFourM9E2 remain unproved. None of the finite
experiments closes them. Completion therefore remains null, irrespective
of the completed auxiliary conjecture and correction band.

The primary source was revisited through hosted retrieval:
[Evans–Veselov–Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (5), (7)–(11), Definitions 6.1–6.2 and Conjecture 6.3. A further
hosted search for the exact Markov-polynomial/log-concavity phrases returned
the primary paper and related/unrelated results, not a full resolution used
here. No external mathematical assertion was added to Lean as an axiom.
