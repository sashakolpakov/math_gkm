# Independent monitoring audit: worker 000049

Worker request: `b5dbe087bddc41aaa420318d5cb776a1`.
Audit date: 2026-10-14. Read-only review of the completed worker's archived
artifacts under `/Users/sasha/math_gkm/.control/markov/workers/000049/artifacts`,
with hashes compared to current final files and the host receipt. No project
changes, new mathematical experiments, fresh builds, proposer contact, or
research guidance were performed.

## Finding

The main advance is an unconditional raw vertical log-concavity theorem for
every actual source triple ending on the top face. The source correspondence,
zero-retaining algebra, small cases, and range conditions are discharged.
Together with inherited results, it yields a genuine two-way equivalence
between the pinned root and an infinite residual interior proposition.

The sharpness theorem and the negative matrix-minor family concern stronger
claims and do not refute the pinned conjecture. The quadratic-form module
proves exact identities, not a log-concavity closure theorem. No material
English–Lean mismatch was found. The full conjecture remains unresolved.

## Vertical theorem and its source bridge

For any finite Boolean path, let `(a,b,P)=(frame path).mid`,
`d=a+b−1`, and `A(i,j)=coeff P i j`, with integer raw coefficients.
The inherited source bridge gives `0<a<b` and covers the intended rational
source family without a denominator bound.

`source_top_vertical_rawB5` assumes only natural `i,j`,
`InPolygon a b i j`, and `i+j+2=d`. It concludes

`A(i,j) A(i,j+2) ≤ A(i,j+1)^2`.

The middle and upper points are automatically in the polygon: increasing
`j` preserves its lower inequality, and the displayed degree equality gives
the upper inequalities. No formula, residual log-concavity, or separate
source-identification premise remains unproved.

`source_top_vertical_largeB5` proves the same inequality under only
`2≤i+j` and `i+j+2=d`, without any polygon premise. Its algebra therefore
retains positions with zero coefficients. In the remaining low-degree cases,
the source-label inequalities and degree relation force `a=1`. The final
theorem then constructs the other two polygon guards and applies the inherited
universal numerator-one `WeakLC` theorem. This is a proved small-case branch,
not a finite scan or an omitted exception.

Writing `D=i+j`, `N=b−1`, `B=a−1`, `F=choose(D,i)`, the checked source
identities are

```
(j+1) M = F [B(j+1)+Ni],
(j+1)(j+2) R = (D+1)(D+2) F,
2D(D−1) L = T F,
T = N(N−1)i(i−1) + 2(BN+N−3B−1)ij + B(B−1)j(j−1).
```

Here `L,M,R` are the actual three raw coefficients. The proof uses the
correct relation `N+B=D+1`, with `B≥0` and `N≥B+1`. The middle-coefficient
bridge handles `i=0` separately and otherwise uses the inherited exact
upper-slice identity. The lower coefficient uses the corrected worker-48
identity; the top coefficient is the inherited binomial formula. All slice
range conditions follow from the displayed degree hypotheses.

The algebra proves the cleared gap identity

```
2D(D−1)(j+1)^2(j+2)(M^2−LR) = F^2 G,
G = 2D(D−1)(j+2)[B(j+1)+Ni]^2
    − (j+1)(D+1)(D+2)T.
```

The certificate establishes `G≥0` for `B≥0`, `2B≤D`, `D≥2` using three
explicit nonnegative polynomial expansions for `i≥2`, `i=1`, and `i=0`.
Their monomial counts are 101, 19, and 15. Lean checks the identities by
`ring` and signs by order reasoning. The canceled factor is proved strictly
positive; no coefficient or binomial value is assumed positive. Real casts
are temporary proof devices, and the final inequality is the target integer
raw inequality.

## Exact root/interior equivalence

`Interior63B5` universally quantifies over all source paths and natural
indices and retains all three original polygon guards for each direction.
Its remaining ranges are:

- horizontal triples `(i,j),(i+1,j),(i+2,j)` with `i+j+3≤d`;
- vertical triples `(i,j),(i,j+1),(i,j+2)` with `i+j+3≤d`;
- diagonal triples `(i,j+2),(i+1,j+1),(i+2,j)` with `i+j+5≤d`.

