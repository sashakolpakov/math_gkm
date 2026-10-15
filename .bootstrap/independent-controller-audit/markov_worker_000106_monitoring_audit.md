# Independent mathematical audit: worker 000106

Request `8ae35b59ea65417ba5e729586edff267`. Read-only review of this completed worker's archived mathematical sources, descriptions, experiment domains and retained validation. No Lean, proof, replay, retry, finalizer or research experiment was executed. No project source was changed, no proposer was contacted or assisted, and active worker 107 was not inspected.

## Finding and exact scope

The entire polygon-guarded fourth lower diagonal is now proved for actual mixed-source paths with **`n≥7,c≥5` and predecessor numerator either `r=2` or `r+1=c`**. The previous predecessor-`r=1` family is inherited. These are actual raw coefficient inequalities, with no remaining formula, gap or positive-coefficient hypothesis. The cumulative exact root equivalence removes these two newly proved regions while retaining every earlier obligation outside the proved regions.

The central source inequalities used in these assemblies are slightly stronger than the headline: they have **no explicit `n≥7` premise**, but assume `2n+6≤j≤3n`, which is first nonempty at `n=6`. The whole-slice conclusions still require `n≥7` through the inherited interval assembly. No full-slice extension to `n=6` is asserted.

The existing seven-position onset **coefficient identity** is extended to `n≥4`. It is not a proof of the onset inequalities for runs 4, 5 or 6. General predecessor central inequalities remain incomplete; checked scalar coefficients and columns are not treated as a completed general gap.

No substantive mismatch was found between the accepted mathematical statements and the accompanying scope reports. Some copied inline comments in `MarkovFourthTwoCompleteM8AE.lean` still refer to a numerator-one or top-predecessor source; its declarations, hypotheses and substantive documentation correctly specify numerator two. Those comments are stale labels, not a different formal theorem.

## Source, coefficients and indices

For an actual predecessor `rest : List Bool`, use

```
c = (frame rest).mid.b,  r = (frame rest).mid.a,
path = List.replicate n true ++ false :: rest,
a = (frame path).mid.a = n*c+r,
b = (frame path).mid.b = (n+1)*c+r,
A(i,j) = coeff (frame path).mid.p i j.
```

The coefficients remain the raw integer numerator coefficients in the established squared-variable representation at the third homogeneous variable equal to one. For the fourth lower slice, an adjacent triple has **`i+j+2=a+4`** and positions

```
((i+2,j), (i+1,j+1), (i,j+2)),
```

with inequality `A(i,j+2)*A(i+2,j)≤A(i+1,j+1)^2`. Its first coefficient index is `j`; `(i,j)` itself is not one of these three points. Natural zero coefficients are retained.

The numerator restrictions concern the **predecessor**, not the final source numerator. The resulting sources have `a=nc+2` in the numerator-two case, or `a=(n+1)c−1` in the upper-predecessor case. They are not the old entire-source numerator-two or numerator-one families. An actual reduced predecessor with `r=2` necessarily has odd `c`; this follows from source membership and is not an omitted extra premise. The scalar algebra below even holds for integer `c≥5` without a parity restriction, but the source theorem quantifies over actual paths.

## Upper-predecessor central inequality

The authoritative source is `MarkovFourthTopCompleteM8AE`, not the uncompiled standalone drafts with overlapping declaration names.

`middle_high_directM8AE` is an integer-polynomial inequality for all **`R,J,E≥0`**. It sets

```
n=J+E+6,  c=R+5,  r=R+4,
j=2*(J+E+6)+J+6.
```

It compares the canonical high-shape values at `j,j+1,j+2`. The inherited three exact value identities are specialized at the appropriate zero chart coordinate; an exact ring identity expresses their complete gap as the sum of nine coefficients times `R^0,...,R^8`. Each coefficient equality and nonnegativity theorem is used, and `R≥0` completes the sum argument. No unproved mixed-term comparison or assumed log-concavity of an aggregate is inserted.

