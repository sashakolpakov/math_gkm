# Independent monitoring audit: worker 000027

Request: `9a720f77696445aab32325da611c5097`.

Read-only review of the completed snapshot under
`/Users/sasha/math_gkm/.control/markov/workers/000027/artifacts`: five final
Lean modules, correspondence/mathematical/checkpoint records, the validation
manifest, matching recorded builds and kernel replays, and the host receipt.
Selected experimental definitions and their claimed finite counterexamples
were also inspected. No project changes, proposer contact, new research
directions, or interaction with worker 000028 occurred. No fresh Lean rebuild
was performed.

## Conclusion

The round proves exact positive finite-sum representations for every raw
coefficient of the Pell source family `a/(a+1)`, a reindexed horizontal
decomposition, and log-concavity of its individual summands. It also proves a
conditional implication from an explicitly unproved coefficientwise fiber
inequality to the family's horizontal raw inequalities.

It does not prove log-concavity of the sum, the proposed fiber inequality,
unconditional horizontal log-concavity of the whole Pell family, or the full
conjecture. These limitations are correctly retained in the Lean statements
and English report. No substantive correspondence defect was found.

The host outcome is `completed` after 1153.30 seconds; mathematical resolution
is false and completion is null.

## Exact coefficient formulas and zero cases

For the repeated-right source with `a=n+1`, `b=n+2`, set `d=2a`.
`right_coeff_sum9a72` identifies each actual raw coefficient `A(i,j)` with
`pellSum9a72 n i j`, for every natural `n,i,j`. In the strip
`a≤i+j≤2a`, put `r=2a-i-j`; the sum is

```
sum over 0≤k≤i, k≤r of
  choose(2a-2r,i-k) choose(a-(r-k),k) choose(a-1-k,r-k).
```

All factors are nonnegative integers. Subtractions use Lean natural
subtraction. The English version's `a-r+k` equals `a-(r-k)` on this range,
because `r≤a` and `k≤r`. Outside the strip, the definition and the actual
source coefficient are proved zero. Inside the strip, vanishing binomial
terms correctly retain further zeros outside the true polygon. No support
points are discarded and no raw coefficient is normalized.

The proof uses the literal source quotient coefficient identity from worker
000026, the homogeneous diagonal coefficient bridge, and ordinary polynomial
multiplication. The upper-half factorization condition is discharged from
the strip bounds. `source_near_one_coeff_sum9a72` extends the same identity
to every actual source path satisfying `b=a+1`, using the proved path
classification. There is no denominator cutoff or extra family-identification
assumption.

`pell_weak_iff_two_sums9a72` equates full WeakLC for all repeated-right sources
with the conjunction of two all-index predicates, `PellHorizontal9a72` and
`PellVertical9a72`, on these sums. The diagonal direction is discharged by
the previous worker's theorem. The converse retains zero coefficients via
the established guarded/global equivalence. Neither of the two remaining
sum predicates is proved. This is an equivalence for this subfamily, not
a reduction of all other rational sources to it.

## Horizontal decomposition and unproved closure

In English excess-degree notation `i+j=a+s`, the positive-excess summand is

```
H(a,j,s,q) = choose(a-q,s) choose(s+q-1,q) choose(2s,j-q)
```

for `q≤j`, and zero otherwise. The formal `horizontalTerm9a72` uses parameter
`s-1`, so all its binomial upper indices are natural. The exact source
decomposition is proved for `1≤s≤a`; its fixed summation range is `0≤q≤a`,
with the additional terms proved zero. Thus shifting the source coefficient
index in a horizontal triple does not silently change the summation domain.

`horizontal_term_lc9a72` proves the non-strict adjacent inequality of each
individual summand as the positive excess degree varies. It includes zero
terms and uses proved fixed-upper and upper-index binomial inequalities,
including the stride-two case. There is no claim that arbitrary sums of
these log-concave sequences inherit log-concavity.

`HorizontalFiberGoal9a72` is a proposition requiring, for every natural
`n,j,s` with `s+2≤n`, every coefficient of

```
F_(s+1)^2 - F_s F_(s+2)
```

