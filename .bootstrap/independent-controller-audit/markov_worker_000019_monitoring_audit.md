# Independent monitoring audit: worker 000019

Request `7252232b881c40b283530604624fc942`. Read-only audit of
`/Users/sasha/math_gkm/.control/markov/workers/000019/artifacts`.
No project edits, mathematical suggestions or proposer contact. Active worker
000020 was left undisturbed.

## Finding

The worker proves unconditional universal support results and discharges the
previously unproved interval-support premise for quotient slices. It does not
prove their adjacent log-concavity or close any remaining universal direction
of the main conjecture. The factorial-weighted failure concerns a stronger
predicate; the same actual source triple satisfies raw log-concavity.

One minor prose/Lean mismatch occurs in the opening paragraph of
`research/markov-7252232b-mathematics.md`: it identifies f,g as the two components
of the gas matrix applied to (1,u). The checked `fg_matrix725` identifies those
components as **(f,u*g)**. At the empty word this distinction is already visible:
f=g=1 whereas the matrix output is (1,u). The actual source scalar identity
h=v*f+u*g is correct in both the document and Lean, so this descriptive slip
does not invalidate the accepted support conclusions.

## Raw support and coordinate directions

`Filled725 d P` means: if A_(i,j)>0, then A_(k,l)>0 whenever k≥i, l≥j,
and k+l≤d. `source_filled725` proves this for the literal raw source numerator
of every finite path and d=a+b-1. There is no denominator cutoff or LC premise.
The source bridge uses the exact ordered word representation, not a speculative
identification with an enlarged matrix family.

This conclusion begins with an already positive coefficient. It does **not**
assert that every lattice point in the Newton polygon has positive coefficient,
or that the polygon is saturated. The total-degree restriction is explicit.

Combining propagation with the inherited outside-polygon-zero theorem gives
interval positive support in every horizontal and vertical row. The integer
coefficient sequences are extended by zero to negative indices. Zero entries
are retained, and identically zero rows satisfy interval support vacuously.
The equivalences `horizontal_cross_iff725` and `vertical_cross_iff725` therefore
remove a separate no-gap assumption when relating adjacent raw LC to CrossLC.
They are equivalences; neither LC side is newly proved by them.

## Quotient slices and conditional raw diagonal transfer

The new positive recurrence operates on the exact inherited quotient, with
outer variable t and inner variable x. Simultaneously proved invariants give:

- Nonnegative coefficients.
- From any positive coefficient in outer row r, positivity through inner
  index r.
- Vanishing when the outer index exceeds the word-length bound.
- Positive diagonal coefficient (r,r) within that bound.
- A separate wedge bound: inner index greater than outer index has zero
  coefficient.

`source_word774` connects the recurrence to `quotientSlice774 path r` and gives
the exact word length b-2. Consequently, for every source path and natural r:

- The quotient slice has interval positive support, including its integer
  zero extension.
- Its coefficient at inner index r is positive when r<b.
- The entire quotient slice is zero when r≥b.

These are universal proved properties, not conclusions extrapolated from the
earlier finite residual scans. In particular, the no-gap condition previously
needed by the upper-diagonal transfer is now genuinely discharged.

The new `upper_raw_lc_of_natural_adjacent725` still assumes

    forall k, Q_r[k] Q_r[k+2] ≤ Q_r[k+1]^2,

and retains the constraints 2r≤d and i+j+2+r=d. It then concludes the actual
raw diagonal triple inequality

    A_(i,j+2) A_(i+2,j) ≤ A_(i+1,j+1)^2.

The sibling theorem uses the equivalent adjacent inequality on integer-indexed
zero-extended sequences. Neither theorem proves the residual LC assumption.
The upper-half restriction is real; no LC-preserving deconvolution or lower-half
conclusion is inferred from the support theorem.

## Exact stronger-predicate obstruction

Twenty right steps give the actual source 21/22. The Lean proof verifies these
labels and polygon membership of (0,24), (1,24), (2,24), and obtains the exact
raw coefficients 190, 13965, 514845 from the universal checked low-column jets.

The failed weighting is specifically **multiplication by i!**, not division
by i!, nor a change in the original source predicate. The proved arithmetic is

    13965^2 = 195021225 < 195641100 = 2*190*514845.

The raw comparison is separately proved:

    190*514845 = 97820550 ≤ 195021225 = 13965^2.

Thus this is not a counterexample to Conjecture 6.3. Other reported finite
coefficientwise probes remain experimental observations, not additional
universal theorems. No historical novelty assertion is made here.

## Recorded verification inspected

Manifest: `evidence/markov-7252232b/validation-1791950504697170000.json`.
All four final source hashes match the manifest, host snapshot, and live bytes:

| Module | SHA-256 |
|---|---|
| MarkovSupport725 | 73c9e6610e6ded76930e997bd7f503d777c9541cfcd9e0e0c9c2095b966835cf |
| MarkovIntervals725 | a0d03e8e61619b3d0ba1517801d323e547beb42455c9e89b27ece603e7c53bcd |
| MarkovResidualSupport725 | eb201edd3efca935a49bdd5f3ba5d6a9c172214380e196c761135eb704a7e487 |
| MarkovFactorialObstruction725 | 47d20c9c6afa64d66014a9d6ec0682206000949eac151a645e36e00592f7b889 |

All four named compilations and four kernel replays succeeded with matching
source hashes. All eight receipt byte hashes match the archived host record.
Eighteen printed theorem axiom closures list only `propext`, `Classical.choice`
and `Quot.sound`. Three rejected elaborations have return code 1 and remain
separate from accepted evidence. Every listed direct-import binary hash matched.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host reports completion after 1116.79 seconds, mathematical resolution false,
and no completion certificate.

This is an independent source-meaning audit with inspection of matching recorded
checks. Those checks use inherited compiled imports; no fresh independent
full-source build was performed. The small descriptive mismatch above does not
require rechecking an altered theorem. The full published conjecture is open.