`middleRawValue_top_lcM8AE` then proves canonical-value log-concavity for **integer `n,c,j`, `c≥5`, `2n+6≤j≤3n`**, with predecessor numerator `c−1`. It introduces `J=j−2n−6`, `E=3n−j`, proves their nonnegativity and the identities `n=J+E+6` and the three translated indices. The high-shape branch follows from `c≥5`; `R=c−5` is nonnegative. There is no run-length lower bound besides what follows from the index interval.

`source_fourth_middle_topM8AE` takes natural `n,i,j`, actual `c≥5,r+1=c`, the same central interval, and `i+j+2=a+4`. It invokes the established canonical source identity at each of the three different index pairs, discharges the separate coefficient-degree and range conditions, identifies `c−1` with the actual predecessor numerator, and cancels the common scale `120960`. It assumes neither a polygon guard nor coefficient positivity, nonzero support, a gap sign, or an unproved source formula. The cancellation does not require individual coefficients to have a sign.

## Predecessor-numerator-two central inequality

The authoritative source is `MarkovFourthTwoCompleteM8AE`, which imports the completed upper-predecessor module and its accepted algebraic dependencies.

`middle_two_directM8AE` is the corresponding integer-polynomial inequality for all **`C,J,E≥0`**, with

```
n=J+E+6,  c=C+5,  r=2,
j=2*(J+E+6)+J+6.
```

It specializes the inherited low-shape value formulas at the zero numerator-offset coordinate. The remaining three values are quartic polynomials in `C`. Their complete gap is explicitly identified with nine terms of degrees 0 through 8. The four new `middle_two_gap_eq/nonneg` coefficient pairs and the other accepted coefficient pairs prove every term's required sign. This is a complete proof for this specialization; it does not depend on a full general low-chart gap theorem.

`middleRawValue_two_lcM8AE` holds for all integer `n,c,j` with `c≥5` and `2n+6≤j≤3n`. It uses `C=c−5`, the same `J,E`, and the low branch `2*2<c`, including the boundary denominator `c=5`. It does not require a separate parity or coprimality hypothesis at the scalar level.

`source_fourth_middle_twoM8AE` uses actual `rest`, natural `n,i,j`, `c≥5`, **`(frame rest).mid.a=2`**, the central index interval and the exact slice equality. The three canonical source identities are proved with the needed indices and then rewritten using the actual numerator equality. Again, only the common constant scale is canceled; no formula, gap, positivity or polygon assumption remains. Actual even-denominator labels with numerator two are not new admitted sources: no such reduced predecessor path satisfies the numerator equality.

Both central inequalities include the natural zero cases. Their displayed interval implies `n≥6`, so the declarations genuinely cover its nonempty `n=6` case. The final full-slice/root-region definitions conservatively retain the `n≥7` hypothesis of the inherited full-slice equivalence.

## Whole-slice and cumulative root equivalences

`run_fourth_topM8AE` assumes `n≥7,c≥5,r+1=c`; `run_fourth_twoM8AE` assumes `n≥7,c≥5,r=2`. Each proves `RunFourthLCM94 n rest` by applying the existing exact `run_fourth_iff_centralM253` and supplying the newly proved central raw inequality. The full-slice predicate retains all three original polygon guards and `i+j+2=a+4`. The inherited prefix, five onset starts, final interval and polygon-derived upper bound are accounted for by that exact equivalence. No remaining central inequality is assumed in either family theorem.

`root_iff_coreTopM8AE` rewrites the inherited worker 105 root equivalence and adds exclusion of the explicitly proved upper-predecessor fourth-slice region. `root_iff_coreTwoM8AE` then rewrites that exact equivalence and additionally excludes the explicitly proved numerator-two region. Each new region includes an actual path decomposition, `n≥7,c≥5`, the fourth-slice equality and its predecessor numerator condition.

