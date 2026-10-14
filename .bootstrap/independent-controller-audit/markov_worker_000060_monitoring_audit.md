# Independent monitoring audit: worker 000060
Request `07a7e5b715cd4825bb464f056e32ebfa`, reviewed 2026-10-15 local time. This audit was read-only. No research source edits, proof suggestions, proposer/successor contact, experiment reruns, Lean compilation, or replay completion were performed. Reviewed source bytes, evidence, event history and hash/status comparisons are saved in `markov_worker_000060_audit_evidence/`; the companion static finite/obstruction review is `markov_worker_000060_formula_audit.md`.

## Verdict

All **five modules, containing 29 named theorems, compiled**. **Four modules, containing 23 named theorems, completed direct separate kernel replay**. Only `MarkovCutPrefix07a7` lacks direct replay: it has two timed-out attempts, not two separate unreplayed modules. The second timeout receipt arrived just after the controller cutoff and was not included in its archive.

The exact structural-degree computation, marked enumeration, three-state transfer, coefficient extraction, and nonnegativity/anchored-support statements match their English descriptions. They are representation and support results, not a new universal log-concavity theorem. The chronological and degree-coordinate obstructions concern auxiliary partial/refined sums. The complete polygon-guarded raw-source examples have positive gaps. The marker failures occur away from the required marker value one. No mathematical English/Lean mismatch was found.

The final manifest undercounts replay successes (two instead of four), and the two progress artifacts have both older manifest hashes and later live bytes than the controller snapshot. These timing differences are precisely identified below. Accepted Lean source and compiled artifact hashes match. The full pinned Conjecture63 remains unresolved.

## Compiled versus separately replayed

| Module | Named theorems | Final compilation | Direct replay |
|---|---:|---|---|
| `MarkovCutPrefix07a7` | 6 | exit 0, 31.248 s | timeout, 100.217 s; timeout, 22.637 s |
| `MarkovCutDegree07a7` | 6 | exit 0, 21.193 s | exit 0, 87.014 s |
| `MarkovDegreeObstruction07a7` | 5 | exit 0, 24.101 s | exit 0, 97.506 s |
| `MarkovDegreeTransfer07a7` | 5 | exit 0, 35.545 s | exit 0, 107.070 s |
| `MarkovDegreeBridge07a7` | 7 | exit 0, 31.008 s | exit 0, 95.451 s |

Every final Lean source matches its validation hash, successful build snapshot, controller receipt and archived source. Current compiled `.olean` files match the worker's artifact index, controller hashes and archived artifacts. The four successful separate replay records and their source snapshots likewise match their final sources and controller/archive records. There is no receipt filename collision in the inspected records.

Successful printed main-theorem closures use only `propext`, `Classical.choice`, and `Quot.sound` (some require only a subset). Final sources contain no custom axioms or proof admissions. Three rejected elaborations have nonzero exit codes, differing hashes, and sometimes Lean-generated `sorryAx` in error output; they are not accepted proofs. This audit reviewed recorded checks, not a fresh whole-source rebuild or independently rerun exhaustive axiom closure. Inherited compiled imports were reused, as the worker discloses.

### Exact late effects and paths to preserve

The final manifest was written at **2026-10-14T22:40:37.564778Z**, listing successful replays only for CutDegree and DegreeTransfer. Two additional successful replay receipts followed before the controller cutoff:

- `run-MarkovDegreeBridge07a7-replay-1792017588646398000.json`: exit 0 after 95.451 seconds, written **22:41:24.099894Z**; acknowledged by archived event 238.
- `run-MarkovDegreeObstruction07a7-replay-1792017684198087000.json`: exit 0 after 97.506 seconds, written **22:43:01.706894Z**; acknowledged by archived event 247.

Both are in the worker archive and match controller change hashes. Thus the manifest/report's count of two successes is stale; four is the correct recorded final count.

The controller cutoff is **22:43:24.064682Z**. The prefix retry timed out after 22.637 seconds and wrote its receipt at **22:43:24.433358Z**, roughly 0.369 seconds later. This record exists live but is absent from the worker archive and controller change map. Its already-created Lean snapshot is archived and matches the final source. The original prefix replay timeout at 100.217 seconds is fully archived. Neither attempt was a replay success.

