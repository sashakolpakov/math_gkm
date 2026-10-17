# Source correspondence and scope

Machine-authored local analysis for request 41b38611ad354bc493dae65a2634a3d2.
This is not the separate independent hash-bound completion audit.
Root SHA256: 8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
Canonical contract SHA256: 6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.

Coverage: the new source theorem covers all natural x,k and both residues in
the admissible numerator-three middle strip, for all starting columns at least
30. There is no denominator or depth bound. The path theorem uses the inherited
numerator-three classification. The final root equivalence retains all other
paths and endpoints. No full rational-coverage theorem is inferred from a
restricted-family result or a finite experiment.

Source family: source_middle_integerMD02 and source_three_rawM9E2 are the
formal inherited bridges used. The new proof uses exact binomial sums for
those actual coefficients. The actual moment weights are attached by a proved
weighted antitone comparison, with the endpoint weight included. No external
mathematical assertion is introduced as an assumption or new Lean axiom.

Homogeneity and coefficients: final source inequalities concern the literal
integer coeff values of the pinned squared-variable numerator recurrence.
Positive powers of three, positive polynomial factors and real casts occur
only in auxiliary comparisons and are removed before returning the raw gap.
No factorial or multinomial normalization replaces the target. Whole-family
homogeneity and source identification remain completion-audit obligations.

Polygon: source_middle_largeM41B explicitly proves membership of all three
positions in its supported region. The all-high-column theorem also covers
the last supported triple and all exterior zero tails as a raw inequality.
Consequently it applies to every polygon-valid horizontal triple in that
region; exterior indices are not falsely described as polygon points. The
global equality between the defined polygon and the source Newton polygon
is not established by these local lemmas.

Directions, zeros, endpoints: the new log-concavity result is horizontal.
Vertical and constant-i+j clauses remain in ThreeOutsideMiddleMD02 and the
other-family residual. All raw zeros are retained. The last supported triple
uses an inherited exact strict inequality; the full statement is non-strict.
The 0/1 and 1/1 endpoints remain in the exact pinned root and final equivalence.

Assumptions: pinned Lean 4.32.2 and read-only pinned Mathlib. Local compilation,
joint isolated kernel replay and explicit theorem-axiom checks are recorded
in validation.json. Only propext, Classical.choice and Quot.sound are allowed.
Inherited compiled imports are reused. No fresh whole-source rebuild or
independent hash-bound completion audit was performed.

Proof scope: root_iff_finite_middle_columnsM41B is an exact residual equivalence,
not a proof of its conjuncts. MiddleFiniteColumnsM41B still has unbounded x,k
and both residues, despite its finite column range. ThreeOutsideMiddleMD02 and
OtherFourM9E2 remain open. Neither the root nor its negation is obtained.
completion is null.
