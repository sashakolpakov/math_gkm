# Independent monitoring audit: worker 000047

Request: `5c90b5063976426b9c5577badcc55c00`.

Read-only audit of the completed worker's archived output under
`/Users/sasha/math_gkm/.control/markov/workers/000047/artifacts`,
matching current final sources/compiled objects, and retained receipts.
No project changes, mathematical advice, proposer contact, active-worker
interference, fresh Lean builds, or mathematical experiment reruns.

## Finding

The new exact all-source change of exponents, source coefficient/polygon
transports, Pell recurrence, full generating equation, and extracted kernel
are correctly formalized at their stated scope. The arbitrary-word ambient
inequality is explicitly unproved; its reduction to the source horizontal
clause is conditional. No general source inequality follows merely from
the transfer or generating identities.

The actual source 1/3 polynomial identity and positivity of its ambient
specialization for every real argument are proved in Lean. This is an
obstruction to blanket real-rootedness, not to the pinned coefficient
inequalities.

No material English/Lean mismatch was found. Initial kernel replay timeouts
are superseded by successful later replays of the same final sources;
the failed records remain separate. Full Conjecture 6.3 is unresolved.

## Exact source change of exponents and matrices

The ring homomorphism `horizontalShear5c` substitutes
`u=x,v=xy`. It sends a monomial `u^i v^j` to `x^(i+j)y^j`;
`horizontalShear_coeff5c` proves the corresponding literal coefficient
identity for every bivariate integer polynomial and every natural `i,j`.

For the canonical central word `c=central28 path`, the source identity is

`P_(a/b)(x,xy)=x^a F_c(x,y)`,

where

`F_c=(y,1) T_c (x(1+y),1+x(1+y))^T`,

`T_A=[[xy,x],[xy,1+x]]`,

`T_B=[[y+xy(1+y),x(1+y)],
      [2y+xy(1+y),1+x(1+y)]]`.

The inherited canonical word has length `b-2` and B-count `a-1`.
The proof uses the literal raw-word source identity, including its A/B
boundary letters, rather than an experimentally inferred association.

The matrix entries are affine in `x` with nonnegative polynomial
coefficients. Their linear parts are `H` and `(1+y)H`, where

`H=[[y,1],[y,1]]`, `H²=(1+y)H`.

The formal rank-one-related result is this explicit repeated-row matrix
identity over a commutative ring; the code does not introduce a generic
matrix-rank theorem. In the intended polynomial/field setting it gives
the stated rank-one structure.

The gauge equations multiply through the diagonal factor. The only
cancellation is of the nonzero polynomial `U` in the integer polynomial
ring; no real value or source coefficient is divided. The resulting
polynomial identity remains valid when evaluated at `x=0`.

## Coefficients, domain, polygon, and directions

`source_ambient_coeff5c` states, for every source path and natural
`i,j,s` with `i+j=a+s`,

`A(i,j)=[x^s y^j]F_c`.

No coefficient normalization or weighting occurs. The equality includes
zero coefficients. Its domain condition retains the original natural
index `i`, hence also `j≤a+s`; it is not an unrestricted substitution
of arbitrary natural `s,j` for source positions.

Under that same equality,
`source_polygon_shear5c` proves the exact equivalence

`InPolygon(a,b,i,j) ↔ (s≤b-1 ∧ (b-a)j≤bs)`.

The missing-looking condition `j≤a+s` is already enforced by the
original natural `i` and the equality, and must be retained if the
region is restated using only `s,j`.

The original horizontal, vertical, and constant-total-degree directions
become respectively `(1,0)`, `(1,1)`, and `(0,1)`.
The vertical and diagonal Lean statements are equivalences between the
respective inequalities after exact coefficient replacement. They prove
neither inequality in general. In the diagonal equivalence, the domain
condition is `i+j+2=a+s`, reflecting the actual total degree of all
three original positions.

These identities quantify over all finite interior source paths with no
denominator or path-length cutoff. They do not infer the separate root
endpoint clauses from an interior identity.

## Explicitly conditional arbitrary-word reduction

`AmbientWordHorizontal5c` quantifies every finite A/B word `w`,
every natural `s,j`, and the range condition
`s+2≤length(w)+1`. With `N=length(w)+1`, its required inequality is

`(s+2)(N-s) C_w(s,j) C_w(s+2,j)
 ≤(s+1)(N-s-1) C_w(s+1,j)^2`.

This is an explicitly larger family of words than the canonical source
cores. The source reduction substitutes the actual canonical word,
derives `length(c)+2=b`, and proves the correct source range and three
coefficient identities from the polygon premises.

`ambient_word_implies_source5c` and
`ambient_word_implies_raw_horizontal5c` both retain the unproved premise
`h : AmbientWordHorizontal5c`. They do not assert arbitrary-word
vertical or diagonal LC and do not prove the full root.
No circular source-membership or LC premise is concealed in the equality
bridges; the remaining universal inequality is openly a hypothesis.

## Pell recurrence and generating equations

For the all-B word of length `a-1`, the scalar equals `Q_a`.
The seed `Q_0=1` is separately defined; the actual interior source bridge
uses `a=n+1≥1`. Over every commutative ring,

`Q_1=1+x(1+y)^2`,

`Q_(a+2)=(1+y+x(1+y)^2)Q_(a+1)-y Q_a`.

The ordinary formal series satisfies the proved equation

`((1-z)(1-yz)-xz(1+y)^2) Σ_(a≥0) Q_a z^a=1-yz`.

