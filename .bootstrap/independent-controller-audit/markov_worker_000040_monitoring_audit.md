# Independent monitoring audit: worker 000040

Request: `a3c53fa7bcea4aaf80795a13558baa99`. Reviewed 2026-10-14. This audit checks completed work; it supplies no proof strategy or implementation. No active repository changes, Lean reruns, proposer contact, or successor interaction occurred. The existing finite Python experiment was independently rerun only in an isolated temporary directory by the finite-scan subauditor.

## Verdict and one wording defect

All four final modules, comprising **26 named theorems**, have successful source-matching compilation and kernel-replay records. Final source snapshots, current source, archived source, manifest hashes, controller receipt hashes, and compiled-artifact hashes agree. The exact source specialization at integer weight 1 and the integer-weight matrix interface are actually proved; they are not merely explanatory analogies.

The result at weight 2 is a universal obstruction for a **deformed** Pell matrix family, not a counterexample to the protected source conjecture. The result at weight 1 is a strict inequality for **one moving vertical triple**, for every source `a/(a+1)` with `a>=3`. It does not establish a whole direction, the complete Pell family, arbitrary rational sources, or `MathGKM.Markov.Conjecture63`.

There is one narrow English mismatch in `evidence/markov-a3c53fa7/report.json`, in the observation beginning “For the displayed Pell triple”: it says that the real gap polynomial is uniformly nonnegative “exactly when t>=0 and t^2<=2.” Read as an unrestricted equivalence in real `t`, that is false. For example,

\[
G(n,-1)=n^2+7n+12>0\quad(n\in\mathbb N).
\]

The Lean theorem instead **assumes `0<=t`**, and then proves uniform nonnegativity iff `t^2<=2`. The main mathematics document explicitly says “for real t>=0,” and its displayed equivalence is correct. The correspondence document also correctly limits the real theorem to the gap polynomial and the matrix interface to integer weights. This is an omitted domain restriction in that report sentence, not a false Lean theorem or a source-bridge failure. No file was edited.

## Evidence status and provenance

| Final module in `research/` | Theorems | Build | Kernel replay |
|---|---:|---|---|
| `MarkovDeformedJetA3c5.lean` | 4 | exit 0, 11.012 s | exit 0, 30.718 s |
| `MarkovDeformedSourceA3c5.lean` | 9 | exit 0, 6.565 s | exit 0, 32.842 s |
| `MarkovDeformationThresholdA3c5.lean` | 9 | exit 0, 11.636 s | exit 0, 45.696 s |
| `MarkovTypeMatrixA3c5.lean` | 4 | exit 0, 12.899 s | exit 0, 36.457 s |

Build/replay receipts, respectively, under `evidence/markov-a3c53fa7/`:

- Jet: `run-1791993847686869000.json`, `run-1791993873697180000.json`.
- Source: `run-1791993955861725000.json`, `run-1791993976890322000.json`.
- Threshold: `run-1791994017185402000.json`, `run-1791994110697324000.json`.
- Matrix: `run-1791993976889509000.json`, `run-1791994017183170000.json`.

