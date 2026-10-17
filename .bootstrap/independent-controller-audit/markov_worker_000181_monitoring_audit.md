# Closed worker 000181 — independent monitoring audit

Request **5bf6837d0c5b4b818f68c99f57ad498a**; archive **/Users/sasha/math_gkm/.control/markov/workers/000181/artifacts**, evidence **markov-5bf6837d**. Historical receipt: **completed / return code 0 / structured report delivered**, elapsed **1063.704658985138 seconds**, mathematical resolution false and completion null. Full pinned Conjecture63 remains open.

This round proves a genuine unconditional source result: **for every actual Farey path with numerator a=3, every natural i,j satisfying 2j+1≤b has raw horizontal log-concavity at (i,j),(i+1,j),(i+2,j)**. There is no denominator bound, positive-coefficient hypothesis or unresolved auxiliary premise. Zero coefficients remain included. The proof closes the entire previously conditional correction band, removing its prefix/tail column restrictions. It also retains the previously proved lower rows and exceptional row5.

The new exact reduction is **Conjecture63 ↔ ThreeUpperResidualM5BF ∧ OtherFourM9E2**. Both residuals remain unproved. Numerator-three horizontal work remains where **j>q+3, b<2j+1, j≠5**; the prior vertical and diagonal clauses remain verbatim. OtherFourM9E2 is unchanged for actual numerators at least four. No full-root theorem or refutation is claimed.

The auxiliary achievement is universal **strictly positive variance drift** for natural j,s,h with **1≤h≤j**. It closes PositiveParameterTailM1C6, UpperAdjacentMA45, UnshiftedAdjacentM09F, UnshiftedRatioM09F and SharpCompleteMarginMBE3. Strictness is an auxiliary result; the raw source conclusions remain non-strict and include zeros. Eight selected modules contain **39 theorems and eight definitions**; final validation and inherited limits are detailed below.

## Observation and independence

The first and only receipt-only read found closure at **2026-10-17 07:24:23.004270 UTC**. Receipt **14,447 bytes**, SHA **f903b2a707b7cddf85f5a7373251c92df015f0b9156543de686f99b9d69e5e98**. No waiting or repeated polling was needed. No active181 source/event read preceded closure; active182 and later work remain excluded.

All eight final Lean bodies, three final experimental Python scripts and the archived initial outward script were read in full. Final mathematical, correspondence, operational and next prose were read; checkpoints are identity pins. Five explicitly named inherited Lean bodies were reread to check the source/root attachment; the inherited moments helper was read to establish its return convention. Earlier proof reviews are reused only with explicit identity and historical-status qualifications.

Own helpers perform static parsing, hashing, literal record comparison and index-domain counts. **No project program, Lean/compiler/proof/checker/replay/finalizer, experiment, generator or CAS is executed or imported. No coefficient, binomial, polynomial, kernel, moment, variance, gap, sign or RNG value is recomputed.** No project edit, proposer contact, research help or new literature search occurs. Writes are restricted to the temporary audit directory. Earlier seals and bounded observation windows remain unchanged.

Primary bindings cover **568 named older mathematical sources,182 historical pending/compiled-only/other-status sources, two operational files,106 inherited scripts, five result JSONs and eighteen external source/object pairs**. Static expected identities come from sealed180 and the current initial inventory; current bytes do not supply their own expected digest.

## Exact auxiliary kernel and exceptional rates

The inherited reversed kernel is

**K(j,s,r)=w(r)·fall(j,r)/fall(s+j+3,r)**,

where w(0)=1 and w(r)=4r for positive natural r. K is strictly positive when r≤j. Define, for h≤j,

**S_h=Σ_(r=0)^h K(r)K(h−r)**,
**T_h=Σ_(r=0)^h (r−h/2)²K(r)K(h−r)**,
**v_h=T_h/S_h**, and **z=s+j+4−h/2>0**.

The inherited source proves positive S_h, including h=0, and 0≤v_h≤h²/4. Natural subtraction h−r and h−1 is used only with the corresponding range bounds. The drift is

