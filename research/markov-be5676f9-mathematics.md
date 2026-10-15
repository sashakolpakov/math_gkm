# Fourth moments for arbitrary runs and fourth diagonals through slope 2/3

Machine-authored live research, request `be5676f95b2a42969d21ef1f51f30bc6`.
The exact pinned `MathGKM.Markov.Conjecture63` remains unresolved. Final
acceptance of individual statements is recorded in this run's validation.json.
All fourteen new mathematical modules compiled and passed union kernel replay;
all 108 named theorem axiom closures use only the permitted axioms. Six rejected
build attempts remain in the evidence directory, separate from accepted sources.

## General four-letter averaging

For an arbitrary ring-valued four-letter function f define

    P(p,q,r) = f(p,q,r,0)+f(q,r,0,0)+f(r,0,0,0),
    H(p,q,r,s) = f(p,q,r,s)-P(p,q,r)+P(q,r,s).

The cyclic sum is unchanged, by an exact telescoping identity. Moreover,
H(p,q,r,0)=f(0,0,0,0). Thus H splits into its constant value, a three-letter
function H(0,q,r,s)-f(0,0,0,0) that vanishes when s=0, and a four-letter
function H(p,q,r,s)-H(0,q,r,s) that vanishes at either endpoint zero.
The inherited exact source statistics apply to those two functions.
`fourMomentBE` packages the resulting parameter-only cyclic average.

This construction works for arbitrary f over every commutative ring. It
requires no fitted polynomial, no positivity assumption, and no enumeration
of source paths. The telescoping boundary and the rotation to the inherited
scan convention are proved explicitly in `MarkovFourMomentBE`.

## All run lengths

Every mixed path has the form `replicate n true ++ false :: rest`. Write
c=(frame rest).mid.b and r=(frame rest).mid.a. The resulting source has
a=cn+r and b=c(n+1)+r. All its gauged run blocks have b-coefficient of
degree one equal to one. Consequently the fourth local logarithmic trace
jet depends on four source letters, even though the uncontracted formula
appears to use five. `runLocalFourBE` gives this contraction.

`source_fourth_run_momentBE` proves, for every n and every rest with c≥5,
that the fourth trace cumulant equals `fourMomentBE (runLocalFourBE n) c r`.
Here the cumulant is the exact integral expression

    24 t4 - 24 t1 t3 - 12 t2² + 24 t1² t2 - 6 t1⁴.

No analytic logarithm is introduced. The determinant contribution vanishes
only after c≥5 is established, using the inherited divisibility theorem.
`source_fourth_explicit_rawBE` transports the result to literal source
coefficients on i+j=a+4, with a uniform factor 24. This factor is common to
all coefficients and cancels from the quadratic comparison.

`MarkovFourthAllCyclesBE` additionally treats c≤4 by the actual finite
source word `0^(c-r)1^r`. Reducedness and the source word counts justify this
word for precisely these small denominators. Its gauged trace is retained
literally, so determinant corrections for c=2,3,4 are not dropped.
`source_fourth_parameter_rawBE` is the resulting parameter-only coefficient
identity for every mixed source, with no lower bound on c.

## Run one and slope at most 2/3

The six strict predecessor chambers have boundaries
0, 1/4, 1/3, 1/2, 2/3, 3/4, 1. Reducedness excludes every nontrivial chamber
boundary when c≥5. The new explicit moment specializes to an exact polynomial
in c,r,X on each chamber. The first three slices come from inherited proved
formulas; together these determine the fourth slice.

Each adjacent coefficient gap is proved nonnegative after writing the
parameters in nonnegative Farey-cone coordinates x,y. The generator records
the expanded polynomial certificate; Lean `ring` checks the identity and
`positivity` checks its sign. This is a universal argument on each chamber,
not interpolation or verification of a finite parameter grid. Coefficients
past the final listed position are explicitly zero.

For n=1 and c≤4, all cases except c=4,r=3 fall among previously proved upper
diagonals. The exceptional case is the actual source a/b=7/11. Its fourth
lower diagonal, in increasing j, is

    210,1596,5380,10579,13426,11496,6752,2720,744,136,16,1.

Its source word and cut expansion are proved before its numerical inequalities.
This preserves the short-cycle correction and all zero tails.

`source_fourth_lower_two_thirdsBE` proves the original raw diagonal inequality
on i+j=a+4 for every source satisfying 3a≤2b, with all three polygon guards.
Pure-right paths use the inherited Pell diagonal theorem. Mixed paths under
this slope bound have n=0 or n=1, covered respectively by the inherited
low-slope result and this run's theorem.

`root_iff_coreBE` states `Conjecture63 ↔ InteriorCore63BE`. The new residual
retains the previous horizontal and vertical interiors. Its diagonal clause
retains the old upper/lower bounds and requires

    a+5 ≤ i+j+2  OR  2b < 3a.

Thus higher lower diagonals and fourth lower diagonals at slope greater than
2/3 remain explicit, as do the other two directions. This predicate is unproved.

## Experiments and limits

`research/experiment_be5676f9.py` implements the literal gauged matrices and
local four-letter moment with rational arithmetic. It checked runs
n=0,1,2,3,4,7 and 5≤c≤20 with gcd(c,r)=1: 732 source/run instances,
832 independently computed raw coefficient positions, and 11,590 valid
fourth-diagonal triples. No failures occurred. These are experiments only.

`small_cycle_probe_be5676f9.py` separately checked every reduced predecessor
of denominators two, three and four for n=0,...,8: 45 source/run cases,
228 literal coefficient positions and 775 valid triples. The saved output
retains the difference between the actual fourth trace and the naive long-cycle
moment. At n=1,c=4,r=3 this difference is 24 X^11, explaining the final
coefficient one in the exceptional source sequence. No failures occurred.

An exact Python symbolic comparison also matched all eighteen inherited
high-run candidate moments (n=1,2,3, six chambers each) to the expressions
obtained from the new local statistic. This consistency check does not by
itself provide a Lean specialization proof for n=2,3.

The same symbolic calculations produced nonnegative Farey-cone gap
certificates for all six chambers at n=2,3 as well. They have not been
transported and checked in Lean here. They are advice for a subsequent run,
not theorem premises or completed inequalities.

No historical novelty is claimed. Inherited compiled imports are reused.
There is no fresh whole-source rebuild and no independent hash-bound
English/source completion audit in this run.
