# Independent monitoring audit: worker 000050

Request `a27f6d422b1a478c976694b9ca5c9a54`, reviewed 2026-10-14. This was a read-only audit of final sources and existing evidence. No active files were edited; no compilation, replay, numerical experiment, pending proof, or successor action was run. No proposer contact or mathematical guidance was supplied.

## Verdict: three replays succeeded, one timed out

All four final modules compiled successfully, totaling **24 named theorems**. Contrary to the stale manifest's count of two successful replays, a later **successful sequential replay of `MarkovCutRootA27`** is present in both the worker archive and completed event transcript. Thus the final existing evidence supports successful compilation and replay of **Partition, Gaps, and Root: 19 named theorems**. The **Obstruction module's five named theorems compiled, but its only recorded replay timed out**.

The source-coefficient representation and root equivalence retain all finite source paths, all raw coefficient positions, zeros, all three directions, the original polygon guards, and both endpoint clauses. No log-concavity hypothesis is hidden in the coefficient equality. The equivalence does not prove either side: `CutGoalA27` remains an unproved reformulation of `Conjecture63`.

The `[20,14,10]` obstruction is an exact compiled arbitrary-word result. Its virtual positions satisfy the `7/9` polygon guards, but the word is proved not to equal any canonical source central word. It is not a source counterexample. The associated source exclusion theorem is about word equality, not a universal assertion that no different word could yield the same polynomial.

## Validation status and stale reporting

| Final module in `research/` | Named theorems | Build | Best recorded replay |
|---|---:|---|---|
| `MarkovCutPartitionA27.lean` | 8 | exit 0, 8.548 s | exit 0, 32.139 s |
| `MarkovCutGapsA27.lean` | 9 | exit 0, 9.150 s | exit 0, 39.605 s |
| `MarkovCutRootA27.lean` | 2 | exit 0, 21.483 s | **exit 0, 36.793 s**, after earlier timeout |
| `MarkovCutObstructionA27.lean` | 5 | exit 0, 20.276 s | **timeout**, 100.208 s |

Records under `evidence/markov-a27f6d42/`:

- Partition build/replay: `run-1792005301056399000.json`, `run-1792005344318403000.json`.
- Gaps build/replay: `run-1792005448819805000.json`, `run-1792005537455973000.json`.
- Root build: `run-1792005535073011000.json`; parallel timeout: `run-1792005637706134000.json`; **later success: `run-1792005749259901000.json`**.
- Obstruction build: `run-1792005536251733000.json`; timeout: `run-1792005637705906000.json`.

All selected records' source hashes and associated source snapshots match the final source. Current source bytes match the archived source and controller receipt. Each current compiled artifact matches the manifest, receipt, and archived artifact bytes. The late successful Root receipt itself also matches its archived bytes and controller change hash.

The manifest was written at `2026-10-14T19:23:03.993663Z`, while the sequential Root replay was still finishing. The success receipt was written at **19:23:06.053535Z**, before the worker timeout at **19:23:23.466282Z**. In the zero-based archived transcript, event 180 completes the finalizer, and event **181 completes the Root replay with exit 0**. This directly explains the manifest's stale `replay: null` and the saved report's “2 kernel replays succeeded.” The final commentary mentions the true parallel timeouts but omits the later sequential success. No rerun or inference from compilation is needed to establish that success.

The Obstruction timeout remains a timeout: it has no return code or completed checker output. No later Obstruction success exists in the reviewed worker evidence. The saved report does not claim four successful replays; its undercount is conservative but should not be mistaken for the latest evidence state.

The controller outcome remains `timeout`, after 1201.326 s, with `report: null` and `mathematical_resolution: false`. A saved research report is not a completed controller submission. Seven rejected elaborations and the two parallel replay timeouts are separately retained; failed drafts' diagnostic `sorryAx` occurrences are not final proof evidence.

Successful final printed main-theorem axiom closures use only `propext`, `Classical.choice`, and `Quot.sound`, sometimes proper subsets. These are recorded checks, not a new exhaustive axiom run. No final source introduces a custom axiom or admission. Validation reused inherited compiled imports; no fresh whole-source rebuild or newly independent kernel replay was performed here.

Final source SHA256:

```
Partition   5f0873d54b80b7a76fb61b62f70d749482ee56b8f843460fe7469dc49817beca
Gaps        72f4bb5dd5700311b595139f25094e27da4693cf215f33514f0b650bc72ecdad
Root        05754d655e2bb3e019858868e88430ea5728cf8fcf9d00323ee5c1415b0afa05
Obstruction 9961c71dc0e79ea491d369f5ea1b311605edfa9b18655d2298ad20a51c0acefc
```

Exact source snapshots, selected records, English documents, and hash comparisons are saved in `markov_worker_000050_audit_evidence/` beside this report. Its `summary.json` distinguishes the manifest from the late replay and records the final stability check.

## Cut recursion and source coefficient equality

The Boolean convention in the sources is `false=A`, `true=B`. The definitions implement the stated two alternatives for a row `(p,q)`:

- Skip A sends the first entry to 0; skip B sends it to `y(p+2q)`; the second entry stays `q`.
- Select contributes `x c_r(p+q)`, where `c_A=1`, `c_B=1+y`, then resets the row to `(y,1)`.

`cutEval_matrixA27` proves that this recursion equals the corresponding ambient matrix scalar for any word and any commutative ring. `cutEval_scalarA27` proves the exact appended-B terminal identity. In particular, the terminal letter is part of the formal expression, not a convention omitted from the coefficient count.

`cutCoeffA27` is the weighted recursion with exactly `s` selected positions. On the empty word, its value is `q` at `s=0` and zero otherwise. `cutCoeff_zeroA27` proves the zero-selection value remains `q` for every word; `cutCoeff_boundA27` proves zero when `s` exceeds word length. `cutCoeff_polynomialA27` proves it is exactly the ordinary coefficient of `x^s` in `cutEval`, without normalization or specialization of the other variable.

`ambient_cut_coeffA27` gives the ordinary bivariate coefficient equality. `source_cut_coeffA27` applies the inherited exact source/ambient identity to **every** finite source path, with only the explicit natural-number indexing relation

\[
i+j=(\operatorname{frame}(path)).mid.a+s.
\]

It proves the raw source coefficient equals the `y^j` coefficient of the cut polynomial for `central28 path ++ [true]`. There is no finite conductor/path bound, no Pell-family restriction, no assumed log-concavity, no positive-coefficient assumption, and no `y=1` specialization. The dependencies inspected (`source_ambient_coeff5c` and its exact source identity) likewise have no conjecture premise. All-rational coverage from generated paths remains an inherited separate correspondence result, as the notes state.

`cutCoeff_nonnegA27` is specifically **scalar** nonnegativity for real `y,p,q>=0`. It is not a theorem asserting coefficientwise nonnegativity merely from evaluations. The English notes explicitly make this distinction. The general-ring identities do not themselves require ordered-ring assumptions.

The finite-subset product expansion is not a separately proved `Finset` identity in these modules. The formal object is the select/skip recursion and its coefficient identity. The notes accurately label the explicit subset formula as tested separately.

## Whole-grid transport and exact root equivalence

`cutRawA27 path i j` uses the cut coefficient at `s=i+j-a` only when `a<=i+j`, and returns zero otherwise. `cutRaw_eqA27` proves this equals the original raw coefficient **at every natural grid position**.

The below-`a` branch is not justified by natural subtraction truncating to zero. Its proof uses the already-proved reduced labels `0<a<b` to show that `i+j<a` contradicts the polygon's lower inequality, and then invokes the inherited exact zero-outside-polygon theorem. Thus this branch records a proved source zero, with no hidden support-saturation premise. The upper support and other zeros remain whatever the exact coefficient equality gives; they are not removed from the statement.

`CutGoalA27` universally quantifies over all paths and reproduces:

1. horizontal triples `(i,j),(i+1,j),(i+2,j)`;
2. vertical triples `(i,j),(i,j+1),(i,j+2)`;
3. diagonal triples `(i,j+2),(i+1,j+1),(i+2,j)`.

Every triple retains its three original `InPolygon` premises, and each inequality uses unnormalized raw integer coefficients. `root_iff_cutA27` rewrites by the exact whole-grid equality. It proves the `0/1` and `1/1` endpoint clauses locally from their degenerate polygon geometry, where no guarded three-point triple exists. Consequently omitting those endpoint clauses from `CutGoalA27` does not weaken the equivalence.

The equivalence is unconditional as an equivalence, but neither `CutGoalA27` nor `Conjecture63` is proved. It is a faithful reformulation, not a log-concavity closure theorem or a conditional proof with its main inequality concealed among assumptions.

