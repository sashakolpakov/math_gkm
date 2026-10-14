# Independent monitoring audit: worker 000042

Request `80b7912a37f44a85a9093d9d5ef87118`, audited 2026-10-14. This is a read-only mathematical and existing-evidence review. No active repository edits, Lean compilation/replay, numerical reruns, repairs, proposer contact, or successor interference occurred. The finite-experiment subaudit likewise inspected source and saved results without rerunning them.

## Verdict

The three final modules contain **21 named theorems**, all with successful source-matching compilation and kernel replay. Their final source snapshots, archived source, manifest hashes, controller receipt hashes, and compiled-artifact hashes agree. The successful recorded main-theorem axiom closures contain only `propext`, `Classical.choice`, and `Quot.sound`.

The new all-direction theorem is exactly about the **zero-weight Pell deformation**

\[
P_a(0)=((u+v)^2+u)^a,\qquad a\in\mathbb N.
\]

It proves the three raw adjacent-triple inequalities at **every natural coefficient position**, including all zeros. It is not an all-source theorem and does not establish any corresponding all-direction result at the actual source weight 1. The formal parameter/source equality at 1 is genuine, but equality at 1 does not transfer inequalities proved only at 0.

The first-order horizontal-gap nonnegativity candidate remains experimental. The Lean theorem proves the first parameter coefficient of the whole polynomial, but not the proposed scalar coefficient formula or the first-order gap inequality. The English mathematical notes and correspondence report retain that distinction. No substantive English/Lean mismatch was found.

## Compilation, replay, and worker timeout

| Module in `research/` | Named theorems | Build | Replay |
|---|---:|---|---|
| `MarkovZeroWeight80b7.lean` | 8 | exit 0, 9.741 s | exit 0, 85.578 s |
| `MarkovZeroAll80b7.lean` | 5 | exit 0, 10.215 s | exit 0, 84.477 s |
| `MarkovParameter80b7.lean` | 8 | exit 0, 4.445 s | exit 0, 33.698 s |

Build and replay records, respectively, under `evidence/markov-80b7912a/`:

- ZeroWeight: `run-1791995956946854000.json`, `run-1791996248656297000.json`.
- ZeroAll: `run-1791996179651281000.json`, `run-1791996249854297000.json`.
- Parameter: `run-1791996412259797000.json`, `run-1791996494247771000.json`.

Every selected record's source hash and associated `.lean` snapshot match the final source. All six records exist identically in the worker archive. The current compiled artifacts match the manifest, controller receipt, and archived artifact bytes. There are no selected timeout or failed-replay records.

The Parameter replay began around `16:48:14.247771Z` and completed after 33.698 seconds, before the manifest at `2026-10-14T16:49:05.958370Z` and before the worker timeout at `16:49:21.527098Z`. Thus all three replay completions are evidenced despite the controller's eventual `outcome: timeout`, `report: null`, and elapsed 1201.058 seconds. The saved mathematical report is not a successfully submitted controller final report. Both leave root completion null/false.

The early checkpoint describing Parameter replay as active is historical; the final checkpoint and manifest correctly record its completed replay. Five rejected elaborations are separately retained and not accepted. Any `sorryAx` in their diagnostics belongs to rejected versions, not the successful final proofs.

The printed axiom checks cover the advertised main results: the zero-weight identities, horizontal result, weighted horizontal result, vertical recurrence/inequality, all-direction theorem, parameter source/linear/raw-coefficient/source-extraction identities, and constant gap inequality. They are existing recorded closures, not an independently rerun exhaustive axiom inspection. Inherited compiled imports were reused, as the documentation discloses; this audit did not perform a whole-source rebuild.

Final source SHA256:

```
ZeroWeight c765393695b0853f8d44cafa455b264cbbc3a71af9a282d1cb255d0e0d8da0b7
ZeroAll    e34ea75ab6e00a23e1cd0b95b7dbe0f8852e4860d92b900ebc71539085049132
Parameter  e9f62d34c260ec7186affb5877dc933cb97abe7807535e28c4ad16b151c61438
```

Exact reviewed sources, selected receipts, English documents, and hash comparisons are saved in `markov_worker_000042_audit_evidence/` beside this note. Large `.olean` files were hashed rather than copied. The companion `summary.json` contains the final stability timestamp.

## Zero-weight coefficients: domain and boundaries

`typeP_zero80` and `deform_zero_weight80` prove the polynomial identities

\[
P_a(0)=((u+v)^2+u)^a,\qquad R_a(0)=(1+u(1+v)^2)^a
\]

for every natural `a`, including 0. The helper `coeff_one_linear_pow80` establishes an ordinary binomial coefficient expansion, and `zero_weight_coeff80` proves

\[
[u^k v^j]R_a(0)=\binom ak\binom{2k}j.
\]

`zero_weight_raw_coeff80` then proves the raw-source-coordinate formula for natural `a,i,j,k` **under the explicit equality `i+j=a+k`**. It uses the inherited exact shear and removal of the factor `u^a`. The separate `zero_weight_below80` proves that the coefficient vanishes when `i+j<a`. This separation matters: the binomial formula is not applied with silently truncated `k=i+j-a` below support.

All remaining out-of-support cases are retained by the natural binomial coefficients: `k>a` or `j>2k` gives zero. No nonzero-coefficient premise or division appears. At `a=0`, the definitions and formulas retain the constant polynomial 1 and zero at other positions. There is no assumption that the deformation has the same support or Newton polygon as the published source.

