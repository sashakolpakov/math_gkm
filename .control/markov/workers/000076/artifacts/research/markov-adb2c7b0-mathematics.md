# Direct cyclic source bridge and third lower slice

Machine-authored live request `adb2c7b044ee463584f90512a565fe95`.
Full pinned `MathGKM.Markov.Conjecture63` remains unresolved.

## Checkpoint: completed source bridge

The previous cubic-moment premise is discharged for `false::rest` when the
predecessor label `r/c` has `c≥4`. New proofs use a direct telescoping identity
instead of identifying recursive lists with permutation orbits. All prior
artifacts are preserved. The local cubic expression differs from

    (2−12y+6y²) + r_bit(2+30y−30y²+6y³)
    + q_bit r_bit(−144y³−96y⁴)
    + p_bit(1−q_bit)r_bit 24y⁴ + p_bit q_bit r_bit 24y⁵

by `F(p,q)−F(q,r)`, where

    F(p,q)=p_bit(12y−12y²+4y³)
           +q_bit(2+30y−30y²−6y³)
           +p_bit q_bit(−120y³−96y⁴).

On the exact source word beginning 0 and ending 1, these terms telescope.
The inherited source counts identify the remaining sums. The ordered-matrix
bridge proves all wrap terms explicitly. First and second trace moments
identify the other terms of the cubic Newton identity. Gauge cancellation
then gives the actual source trace, and the existing all-index coefficient
bridge yields `source_third_formulaADB2` with its uniform factor six.

## Unconditional raw inequality

`source_third_lower_lowADB2` proves the literal raw integer inequality

    A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)²

for every finite source path with `2a≤b` and `i+j+2=a+3`, with the original
polygon guards. No finite denominator bound, support filter, normalization,
or source-formula assumption is present. The third slice is the **lower**
slice `i+j=a+3`; it must not be confused with the published third upper
diagonal `i+j=a+b−3`.

For `c≥4`, all reduced predecessor fractions are covered by the four inherited
algebraic chambers. Coprimality excludes the unrepresented boundary ratios
1/2 and 2/3 at these denominators. Small predecessor cycles are handled
separately: `c=2` has no applicable polygon triple, while `c=3` gives a top
or second upper diagonal whose raw inequality was already proved.

`root_iff_interiorADB2` states an exact equivalence to the pinned root after
removing this now-proved slice from the residual. Its right side remains
unproved and includes the horizontal, vertical, and remaining diagonal
inequalities. It is not a root closure.

Build/replay receipts and rejected attempts are retained under
`evidence/markov-adb2c7b0/`. Pinned inherited compiled imports are reused;
this is not a fresh whole-source rebuild or an independent completion audit.

## Arbitrary run lengths

`source_tripleScanADB2` generalizes the telescoping step to ANY function of
three Boolean letters with values in a commutative ring. Its five source
statistics are the word length, number of ones, adjacent 11 count, 101 count,
and 111 count. The truth-table expansion and the boundary potential are proved
by ordinary ring reasoning, without importing an external mathematical claim.

`source_run_cut3ADB2` applies this to gauged blocks `AB^n` and `AB^(n+1)` for
every natural `n`, retaining the source order. For predecessor denominator
`c≥4`, if `C1,C2,C3` are the actual source cut polynomials and `L` is the local
third moment, it proves

    6 C3 = 6 C1 C2 − 2 C1³ − 2(1+X)³ + L.

`thirdRunPolyADB2 n c r` substitutes the proved first- and second-slice
polynomials and the five exact source counts. It has no source word or trace
as an input. `source_third_run_rawADB2` proves its coefficient at every `j`
equals six times the actual raw coefficient on `i+j=a+3`. This is a universal
identity for `replicate n true ++ false::rest`, `c≥4`, not a log-concavity
result for `n≥1`. The conditional transfer exposes that remaining inequality.

The generic two- and three-block cubic cumulants are also proved, including
the missing top-left terms. The actual source 1/4 has third cut polynomial
`1+4X+6X²+4X³+X⁴`; `third_small_formula_failureADB2` proves the uncorrected
large-cycle `ThirdFormula75` false on this source. This is an obstruction to
dropping the length hypothesis, not a refutation of the pinned conjecture.

## Exact finite experiments

The new experiment derives jets from literal 2×2 matrix multiplication,
builds Boolean truth-table moments, and compares the resulting cubic formula
with both a backward cut recurrence and the pinned numerator recurrence.
On 611 applicable reduced sources through denominator 48, it matched 30,818
backward coefficient positions and 11,593 literal raw positions. It also
checked 957 polygon-valid low-slope third-slice triples, including small cycles.
All arithmetic is exact; these are finite checks, not universal theorems.

For each of run lengths n=0,…,8 and the four source-statistic chambers, it
expanded every cubic-slice coefficient gap as a polynomial in nonnegative
integer chamber parameters. All 540 expanded gaps have nonnegative
coefficients. These Python symbolic expansions have NOT been replayed as Lean
identities and do not prove universal inequalities, especially in unbounded n.
The full coefficient and gap tables are in `run-chamber-symbolic.json`.

An additional finite check for 26 three-block sources, n=0,…,12 and r=1,2,
matched 1,144 positions after adding the uniform scaled correction `6X^b`.
Sage and SymPy are unavailable; GAP is available but was not used.

## Three-block correction proved

`source_third_run_poly_threeADB2` proves, for every n and predecessor path
with c=3, that the actual scaled third cut polynomial is

    thirdRunPolyADB2 n 3 r + 6 X^b,

where b is the actual source denominator. Thus the c=3 exceptional term is
now formally identified for all run lengths. The c=2 generic matrix cumulant
is proved, but its full parameter-only source correction and general-n
coefficient inequalities remain unfinished. This does not weaken the completed
low-slope theorem, whose small cases are already covered.
