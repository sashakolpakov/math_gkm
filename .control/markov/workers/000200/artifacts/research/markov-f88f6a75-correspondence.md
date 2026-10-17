# Partial source correspondence and scope

Request f88f6a75cab54deb828cd05d7806b3e4. This is a machine-authored partial
research report, not an independent source/English audit and not a completion
submission. The pinned root and its exact negation remain unresolved.

The root is MathGKM.Markov.Conjecture63 in MathGKM/Markov.lean, SHA256
8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
The canonical contract hash is
6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.
The final bindings receipt checks these against the unchanged files.

The mathematical source is Evans–Veselov–Winn, equations (5), (7)–(11),
Definitions 6.1–6.2 and Conjecture 6.3:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
The independent target-definition, residual-scope and mathematical-review
reports under evidence/independent-markov were read. Their restrictions are
retained; particularly adjacent log-concavity with arbitrary zeros is not
silently substituted for CrossLC.

## Coverage and source family

The unchanged root is universal over paths, with the separate 0/1 endpoint.
The inherited coverage/source correspondence bridges and exact root reductions
are reused, not independently rebuilt here. source_three_rawM9E2 maps every
path with numerator three to q>=1 and b=3q+1 or b=3q+2. The new horizontal
theorem covers every such q, both residues and all natural column and row
indices. The new lower vertical theorem covers all columns when j+2<=q.
No denominator or path bound enters either statement.

OtherFourM9E2 remains an explicit universal residual. The exact iff reduction
does not claim that the numerator-three family exhausts the published family.
Construction and Agoh were not changed.

## Homogeneity and coefficients

The source numerator uses squared variables. threeRawM9E2 is the actual
integer coefficient function of the inherited bivariate numerator after the
homogeneous third variable is set to one. The fixed homogeneous degree makes
this coefficient identification unambiguous in the inherited bridge. No
binomial or degree-dependent normalization of the target coefficients occurs.
The polynomial certificate calculations clear denominators only inside
proved identities and sign-transfer theorems. Negative correction terms in
the central raw formula are retained. The lower convolution uses the exact
weights 1,4,8,12,...; its equality with source coefficients is proved, not
assumed from a positive model.

## Polygon, directions, zeros and endpoints

The horizontal result is proved for all natural coefficient positions and
therefore supplies the explicit polygon-guarded path theorem in
MarkovThreeHorizontalMF88. Lower vertical path transport is explicit in
MarkovLowerVerticalMF88, with 3*(j+2)<=b. Polygon restriction and full root
direction conventions remain those of the unchanged root and inherited iff
chain. Constant-i+j triples are written (i,j+2),(i+1,j+1),(i+2,j), the same
unoriented direction as (1,-1).

Coefficients are zero-extended; proofs use non-strict inequalities. Small
central parameters with vanishing last coefficients are handled explicitly.
Lower vertical support tails and small columns are handled by the inherited
source theorem. No division by a potentially zero source coefficient is used.
The endpoints remain in the exact root iff chain, whose previously proved
endpoint clauses are unchanged. Neither experiments nor this report strengthen
non-strict inequalities to strict ones.

## Assumptions and proof scope

See evidence/markov-f88f6a75/validation.json for the final selected sources,
source hashes, individual build receipts, isolated joint kernel replay and
theorem axiom closures. The pinned Lean 4.32.2 and existing read-only Mathlib
were used. No sorry, admit, custom axiom or native_decide was introduced.
Only propext, Classical.choice and Quot.sound are permitted in closures.
Inherited compiled imports were reused: this is not a fresh whole-source
rebuild. No independent hash-bound completion audit was performed.

The strongest new exact statement is
root_iff_upper_vertical_diagonalMF88 in MarkovUpperVerticalResidualMF88:

  Conjecture63 iff ThreeUpperVerticalDiagonalMF88 and OtherFourM9E2.

Both right-hand propositions remain open. The new horizontal and lower vertical
theorems discharge substantial subscopes but do not discharge all seven root
correspondence obligations. Auxiliary negative minors in
MarkovLowerDiagnosticsMF88 are not reversed source inequalities and do not
refute the root. Completion is null.