**D(j,s,h)=(z+1)v_h−zv_(h−1)+z/4**.

New birthRate has a genuine exceptional value:

**b(0)=4j**, while for r>0, **b(r)=j−r−1+j/r=(r+1)(j−r)/r**.

kernel_birthM5BF proves **(s+j+3−r)K(r+1)=b(r)K(r)** under **r<j**. It treats r=0 separately and proves all needed falling-factorial/real denominators nonzero. It does not substitute the positive-index expression at zero or extend its kernel relation beyond the stated range.

For natural H,t, define **B(t)=b(t)+b(H−t)**. Reflection is proved for t≤H. If H>0, the endpoint value is **5j−H−1+j/H**. For 0<t<H the interior value is **2j−H−2+jH/[t(H−t)]**. The source proves every interior value lies below the endpoint and proves B is nondecreasing with **(t−H/2)²**, for all natural j,H and t,u≤H. Endpoint cases and H=0 are explicitly covered. The interior argument uses positive t(H−t), not a continuous approximation or an assumed distribution shape.

## Finite covariance and both exterior endpoints

weighted_covarianceM5BF is a generic finite theorem. It assumes **w(i)≥0 for i<N** and that b preserves the ordering of x on that finite range, and proves

**(Σwx)(Σwb)≤(Σw)(Σwbx)**.

Its proof expands the finite double sum **Σ_iΣ_k w_iw_k(x_i−x_k)(b_i−b_k)≥0**. N=0 is allowed; there is no division, probability-normalization premise, or unstated positivity requirement on b.

outward_sumM5BF is an exact reindexing identity for arbitrary natural H, real y, f:ℕ→ℝ and F:ℝ→ℝ. Splitting the range H+2 at its two ends retains both terms at the new exterior positions **−H/2−1** and **H/2+1**. Range membership justifies H+1−(t+1)=H−t and the casts; the natural subtraction is not silently treated as integer subtraction outside its range.

For the actual kernel, take **H=h−1**, **y=s+j+4**, and define

**R=Σ_(t=0)^H B(t)K(t)K(H−t)**,
**Q=Σ_(t=0)^H B(t)K(t)K(H−t)(t−H/2)²**,
**E=2yK(0)K(H+1)**.

Under **H<j**, rate_product converts the birth relation to the shifted summands. Applying the generic outward identity with F=1 and F(x)=x² proves exactly

**R+E=2zS_(H+1)**,
**Q+E(H/2+1)²=2(z+1)T_(H+1)+(z/2)S_(H+1)**.

The two exterior endpoints contribute E. They are not zero or discarded. Under H≤j the actual kernel weights are nonnegative and the radial order supplies the covariance hypothesis, giving **T_HR≤S_HQ**. The proof uses explicit finite sums; its probability interpretation in prose is motivational rather than an extra formal premise.

## Universal positive drift and closed auxiliary propositions

The inherited bound v_H≤H²/4 and positive S_H imply **T_H≤S_H(H/2+1)²**. Since E≥0, the covariance inequality remains valid after adding the outside-endpoint contribution. Substitution of the two exact mass/moment equations gives nonnegative momentDrift. Its inherited identity with **S_(H+1)S_HD** and strictly positive masses then gives **D≥0**.

MarkovDriftStrictM5BF strengthens both endpoint facts: **E>0** for H<j, and **H²/4<(H/2+1)²** for every natural H. Thus the same argument gives **D>0** for all natural j,s,h with **1≤h≤j**, including h=1/H=0. j=0 has no h in this domain. No claim about h=0 drift is substituted for the theorem.

The inherited reversed-gap identity and positive factors y³(y+1),2z+1,S_h,S_(h−1) then yield the strict reversed comparison

**C(j,s+1,s+1,h)C(j,s,s+2,h−1) < C(j,s+1,s+1,h−1)C(j,s,s+2,h)**.

This is an auxiliary convolution inequality. It is not an assertion that every raw source triple is strictly log-concave.