The horizontal and vertical residual clauses and their polygon/degree guards are unchanged. The diagonal residual keeps all three polygon guards, inherited total-degree/slope clauses and every earlier initial/final/onset/numerator-one exclusion, then adds the two new exclusions. The reverse proofs split on the new region and invoke the corresponding whole-slice theorem with the original polygon guards; all other cases pass to the retained residual. Thus the root has not been weakened by assuming away unproved regions. Endpoint obligations remain carried by the inherited exact root equivalences.

The new residual is not itself proved. General predecessor central intervals, other applicable small-run/small-predecessor cases, higher slices and axial interiors remain open. This worker does not newly establish all published rational-index coverage, source-family identification, homogeneity recovery, or a fresh proof of the complete inherited dependency tree.

## Seven-position source identity for smaller runs

`source_fourth_second_onset_valueM8AE` assumes natural `n,i,k`, actual `c≥5`, **`n≥4`, `1≤k≤7`**, and

```
i+(2*n+k)=a+4.
```

It proves

```
120960*A(i,2*n+k)
  = secondOnsetValueM5DC n c r k.
```

It applies the previously proved corrected source identity, with both bounds `n+5≤2n+k≤3n+3` discharged from these assumptions. The boundary cases `n=4,k=1` and `n=4,k=7` are included. For offsets 1 through 5 it uses the proved explicit correction formulas; for offsets 6 and 7 the correction is proved zero. There is no division/nonzero-evaluation condition and no skipped coefficient support case.

This is a broader **identity** than the earlier `n≥7` adapter. The accepted theorem does not lower the onset log-concavity bound from seven to four, does not turn the saved threshold probe into a Lean theorem, and does not prove a complete smaller-run slice.

## Partial general algebra and accepted scope accounting

The accepted inventory comprises 87 mathematical modules and 227 named theorem declarations. Static parsing of the selected sources separates:

| Accepted component | Modules | Named theorems | Definitions |
|---|---:|---:|---:|
| Two completed family/source/root modules | 2 | 10 | 4 |
| Broader onset source identity | 1 | 1 | 0 |
| Horner bases and import assemblies | 12 | 105 | 105 |
| Checked gap columns | 11 | 11 | 11 |
| Scalar gap certificates and import assemblies | 61 | 100 | 50 |
| Total | 87 | 227 | 170 |

These are not 227 new source regions. The base equalities rewrite existing coefficient polynomials into Horner form. Individual gap equalities and signs, and the accepted columns, are valid algebraic helpers with their own hypotheses; they do not by themselves establish the unassembled general source gap. Some selected modules are import-only assemblies with no own theorem declarations.

The general chart, scalar all-predecessor inequality, general source/full-slice/root candidates are not accepted results. Standalone top/two drafts duplicate names consolidated in the authoritative `Complete` modules; they are not additional accepted proofs. The retained inventory distinguishes these candidates from the checked modules. Exact excluded/build/replay counts are recorded in the supporting validation audit rather than inferred from filenames.

## Finite and symbolic evidence

The central experiment uses reduced `1≤r<c`, **`5≤c≤17`** and **`n∈{7,13,26}`**. Independent input/index enumeration, without running the research coefficient code, reproduces every saved input and count:

- 270 parameter cases;
- 3,600 coefficient positions `2n+6≤j≤3n+3`;
- 2,790 polygon-valid central triples `2n+6≤j≤3n`;
- 30 literal recurrence comparisons in six cases with `n=7`, `c≤6`, namely predecessor labels `1/5,2/5,3/5,4/5,1/6,5/6`.

The smaller-onset experiment uses reduced predecessors with **`5≤c≤13`** and **`n∈{4,5,6}`**. Its saved input array and counts independently match:

- 156 cases, chart counts 51, 27, 51, 27;
- 1,092 coefficient positions, seven per case;
- 780 valid onset triples, five per case;
- 42 literal recurrence comparisons at `n=4` and the same six predecessor labels above.

