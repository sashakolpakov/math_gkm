# Independent monitoring audit: worker 000039

Request: `88f3b55352d94aa995ace708cad23b17`.

Read-only inspection of the completed worker's archived files in
`/Users/sasha/math_gkm/.control/markov/workers/000039/artifacts`,
corresponding current source/compiled-object hashes, and retained receipts.
No project files were edited, no mathematical advice was supplied, and the
active successor was not contacted or disturbed. No new Lean build was run.

## Finding

The three final modules prove an exact coefficient-counting reformulation
of the full pinned target, together with a concrete obstruction to the
specified component-switching comparison on the actual source 1/4.
They do not prove the reformulated inequalities and do not refute the source
conjecture. The actual source coefficients in the obstruction satisfy
strict log-concavity.

No material English/Lean mismatch was found. A qualification that matters:
Lean exhausts two explicitly defined Boolean component switches, with their
component charges and valid example walks checked. It does not supply a
general formal theory classifying arbitrary path transformations. The
machine's English correspondence states this limitation correctly.

## Exact counting interface and full-root scope

`Cloud88` is a finite list of natural exponent pairs. The count
`multiplicity88 l i j` is the integer-valued number of occurrences of
`(i,j)`. Duplicate entries remain distinct occurrences for counting;
there is no deduplication or normalization.

The recursive pair of lists starts at `([(0,0)],[(0,0)])`. For a suffix
pair `(f,g)`, set `h=shiftV(f) ++ shiftU(g)`. A prepended false/A
gives `(h,h++g)`; a prepended true/C gives `(h++f,h)`. The final list
is `shiftV(f)++shiftU(g)`.

`object_pair_coeff88` proves the two counts agree with the corresponding
recursive polynomial coefficients for every word and every natural pair
of indices. `objects_coeff88` identifies the final count with the scalar
gas polynomial. The inherited matrix convention is

`A=[[v,1],[uv,u+1]]`, `C=[[v+1,1],[uv,u]]`,

with scalar boundary expression `(v,1) M (1,u)^T`. These conventions
agree with the recurrence and the English description.

For actual sources, `sourceObjects88 path = objects88 (gasCore28 path)`.
The unconditional theorem `source_multiplicity88` proves, for every finite
source path and every natural `i,j`,

`coeff (frame path).mid.p i j = multiplicity88 (sourceObjects88 path) i j`.

The source core is the canonical one from the inherited exact source-gas
identity. It is not replaced by an arbitrary word or arbitrary cloud.
There is no denominator, path-length, index, or positive-coefficient cutoff.

`ObjectLC88` has precisely the three global raw inequalities

- `N(i,j)*N(i+2,j) ≤ N(i+1,j)^2`;
- `N(i,j)*N(i,j+2) ≤ N(i,j+1)^2`;
- `N(i,j+2)*N(i+2,j) ≤ N(i+1,j+1)^2`.

Every `i,j : ℕ` is retained, including zero counts. `ObjectGoal88`
quantifies this predicate over every source path.

`root_iff_objects88 : Conjecture63 ↔ ObjectGoal88` is an unconditional
equivalence. The proof uses exact source coefficients and the inherited
`root_iff_raw_matrix18`. That earlier equivalence discharges the two
endpoint clauses at 0/1 and 1/1 and justifies moving from polygon-guarded
triples to global triples using outside-polygon zeros and polygon midpoint
closure. Thus the new target does not silently omit endpoints or impose
an additional unproved support premise.

The equivalence proves neither side. No universal injection between counted
pairs, and no universal count inequality, is provided. Lists supply a
literal finite multiplicity model; the theorem is not itself a formal
bijection between list positions and an independently defined path type.

## Actual 1/4 switching witness

The source identity is proved for `frame [false,false]`: its labels are
1 and 4 and its numerator is the gas scalar on `[false,false,false]`
(the core AAA).

