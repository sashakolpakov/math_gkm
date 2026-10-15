# Worker 000068: static finite-evidence audit

Request `89ce11adb69243f8836fc68470d6d524`, repository `/Users/sasha/math_gkm`. Scope: experiment scripts, saved JSON and finite claims in the mathematical/correspondence/transport notes. Formal theorem and replay receipt review belongs to the parent audit. No project code was executed or imported, no experiment or Lean run was repeated, and no project file was written. JSON parsing, saved-data arithmetic and hashing were used; coefficients and flows were not regenerated.

## Finding

The finite counts and their stated bounded scope are consistent with the inspected scripts and saved data. In particular, the full run contains exactly all **240 reduced interior fractions with `3≤b≤28`**, and exactly **79,505 distinct certificate indices**. The independently computed raw-polynomial comparison records **88,357 coefficient positions** on those same sources.

The main verification limit is that full/stress artifacts store hashes of certificate payloads, not the payloads themselves. Static inspection therefore verifies their index/count integrity and the generating/checking code, but cannot recheck all recorded flows and gap coefficients from those files alone. One complete retained example was checked arithmetically and matched its full-run digest. The finite artifacts do not prove universal certificate existence or add kernel-checked source instances.

## What a certificate count means

For a source's exact mechanical interior word followed by `B`, the transfer returns integer entries `F[s,d,j]`, with cut count `s`, individual mask degree `d`, and coefficient index `j`. At a fixed `s`, the scripts collect all represented degrees and let `J` be the largest represented coefficient index. They consider natural starts `j=0..J-2`.

For each unordered degree pair `d≤e`, the gap array is

* diagonal: `G[d,d]=F[s,d,j+1]^2-F[s,d,j]F[s,d,j+2]`;
* off diagonal: `G[d,e]=2F[s,d,j+1]F[s,e,j+1]-F[s,d,j]F[s,e,j+2]-F[s,e,j]F[s,d,j+2]`.

Thus `sum G[d,e] w_d w_e` is the actual weighted adjacent coefficient gap. The factor two occurs only in the off-diagonal expansion; it is not coefficient normalization. Each increment of `checks` is one attempted certificate for one indexed `(a,b,s,j)` gap, not one pair coefficient, one flow edge, or one sampled weight. With no recorded failures, the recorded attempted certificates are reported as successful.

`nontrivial` counts gaps containing at least one negative pair coefficient (`negative_mass>0`). It does not count negative pairs or their mass. The flow graph moves negative mass at sorted pair `x` to positive mass at sorted pair `y` only when `x[0]≤y[0]` and `sum(x)≤sum(y)`. After a successful max-flow calculation, the script independently constructs `R=G+outgoing-incoming`, checks every move's order and positive amount, and asserts that every residual entry is nonnegative. This verifies the claimed transport identity arithmetically within the Python computation.

Zero coefficient entries are obtained through dictionary defaults, with no nonzero-endpoint filter. Entirely absent degree layers contribute zero. Exactly zero **pair-gap** entries are omitted from the sparse `G` dictionary; therefore the notes' retention of zeros refers to coefficient semantics, not literal storage of every zero in `G`. There is no explicit polygon filter in these loops; the start range is defined by the transfer polynomial's support extent.

## Full source run: 79,505 certificates

`transport_full_89ce.py` in `full` mode enumerates reduced `1≤a<b`, `3≤b≤28`, in denominator/numerator order. Parsing the saved input list confirmed the exact expected ordered list: 240 distinct sources, ending at `27/28`, with none missing. This excludes source `1/2` and both endpoint clauses. The word length is `b-1`, and `transfer(w,b-1)` retains every cut count, since each site can increase the count by at most one.

The cut loop is `s=1..b-1`, inclusive. The zero-cut constant polynomial is not counted. Each cut level gets every `j≥0` with `j+2≤J`. Starts beyond that extent have zero right coefficient and are not experimental certificates; they were not counted. All cut levels are considered, but a level with `J≤1` produces no certificate.

Saved-data checks established:

* `checks=79,505` equals the number of hash records, and all 79,505 `(a,b,s,j)` indices are distinct.
* Every record uses a saved source, `1≤s≤b-1`, a nonnegative `j`, and a syntactically valid SHA-256 string.
* Within each represented `(a,b,s)` group, the stored starts are exactly consecutive `0,1,...`, without holes or duplicates.
* The records represent 4,186 source/cut groups, compared with 4,306 source/cut groups visited by the full cut loops. The 120 groups without hash rows are consistent with the script's zero-test `J≤1` branch; their coefficient extents were not independently regenerated.
* `nontrivial=37,326`, leaving 42,179 certificates with no negative pair coefficient. `failures=[]`.
* The run's saved elapsed time is about 80.56 seconds, below its 100-second post-input stopping threshold; its complete source list confirms that it did not truncate.