The two disjoint run domains therefore account for the reported 4,692 coefficient comparisons, 3,570 valid triples and 72 literal comparisons. Literal comparisons cover only twelve parameter cases, not every tested source. Both saved zero counts are zero; those coefficient values were not recomputed in this audit, and their absence from the finite samples does not impose a restriction on the formal source statements.

The threshold probe contains 140 recorded chart/start/base cases, obtained by substituting `N→N+(n_base−7)` into inherited onset-gap polynomials. Its saved rows report 20 of 20 coefficientwise-nonnegative expressions for each `n_base=3,...,7`, 18 of 20 at 2 and 7 of 20 at 1. These summaries were recounted from the saved rows only. They are not accepted Lean gap proofs, and a negative expansion coefficient does not imply a negative polynomial value or a source counterexample.

The complement probe reports that the high-chart gap minus the low-chart gap with its two parameters exchanged has 3,432 positive terms and no negative terms, and each of the three value differences has 392 positive terms. This remains a symbolic experiment; no corresponding general source comparison theorem is accepted here. No symbolic or numerical calculation was rerun for this audit.

## Validation and timing

All 87 selected mathematical modules have matching successful final-source builds and alternate union replay. They include 14 import-only assemblies; the other 73 contain the 227 theorem declarations and 170 definitions above. Three successful Audit builds print 148, 206 and 227 names: 581 printed rows cover exactly the 227 distinct accepted names, with permitted standard axiom closures only. The fourth Audit (`BaseAudit`) timed out and has no object; it contributes no successful audit coverage. Audit compilation is separate from replay of the mathematics it imports.

All **531 controller artifacts** and **528 indexed artifacts** match the archive, current bytes and recorded hashes. The three unindexed controller artifacts are the index itself, `final-check.json` and the expected later verifier output `last-verification.json`. All 304 worker 105 artifacts and 314 preservation inputs remain unchanged; 301 reconciliation and 314 initial-hash checks also match. These counts overlap. No current extra artifact, pending command or unarchived validation result was found.

The archive contains 174 new Lean sources: 87 selected mathematical sources, 83 excluded unbuilt mathematical drafts and four Audits. The excluded drafts have no successful final-source build or object. They include 53 pending coefficient-gap files, eight columns, six general chart/source/residual candidates, eight duplicate standalone drafts and eight import assemblies. None is used as an accepted general source theorem.

There are 107 actual Lean validation invocations: 103 builds (90 successes, six errors, seven timeouts) and four successful unions. Seven rejected builds are superseded earlier versions of selected modules; five attempts concern excluded mathematics; the final timeout is BaseAudit. The foreground general pipeline also records eight skipped, uninvoked queue entries at its time budget, which are not additional Lean failures or pending live jobs.

The four unions select 12, 16, 48 and 15 modules: 91 selections, **87 distinct targets**, because four Base3 modules repeat at identical hashes. There is no direct or inherited recovery replay. Every accepted source has a matching successful build before its replay. The 48-target union took 242.674 seconds using the earlier 300-second wrapper; events 224–225 preserve that wrapper and change the limit to 140 seconds for the final 15-target wave. The final wrapper must not be applied retrospectively to the earlier run. The kernel replay drivers themselves are unchanged.

Finalizer event 242 and verifier event 244 both succeed. The finalizer writes validation and the 528-file index; the verifier checks all indexed hashes, selected source/replay/axiom bindings and 314 preserved inputs. Final report event 245 matches `final.json` and the controller report, followed by `turn.completed` at event 246.

