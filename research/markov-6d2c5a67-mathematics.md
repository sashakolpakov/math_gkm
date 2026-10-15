# Aligned constant layers and actual interval aggregation

Machine-authored live request 6d2c5a67e4e14b3993f3b98af6bf0e61.
The final validation receipts, not this narrative, determine compilation and
separate kernel replay status. Full Conjecture63 is unresolved.

Let c_n(s,d) be the constant coefficient of degreeLayer07a7 on the exact source
word B^n A B^(n+1), corresponding to the pinned path R^n L and fraction
(2n+1)/(2n+3). Set H_e(t)=sum_s c_n(s,s+e)t^s. For n>=1 the checked formula is

* e=0: 1+t.
* 1<=e<n: t(1+t)^(e-1)(2+(e+1)t).
* e=n: t(1+t)^(n-1)(3+(n+2)t).
* e>n: max(2n+2-e,0)t^2(1+t)^(e-1).

The source coefficient bridge is source_aligned_count6d. Polynomial coefficient
zeros and actual mask multiplicities are retained. No rational substitution or
division by a variable is assumed. The proof extracts coefficients of explicit
atoms, then counts the triangular diagonal of a rectangular finite sum.
source_negative_alignment6d proves c_n(s,d)=0 for d<s; negative e contributes
nothing for this family. This does not assert the same for every source word.

Each H_e has coefficient log-concavity, proved in source_aligned_constant_lc6d.
More substantially, cumulative layers telescope. Write P_E=sum_(e=0..E) H_e.

* E<n: P_E=(1+t)^E(1+(E+1)t).
* n<=E<=2n+1: P_E=(1+t)^E(1+(2n+2-E)t).
* E>=2n+1: P_E=(1+t)^(2n+2).

source_aligned_prefix_lc6d proves raw integer coefficient log-concavity of every
such cumulative aligned count sum, for all n>=1, all E and all cut counts s.
This is actual-multiplicity aggregation, not arbitrary reweighting.

For an active interval 1<=L<=U<=2n+1, its generating polynomial is P_U-P_(L-1).
Let C_E=E+1 if E<n, and C_E=2n+2-E otherwise. Factoring yields

    (1+t)^(L-1) [(1+t)^(U-L+1)(1+C_U t)-1-C_(L-1)t].

Here C_(L-1)<=U-L+1+C_U. The bracket is a nonnegative binomial-linear
polynomial whose constant coefficient is removed and whose linear coefficient
is decreased without becoming negative. This preserves CrossLC: comparisons
at index <=0 have zero left side, at index 1 the left side only decreases,
and at larger indices nothing changes. Pascal multiplication preserves CrossLC.
MarkovTrimLinear6d2c formalizes that mechanism; MarkovAlignedInterval6d2c connects
it to actual source interval sums. Its final build/replay status is in validation.json.
Intervals beginning at zero are covered by the prefix result. All these results
concern constant coefficients; they do not establish raw interior log-concavity.

Skipping intervening layers destroys the statement. For every n>=6,
H_0+H_5 begins [1,3,14] and has gap 3^2-1*14=-5. This is formally source-connected
in source_skipped_pair_failure6d. At n=6, source 13/15, the complete raw polygon
triple at (13,0),(14,0),(15,0) is [1,14,91], with gap 105. The latter is checked
both in Lean and by independent literal numerator recurrence (raw-source.json).
The auxiliary negative gap does not refute the pinned root.

## Experiments

aligned-intervals-all.json records all 394 reduced interior fractions with
3<=b<=36, all cut counts, all signed degree-minus-cut intervals between the
minimum and maximum active grading, and every polygon-valid triple in all three
directions: 52,516,538 horizontal, 52,516,538 vertical, 54,824,267 diagonal tests.
No failure was observed. Empty exterior extensions add only zero layers.
aligned-intervals.json is a separate smaller-cut scan. aligned-source.json
checks 302 larger sources with cut counts <=7 and 987,176 tests in each of the
horizontal and vertical directions. The actual input lists are saved.

transfer-validation.json independently compares the full marked-transfer sums
with the literal pinned numerator recurrence on 240 sources through denominator
28, checking 88,357 coefficient positions, with no discrepancy. This validates
the implementation on that finite range; it is not a universal source bridge.

aligned-arbitrary.json gives an arbitrary-word failure of the alignment itself.
aligned-matroid.json rejects a proposed matroid explanation of aligned sublevel
sets already for source 2/5: in word ABAB at e<=0, the cut sets {0} and {1,2}
are allowed, but neither {0,1} nor {0,2} is. This is an exact finite diagnostic,
not a claim that all possible matroid representations are ruled out.

## Remaining mathematics

The all-source, all-coefficient aligned interval property is still a conjectural
strengthening suggested by experiments. Its constants use signed e=d-s; general
sources can have negative e and must not be truncated to e>=0. A full interval
covering all masks recovers the unnormalized raw coefficient sums through the
inherited exact cut decomposition. Proving source-preserved interval aggregation
in all three directions would be sufficient, but no such universal argument is
provided here. The present mixed-run count result does not fill that gap.

## Final validation distinction

All six mathematical modules compiled at their final hashes with permitted
printed axiom closures. The official pinned leanchecker separately replayed
MarkovTrimLinear6d2c and MarkovAlignedInterval6d2c successfully. Four other module
replays timed out at 90/100 seconds; their compilation is not mislabeled as
successful separate replay. The direct known-module replay driver also timed out.
All imports were inherited compiled artifacts; no fresh whole-source rebuild,
independent completion audit, or proof of the root occurred. Every foreground
run finished or was killed by its recorded subprocess timeout before reporting.