The nonnegative theorem closes PositiveParameterTailM1C6 outright. Its previously proved exact equivalence supplies UpperAdjacentMA45; inherited equivalences supply UnshiftedAdjacentM09F and UnshiftedRatioM09F, then SharpCompleteMarginMBE3. The lower/cutoff/final adjacent steps, interval positivity and zero tails remain part of that inherited assembly. Ordered comparisons are not inferred by dividing through possibly zero coefficients. Previous s0 and fixed-deficiency proof modules remain inherited checked dependencies; no old historical receipt is backdated.

## Actual source attachment and complete half-plane

source_band_allM5BF instantiates the inherited source_band_of_upperMA45 with the now-proved global auxiliary proposition. For natural q,k,i and Boolean r, it assumes only **q≥2** and **2(q+k+1)+1≤sourceNME9C(q,r)** and concludes literal raw horizontal LC at row **j=q+k+1**, every natural i.

Here **b=3q+1 when r=true**, and **b=3q+2 when r=false**. The inherited classification proves every actual path of numerator three is **false^(q−1)++[true,r]** with q≥1; it proves the exact cubic/source polynomial and every raw coefficient identity, not only a finite rational sample. source_three_rawM9E2 supplies this identity at all natural indices, including outside-support zeros.

**FullBandRegionM5BF(q,r,i,j)** is exactly **q≥2 ∧ q<j ∧ 2j+1≤b**. Its definition does not depend on i. Setting k=j−q−1 under q<j reaches source_band_all. This removes the old prefix condition i≤5 and strict-tail condition b<i+j+q; no auxiliary sign premise remains for the omitted middle columns.

source_lower_halfM5BF assumes q≥1 and2j+1≤b. If j≤q+3, it applies the inherited lower-and-three-corrections theorem. Otherwise the explicit two residue formulas force q≥2, allowing the full-band result. This includes q=1 through the inherited small cases, without applying a q≥2 adapter illegally. source_lower_half_pathM5BF then states directly, for every actual path with a=3,

**2j+1≤b ⇒ coeff(p,i,j)coeff(p,i+2,j)≤coeff(p,i+1,j)²**, for every natural i,j.

The source coefficient is the original integer squared-variable numerator coefficient, with w=1 and no factorial/binomial normalization. All auxiliary scales are canceled only through established positivity. No extension above the band is inferred by truncating a negative smoothing exponent to a natural number.

The theorem has no polygon premise, so it includes every original polygon-valid horizontal triple in these rows. The unchanged polygon is **ab≤bi+aj** and **i+j≤a+b−1**, checked at all three points in the root. The root's 0/1 and1/1 endpoints and previously closed a=1/a=2 portions remain covered by the inherited equivalences. No new global published-polynomial or polygon-support correspondence theorem is claimed.

## Exact remaining root clauses

root_iff_beyond_full_bandM5BF first replaces the former band exclusion by the entire FullBandRegion. root_iff_upper_residualM5BF gives the simpler exact residual, both through inherited root_iff_beyond_thirdM964.

For every natural q≥1 and Boolean r, **ThreeUpperResidualM5BF** requires:

- Horizontal LC for every natural i,j with **q+3<j, b<2j+1, j≠5**.
- Vertical LC at **(i,j),(i,j+1),(i,j+2)** outside the already solved region **((i=3 or i=4) and j+1≤q) or (5≤i≤8 and j+2≤q)**.
- Diagonal LC at **(i,j+2),(i+1,j+1),(i+2,j)** outside **3≤i≤6 and j+2≤q**.

The V/D clauses are copied verbatim from the inherited residual. In both directions of the new iff, the H cases split at2j+1≤b versus b<2j+1, and the omitted lower/three correction rows and exceptional row5 are already proved. Original zero/endpoint/polygon scope follows through the unchanged root equivalence; it is not replaced by an assertion only about positive entries.

**OtherFourM9E2** still requires GlobalLC18 for every actual path with numerator at least four. Neither new residual conjunct is proved. The root statement is an equivalence, not a proof of its left side.

## Formally refuted shortcut, without a source counterexample

The stronger quarter-drop shortcut **v_(h−1)≤v_h+1/4** is false. MarkovDropObstructionM5BF formally certifies