The exact source theorem identifies coefficients of
`frame (replicate n true)` with coefficients of `Q_(n+1)`
whenever `i+j=n+1+s`. This retains all natural indices and their zeros.

The checked Cassini identity is

`Q_a Q_(a+2)-Q_(a+1)^2=x y^(a+1)(1+y)^2`.

It compares different source-family indices. Its ordered interpretation
at nonnegative real parameters concerns that family index, not a pinned
coefficient direction. The generic ring theorem itself is an equality,
not a positivity assertion for arbitrary ring elements.

For the coefficient-extracted series

`K_s(z)=Σ_(a≥0) [x^s]Q_a z^a`,

the new module proves

`K_0(z)(1-z)=1`,

`(1-z)(1-yz)K_(s+1)(z)=z(1+y)^2 K_s(z)`,

and, for every natural `s),

`K_s(z)(1-z)^(s+1)(1-yz)^s=z^s(1+y)^(2s)`.

These are ordinary formal-power-series equalities over every commutative
ring, including `s=0`. They are denominator-cleared, need no numerical
convergence, and do not divide by a possibly zero value. The rational
generating-function form in English describes these exact identities.
No aggregate coefficient inequality is proved by them.

## Actual 1/3 positivity obstruction

For `c=[A]`, the exact scalar identity is

`F_A(x,y)=1+2x(1+y)+x²(1+y)^3`.

`ambient_source_one_third5c` identifies this with the sheared numerator
of the explicit actual source path `[false]`, with the required factor
`x`. The separate theorem
`ambient_one_third_no_real_root5c` proves

`F_A(x,1)=1+4x+8x²>0` for every `x : ℝ`.

Thus the obstruction is supported by exact source algebra and a universal
real inequality, not only by the finite Sturm probe. The degree-two
specialization has no real zero. No general complex-root classification
or reversed raw LC triple is asserted.

Evaluating `y=1` sums coefficient rows. It is different from the
horizontal target, which fixes a `y)-coefficient. Therefore this failure
of blanket real-rootedness does not refute the ambient or raw coefficient
inequalities.

## Finite experiments

The gas-word enumeration records 28,656 A-ended words of lengths 1–21
without adjacent C letters, and 4,415,699 nontrivial horizontal comparisons
without failure. The per-length class counts match the retained Fibonacci
counts and sum to 28,656. These words correspond to expanded original
A/B words, not all to published source cores.

A separate explicit transfer implementation records 2,047 polynomial
identities for all original words of lengths 0–10, and adds 200 seeded
words of lengths 20,40,60,100. I checked the total 2,247 and the retained
200-word length distribution. Its 929,901 recorded ambient comparisons
have no failure. The constant/top coefficient checks in that experiment
are finite checks on those words, not separately admitted universal
theorems from this run.

The exact Sturm probe stops at the one-letter A example and records
zero real roots for `1+4x+8x²`. The stronger universal positivity
claim for that example is independently present in the Lean module.

Experiment records match archived host hashes. Comparison counts were
not rerun, and finite overlapping scans are not treated as proof or
independent all-word coverage.

## Final verification and successful retries

Final manifest: `evidence/markov-5c90b506/validation.json`, timestamp
`2026-10-14T18:25:10.162310+00:00`. The host reports completed,
approximately 1147.54 seconds, mathematical resolution false, completion null.

| Module | Final source SHA-256 | Build receipt | Successful kernel replay receipt |
|---|---|---|---|
| MarkovShearedTransfer5c90 | `18df7a106a0c961d9b0a22de3108111bb92c2b25bba9eac4c6e7ca68d5473384` | `run-1792001741459597000.json` | `run-1792002110892694000.json` |
| MarkovAmbientKernel5c90 | `d7a1df52255219e22191d30f27cbfa2b589fdec03c5a936831ab0e930c23cc1c` | `run-1792001813431751000.json` | `run-1792002172426293000.json` |
| MarkovAmbientReduction5c90 | `08e8f33486369dc8c4aff9260ada3c0f543a4e31fd36687b30b359e17f4e6aee` | `run-1792001959685030000.json` | `run-1792002052554320000.json` |
| MarkovAmbientSlices5c90 | `2369918f1f6a237a54d3186bd2a82142f4180e19af398c0861a415fb86aa292d` | `run-1792002171231277000.json` | `run-1792002241420275000.json` |

All four final source hashes match current/archived source, the manifest,
host changes, and final build/replay snapshots. All eight listed records
return zero and bind those same hashes. Replay invokes pinned Lean 4.32.2
`leanchecker` on the corresponding module. Receipt-file hashes and
archived/current compiled-object hashes match the host/manifest records.

The initial ShearedTransfer and AmbientKernel replay records
`run-1792001960869389000.json` and
`run-1792001962067620000.json` each report a timeout near 100 seconds.
Their source hashes are the same as the final versions. The later listed
replays succeed sequentially in approximately 45.80 and 45.30 seconds.
The final extracted-slices replay also succeeds, in approximately 39.21
seconds. The timeouts are not counted as successful checks.

Nine rejected elaborations remain separate: three shear drafts, one kernel
draft, two reduction drafts, and three extracted-slices drafts.
The eighteen printed final axiom closures match the successful build
outputs and contain only standard axioms from `propext`,
`Classical.choice`, and `Quot.sound`.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected matching recorded compilation/kernel replay rather
than performing an independent fresh transitive rebuild. Inherited compiled
imports remain part of the verification boundary. Full Conjecture 6.3
remains open within the project.