The expanded A edges include both lower-state loops, with weights `u`
and `1` distinguished. The high walk has internal states
`[1,0,1,1]`, edge weights `uv,1,u`, and boundary weights `1,u`.
The low walk has states `[1,1,1,0]`, edge weights `1,1,uv`, and
boundary weights `1,1`. Lean verifies their valid edges and total
exponent charges `(3,1)` and `(1,1)`.

The displayed common internal times are 0 and 2; the terminal exterior
vertex supplies the final meeting. The initial boundary agrees and
contributes no nontrivial charge difference. The two remaining components
have high-minus-low differences `(1,1)` and `(1,-1)`, with the last
component including the terminal boundary.

The explicitly defined component swaps have possible transferred charges

`(0,0), (1,1), (1,-1), (2,0)`.

None is `(1,0)`; equivalently, none turns the first path's charge
`(3,1)` into `(2,1)`. The four first-path charges are
`(3,1),(2,2),(2,0),(1,1)`. The formal orbit has horizontal counts
`[1,0,1]`, and hence fails log-concavity.

The exhaustion is over these two explicit switches. Interpreting them as
all common-vertex exchanges for the displayed pair follows from its
displayed states; the code does not state a general reachability/classification
theorem about path transformations. It establishes no obstruction to
transformations that change the joint decorated-edge multiset.

Separately, Lean proves the actual source's raw coefficients at
`(1,1),(2,1),(3,1)` are `[2,6,4]`, proves all three polygon memberships,
and proves `2*4 < 6^2`. The zero in the restricted switching orbit is
therefore not a zero in the source row and is not a source counterexample.

## Finite experiment, separately classified

`orbit-inventory.json` and its retained Python script enumerate the 1/4
example. For total pair charge `(4,2)`, the script groups ordered path
pairs by their unordered decorated-edge pair at each layer. Its record
has 34 individual weighted paths and 34 overlay classes. The class-gap
histogram is

`-1: 2 classes; 0: 11 classes; 1: 12 classes; 2: 9 classes`.

The recorded total middle-pair count is 36 and the oriented endpoint-pair
count is 8. I checked that the stored rows, histogram, totals, and total
gap 28 agree. This is finite experimental evidence; the inventory is not
a Lean theorem or a universal classification of source overlays. No fresh
enumeration was run during this audit.

## Final verification records

Final manifest: `evidence/markov-88f3b553/validation.json`, timestamp
`2026-10-14T15:49:49.933128+00:00`. The host reports a completed attempt,
approximately 1109.05 seconds, mathematical resolution false, completion null.

| Module | Final source SHA-256 | Build receipt | Kernel replay receipt |
|---|---|---|---|
| MarkovObjects88f3 | `193625daab086d4dcc1f9473ad7f81c729e4ca03da70b31575c4c5e0c36bb813` | `run-1791992618918317000.json` | `run-1791992692036566000.json` |
| MarkovSwapObstruction88f3 | `be31c35e519bf86d7a458409138041a99ad7e270b555db952c56f51851378b8e` | `run-1791992690853551000.json` | `run-1791992743711071000.json` |
| MarkovObjectGoal88f3 | `3cdfb81d84acdcf606c87b2e0bf5dc5bdcf4903bcc7668387e42d401e473845e` | `run-1791992822283514000.json` | `run-1791992931768329000.json` |

For each module, archived source, current source, manifest, host change
record, and build/replay source snapshots have the same final source hash.
All six listed verification receipts return zero and name the same final
source hash; the replay command invokes pinned Lean 4.32.2 `leanchecker`.
Receipt hashes agree with the archived host records. Final archived and
current compiled-object hashes agree with the manifest and host record.

The eleven printed final axiom reports are consistent with the successful
build output. Ten contain only permitted standard axioms from
`propext`, `Classical.choice`, and `Quot.sound`; the midpoint-swap
exclusion has no axioms. Three failed elaborations are retained separately:
two obstruction drafts and one object-model draft. They are not accepted
proof evidence.

The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected matching recorded compilation/kernel replay. It did
not conduct a fresh whole-source transitive rebuild; inherited compiled
imports remain part of the verification boundary. No historical novelty
claim or resolution of full Conjecture 6.3 follows from these results.

