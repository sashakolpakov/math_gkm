# Source and English scope: 99a0f3b8

Machine-authored scope analysis, not the separate independent completion audit.
Root MathGKM.Markov.Conjecture63 and MathGKM/Markov.lean remain unchanged,
SHA256 8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
Canonical contract SHA256:
6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.

Primary source: [Evans–Veselov–Winn, published article](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (5), (7)–(11), Definitions 6.1–6.2 and Conjecture 6.3. Hosted retrieval
succeeded. The independent target-definition, residual-scope and mathematical
audits were read completely; none is treated as a proof of the root.

Coverage: every new source theorem quantifies over unbounded q>=1 and the two
residues b=3q+1 and b=3q+2. source_middle_pathM99A uses the inherited exact
source_three_rawM9E2 to attach to every path with middle numerator three.
The first new middle row is fully covered, including small q. The wider region
has the stated inequalities in q,k,c. This is neither universal rational
coverage of the root nor closure of all numerator-three cases. The exact root
equivalence retains all other sources, rows and directions explicitly.

Source family: middleCorrectionM99A is derived from source_rows_equationMB3E,
which itself is a proved identity of the unchanged threePolyM9E2. The forcing
gainRowsMC3E term is retained below the upper sector. The source formula is a
proved identity, not a new premise about an arbitrary coefficient sequence.
The actual path/cubic/raw bridges are inherited and explicitly used. No
auxiliary negative group is asserted to be a source-family counterexample.

Homogeneity and coefficients: final raw conclusions are integer (P.coeff i).coeff j
with u=x^2, v=y^2 and w=1, interpreting the omitted exponent as a+b-1-i-j.
No factorial, binomial or mass normalization remains in these conclusions.
Auxiliary real sixth moments are transported through exact group and positive
scale identities. The source row identity uses the coefficient swap bridge
raw_row_coeffMC3E. A newly independent universal homogeneity/source identification
for the entire root is not claimed by this invocation.

Polygon: source_middle_wide_polygonM99A proves all three literal InPolygon
memberships for c,c+1,c+2 and j=b+2-(q+3+k). It requires c+2<=q+3+k and the
stated widened-region conditions. source_middle_first_polygonM99A includes
columns starting at two in the first row, including small denominators.
General row inequalities also retain exterior zeros. These are local polygon
bridges; a whole-source Newton-polygon correspondence audit remains separate.

Directions, zeros and endpoints: only horizontal inequalities are newly
closed. ThreeAfterMiddleM99A keeps the predecessor vertical and constant-i+j
diagonal clauses verbatim. OtherFourM9E2 is unchanged. The original endpoint
clauses at 0/1 and 1/1 remain in Conjecture63. No coefficients or zero masses
were removed. First-row axes are checked zero, the universal zero tail is
proved, and finite exceptional cases use ordinary kernel reduction.

Assumptions: pinned Lean 4.32.2 and read-only pinned Mathlib. No added
mathematical axioms, admissions or native evaluator. All 22 selected modules
passed local compilation and joint isolated kernel replay; 68 explicit theorem
closures used only propext, Classical.choice and Quot.sound. Exact receipts and
hashes are in validation.json. Inherited compiled imports were reused; this
is not a fresh whole-source rebuild or independent hash-bound English audit.

Proof scope: the universal statements are exactly their Lean hypotheses and
conclusions. Finite scans, polynomial-generation scripts and capability outcomes
are not proof premises. Conjecture63 iff ThreeAfterMiddleM99A and OtherFourM9E2
is an exact reduction, not closure. Both residuals remain unproved. Completion
must be null until the full root or its exact negation and every independent
correspondence obligation have been discharged.