## Gap identities and sign scope

The gap lemmas hold over any commutative ring. For a pure B run of length `n`,

\[
R(B^n)=1+2\sum_{k=1}^{n}y^k+y^{n+1}.
\]

For an arbitrary prefix followed by A and then `n` Bs,

\[
R(uAB^n)=1+2\sum_{k=1}^{n}y^k.
\]

The formulas include `n=0`: the empty gap has weight `1+y`, while a gap ending in A has weight 1. The affine/linear dependence on the incoming row and concatenation lemma lead to the exact split-defect identity in the English notes. The two specializations give defects `-y` and `y+y^2`. For positive real `y`, these have opposite signs; no claim of strict opposite signs at `y=0`, or of an order on an arbitrary ring, is needed. This excludes both unconditional signs for that specific local comparison, not any global source inequality.

## Arbitrary-word obstruction: compiled, replay incomplete

`cutBadWordA27=[B,A,B,B,B,B,B]=BAB^5`. Its exact compiled slice at selected count `s=1`, including the appended B, is

\[
8+20y+20y^2+14y^3+10y^4+6y^5+2y^6.
\]

The three ambient coefficients at `(s,j)=(1,2),(1,3),(1,4)` are therefore `[20,14,10]`, with `14^2=196<200`. Under the virtual regrading `i+j=a+s` with `a=7`, these correspond to `(6,2),(5,3),(4,4)`, a source-grid diagonal rather than a source-grid vertical triple. `cutBad_polygonA27` proves all three positions satisfy `InPolygon 7 9`; the earlier failed polygon-exclusion draft is not accepted.

`cutBad_not_sourceA27` proves, for every path, `central28 path != cutBadWordA27`, by using the inherited palindrome theorem and a decidable check that this word is not palindromic. This precisely excludes its identification as a canonical central word; it does not assert a stronger theorem about every possible equality of resulting polynomials. Without the necessary source identification, the arbitrary-word failure is not a counterexample to `Conjecture63`.

These five Obstruction theorems have successful final compilation and standard printed axiom closures. Their separate replay remains timed out and is not upgraded by the simple numerical arithmetic or the successful Root replay.

## Finite experiments and normalization

The separate static subaudit is `markov_worker_000050_finite_audit.md`; no experiments were rerun here.

- The cut expansion compares all 511 Boolean words of lengths 0 through 8. The 174762 count is the number of enumerated subsets of the **appended** words, not a count of coefficient identities. It separately checks 54525 fixed-`s` column triples and records the raw `[20,14,10]` failure above.
- The positive-state and polygon-state probes use **binomial-weighted/normalized horizontal comparisons**, of the form `B·middle²−A·low·high`, and analogous mixed expressions. Their negative numbers must not be read as ordinary raw log-concavity gaps. For example, positive-state triples `[2,11,32]` and `[2,48,676]` have positive raw gaps 57 and 952 although their recorded weighted gaps are negative. The source `1/3` mixed failure has weighted total gap zero, and the arbitrary `BA^9` mixed failure `−432` has positive weighted total gap 118944. These tests reject the stated termwise stronger conditions, not raw source log-concavity.
- The broad second-row statistic envelope admits a nonrealizable sample and reports a failure after 11 checks. The sharper envelope's 3206630 tests are finite. The sparse attempted certificates still contain negative monomial coefficients; this is a failed positivity-certificate attempt, not a source counterexample or a proof of negative values.

There is a precise English qualification in the mathematics document: the paragraph saying the “mixed horizontal gap is negative already for source 1/3” does not state its normalization. For its displayed component data `H=[0,1,1]` and `h=[1,1,0]`, the ordinary raw mixed gap is `2·1·1−0·0−1·1=+1`; only the weighted mixed gap is `−2`. Therefore the sentence is valid with the stronger normalized comparison understood, but false if read as a statement about the ordinary raw mixed gap. The later `BA^9` paragraph explicitly says “weighted gap.” The reports otherwise distinguish these experiments from accepted identities and retain the open global inequalities. No source was edited.

## Final status

The source coefficient transport and exact full-root equivalence are supported by final compilation **and the late successful Root replay**. The only replay-incomplete final module is Obstruction. The validation manifest/report undercount successful replays because they precede that late Root completion; they do not establish a fourth replay.

The pinned root remains unchanged, SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. No full-source log-concavity proof or root refutation is present. No mathematical defect in the final representation/equivalence statements was found.