**v(22,5,21)=2668474283/272959244**,
**v(22,5,22)=4129805/433571**,

and proves **v(22,5,22)+1/4<v(22,5,21)**. The retained experimental difference is **−29452398023/29586803095081**. The same source proves the required drift is **281228064706395/29586803095081>0**. These exact constants were read and bound to checks, not evaluated by the auditor.

The obstruction is to an auxiliary stronger inequality. It is not a counterexample to the newly proved drift, a raw source triple, or Conjecture63. No source-level failure is inferred.

## Finite evidence and failed helper interpretation

All counts below concern index domains, saved labels or stored list lengths. No mathematical value or random sequence is regenerated.

- The deterministic source identity scan uses q=2..15 plus24,35,50 and both residues: **34 source labels,228 band rows,18,334 coefficient positions** at i=0..b+5. The **8,181 zeros** are saved outcomes. A broader scan has52 saved distinct labels, including both endpoints and random length-six paths, with **56,667 H +56,667 V +57,157 D=170,491 polygon-valid triples**. These domain counts are independently recounted from stored labels and all three polygon guards. There are57 planned appended polynomial slots before deduplication; no source polynomial or random path is reconstructed.
- The outward experiment has a deterministic grid j=2..39, s∈{0,1,2,7,25,1000}, h=1..j: **4,674 cases**, with63,954 birth-index checks,59,280 adjacent radial-order comparisons and9,348 moment identities. It appends100 seeded random parameter triples, j=40..199,s=0..99,h=1..j. Every one of the initial run's4,774 failure rows records its parameter triple; the prefix equals the deterministic grid and the saved100-case tail lies in the stated domain. Counting those saved domains gives **70,800 birth checks,66,026 radial comparisons and9,548 identities**, matching both initial and final counters. The final run does not save its complete case list, so matching loop/seed text and counters are not an independent authentication of its exact random draw sequence.
- The drop probe covers j=2..100, eight specified s values, h=1..j: **40,392 checks**. It retains only its first20 failures;20 is not the total failure count. Its minimum, witness and rational values remain saved evidence only.

The initial outward script misread the inherited moments helper. That helper returns **(mass, Σr(h−r)weights, variance)**; its second component is not the centered second moment. The initial script treated it as one and saved4,774 moment-test failure rows. The corrected script sets **T=S·v** and **U=P·u**, and its saved result has no failures. Formal finite-sum proofs are separate from both experiments; the failed run receives no mathematical credit.

The record captures initial execution98, explicit byte copies of the initial script and JSON at107/108, edit109/111 and corrected rerun112/113. These are retained **pre-edit copies**, not a later reconstruction. Literal comparison identifies the changed return handling and stdout projection. Despite prose about displayed truncation, **raw event98 contains the complete initial JSON**, matching all4,774 failure rows. Event39 fully matches drop-probe.json; event80 matches the source projection without labels; event113 matches the final outward projection without failures plus failure_count=0.

All three final scripts and the initial script were read and AST-parsed only. probe_drop performs top-level work if imported; main guards on other scripts do not authorize executing their imported dependencies. The auditor imported none. The capability record reports Python3.14.6, no Sage/SymPy, and GAP found but not invoked; no installation, tool invocation or literature search is performed by this audit.

## Validation, versions and inherited limits

All **eight selected mathematical modules**, containing **39 theorem declarations and eight definitions**, have one final-source successful build each. The16 compiler attempts comprise **nine successes** (eight mathematics plus Audit) and **seven return-code1 failures**, with no timeout. All successful snapshots are final-identical. There is no additional current compiled-only, timeout-only, unbuilt or excluded mathematical module.

Every rejected snapshot differs from final bytes, while its imports, declaration-name set and common theorem headers agree modulo whitespace. Literal diffs and diagnostics are retained; failed proof attempts receive no accepted-version credit. No same-module build intervals overlap, no final source mtime falls inside its own compiler interval, and no recorded completed same-source edit lies between compiler start/completion. These are bounded recorded observations, not proof of atomic compiler reads: wrappers snapshot then compile a live named path without locking it.