`zero_weight_horizontal80` proves the ordinary raw inequality at `(i,j),(i+1,j),(i+2,j)` for all naturals `a,i,j`. Below support, an endpoint is zero; otherwise it combines binomial log-concavity in the lower index with upper-index-stride-two binomial log-concavity. `weighted_zero_horizontal80` identifies the same result for a list of `n` zero C-site weights; its corresponding exponent is `a=n+1`. It is not a theorem for arbitrary lists of weights or arbitrary source words.

## Vertical and diagonal inequalities

With `B(a,k,j)=choose(a,k) choose(2k,j)` as an integer, `zeroBin_step80` proves

\[
B(a,k+1,j+1)(j+1)(2k+1-j)
=2(a-k)(2k+1)B(a,k,j)
\]

under `k<=a` and `j<=2k`. Those hypotheses justify the natural-to-integer subtraction conversions in the combinatorial recurrences.

The final `zeroBin_vertical80` is **unconditional** in natural `a,k,j`. It splits off `a<k+2` and `2k<j`, where respectively the right or left endpoint vanishes. In the remaining case, `k+2<=a` and `j<=2k`, it sets the integer `r=2k-j>=0`, proves the stated polynomial nonnegativity certificate, and clears the strictly positive factor `(j+1)(r+1)(j+2)(r+2)`. It never divides by an actual coefficient. Consequently zeros inside or at the boundary of the indexing range are not excluded.

`zero_weight_vertical80` transports this inequality to the raw coefficient indices. `zero_weight_diagonal80` holds total degree fixed and reduces to ordinary binomial log-concavity with a nonnegative squared factor. Its below-support case is also handled explicitly.

`zero_weight_all80 a` assembles these results into `GlobalLC18 (typeP3 0 a)`. Inspection of `GlobalLC18` confirms that it is exactly the conjunction of all horizontal, vertical, and `(1,-1)` diagonal adjacent-triple inequalities at **all natural positions**, with no polygon guard. This stronger positional domain applies only to the stated zero-weight polynomial family. It is not a statement about every reduced rational source or every protected frame path.

## Parameter polynomial and actual source weight

`parameterP80 a` is an ordinary polynomial in the auxiliary parameter, with coefficients in `BiPoly`. Its recurrence is

\[
P_{a+2}(t)=(D+tv)P_{a+1}(t)-tuvP_a(t),\qquad D=(u+v)^2+u.
\]

`parameter_eval80` proves evaluation at each integer `t` equals the inherited `typeP3 t a`. `parameter_source80 n` proves evaluation at 1 of `parameterP80 (n+1)` equals `(frame (List.replicate n true)).mid.p`. The path labels are `(n+1,n+2)`, so this is precisely the repeated-right/Pell subfamily `a/(a+1)` with `a>=1`. The auxiliary exponent `a=0` in the zero-weight theorem does not add another path to this source identity.

`parameter_constant80` proves `[t^0]P_a=D^a`. `parameter_linear_rec80` proves a recurrence for the linear coefficient, and `parameter_linear80 n` proves

\[
[t^1]P_{n+2}(t)=(n+1)v(u+v)^2D^n.
\]

The formula is an exact polynomial identity, not a finite jet test. It is indexed for `a=n+2`; the base parameter polynomials at `a=0,1` are constant in `t` by definition.

`parameterRaw80 a i j` extracts the raw spatial coefficient as a polynomial in `t`. `parameter_raw_coeff80` proves coefficient extraction commutes with taking a parameter coefficient; `parameter_raw_source80` proves evaluation at 1 gives the protected raw source coefficient. No homogeneous-source variable is replaced by `t`, and there is no factorial normalization.

`parameter_gap_constant80` proves only that the **constant parameter coefficient** of every horizontal gap polynomial is nonnegative. The already-proved linear coefficient formula for `P_a` is not a proof that the linear coefficient of every gap is nonnegative, and neither statement implies nonnegative evaluation of the gap at 1. The English notes correctly preserve these distinctions.

## First-order candidate and finite observations

The separate static finite-artifact audit is `markov_worker_000042_finite_audit.md`. No experiment was rerun for this review.

`linear-gap.json` records a 21-term positive-coefficient polynomial `T` after the substitutions `r=2k-j>=0` and `m=a-k-2>=0`. The fallback script `linear_sparse_80b7.py` computes the sparse expansion of **T**. Its displayed normalized-gap formula is an output string, not an asserted universal symbolic identity in that script. The unavailable-SymPy script is not the producer of the successful sparse artifact.

`check_linear_80b7.py` separately checks the proposed scalar coefficient formula's induced gap for `a=2..40`, `k=0..a-2`, and `j=0..2k+2`, totaling **22100** samples. Of these, 20540 have `r>=0` and test the rational identity; the other 1560 have `r=-1` or `r=-2` and test only nonnegativity of the undivided candidate gap. These finite boundary checks are not a universal boundary theorem. The script uses the candidate scalar first-order expression; it does not establish its equality to extracted coefficients of the formal `parameterP80`. The mathematical notes explicitly leave that formal coefficient transport, rational identity, and boundary treatment open.

The mixed-term counterexamples concern auxiliary summands of source-core transformations, not actual source coefficient triples. Their saved negative mixed gaps therefore reject those sufficient auxiliary conditions without refuting the pinned conjecture. The other surviving mixed conditions, the no-consecutive-C scan, and the 496 two-block products are finite experiments only. Their exact bounds and provenance are documented in the separate subaudit; none supplies an accepted Lean premise or a universal result.

## Final state

The protected `MathGKM/Markov.lean` remains byte-identical, with SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. This worker proves a complete all-direction zero-weight deformation theorem and exact parameter/source identities. The actual source-weight-one universal inequalities, first-order gap theorem, and full `Conjecture63` remain unproved. No source-level contradiction, missing premise in the advertised Lean inequalities, or invalid transfer to weight 1 was found.