The digest hashes the exact JSON payload containing `(a,b,s,j)`, the sparse gap coefficients, and the returned certificate, including moves and residual-demand metadata. The full/stress JSON retains only `[a,b,s,j,digest]` for successful cases. The hash list alone cannot establish that the hidden coefficient values, flows or dominance checks are correct.

The retained complete example in `transport.json`, source `3/4`, `s=1,j=2`, has coefficients `G(2,4)=-1`, `G(3,3)=1`, `G(3,4)=3`, `G(4,4)=5`. Its one-unit move `(2,4)→(3,3)` satisfies the min-and-sum order and leaves residual entries `0,0,3,5`. Direct saved-data arithmetic verifies this certificate. Hashing that saved payload matches the corresponding full-run digest.

## Literal numerator comparison: 88,357 positions

In full mode, the script separately computes the initial numerator frame and its left/right updates, matching the literal recurrence in `MathGKM/Markov.lean`. It sums the transfer over degree and maps entries by `raw[a+s-j,j] += F[s,d,j]`. It then compares the union of the raw recurrence and transfer support keys, treating absent coefficients as zero. There is no coefficient normalization or polygon filter.

The counter `raw_positions=88,357` counts those **raw bivariate coefficient positions**, not LC inequalities, degree-layer entries, certificates, or masks. It validates the aggregate polynomial on this finite range, not the individual allocation among degrees. The current artifact's 240-source list is identical to the previously saved `markov-6d2c5a67/transfer-validation.json` list, and that older file's per-source position counts sum to the same 88,357. The current script's raw recurrence and comparison were inspected, not rerun; the current artifact does not save every compared coefficient value.

## Other transport runs

| Artifact | Saved input coverage | Checks | With negative pair coefficients |
|---|---|---:|---:|
| `transport.json` | First 321 entries of the planned reduced-source list `3≤b≤44`, ending at `29/32`; next unprocessed source is `31/32` | 20,018 | 16,392 |
| `transport-stress.json` | First 23 entries of a planned 56-source list, ending at `39/41`; next is `40/41` | 1,893 | 1,708 |

Both have no recorded failure, but stop at the 100-second post-input time check (saved times approximately 103.97 and 133.21 seconds). Neither reaches its planned full input list. The ordinary run retains and considers cuts `1..min(b-1,7)`. The stress run retains and considers cuts `1..6`; its planned denominators are `31,37,41,47,53,61,71`, but only inputs at `31,37,41` were reached. Stress mode performs **no** independent raw recurrence comparison: `raw_positions=0`.

The stress file has exactly 1,893 unique certificate indices and valid hash strings, all within its saved source/cut bounds; each represented cut has consecutive starts from zero. It has 185 certificates without negative pair coefficients. Transport datasets overlap, so their totals must not be added as distinct covered inequalities. Their summary entries match the underlying JSON fields exactly.

## Sampled-weight runs and arbitrary-word failure

`weights-source.json` records 444 distinct saved mechanical sources with `3≤b≤64`, 1,462,468 sampled-weight inequalities, and no failure. The saved words match the mechanical-word formula. This is partial coverage of a shuffled 1,258-source schedule, stopped after approximately 70.015 seconds, not all sources through denominator 64.

For each cut level `2≤s≤min(b-1,9)`, it tests 25 random weight sequences and geometric weights with bases `1,2,10`. Random weights start at one and use nonincreasing ratios drawn from `[1,1,1,2,3,10,100]`, so the sampled weights are positive, nondecreasing and log-concave. Samples may repeat and count separately; they do not exhaust all nonnegative increasing LC weights. The source total is `28×52,231` triple/sample occurrences. All degree layers for each retained cut count are included; the transfer cap truncates cuts, not degrees. Starts are `0..J-2`, with zero defaults and no polygon filter.

`weights-arbitrary.json` stops at the first failure on its ninth random word, after 26,208 checks. Its `(a,b)` entries label the random-word generation schedule, not a mechanical source identity. The failing word has length 46, carries label `(4,47)`, and is not any mechanical source word at denominator 47.

At `s=2,j=3`, its saved degree layers sum to the complete raw word triple `[3378,2516,1896]`, gap `-74,432`. The sampled weights `[1,10,30,60,60,60,60,60,60,60]` give `[202680,150960,113760]`, exactly 60 times that triple, with gap `-267,955,200=60²·(-74,432)`. Thus this failure already exists without weighting. It is an enlarged-word obstruction, not a source counterexample. Both weight summaries agree with their underlying records.

No finite result here supplies the unproved universal source transport hypothesis, horizontal/vertical coverage, or root completion. Input hashes are in the adjacent `markov_worker_000068_finite_audit_inputs.sha256.json`.