Final source/object associations agree across archive/current/controller/manifest, successful snapshots, raw validation, kernel and Audit maps. Object digests are later observations; compiler receipts do not authenticate the object at production time or exhaust every optional module part. Replay maps precede invocation, Audit maps follow its compilation, and checker digest follows subprocess return.

**kernel-1792221517779394000.json** successfully replays all eight final selected sources with **47 guarded constants** over **three direct imports including implicit Init**. The Audit source **MarkovAudit1792221517780791000M5BF** and successful build1792221517780875000 produce **axioms-1792221530359100000.json**. All39 explicit print names match exactly, without duplicates, and all report only **propext, Classical.choice, Quot.sound**. Eight definitions are replayed constants, not additional theorem closures.

Kernel estimated interval is **07:18:37.779394–07:18:50.000799 UTC**; Audit compilation **07:18:37.780875–07:18:50.356381**. They overlap. Saved epoch filenames plus durations provide these estimates; the axiom JSON name is a later write time, not compiler start. Exact source maps and command/output associations establish coverage independently of timing.

Validate, Audit and the isolated checker are exact180 retags; removing the later guard leaves the retained110 ordinary replay body. Checker SHA **560d974ecd228cba7bf08f8bada902c7a27f4934256ba6efe70855cdfde255df**. It rejects every collected MathGKM.Markov name ending M5BF that is already in the imported base, unsafe or partial. Observed47 matches the explicit inventory. Differently named generated/private/equation constants and optional ordinary/server/private module parts retain ordinary replay limits. No imported body is freshly replayed merely by importing it.

The inherited graph has **2,782 source/object pairs**: sealed180's2,771 inherited bindings plus eleven accepted180 modules. The selected closure has2,790 nodes, or2,791 with Audit. Direct inherited roots are **FixedZeroClosedM1C6** and **VarianceContractionM1C6**, plus Init. OutwardRates, RadialCovariance and OutwardMoments each import2,774 inherited modules; the other five selected endpoints import2,782. Of568 named older mathematical comparisons,430 are imported and138 are comparison-only. MomentObstructionM1C6 is the one accepted180 module outside this chain; older weight branches and compiled-only DetTestMBEC remain outside and receive no new validation credit. The inherited180 RisingConvolution live-build overlap and FixedZeroClosed natural-subtraction correction remain qualified by that sealed audit; importing the selected final bytes does not erase its historical provenance limits.

Every endpoint still imports the **212 unrecovered worker121 modules**, including the195 subset, plus the separate19 historically accepted modules. WindowLC retains its empty-checker/two-print boundary (runInterval_cross6d34 and runInterval_smoothed_lc6d34), without a new crossLC_balanced6d34 print. Abel retains its distinct source/object/two-print boundary (tail_weight_nonneg65c4 and centered_weight_nonneg65c4), without a new crossLC_center_weights65c4 print. Worker166 completed at the host while its combined replay timed out; its seven compiled/printed prefixes remain unreplayed and absent here, with only CorrectionFactor contributing. Worker156's timeout/157 recovery,171's missing_or_malformed_report/return1/null report, and all older failed/pending/replacement qualifications remain historical. **No fresh whole-source rebuild of these inherited bodies occurs.**

Raw validation retains the180 schema: modules→{source_sha256,build_receipts[],olean_sha256}, kernel_replays[], axiom_audit, closures, allowed_axioms, rejected_builds, limits and completion. An audit compatibility view is separately labeled. The finalizer now adds a **raw whole-word sorry/admit/native_decide/axiom scan, including comments**, and asserts every recorded axiom set is permitted. It still selects unsorted current-source successful build matches, samples objects afterward, requires one successful exact selected-set/current-source kernel record and an exact full selected-source axiom map, but does not itself assert exact theorem-name coverage, raw Audit object/stdout linkage, checker identity or success-marker text. The unchanged Audit wrapper and independent comparison establish those actual links here.