`root_iff_interiorB5 : Conjecture63 ↔ Interior63B5` is an actual equivalence.
The forward direction restricts the root inequalities. In the reverse
direction, the negation of each horizontal/vertical residual cutoff, together
with the original polygon upper bound, forces precisely `i+j+2=d`; the new
top-face theorems then apply. The diagonal complement has upper-depth
`r=d−(i+j+2)≤2` and uses the inherited first-three-upper-diagonal theorem.
The separate `0/1` and `1/1` endpoint clauses are explicitly discharged
from their polygon bounds, rather than silently dropped.

Thus this removes exactly the triples wholly contained in the top three
homogeneous layers. It does not assert either side of the equivalence.
The residual is exact for this geometric split, but it is not a minimal
inventory of every still-unproved case: it also retains inequalities already
covered by other earlier partial results, such as numerator-one and further
upper-diagonal cases. No false claim that those retained cases are all newly
open is needed for the equivalence.

## Sharpness of the vertical multiplicative constant

For every natural `j` and `k≤2`, `vertical_sharp_coeffB5` proves that the
actual path `replicate (j+1) false`, representing `1/(j+3)`, has coefficient
`A(1,j+k)=j+k+1`. A separate theorem proves each of the three polygon guards.
The resulting top-ending triple is `[j+1,j+2,j+3]`, with raw gap exactly one.

For every real `c>1`, `vertical_uniform_constant_sharpB5` constructs an
actual path and indices with all three polygon guards, the top-face equality,
and the strict inequality `M^2<cLR`. Its Archimedean parameter choice is
unbounded; this is not merely a test of finitely many constants or sources.
Together with the proved raw vertical bound, it establishes sharpness of the
uniform multiplicative factor one. It does not exclude nonuniform stronger
bounds or refute raw log-concavity.

## Infinite actual-source matrix-minor obstruction

For every natural `k,j` with `j≥4`, `pell_shear_minor_formulaB5` proves on
the actual path `replicate (k+j) true` that

```
A(k+2,j) A(k+2,j+1) − A(k+3,j) A(k+1,j+1)
  = 32[(k+2)^3 − j((k+2)^2−(k+2)−1) − 2].
```

The formula is stated after rational casting of exact integer coefficients.
Every range premise of the inherited lower-strip formulas is discharged.
For `k=0`, the determinant is `32(6−j)` and is strictly negative for every
`j≥7`. The path represents `(j+1)/(j+2)`. The separate polygon theorem checks
all four actual positions `(2,j),(3,j),(1,j+1),(2,j+1)` in this infinite
negative family.

`ambient_pell_not_TP2B5` transports the same strict reversal through the
exact source/ambient coefficient bridge to
`C(1,j)C(2,j+1)<C(2,j)C(1,j+1)`. This is a four-position minor, not one
of the three-point inequalities of Conjecture63. The finite first example
at source `8/9`, row `j=6`, has determinant `−160`; it corresponds to the
general formula with `k=1,j=6`. The infinite `k=0,j≥7` subfamily uses a
different minor, with determinant `−32` at its first parameter. These are
consistent examples and should not be conflated.

## Common quadratic form and sandwich identities

The new module works over every commutative ring. For the existing exact
ambient transfer matrices it defines

`K(x)=[[1+x,−x],[−x,x]]`

and checks both displayed products `K T_A` and `K T_B`. With
`Q_w(p,q)=(p,q)K T_w(p,q)^T`, it proves, for every word `w` and either
letter `r`, the exact sandwich identity

`Q_(r w r)(p,q)=Q_w(T_r(p,q)^T)`.

No palindrome premise is needed for this algebraic identity. The empty-word,
one-letter, and source-seed identities also match their English formulas.
The seed equality `Q_w(x(1+y),1+x(1+y))=xF_w` holds without dividing by `x`.
Its actual-source specialization proves

`U·horizontalShear(P)=U^a·Q_(central(path))(U(1+V),1+U(1+V))`.

The source word is the inherited exact central word. These are identities
only; the module does not assume or prove arbitrary ordered-ring positivity,
matrix total positivity, mixed-gap nonnegativity, or a log-concavity induction
principle. The worker correctly relates this representation to inherited
square identities rather than claiming an independently new universal
sum-of-squares theorem.

## Recorded validation and final hashes

All eight final source hashes agree among current files, archived files,
host `changes.after`, manifest, and the selected build/replay snapshots.
All sixteen selected records are successful, have the expected source hash
and `lean`/`leanchecker` command/module, and themselves match host-bound
archived and current JSON files. Final object hashes agree among current
objects, archived objects, manifest, and host receipt.