The live progress file and log then acquired a fifth entry (the late prefix timeout) around **22:43:24.442Z**. Their archived/controller versions contain the four successful replays. Both live files also differ from the still earlier two-success artifact-index hashes. Preserve each version distinctly:

| Kind | Exact path |
|---|---|
| Live progress | `/Users/sasha/math_gkm/evidence/markov-07a7e5b7/replay-progress.json` |
| Archived progress | `/Users/sasha/math_gkm/.control/markov/workers/000060/artifacts/evidence/markov-07a7e5b7/replay-progress.json` |
| Live replay log | `/Users/sasha/math_gkm/evidence/markov-07a7e5b7/replays.log` |
| Archived replay log | `/Users/sasha/math_gkm/.control/markov/workers/000060/artifacts/evidence/markov-07a7e5b7/replays.log` |
| Unarchived late timeout receipt | `/Users/sasha/math_gkm/evidence/markov-07a7e5b7/run-MarkovCutPrefix07a7-replay-1792017781795322000.json` |
| Archived matching retry source | `/Users/sasha/math_gkm/.control/markov/workers/000060/artifacts/evidence/markov-07a7e5b7/MarkovCutPrefix07a7-replay-1792017781795322000.lean` |

The independent evidence directory retains current live bytes under their project-relative paths and archived progress bytes under `controller-artifact-snapshots/`, again retaining project-relative paths. No live or archived artifact was overwritten during this audit.

`artifact-verification.json`'s 80 checks with no mismatches were a valid historical check at finalization, not a verification of later bytes. Three later receipt paths (the two successes and final prefix timeout) are absent from that artifact index. The historical operational summary contains three elaboration failures and the first prefix timeout; the live fifth unsuccessful attempt is the later prefix timeout. The controller outcome remains timeout (1203.509 seconds), `report: null`, `mathematical_resolution: false`. Its subprocess return code zero is not goal completion.

### Final Lean SHA256 values

```
MarkovCutPrefix07a7 cf66c52f1a4fef55b0e8f2541522f4e0aba23249af88a33a177e3990a0dea608
MarkovCutDegree07a7 51e5c81e1ea14af651545cdd666e8935f212912ea077ec6f7f5817ec2851de33
MarkovDegreeObstruction07a7 179efde95c02a0620f6f7e70bf5c7d670bea4b59080f8e4142134143eb9f4728
MarkovDegreeTransfer07a7 2c2fc47680226a24a2583858fdc152f6c741ed57453ae477f415650409b8f7ce
MarkovDegreeBridge07a7 e7f82b099593454b08966ee67726acc92e3c798f84daa71ce53a4bdff46b6c46
```

## Structural degree and grouping: exact domains

A mask is a finite list of pairs `(letter, selected)`, with false/true letters representing A/B. For the actual specialization `p_m(Y)=maskWeight340(Y,Y,1,m)`, the new `maskDegree07a7` maintains an initial gap degree one:

- Skipping A resets the gap degree to zero.
- Skipping B increments it by one.
- Selecting A adds the current gap degree to the total and resets it to one.
- Selecting B adds the current gap degree plus one and resets it to one.
- The unused suffix contributes no terminal degree, since its remaining weight is one.

`mask_natDegree07a7` proves this statistic equals the actual natural degree over **real polynomials** for every mask. The more general theorem allows an initial real polynomial `p` with constant coefficient zero and starts from `p.natDegree`. The factors `p+1`, `p+2`, and `1+Y` are proved nonzero from their constant coefficients; ordinary product-degree equalities are therefore justified. Individual actual mask weights have constant coefficient one and cannot be zero.

The definitions `degreeLayer07a7` and `degreePrefix07a7` then sum the exact-s-cut mask list filtered by structural degree equal to, or at most, `d`. They retain the full list sum, including multiplicities. The generic commutative-ring identities use this structural statistic. They do **not** assert that it equals actual polynomial degree in every characteristic, where cancellations or coefficients reducing to zero can change degree. The English explicitly makes this distinction. The characteristic-zero interpretation and inherited coefficientwise ring-map identity identify the intended integer/real weights.

