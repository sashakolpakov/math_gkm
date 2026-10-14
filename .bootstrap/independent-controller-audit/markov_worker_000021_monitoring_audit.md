# Independent monitoring audit: worker 000021

Request `26dd33d6a67b4559b60690a5fd08502c`. Read-only review of
`/Users/sasha/math_gkm/.control/markov/workers/000021/artifacts`.
No project edits, mathematical guidance or proposer contact. Worker 000022
was left undisturbed.

## Finding

The final theorem **first_five_raw_logConcave26dd covers all source paths and
all natural triples on the first five upper diagonals**, retaining zeros.
There is no numerator restriction, denominator cutoff, path-length cutoff or
remaining LC hypothesis. The small-numerator restriction of the preceding
worker's fifth-diagonal result is genuinely removed.

The full conjecture is still unresolved: the new result concerns diagonal
direction (1,-1) at omitted homogeneous exponents r=0,1,2,3,4, not all diagonal
levels or the unresolved coordinate-direction inequalities. No substantive
English/Lean mismatch was found. No quintic formula or sixth-diagonal proof is
claimed by these three Lean modules.

## Exhaustive parameter split

The inherited exact quartic residual identity uses actual core-word length
n=b-2, true-letter count m=a-1, switch count s and triple statistic t. The new
proof establishes s≤2m for every core word. The inherited bounds s≤2(n-m),
t≤n-m and m≤n remain checked, rather than assumed word-admissibility rules.

For m≥6 the preceding universal quartic certificate applies. For m=1,...,5
and n≥10, `small_quartic_cert26dd` proves the lower coefficient estimates and
all three requisite gap certificates after n=x+10, x≥0. Finite enumeration of
these five values of m leaves a universal real x. Ring normalization and
positivity certify the polynomial bounds; actual source inequalities follow
through the proved monotonic bounds. This is not extrapolation from a finite
denominator experiment.

For n≤9, `shortWords26dd 9` recursively contains every Boolean word of length
at most nine. `mem_shortWords26dd` proves the required membership from the
length bound, so the finite case is exhaustive. `finite_quartic26dd` uses
ordinary Lean `decide` to establish the three exact integer quartic coefficient
inequalities for each listed word. There is no `native_decide`, external numeric
oracle or unproved interpolation premise. Empty and one-letter list entries
have a trivial predicate, but that does not leave a gap: the quartic formula
consumer has an explicit two-letter prefix, while the source adapter handles
shorter source cores separately.

For a≥2, an empty core contradicts the exact true-letter count. A one-letter
core gives a zero r=4 quotient slice by the inherited exact outer-degree bound.
Every longer core has m≥1 and falls into exactly one of the parameter branches
above. The exact quartic identity is mapped to real coefficients and the common
positive factor 24 is canceled. Thus `fifth_quotient_adjacent26dd` has only the
actual source condition a≥2 and proves all natural adjacent inequalities,
including quartic tail zeros.

## Polygon theorem versus final raw theorem

The intermediate `fifth_raw_logConcave26dd` still assumes d=a+b-1≥8, as required
by the upper-slice factorization at r=4. It separately handles a=1 using the
already checked complete numerator-one theorem.

`fifth_polygon_logConcave26dd` removes the d≥8 assumption. For a≥2, the genuine
polygon condition on the first endpoint (i,j+2), together with i+j+6=d,
forces d≥8; the finite small-degree contradiction is checked exactly. For a=1,
the inherited complete theorem again applies. There is no missing small-degree
case hidden by a natural-subtraction exponent.

The first-five polygon theorem combines that fifth-diagonal result with the
inherited first-four theorem. Finally `first_five_raw_logConcave26dd` assumes
only

    path : List Bool,
    r,i,j : Nat,
    r ≤ 4,
    i+j+2+r = a+b-1,

and concludes the literal raw integer inequality

    A_(i,j+2) A_(i+2,j) ≤ A_(i+1,j+1)^2.

If the first endpoint is inside the polygon, the checked polygon theorem
applies. Otherwise its coefficient is exactly zero by the source support
theorem, giving 0≤the middle square. This removes the guard without filtering
out zeros or requiring any unproved support assumption. It also covers the
cases where no valid polygon triple exists on the specified low-degree line.

The root's endpoint clauses 0/1 and 1/1 are unchanged and inherited; the new
universal path theorem concerns actual interior source polynomials. The
factor 24 is only a uniform denominator-clearing factor in an exact identity,
not factorial or binomial coefficient normalization.

## Unproved exploration stays separate

The quintic fitting and truncated-slice scans are labeled finite experiments.
Their candidate identities and sixth-diagonal implications are not introduced
as Lean assumptions or credited as proved results. The reported enlarged-word
degree-six obstruction is not presented as an actual source counterexample.
The corrected experiment bookkeeping is documented; it supplies no premise
to the universal first-five proof. This audit makes no historical novelty claim.

## Recorded verification inspected

Manifest: `evidence/markov-26dd33d6/validation-1791952476518063000.json`.
All final source hashes match the manifest, archived host record and live bytes:

| Module | SHA-256 |
|---|---|
| MarkovSmallQuartic26dd | af0c48415056639ffdb1b7b36a66d1b562150a4f2563fb51cf7277f07103221b |
| MarkovFiniteQuartic26dd | 9dbd9ade243c22c59b6f0e576fc6f54f577bf1d8b2e4035f3098e0dac1394df5 |
| MarkovFifthAll26dd | 61afef553a5e64afd4c19450c7eda71e93eacedb0a0b01927d027a9de07af1a6 |

All three compilations and three `leanchecker` replays have return code 0 and
matching final source hashes. All six receipt byte hashes match the host
archive. Nine printed theorem axiom closures use only `propext`,
`Classical.choice`, and `Quot.sound`; the finite decision theorem itself lists
only `propext`. Three rejected elaborations remain separately recorded with
return code 1. All listed direct-import binary hashes matched at audit time.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host records completion after 932.14 seconds, mathematical resolution false,
and no completion certificate.

This is an independent source-meaning review plus inspection of matching
recorded compilation/replay evidence with inherited compiled imports. No fresh
independent rebuild was performed. No discrepancy requiring one was found.
The full published Conjecture 6.3 remains unresolved.