| Historical boundary | UTC on 2026-10-15 |
|---|---|
| Controller start | 19:54:16.598663 |
| Last union receipt timestamp | 20:22:45.285783 |
| Validation mtime | 20:23:20.533414 |
| Final artifact-index mtime | 20:23:23.403776 |
| Latest changed project artifact, final verifier output | 20:23:30.986554 |
| Complete event-log mtime | 20:24:03.362589 |
| Activity records the full 652,787-byte event stream | 20:24:03.968747 |
| `final.json` mtime | 20:24:04.315722 |
| Nominal 1800-second deadline | 20:24:16.598663 |
| Controller finish | 20:24:20.856557 |

The controller reports **completed**, return code 0, with elapsed 1804.2578942775726 seconds. Its finish is 4.257894 seconds after the deadline, but all changed project artifacts, the full stream containing the final report and turn completion, and `final.json` predate it. The latest changed project artifact is 45.612109 seconds before the deadline; `final.json` is 12.282941 seconds before it. This supports the completed status and does not support relabeling the run as a proof timeout or claiming post-deadline mathematical checking. Event lines lack individual independent timestamps, so the chronology relies on full-byte activity and file timestamps rather than an invented per-event time. `completion` remains null and `mathematical_resolution` false.

Static source import bases for the four successful unions contain 5, 948, 976 and 27 resolved modules, all transitively target-free, without observed explicit-name collisions or cycles. Imported new dependencies have earlier successful replay coverage. The 83 excluded drafts and still-unreplayed old Gap3 modules do not occur in these bases. These checks do not independently identify every generated/private constant or binary import table. The procedure loads inherited compiled imports; retained source/object hashes do not measure exact loaded object bytes at invocation. Kernel replay, ordinary compilation and axiom output remain distinct evidence. No official LeanChecker CLI check or fresh whole-source dependency rebuild is claimed, and no missing mathematical or validation work was completed by this audit.

## Archived source anchors

- `MarkovFourthTopCompleteM8AE.lean`: `0f25fc7ab2f362093147e93adbe975d25a7e7913a7f8eb2214f0981c3e5f501f`.
- `MarkovFourthTwoCompleteM8AE.lean`: `eccf88fb6d3ae174adfc459472e4d0bf002efc1232867a2e8db95cc7ceaebcb9`.
- `MarkovOnsetSmallSourceM8AE.lean`: `8cde72b63e53ac5ca5e140464523ae55a7c2c42c3470b619a2e85279760afeaa`.
- `experiments.json`: `06ce18c53b37cdd19a1aa458c73aa6fe573755f74d1fb647f210b60007f813f4`.
- `small-onset-experiments.json`: `04bee566199efa2fb544b207d392ee0e6e5dff2a874f2a3768071236f808a474`.
- `threshold-probe.json`: `e1b0dc6edabc54b50e9e2cf0ee580b92e561403255e5dc21a42be92235abf886`.
- `complement-probe.json`: `8c5eeae626a67b87997c4cdb1ef1f8a2941bae70dd4b3a5c5dea61c082cb9140`.

These identify audited historical versions, not additional proof or experiment executions.

## Supporting records

- `markov_worker_000106_validation_audit.md`: SHA-256 `b86d9c6b29e37f8ad736a20332c2ec78ceb94090233e197c9d228daed809c96f`.
- `markov_worker_000106_validation_evidence.json`: SHA-256 `25d97887beeb86d3f41e06559b58596237efc90f9b9d0a3ecdc1910be46fe4ef`.
- `markov_worker_000106_replay_method.md`: SHA-256 `e62e08ef0ea3bf07835e71e33b020732f86a80e0cb07f42ad4f637b6a84f1371`.
- `markov_worker_000106_replay_method_evidence.json`: SHA-256 `85e22aaca6b08acdd47eb519987ffa9f91307bb47394e384ea456e5f33a29cae`.

All 1,707 directly recorded supporting inputs were stable at `2026-10-15T20:33:45.119530Z`. Historical source graph reuse is bound to predecessor records and before hashes, not a new whole-tree proof execution. The main audit and all supporting records were written only under `/private/tmp`.