`maskDegree_bound07a7` holds for every natural starting degree and every mask: `maskDegree(d,m)<=d+2*length(m)`. Therefore, for all finite words `w`, cut counts `s`, and `d>=1+2*length(w)`, the degree prefix is exactly the full cut coefficient. This is finite exhaustion without a denominator bound; it proves neither an inequality nor log-concavity of intermediate prefixes. Empty mask families (for instance too many requested cuts) remain legitimate zero sums.

The source exhaustion bridge has two explicit premises: `i+j=a+s` and `d>=1+2*length(central28(path)++[true])`. Under these conditions its coefficient is the literal raw integer source coefficient. It is not an unconditional identification of every source position with every arbitrarily chosen cut count or truncated degree prefix.

## Marked transfer and coefficient bridges

The marker `x` counts selected cuts, `z` records structural term degree, and `y` is the ordinary sheared coefficient variable. The extra `z` is **not** the omitted homogeneous variable of the source paper. At marker value one, the marked sum restores the original cut sum exactly; this is not coefficient normalization.

`degreeCoeff_masks07a7` holds over any commutative ring and for arbitrary initial ring values `y,z,p,q` and natural initial degree `d`: the degree-refined coefficient is the sum of `z^(maskDegree d m)*maskWeight y p q m` over exactly-s-cut masks. Here generic `p,q,d` are formal parameters, not a claim that `d` is their polynomial degree. `degreeCoeff_forget07a7` and `degreeEval_forget07a7` prove exact specialization at `z=1` for those same general parameters.

The scalar transfer theorem applies over any commutative ring, for all words, initial `p`, and natural `d`, with `q=1`. If its backward state is `(a,b,c)`, it identifies the marked recursion with `a+b z^d(p+1)+c z^d`. Its terminal state `(1,0,0)` and both updates agree algebraically with the transpose action of the forward W/H/Z recurrence displayed in the mathematics note. For the intended initial state `p=y,d=1`, that is `(W,H,Z)=(1,z(1+y),z)` and the final W is the complete marked mask sum.

The transfer formulas have nonnegative polynomial coefficients in their displayed variables. The explicit `degreeTransfer_nonneg07a7` theorem proves the backward state's **values** are nonnegative for real `x,y,z>=0`. It does not assert total positivity of matrix minors or any coefficient log-concavity. The notes correctly distinguish those properties and record a negative coefficient in an auxiliary minor without treating it as a root counterexample.

Ordinary polynomial coefficient extraction is rigorously separated:

- `degreeEval_coeff07a7` extracts the x coefficient at `s`, keeping all other parameters as constant polynomials.
- `degreeCoeff_layer07a7` extracts the z coefficient at `d`, giving exactly the structural degree layer in the base ring.
- `source_degreeCoeff07a7` specializes `z=1`, sets `w=central28(path)++[true]`, and extracts the y coefficient at `j`, under **`i+j=a+s`**, to recover `coeff (frame path).mid.p i j` over the integers.

There is no numerical fitting, evaluation at a nontrivial marker, division by a coefficient, binomial rescaling, or assumption of log-concavity in these bridges. Their natural-index and source-path quantifiers are unbounded. Endpoint clauses remain in the protected root; these path bridges neither redefine nor separately discharge them.

## Nonnegativity, anchored support, and zeros

`maskSum_nonneg07a7` applies to any finite list of actual mask weights over real polynomials. `maskSum_no_gaps07a7` says: if the coefficient at k of that sum is strictly positive and `j<=k`, then the coefficient at j is strictly positive. It uses inherited coefficient nonnegativity to avoid cancellation and inherited anchored support of each individual mask. Applied to a degree-filtered list, these prove `degreeLayer_nonneg07a7` and `degreeLayer_no_gaps07a7` for every word and all natural `s,d,j,k`.

The positivity premise is explicit. An empty/identically-zero layer is permitted; no theorem declares every layer positive or removes zero coefficients. For a nonzero layer, support starts at zero and has no internal gap. These are support facts only. They supply neither adjacent log-concavity of each layer nor closure under summing degree layers or degree intervals. Horizontal and vertical source directions also change cut counts, unlike the fixed-s diagonal direction. The notes correctly leave these separate obligations open.