All **21,874 initial inputs** match without owned exemptions. Setup and checkpoint1 are included even though absent from controller-before181. Suffix filtering excludes ordinary objects, caches and .g/.sing/.txt; separate docs are outside this read set. All110 predecessor-manifest identities match. Setup's recorded flags/mismatch lists are distinguished from its generic assertions. Reconciliation of127 historical171 paths and raw events supplies preservation, not a new replay or proof of the cause of171's host failure.

The finalizer writes validation before its preservation assertions, checks fixed root/canonical-contract hashes, and computes/reports artifacts_verified=true without separately asserting that field. It provides no later-write lock. last-verification.json has no manifest/validation digest fields; the audit binds those independently. One invocation completes at event168. Its full stdout equals the retained verifier. Delivered report170 equals final.json and receipt.report, followed by turn.completed171. There is no retained evidence report.json draft or final-check.json. All78 started items among171 events are matched; stderr is empty and activity accounting agrees with712,239 event bytes.

Host starts **07:05:21.601496 UTC**, nominal1800-second deadline **07:35:21.601496**, and finishes **07:23:05.306154**. Stored elapsed1063.704658985138 differs from timestamp subtraction1063.7046580314636 by **9.5367431640625×10⁻⁷ seconds**; this rounding-scale difference is preserved. Host finish precedes deadline by **736.2953419685364 seconds**. Final.json mtime is07:22:34.920022; event-log mtime07:22:33.333263. Last selected mathematical build finishes around07:17:37.128676. Original execution/artifact clocks remain distinct from archive-copy metadata, and no cause is inferred for report-to-host delay.

Pinned root SHA **8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe**; canonical contract **6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc**; raw contract **cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068**. Validation SHA **c569f9ba64db38dde752336cde58186dd3df238889536af2b1ca05d0cc0196b3**; manifest **581a479a111dcec6dfb4f2f2d833d39e34839bfda14b4a891b9fbd709dcd3a22**; verifier **02c8cc6f8f908d175d3cff06d94103629128aaa2553d11f074acafd94cde1385**.

## Retention and final bounded observation

Controller/archive inventories agree at **81 files**. All **79 manifested paths** are archived; the manifest and verifier are the two archive-only administrative records. There are **zero manifest-only files**. Exact current-request scope has **82 paths**, adding one unindexed/unarchived opaque cache:

**research/__pycache__/validate_5bf6837d.cpython-314.pyc**, **5,808 bytes**, SHA **8e1e2fc6c828609014eb63a77bfc9c98573e72d9ce6516f8d2125a84d426ae69**.

