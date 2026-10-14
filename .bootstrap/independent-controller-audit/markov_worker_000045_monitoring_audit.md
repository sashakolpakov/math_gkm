# Independent monitoring audit: worker 000045

Request: `be07ef751cf4477697c81b1e02c1e531`.

Read-only audit of the completed worker's archived output under
`/Users/sasha/math_gkm/.control/markov/workers/000045/artifacts`,
matching current final source/compiled objects, and retained receipts.
No project changes, proposer contact, research guidance, active-worker
interference, fresh Lean builds, or mathematical experiment reruns.

## Finding

The universal artificial-array obstruction and the stronger individual Pell
summand inequality are correctly scoped and proved. The transfer to actual
source horizontal inequalities expressly assumes an unproved aggregate
predicate. It does not obtain aggregation from the individual bounds.

The actual 12/13 normalization obstruction repeats worker 000018's result.
This run adds its explicit comparison with the proposed ambient-numerator
scaling. It is not a new raw source case or a counterexample to the root.
No material English/Lean mismatch was found; full Conjecture 6.3 is unresolved.

## Fixed-radius obstruction: exact abstract scope

For every natural radius `h`, choose `t=h+2` and indices
`0≤q≤h+1`. The auxiliary arrays are

`L_q=t^(2(h+1-q))`, `M_q=t^(2h+1)`, `R_q=t^(2q)`.

They are positive on this range; the first and last rows satisfy the proved
geometric three-term identities, and the middle row is constant.

`radius_local_pairBe07` actually allows any natural `t≥1`. Under
`q≤h+1` and `r≤q+h`, it proves `L_q R_r≤M_q M_r`.
In particular, both orientations hold within distance `h` on the indicated
finite range.

`radius_windowBe07` proves the sum inequality on every finite subset
`I⊆{0,…,h+1}` satisfying the ordered diameter condition
`∀q,r∈I, r≤q+h`. There is no unproved interval closure assumption.
The empty subset is also permitted. The English consequence about
coefficientwise inequalities on local windows follows from summing these
pointwise comparisons; it is not separately presented as a formal general
polynomial theorem in the module.

At `t=h+2`, the final theorems prove

`ΣM=(h+2)^(2h+2)`,

`ΣL=ΣR=Σ_(q=0)^(h+1) (h+2)^(2q)>(h+2)^(2h+2)`.

Hence `(ΣM)²<(ΣL)(ΣR)` for every natural `h`, including `h=0`.
The low-row geometric identity is appropriately restricted so its indices
remain in range; natural subtraction is not used to claim that identity
beyond the finite range.

These arrays are not asserted to be Pell summands or Markov coefficients.
The result excludes inferring unrestricted aggregation from those fixed-radius
local comparisons alone. It does not exclude a proof using further identities
specific to the exact binomial array, or a suitable argument with a varying
radius.

## Stronger exact summand bound

Let the positive English excess be `S=s+1`, where `s` is the final
Lean argument of `horizontalTerm9a72`. The literal raw summand is

`H(a,j,S,q)=choose(a-q,S)*choose(S+q-1,q)*choose(2S,j-q)`,

with its explicit zero guard for `q>j` and zero binomial conventions.

`horizontal_term_ultraBe07` quantifies every `a,j,q,s : ℕ` with
the explicit range hypothesis `s+3≤a`, equivalently `S+2≤a`, and proves

`(S+2)(a-S) H_S H_(S+2) ≤ (S+1)(a-S-1) H_(S+1)^2`

at each fixed charge `q`.

All support-zero cases are retained. The proof handles the `q>j` guard
and invokes the ambient-binomial bound at `n=a-q≤a`, with vanishing
upper-endpoint binomials handled before cancellation. Positivity of the
factors used in cancellation is proved in the nonzero-support branch.
Rational arithmetic clears proof denominators; the conclusion uses the
unchanged integer summands.

The underlying binomial theorem assumes `n≤a` and `k+2≤a`.
Its exact remainder identity, in the branch `k+2≤n`, is

`(n-k)*[(k+1)(a-k-1) C(n,k+1)^2
       -(k+2)(a-k) C(n,k) C(n,k+2)]
 =(k+1)(a-n) C(n,k+1)^2`.

This supplies the nonnegative remainder claimed in English. The other
two binomial factors use inherited log-concavity bounds. None of these
steps proves closure under summing the charges.

## Conditional aggregate-to-source transfer

`UltraHorizontalFiberGoalBe07` is a definition of a proposition,
not an axiom or a proved theorem. It quantifies all natural `n,j,s,k`
with `s+2≤n`, and assumes the coefficientwise inequality

`(s+3)(n-s) [T^k](F_s F_(s+2))
 ≤(s+2)(n-s-1) [T^k](F_(s+1)^2)`,

where `F_s=horizontalFiberPoly9a72 n j s`. In positive-excess notation,
`a=n+1`, `S=s+1`, this has the same scalars as the individual bound.

It is a proposed sufficient condition, mathematically corresponding in
range to log-concavity after division by `choose(a,S)`. It is not a
redefinition of the pinned raw-coefficient target.