to be nonnegative. Each `F_s` is the polynomial whose coefficients are the
fixed-range horizontal summands. The extra coefficient variable records the
summand index. The fiber goal is explicitly a hypothesis of both transfer
theorems; no axiom, finite experiment, or individual-summand inequality is
used to discharge it.

`right_horizontal_of_fiber9a72` and
`source_near_one_horizontal_of_fiber9a72` prove its sufficient implication
for all actual horizontal Pell polygon triples. The `j=0` case uses the
already proved source boundary inequality. When `j>0`, the polygon bounds
give the positive-excess range and the condition `s+2≤n` needed by the
unproved fiber goal. Evaluating the coefficientwise nonnegative polynomial
at one gives exactly the raw horizontal inequality. The source bridge and
parameter/zero conditions are discharged; the fiber inequality is not.

## Obstruction scope

The checked actual `3/4` source column at `i=3` is `1,8,26,20`.
`source_slice_binomial_failure9a72` proves `8² < 3*1*26`, which is the failure
after division by the cubic binomial coefficients `1,3,3,1`. The raw
inequalities still hold (`26≤64` and `160≤676`). No raw source counterexample
or formal real-rootedness theorem follows from this assertion alone.

The two other checked obstructions concern stronger summand-pair strategies:
midpoint balancing fails with products `61,047,000 > 60,648,000`, and pairwise
synchronization fails with `15 > 0`. Those exact finite evaluations were
independently recomputed without extending the search. Neither disproves
the aggregate horizontal fiber goal.

The vertical grouped-fiber failure is experimental, not one of the new Lean
obstruction theorems. Its recorded parameters are `a=10`, fixed `i=10`,
center excess degree one, and combined summand index 16. That single fiber
has 84 endpoint pairs versus 81 center pairs. The unrefined raw triple is
`1,29,642`, which satisfies `1*642≤29²`. The inspected probe groups products
by the sum of the two auxiliary summand indices; it is not testing the raw
coefficient inequality directly at each individual fiber. The report
correctly separates this stronger failure from the pinned target.

The finite horizontal/vertical fiber scan through `a=50`, larger deterministic
horizontal trials through `a≤250`, and Sturm experiments remain finite
evidence. They are not premises of any accepted universal theorem. This
monitoring audit does not establish historical novelty or independently
review the additional literature discussion.

## Recorded verification

For all five modules, the archived final source hash matches the validation
manifest, host change receipt, and current source. Each listed build and
kernel receipt has return code zero, binds the same final source hash, and
itself matches the archived host receipt hash. The replay commands invoke
Lean 4.32.2 `leanchecker` on the corresponding module.

| Module | Final source SHA256 |
| --- | --- |
| MarkovPellSum9a72 | `1769127343d5605643e54dbe7570cb70d3879a460f6035f90f4690b5deaf2fa3` |
| MarkovPellSummand9a72 | `1e5c7d6f8faa7f368ae403ba0d4a72f2e2821bdf228e7bb64048ec7cdef2b2b3` |
| MarkovPellHorizontalSum9a72 | `5425894aa3198950aae4f707d50a04b6ca8506d5e34938ba10fe935189e772b2` |
| MarkovPellObstructions9a72 | `d15e9796f253e2d2907b2528b70d11d67f52b7cb4433dcb9678be70b0e31b40f` |
| MarkovPellFiberTransfer9a72 | `eff98a0b349edbb6e8f86690904c62f39bd15c9657ec62d8deea1f205f6ec836` |

All 14 printed declaration closures contain only `propext`, `Classical.choice`,
and `Quot.sound`, and the manifest's axiom-output fields exactly match the
successful build output. All five distinct recorded project-local direct
import binary hashes match. The final transfer source has only a harmless
deprecated-lemma-name warning. Verification reuses inherited compiled imports;
it is not a fresh complete dependency rebuild.

Seven failed elaborations are retained and correctly marked rejected: one
Sum, three Summand, two HorizontalSum, and one FiberTransfer attempt. None is
used as accepted proof evidence.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The new checked progress consists of exact formulas, summand inequalities,
conditional transfer, and scoped obstructions. Full horizontal log-concavity
and full conjecture completion remain unproved.
