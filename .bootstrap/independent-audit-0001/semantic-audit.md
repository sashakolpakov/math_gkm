# Early semantic audit of machine-authored foundations

This is a source-level independent audit, not a report of a new Lean build.
Read-only inputs were the two fresh machine-authored Lean sources. No engine
code, proofs, or mathematical campaign solutions were supplied by this audit.

Snapshots inspected:

- `MathGKM/Foundations.lean`: SHA256
  `c7582e96018139af9f76f448c3117d8088ece7b3342ed71f087bda89889030bf`, 2,225 bytes.
- `MathGKM/Machine.lean`: SHA256
  `da25ad6b91ba88df4088a7cfec2e487ec09dfd2acf1687838b418adf0c33d954`, 3,817 bytes.

All line numbers below refer to these snapshots. A follow-up read found only
the binder rename `extends` to `extension` in `Foundations.lean`, SHA256
`c01afc90b2cd6b4d51409b3b113d612d4609d07456079ab47643dc051e0c0ec3`, 2,229 bytes.
The semantic findings also apply to that checked follow-up snapshot. Other
later edits require a fresh scope comparison; this review does not automatically
apply to changed sources.

## Foundations: correct abstract preservation statements

`Attachment C R` (lines 6–8) consists of an old object x and a new object y
satisfying both the old context predicate C(x) and a relation R(x,y).
`forget` projects to x.

`attachment_conservative` (14–22) says: if every old model x satisfying C has
some extension y satisfying R, then a predicate P on old objects holds for all
attached models exactly when it holds for all old models. This is a substantive
semantic conservativity statement, conditional on the extension obligation.
It quantifies over arbitrary old-object predicates, not merely a selected goal.

`sequential_extension` (24–32) composes two explicitly assumed extension laws.
The second law covers every compatible first extension. It does not manufacture
a proof that a concrete Lean module satisfies either extension obligation.

`inconsistent_attachment` (34–39) correctly demonstrates that a contradictory
extension can make all claims vacuous while the original context cannot. This
is a meaningful negative example for omitting the extension hypothesis.

`transport` (41–44) extracts one direction of a supplied predicate equivalence.
It is a valid consumer interface law, not an independently proved adapter for
any actual mathematical representation. `collision_obstruction` (46–53) proves
that identifying two objects distinguished by P prevents any exact transported
predicate on the target representation. `lossy_bool` is a concrete instance.

These are useful semantic foundations. They do not yet define a pushout span,
its universal property, a category with cofibrations, dependent Lean signature
substitution, or a runtime attachment mechanism. Such claims would exceed the
statements inspected. The source itself makes no inflated categorical claim.

## Machine: exact finite-continuation content

The instruction language consists of recording a number, requesting a numbered
query, and replacing the remaining instruction list. State contains code,
number lists, pending state, and history. Inputs supply an answer, an optional
replacement program, and a declared delay.

`run n e s env` (62–68) executes exactly n ticks, including idle ticks after
code is empty. On a request it can replace the future program from the input;
explicit rewrite instructions also replace that program. Both engines use the
same state transition `step` (41–49). Their only difference is the stipulated
per-tick cost: reference 2, candidate 1 (37–39).

Consequently, for every finite n, initial state, and input tape:

- `continuation_preserves` proves equality of final states.
- `continuation_cost` proves candidate cost plus n equals reference cost.
- `concrete_switch` proves equality of final states and strict total cost
  improvement when the extra overhead k is less than n.
- `overhead_removes_gain` proves that the cost comparison fails when k is at
  least n. This directly tests the omitted-overhead risk.

These are universal statements about finite continuations, including all later
instruction-list replacements during those n ticks. They are not a comparison
on one frozen example or measured outcome table. Their mathematical scope is
clear and useful.

## Gaps between this model and the full research system

1. The cost saving is built into `dispatchCost`, not derived from distinct
   executable interpreter implementations. No inspected theorem connects
   actual Python/Lean execution costs to 2 and 1 per tick.
2. The archive holds arbitrary natural numbers. Requests insert `answer`
   directly. The comment calls inputs abstract authorized responses and
   explicitly does not claim verifier soundness. The model therefore does not
   establish that admitted entries are true theorems or relevant to the root.
3. Future replacements change `Program`, not the `Engine` tag, interpreter,
   verifier, or externally supplied input mechanism. The inspected definitions
   do not encode and identify the actual research controller's complete future
   search and self-modification behavior. Arbitrary response tapes alone do
   not supply that missing execution connection.
4. Inputs are indexed by run tick, with an index consumed even on record,
   rewrite, or idle ticks. The comment's phrase “interaction step” should be
   read as this abstract tick index, not necessarily the number of API calls.
   The same tape is used for both engines, independently of wall-clock time.
5. k is a free parameter. A comment requires it to include remaining validation
   and installation costs, but no inspected definition establishes a real
   overhead bound, installation transition, state migration, or timestamp gate.
6. There is no problem-specific utility definition or expected-value theorem.
   Same abstract final state plus cheaper modeled execution can support a
   later specified preference; it is not itself a theorem for an arbitrary
   user utility or a deadline-sensitive environment.
7. `deadline_counterexample` is a concrete cost/deadline inequality, not a proof
   of a working deadline-validation mechanism. `frozen_incumbent_counterexample`
   shows different final archives under two tapes, one permitting replacement;
   it does not itself prove optimality against future proof search.
8. Empty programs continue paying dispatch costs for every remaining tick.
   This is coherent idle semantics. An implementation that stops on empty code
   would need a corresponding model; it cannot import these savings unchanged.

## Disposition

Accept these as useful machine-authored abstract-model and semantic-preservation
work, subject to independent Lean compilation and axiom checks. No false claim
of a complete real-world Gödel machine appears in the inspected files. Do not
promote the names `concrete_switch` or “complete n-tick continuation” into a
claim that the actual research engine is fully modeled or has already installed
a certified improvement. Those require separate evidence.
