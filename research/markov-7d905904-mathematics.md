# Grading structure and diagonal tail certificates

Machine-authored live request 7d905904dcbe45a89408ca2cea9065c6.
Full pinned Conjecture63 remains unresolved. Validation receipts determine
the compiled and replayed statuses; no historical novelty is claimed.

The positive Fibonacci grading results and the separate unformalized full
interval derivation are in markov-7d905904-fibonacci-interval-derivation.md.
Their source-family restriction must not be dropped.

## An exact candidate certificate for the diagonal direction

Let M_j(z) sum over all actual s-cut masks of the exact source word, with
each mask's raw y^j coefficient multiplied by z to its individual degree d.
MarkovDegreeTail7d90 defines this ordinary polynomial without discarding zeros
and proves [z^d]M_j equals the degree-layer coefficient. At z=1 it proves
M_j(1)=A(i,j) whenever i+j=a+s. Thus the grading is an exact refinement.

Put Q(z)=M_(j+1)(z)^2-M_j(z)M_(j+2)(z). The candidate condition is that every
suffix sum of the ordinary coefficients of Q is nonnegative. A finite Abel
argument, formalized using the inherited finite-sum lemma, proves Q(z)>=0
for every z>=1 under precisely that hypothesis. Specializing z=1 gives the
literal raw diagonal inequality. No tail positivity hypothesis is discharged
for arbitrary sources by this conditional theorem. It says nothing about
horizontal or vertical triples, where s changes.

For a fixed diagonal s, aligned grade e=d-s shifts every degree of Q by -2s.
Therefore the experimental signed-grade suffix tests and this natural-degree
certificate agree. This is a uniform shift, not truncation of negative grades.
The experiment cumulative.json checked 11,529,188 diagonal suffixes on 440
listed sources without failure, stopping at its time limit. It does not claim
exhaustive coverage through denominator 40. Both prefix and suffix orientations
failed for horizontal and vertical gaps. Coefficientwise graded positivity
failed in all three directions (qgap.json).

A separate interval-restricted scan through denominator 24, with cut counts
at most six, checked 2,896,302 suffix sums across 335,288 intervals on all 178
listed sources, without failure (diagonal-tail-intervals.json). This also is
finite evidence. The formal tail lemma is stated for the complete marked sum;
the interval-restricted implication would use the same Abel argument but is
not separately packaged as a source theorem here.

## Why arbitrary positive grading weights cannot be assumed

For source 2/7, path [false,false,true], cuts s=2, the exact marked polynomial
is 1+3z(1+y)+z^2(11+25y+14y^2). MarkovGradingObstruction7d90 proves this from
the literal degreeCoeff recurrence. Its y=0,1,2 coefficient gap is

    z^2(-5+108z+471z^2).

At z=1/100 it is exactly -38729/100000000; for every z>=1 it is nonnegative.
At z=1, the actual raw polygon triple is [15,28,14], with gap 574. Its source
identity and guards were inherited in full27_raw07a7 and were independently
checked this run by the literal numerator recurrence in raw-checks.json.
Thus this disproves an unrestricted positive degree-deformation strengthening,
not the pinned conjecture. The earlier source already witnessed a different
failure of log-concavity in the degree coordinate; no discovery-priority claim
is made for that source or its inherited layer values.

## An infinite slanted grading obstruction

For every n>=3, take the exact source R^n L, fraction (2n+1)/(2n+3).
At constant y coefficient, the three layers with (s,e) respectively

    (n-1,n-2), (n,n-1), (n+1,n)

have values n-1,n,n+2. MarkovAlignedSlope7d90 derives them from the inherited
all-n aligned formulas and proves their gap is 2-n<0. Their individual
degrees are 2n-3,2n-1,2n+1. This compares different grades across cuts; it
is neither a fixed aligned interval nor a full raw triple.

The same module proves that the complete raw horizontal triple at
(3n,0),(3n+1,0),(3n+2,0) is polygon-valid and satisfies log-concavity, using
the inherited universal boundary theorem. At n=3 its raw values are
[28,56,70], gap 1176, while the selected-layer values are [2,3,5], gap -1.
The independent literal recurrence checked n=3,...,15 as operational evidence.

## Operational reconciliation

83 predecessor artifact hashes and six inherited-index hashes matched.
The immediate predecessor's raw final event was turn.completed. Earlier
interrupted effects had already been reconciled in the completed chain;
no possibly completed mutation was replayed. Only unique research/evidence
artifacts were written. Root, contract, prior evidence and controller records
are preserved and rechecked in preservation.json.

Official leanchecker invocations timed out. Its pinned source was inspected:
it scans all search-path oleans before selecting modules, and imports cached
dependencies for replay. The inherited explicit-module driver uses that same
replay body while bypassing discovery. Its successful and failed statuses are
recorded separately; it is neither a fresh dependency rebuild nor an external
verifier. The attempt to request leanchecker --help instead selected the
default package target and failed to find Math_gkm; this is a capability
observation. The active profile denies .scratch, so durable per-run evidence
paths were used. No external action request remains pending.

Final validation: all five new modules compiled at their final hashes with
permitted printed axiom closures. Explicit-module kernel replay passed for
all five. The same replay also passed for the four inherited modules whose
separate checks had timed out: MarkovAlignedCount6d2c, MarkovAlignedLC6d2c,
MarkovAlignedPrefix6d2c and MarkovAlignedObstruction6d2c. The driver is the
inherited ReplayKnown6d2c source, compared this run to the pinned LeanChecker
replayFromImports body. Official discovery-command timeouts remain recorded;
these successes are not a fresh whole-source rebuild.