`fiber_of_ultraBe07` proves its implication to the existing raw fiber
goal. Coefficient nonnegativity of the product is proved, the right scalar
is strictly positive, and the difference between the left and right scalars
is `n+2=a+1>0`. Thus the cancellation and weakening to raw LC are justified.

`source_horizontal_of_ultraBe07` then concludes the literal source
horizontal inequality for every actual path satisfying `b=a+1`, with
the starting and ending positions in the protected polygon. It retains
the explicit hypothesis `h : UltraHorizontalFiberGoalBe07`.
It uses the inherited exact source-sum bridge and source-family classification;
there is no silent enlargement to arbitrary rational sources or deletion
of polygon conditions. Other directions and root endpoints remain unchanged.

## The 12/13 example and duplication

The final module proves that eleven right steps have labels 12 and 13,
that positions `(0,14),(1,14),(2,14)` satisfy the source polygon, and
that their actual raw coefficients are

`[11,510,10680]`.

The three checked comparisons are

`11*10680 < 510²`,

`40*(11*10680) ≤ 27*510²`,

`9*510² < 20*(11*10680)`.

The second is the candidate ambient scaling at `a=12,S=2`. The third
is failure of the stronger row-support normalization by
`choose(10,i)`, whose first entries would be `11,51,712/3`.
Its reversed cleared gap is 8,700. The source raw inequality remains strict.

This same source triple, labels, polygon memberships, raw inequality,
and failure of division by `choose(10,i)` were already proved in
`MarkovHorizontalObstructionF650.lean` by worker 000018, including
`source_horizontal_normalized_failure650`. I checked the current
earlier source and its saved independent audit. The present calculation
is therefore a repeated witness, with an additional comparison to the
newly proposed ambient scaling. No historical novelty is claimed.

## Finite evidence and corrected probes

The inspected scripts and records distinguish these observations:

- 11,808,302 nonempty interval-sum comparisons for `3≤a≤35`, without
  an interval failure. I independently counted the loop indices and
  obtained the same number. Separate mixed block/singleton tests do fail;
  they are not conflated with the successful interval comparisons.
- 106,082 nonzero-endpoint full-sum triples through `a=60` in the
  corrected global probe. The recorded ambient bound has no failure;
  the support-normalized bound fails at the 12/13 example.
- 483,836 nonzero refined convolution-coefficient tests on 41,993 parameter
  triples. The sample count consists of the finite exhaustive parameter
  range through `a=40` plus 250 seeded samples; I checked that count.
- 5,000 randomized attempts yield 2,938 admissible recorded fibers, of which
  2,766 are reported nonzero. I checked the parameter-list length and
  recorded bounds `4≤a<1200`, `1≤S<min(a-1,120)`.
  These are sampled fibers, not a universal theorem.

All these records match the archived host file hashes. No mathematical
scan was rerun. The record counts are not a claim of distinct examples
across overlapping scans.

The first global probe uses an incorrect excess-index scalar and a
different treatment of the lower support endpoint at `j=0`. It remains
preserved as `global-probe.json`; the explicitly corrected script/result
is the relevant evidence. Its early reported failures must not be treated
as failures of the later formal candidate. This correction does not affect
the accepted Lean statements.

## Matching final proof records

Final manifest: `evidence/markov-be07ef75/validation.json`, timestamp
`2026-10-14T17:47:01.058429+00:00`. The host records completed,
approximately 1140.35 seconds, mathematical resolution false, completion null.

| Module | Final source SHA-256 | Build receipt | Kernel replay receipt |
|---|---|---|---|
| MarkovLocalRadiusBe07 | `f793a60a677c0563d361646d4e69e529d99ee0bf43ae2cd4fcf193200f295360` | `run-1791999328623980000.json` | `run-1791999378192012000.json` |
| MarkovUltraSummandBe07 | `56a865347630f559da51b1324009c06a3944e46df2ac7d51de7fa7b133da2811` | `run-1791999849472949000.json` | `run-1791999953421692000.json` |
| MarkovUltraTransferBe07 | `a46dad48719d5617c5317959aa541801153003db18cdc8767d27566eab198a81` | `run-1791999725984352000.json` | `run-1791999806945501000.json` |
| MarkovUltraScopeBe07 | `4fba4c679da6922ddf13ce9215e76dcb8be1d9410b75b0ef3b741df4cc72071e` | `run-1791999808222352000.json` | `run-1791999850650687000.json` |

All four final source hashes agree among current and archived source,
manifest, host changes, and the final build/replay snapshots. All eight
listed receipts return zero and bind those same final source hashes.
Replay uses the corresponding pinned Lean 4.32.2 `leanchecker` module
command. Receipt hashes and archived/current compiled-object hashes agree
with the manifest/host records.

The twelve printed final axiom closures match successful build output and
contain only permitted standard axioms from `propext`,
`Classical.choice`, and `Quot.sound`. Four rejected elaborations are
preserved separately: one radius-array draft and three strengthened-summand
drafts. They are not accepted proof evidence.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected matching recorded compilation/kernel replay, not a
fresh whole-source transitive rebuild. Inherited compiled imports remain
part of the verification boundary.