Its exact bytes are retained under **/private/tmp/math_gkm_godel_20261013/markov_worker_000181_unindexed_cache_bundle/**, preserving that relative path. Companions are **markov_worker_000181_unindexed_cache_bundle.json**, SHA **4bca7c2468d04d3f05aa921f5792f603fd054a4c0e2c1ddf1bffabfcaa16d202**, and **markov_worker_000181_unindexed_cache_observation.json**, SHA **53abb8f620456b6943359bb08890dc7415325239501cd7a1a3e1316dcf306391**. Bytes/mode/uid/gid/mtime match. No cache decoding, import or execution occurs; its name, observed mtime and discovery do not establish creation time, producing process, source version or successor attribution.

Initial exact inventory is **07:29:51.720564 UTC**. Cache metadata observation is **07:32:13.986361–07:32:13.986780**; copy interval **07:32:13.986923–07:32:13.987365**. These are distinct observations. Original archive/controller/index remain unchanged. The three180 caches and earlier179 supplement remain in their existing sealed retention, without recopy, reindexing or historical observation upgrades. The separate0720 storage operation concerns byte-identical sealed179–180 copies only and does not alter181 mathematics or any old proof status.

Audit-only refinements remain explicit: the first primary static pass succeeded; V's comparison initially stopped before writing on a full-record versus failure-list-omitted projection, then used exact projection plus stored length. M corrected a pre-write support-count adaptation. The fresh sealer's source-mtime overlap map and attempt-overlap list were distinguished, and a retagged1810 literal was corrected to the exact1800-second request before any execution. No project byte, mathematical value or earlier sealed audit was changed by these adjustments.

The independent inherited-pair pass freshly hashes all2,782 source/object pairs at **07:30:20.270224–07:30:47.110369 UTC**, with no mismatch. The final method window covers **143 named inputs**, all unchanged, at **07:37:21.422618–07:37:21.473375**; its not-applicable absence observation is07:37:21.473384 with an empty path set. The validator's final window covers **25,019 named inputs**, all unchanged, at **07:37:41.162411–07:38:09.767462**; its not-applicable absence observation is07:38:09.779430. Every current mathematical source has a successful ordinary object; no earlier missing-object window is extended.

The final exact inventory and two cache source/copy metadata comparisons at **07:38:09.779578 UTC** retain81 archive/79 manifest/82 current paths, the same one opaque extra, no missing paths and no extra archive files. Independent comparisons agree on **89 method fields,2,782 inherited pairs and128 shared input hashes**. Final audit-only rechecks cover20 validator and21 method temporary inputs.

Both reviewers reviewed the full source/finite/provenance body and fresh sealer; final concurrence is against their exact audit-file hashes. All project reads are closed. The sealer reads only retained temporary audit files and does not extend the project observation windows. No missing research check is executed or requested; the root remains open.

## Preserved audit files

Preserve **15 files total**, all under **/private/tmp/math_gkm_godel_20261013**: main and seven standard supports, inherited pairmap, primary helper, seal helper, integrity JSON, one opaque cache copy and two metadata companions. The integrity record enumerates14 non-integrity preservation_paths; add markov_worker_000181_audit_integrity.json itself. Its preservation.supplemental_unindexed_cache_bundle contains three explicit supplemental file pins, including the .pyc that ordinary exclusion rules may omit.

Main: markov_worker_000181_monitoring_audit.md. Seal helper: seal_worker181_audit.py. Main/helper/integrity final hashes are supplied separately to avoid circular self-hashes. The sealed preservation list binds every required file; no original archive/controller/manifest or earlier audit is changed.

| Companion | Bytes | SHA256 |
| --- | ---: | --- |
| markov_worker_000181_mathematical_source_hashes.json | 459,951 | 2812de764b00a12ff14a38203b1f33c6b8ba08bd2c20f0cef8adc0a732a12273 |
| markov_worker_000181_source_structure_audit.json | 45,570 | 6dbd52ef3b0e8973086f14ff0fd7a1f290d713dd7cd8bec7dd32b8151836ae97 |
| markov_worker_000181_finite_domain_audit.json | 264,576 | 5d5300710a48fa6aad5442a48d118a319affc4a41d82d4c4b602348c7a51b640 |
| markov_worker_000181_validation_audit.md | 24,699 | 21a394a68431250d68d0469adc25a7382f5bad54692c5ef9665df1909bf762a7 |
| markov_worker_000181_validation_evidence.json | 18,624,879 | ae1343b46b0d55a110d2e356f46b1624c17581401c737d8cf8e4767ec2571710 |
| markov_worker_000181_replay_method.md | 25,098 | 51c750337cccde7a4b2e9745f74c87c1ed4211f28db4042a34da39654c6da6ba |
| markov_worker_000181_replay_method_evidence.json | 20,069,646 | 97909e22a17f4e955fc22a53dd58a080027cdbd10f8209624ad5d5c1b305ea0a |
| markov_worker_000181_inherited_pair_expectations.json | 2,571,535 | 0b8daed633429d4ce0052e01e5bf2bb4a6c0c226037ff4267d3d9850d54eb258 |
| markov_worker_000181_unindexed_cache_bundle.json | 1,758 | 4bca7c2468d04d3f05aa921f5792f603fd054a4c0e2c1ddf1bffabfcaa16d202 |
| markov_worker_000181_unindexed_cache_observation.json | 1,369 | 53abb8f620456b6943359bb08890dc7415325239501cd7a1a3e1316dcf306391 |
| static_audit_worker181.py | 23,077 | 6360edd5147c87355946134009b6bd0413456d307f6254264925a161fbb91640 |