## What the checked obstructions actually refute

At the explicit source path `[true,true,true,true,true,false]`, the label is 11/13 and the extended word is B^5 A B^6. The universal one-cut append identity makes `take 8` an actual chronological sum of the first eight possible cut positions. Its exact polynomial has coefficients `[8,20,20,14,10,6,2]`; at j=2,3,4 the gap is `14^2−20*10=−4`. This refutes universal log-concavity of arbitrary chronological partial sums even within that actual source, but not the complete source polynomial.

The full one-cut sum has coefficients `[12,32,36,28,20,12,4]`. The separate raw theorem checks the source label, all three original polygon guards at `(10,2),(9,3),(8,4)`, coefficients `[36,28,20]`, and gap `28^2−36*20=64`. These prefix/full formulas compiled; their own module's direct replay remains incomplete.

At the explicit source `[false,false,true]` with label 2/7, the two-cut degree layers at d=0,1,2 are `1`, `3+3y`, and `11+25y+14y^2`. Their constant coefficients `[1,3,11]` violate log-concavity **in auxiliary degree d**, with gap −2. This also contradicts a midpoint-log-concavity assertion that includes that coordinate direction. It does not contradict one of the three raw-source directions. The full raw-source diagonal at `(4,0),(3,1),(2,2)` has `[15,28,14]`, all polygon guards, and gap **574**. These obstruction/raw declarations completed direct replay.

The nontrivial marker counterexamples are exact finite experimental statements, not extra Lean theorems in these modules:

- At source 2/7, marker `z=1/100` gives common-denominator-scaled coefficients `[10311,325,14]`, gap −38729. Its symbolic gap is `z^2(-5+108z+471z^2)`. Marker one restores gap 574.
- At source 1/3, the horizontal marked gap is `z^2(4−z)` and the vertical gap is `z^2(4−3z)`. For positive markers they fail only past z=4 and z=4/3 respectively. At z=1 their gaps are positive (3 and 1). These are failures of all-marker strengthening, not of the required marker-one source inequalities.

## Exact finite scope

The companion static audit checks the scripts and stored artifacts without importing or executing them. Its coverage qualifications include:

- Source-layer/prefix/suffix checks cover all 489 proper reduced fractions through b=40; interval-sum checks cover all 277 through b=30. These finite successes are not universal theorems.
- The arbitrary-word scan reaches all 16383 binary words of lengths 0 through 13. Descriptor fields `a=sum(word), b=len(word)` in arbitrary mode are not source rational labels. Its prefix/suffix failures are not asserted to be source counterexamples.
- The transfer comparison uses 1222 **inputs**: 1023 arbitrary-word inputs plus 199 source inputs, with overlap, rather than 1222 distinct words. It reports 533536 coefficient comparisons.
- The marked-gap scan has 37405 polygon-guarded tests over 101 sources through b=18, split 12060 horizontal, 12060 vertical, and 13285 diagonal. It tests coefficientwise nonnegativity after `z=1+t`, which is stronger than pointwise nonnegativity for z>=1. The recorded diagonal successes remain finite evidence only.
- Some mixed-pair/joint-midpoint assertion categories stop at their first failure; their saved test counts must not be read as exhaustive pairwise coverage. Other bounded scans reached their stated input counts despite optional runtime stopping guards.

No finite success was used to close the root, and the failed auxiliary tests are clearly separated from actual raw gaps. The all-word degree-layer and source degree-interval conjectures remain unproved, as do the complete cross-cut-count comparisons.

## Final state

The accepted Lean source and compiled artifact provenance is consistent. Replay has completed for four modules, with the exact post-cutoff prefix timeout and progress-file versions documented above. The exact representation/support findings and the narrow obstruction statements match their English meanings. No new universal source log-concavity region, proof of the infinite residual, or refutation of the root is claimed by these modules.

The protected `MathGKM/Markov.lean` remains at SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Full Conjecture63 remains unresolved.

Final byte comparison at **2026-10-14T22:56:33.915619+00:00**: all **90** saved active inputs still match the reviewed hashes. The completed formula/finite subaudit found no discrepancy beyond the stated coverage qualifications. No additional compilation, replay, or numerical experiment was performed.