| Module | Final source SHA-256 | Build suffix | Replay suffix |
|---|---|---|---|
| MarkovVerticalCertificateB5 | `11cf926a0b8ea9952ca6e56da040a4b3158cabe82afbe0233d6ce1040f37edc6` | `1792003697800922000` | `1792003758445716000` |
| MarkovVerticalAlgebraB5 | `ce84e902baa61dd939698228343313ee5e4d218933917099c15981f4c5aa2712` | `1792003756708632000` | `1792003811589488000` |
| MarkovVerticalSourceB5 | `5f1314cac99436243b7006c6949097c498d7c2a8ca9a1cab324356092976c8ab` | `1792003771493552000` | `1792003810408839000` |
| MarkovTopVerticalB5 | `40393351bce561ab25d83ae84439dec6e47db9de0d78c307a08b34377b81ea65` | `1792003809225383000` | `1792003858217034000` |
| MarkovVerticalSharpB5 | `6a259274a0bff11fdcc9671c765dbdcca3bbb59bef3ee4019d90cb60eb70fa61` | `1792003979818440000` | `1792004044854713000` |
| MarkovInteriorReductionB5 | `cffbca593291f19f1a5dd0d35f57077ab353daecba4e841bbe75dcfc995b7413` | `1792003925262582000` | `1792003970626091000` |
| MarkovShearObstructionB5 | `76645fb30033a1839ac7005ae6166739a1dcdc5a0af66cd7d8170507043b4696` | `1792004159885964000` | `1792004197443396000` |
| MarkovAmbientFormB5 | `0740e47d507b737650497bbfc29580e36c43ae53017929a995f7a4cbeff034e6` | `1792004309756443000` | `1792004382009200000` |

Record paths are `evidence/markov-b5dbe087/run-<suffix>.json`.
All fifteen manifest axiom-print lines match successful build output and
use only subsets of `propext`, `Classical.choice`, and `Quot.sound`.
Four earlier failed elaborations are retained and excluded; no failed
error-recovery `sorryAx` print is counted as admitted evidence.

The last selected replay finished at 19:00:19.210 UTC. The host completed
normally at 19:03:17.059 UTC after 1058.017 seconds, with a final report,
`completion:null`, and `mathematical_resolution:false`. The manifest,
report, mathematics, correspondence, and checkpoint hashes also match
the archived host receipt and current files.

The independently recomputed protected root and canonical contract hashes
remain respectively
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe` and
`6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.
Inherited compiled imports were reused. This audit inspected recorded
checks; it did not independently rerun Lean or rebuild all dependencies.

## Experiments are distinct from theorems

The scripts and final records were inspected without rerunning them.

- The vertical probe reports 491,572 tested top-ending triples across
  4,264 fractions with `a≤100,b≤120`. Of these triples, 491,395 satisfy
  the polygon guard; 177 have zero endpoint product. Three low-degree
  positions are counted separately outside the tested formula range.
  There are 4,720 independent transfer/formula comparisons for `b≤25`.
  No raw inequality failure is recorded. The larger total should not be
  described as 491,572 polygon-admissible triples.
- Arbitrary-word transfer tests through length 10 refute several stronger
  component/minor candidates. For example, the `g`-component scaled gap
  at word `AAAB` and `[2,11,32]` is `−42`. Arbitrary words are not
  identified with source words.
- The palindrome scan enumerates 8,189 words through length 22 and records
  8,860,294 component/terminal scaled-gap checks with no failure. It loops
  over existing left coefficients; left-zero cases are trivially
  nonnegative in the tested scalar range, while middle/right zeros remain.
  This is finite evidence, not a palindrome log-concavity theorem.
- Mixed-gap experiments distinguish the mixed term from the full terminal
  gap. `AB^9A` gives mixed gap `−1168` with the recorded component triples,
  but is not a source counterexample and is not formalized as a new Lean
  obstruction in these modules. A second seeded palindrome failure is
  separately recorded. The source scan through denominator 35 reports
  343,948 checks of each component and mixed gap with no failure.
- The larger source stress completed its 84 selected reduced fractions,
  with denominators at most 120 and seed 518749, and records 821,960
  checks of each of the two component gaps, mixed gap, and terminal gap.
  The script checks the exact decomposition of the terminal gap. Its
  selected sources are not exhaustive coverage of that denominator range,
  and the result proves no universal mixed-gap property.

No priority or novelty claim follows from these finite counts. The useful
new universal coverage is the actual vertical top-face theorem and its
checked integration into the precise root/interior equivalence.