Each associated saved `.lean` snapshot equals the final source bytes. No selected record timed out. All successful printed axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`; the printed main theorems are listed in the saved summary. These are recorded axiom checks, not newly executed exhaustive checks. The final proofs introduce no custom axioms or admissions. Nine rejected earlier elaborations are explicitly excluded from acceptance and retained separately.

The manifest is dated `2026-10-14T16:09:47.297983Z`. Worker 000040 completed at `16:10:11.711539Z`, after 1177.811 s, with a completed controller report, `completion: null`, and `mathematical_resolution: false`. All four successful replays precede the manifest; there is no unfinished late replay to infer. Validation uses inherited compiled imports, as the documents disclose; this review does not substitute for a new whole-source rebuild.

Final source SHA256 values:

```
Jet       5d7fb024074daf0d81823a3b3200964c0b0cf62db3a48ab151f297af4e4fae88
Source    9a05d3301a2067c3437059f6776beddf7dcdc26deef890b7fad23f9ab241c536
Threshold 3e630142ed93bf080213868bd89914ce311f9e5b77f31dbfb0ae68e941d6c335
Matrix    a160c2ca7bfef41add14068a23cf92f2f49c37b5d7935f4953519961723e332f
```

The companion directory `markov_worker_000040_audit_evidence/` contains the exact reviewed sources, selected records, English documents, and `summary.json` with all source/archive/receipt/compiled-artifact comparisons. Large compiled artifacts themselves were hashed, not duplicated.

## Exact mathematical correspondence

### Deformed recurrence and coefficient calculation

`typeP3 t a` is an ordinary bivariate polynomial over integers, for an **integer** parameter `t`. Its recurrence is exactly

\[
P_0=1,\quad P_1=(u+v)^2+u,\qquad
P_{a+2}=((u+v)^2+u+tv)P_{a+1}-tuvP_a.
\]

The auxiliary `deformR3` recurrence has initial values `1` and `1+u(1+v)^2` and transition `(1+tv+u(1+v)^2)R_{a+1}-tvR_a`. `deform_zero3` fixes its entire outer-degree-zero polynomial at 1. `deform_rows3` gives exact recurrences for outer degrees 1 and 2. `deform_jet_step3` is a conditional algebraic preservation lemma; `deform_jets3` discharges those conditions for the actual recurrence using base cases `a=3,4` and two-step induction. Thus the universal result is not obtained by assuming the desired jet invariant.

`excessShear3` sends the monomial `u^i v^j` to `u^(i+j) v^j`. Its monomial and coefficient lemmas prove this exact reindexing. `typeP_shear3` proves the polynomial identity `P_a(u,uv;t)=u^a R_a(u,v;t)`, and `typeP_moving_coeff3` removes the factor `u^a` at the selected coefficients. There is no unproved numerical matching step between the recurrence and the moving triple.

For every natural `n`, setting `a=n+3`, `typeP_triple3` proves

\[
[u^a v^0]P_a=1,\quad
[u^a v^1]P_a=2a+(a-1)t,
\]
\[
2[u^a v^2]P_a=6a(a-1)+8(a-1)(a-2)t+3(a-2)(a-3)t^2.
\]

All are raw integer coefficients. Multiplication by 2 clears the coefficient formula and is removed in the final strict inequality; it is not factorial normalization. The formal identities retain ordinary zero coefficients and do not divide by a coefficient or assume it is nonzero.

### Protected source and exact matrix meaning

`typeP_source3 n` proves `P_(n+1)(1)=rightP650 n`, where `rightP650 n` is definitionally the protected polynomial `(frame (List.replicate n true)).mid.p`. The inherited `right_labels650` gives the labels `(n+1,n+2)`. Thus this is the literal source family `a/(a+1)` with `a=n+1`, not just a similar recurrence with unrelated indexing.

The matrix definitions are literally

\[
A=\begin{pmatrix}v&1\\uv&u+1\end{pmatrix},\qquad
C_t=\begin{pmatrix}v+t&1\\uv&u\end{pmatrix},
\]

and `typeMat3 t n` recursively denotes `(A C_t)^n A`. The scalar is `(v,1) M (1,u)^T`. `typeScalar_rec3` proves the exact two-step scalar identity, and `typeP_matrix3` proves `P_(n+1)(t)` equals that scalar for every integer `t` and natural `n`. `source_type_matrix3` then proves literal equality with the protected repeated-right source at `t=1`.

The entries are visibly polynomials with nonnegative coefficients when integer `t>=0`; the module's named theorems establish identities and the displayed failure, not a separate coefficientwise-positivity predicate for all entries. No real-parameter matrix formalization is asserted. This distinction is accurately stated in the main English notes.

### Sharp threshold, failure, and actual source inequality

`typeP_gap3` proves an exact integer formula for twice the raw vertical gap. The real definition `typeGap3 n t` records the same algebraic expression. `typeGap_certificate3` rewrites it as

\[
G(n,t)=(2-t^2)n^2+(18+16t+5t^2)n+36+32t+8t^2.
\]

For real `n>=0`, real `t>=0`, and `t^2<=2`, `typeGap_positive3` proves strict positivity. When `t>=0` and `t^2>2`, `typeGap_eventually_negative3` proves the existence of a natural `n` with negative gap using an Archimedean bound. Its theorem conclusion is an existential negative witness, not a separately stated “every sufficiently large n” predicate. This suffices for `typeGap_uniform_iff3`:

\[
t\ge0\quad\Longrightarrow\quad
\bigl[(\forall n\in\mathbb N,\ G(n,t)\ge0)\iff t^2\le2\bigr].
\]

There is no formal real-weight source transport in these modules. The integer cases below are proved directly from `typeP_gap3`, so they do not depend on silently extending the real theorem to matrices.

`typeP_weight_two_failure3` proves the reversed vertical coefficient inequality for every `a=n+40`, `n` natural. `type_matrix_triple_failure3` proves the same for the actual defined weighted matrix scalar, with matrix exponent `n+39=a-1`. The identity `G(n+37,2)=-2n^2-78n-16` explains the range `a>=40`. These are universal deformed-family results, not finite tests and not source counterexamples.

At weight 1, `source_corner_gap3` proves twice the source gap is `n^2+39n+76`, and `source_corner_strict3` proves the strict raw inequality at `(a,0),(a,1),(a,2)` for `a=n+3`. The path is exactly `n+2` right steps, whose labels are `(n+3,n+4)`. `source_corner_polygon3` verifies all `j<=2` at outer index `n+3` in the pinned polygon. The natural index arithmetic therefore agrees across the gap, source, path, and polygon statements.

This is one vertical triple per member of an unbounded family. Other vertical triples, the full horizontal and diagonal clauses, other rational sources, and the endpoint clauses of the root are not discharged.

## Finite experimental count

An independent isolated rerun reproduced both `type-refinement.json` and `arbitrary-words.json` exactly, apart from elapsed time. The detailed subaudit is `markov_worker_000040_finite_audit.md` beside this note.

The type-refined scan covers all **307** coprime pairs `1<=a<b<=31`. The count **377267** is a count of spatial triples, not a count of individual type coefficients: 123589 horizontal, 123589 vertical, and 130089 diagonal triples. It found 92 vertical and 16 diagonal triples whose gap polynomial has some negative type coefficient, and none horizontally. Its source coefficients at `t=1` are checked against the unrefined recurrence.

The script selects triples with nonzero endpoint row-polynomials and uses an empty polynomial for a missing middle; it has no explicit polygon guard. The independent finite coverage check found that, throughout this sample, the computed support equals the pinned polygon lattice points, no tested middle is missing, and the counts equal all polygon-guarded triples. This finite observation does not prove universal support saturation or replace the root's zero and polygon obligations.

At source `10/11`, the displayed vertical coefficient polynomials `1`, `20+9t`, `270+288t+84t^2` give the gap `130+72t-3t^2`. Its negative type coefficient rules out that coefficientwise strengthening, while specialization at `t=1` gives raw gap 199. The first recorded diagonal witness at `11/21` has raw gap 584. Neither is a failure of the source inequality.

The arbitrary-word scan only goes through word length 12 and reports horizontal and vertical failures. Such words are not all protected source words. The notes correctly refrain from turning that bounded diagonal non-failure into a universal claim.

## Final status

The source and mathematical evidence support the bounded claims above, with the single report-domain wording issue identified at the start. The protected root remains unchanged with SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. `Conjecture63` remains unproved and unrefuted. Final byte comparison status and UTC timestamp are recorded in the companion summary.
