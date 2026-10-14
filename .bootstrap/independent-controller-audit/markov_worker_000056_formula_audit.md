# Worker 000056: static formula and finite-evidence audit

Request: `7955df0c4dc1407e99579ba90e1017ab`. Repository: `/Users/sasha/math_gkm`. Scope: `MarkovNextCertificate7955`, `MarkovNextAlgebra7955`, `MarkovNextBinomial7955`, the mathematical/correspondence notes, and the three current experiment artifacts and their scripts. This was a read-only source/data inspection. No project code was executed or imported; no experiment or Lean invocation was rerun. Only independent loop-bound arithmetic, JSON inspection, and file hashing were performed. Source linkage, the horizontal source theorem, residual equivalence, build/replay receipts, and controller timing belong to the parent audit.

## Finding

No mathematical discrepancy was found in the assigned Lean formulas, index conditions, zero handling, or clearing factors. The recorded finite counts agree with the scripts. One prose qualification is needed: the progress note's “253208 parameter tests showed no horizontal failure” counts both horizontal and vertical evaluations. There are 126,604 parameter tuples and 126,604 horizontal evaluations, plus 126,604 vertical evaluations. This does not alter the no-horizontal-failure observation.

The failed vertical examples concern the auxiliary switch-zero envelope. They are not counterexamples to the raw coefficient inequality. The follow-up vertical certificates and finite `s=2` experiment remain explicitly outside the new Lean theorem claims.

## Certificate and raw-gap algebra

Use the notes' notation `D=i+j`, `N=D+2-B`, and let `T(s)` and `Q` be the displayed cubic and quadratic expressions. `nextT7955` agrees with that cubic after substituting `N-1` into the inherited `cubicB/C/D5a7` definitions; `nextQ7955` agrees literally. The certificate concerns

`G = 3(D-1)(D-2)(i+2) Q² - 2D(D+1)(i+1) T(0) [N(i+2)+Bj]`.

`nextGap_nonneg7955` assumes natural `i,j`, real `B≥0`, `2B≤D+1`, and `D≥3`. It establishes `G≥0`. It does not require an experimental denominator bound, source coprimality, or nonzero coefficients. The four cases are `(i,j)=(x+3,y),(2,y+1),(1,y+2),(0,y+3)` with nonnegative free indices. Consequently all natural positions with `D≥3`, including the axis cases, are covered.

Each identity multiplies `G` by `(2(D+1))^4` and equates it to the corresponding Horner polynomial in nonnegative quantities `x,y,2B,D+1-2B`; the unused `x` in the three small-index certificates is harmless. The multiplier is strictly positive on the stated domain. The saved horizontal coefficient lists contain 355, 45, 45, and 45 positive coefficients, matching the notes and generator's case counts. The generator's interval transformation has degree four in `B`; homogenizing its interval variable into `2B` and `D+1-2B` gives the displayed clearing multiplier. The source proofs use `ring` for these identities and `positivity` for certificate signs. This subaudit did not independently rerun polynomial expansion or Lean checking.

`next_triple_bound7955` assumes `B≥0`, `N≥B+1`, `N+B=D+2`, `D≥3`, `s≥0`, and the three exact identities

```
2D(i+1) M = F Q
(i+1)(i+2) R = (D+1) F [N(i+2)+Bj]
6D(D-1)(D-2) L = T(s) F.
```

Here `F,L,M,R,s` are real variables; the abstract theorem does not assume `F` or any coefficient is positive. It uses `T(0)-T(s)=12s i j(j-1)≥0`, valid because `i,j` are natural and `s≥0`. The exact resulting identity is

```
12D²(D-1)(D-2)(i+1)²(i+2)(M²-LR)
 = F² [3(D-1)(D-2)(i+2)Q²
       -2D(D+1)(i+1)T(s)(N(i+2)+Bj)].
```

The bracket is nonnegative and `F²≥0`. Only the strictly positive factor on the left is cancelled. No coefficient or binomial factor is divided out, and zero coefficients are retained. These factors agree with the mathematics note; the conclusion is the raw inequality `LR≤M²`, without binomial or factorial normalization.

## Binomial and zero cases

`choose_three_real7955` is `6 choose(n,3)=n(n-1)(n-2)` for every natural `n`, explicitly including `n<3`. `fall_three7955` assumes only natural `k≥3` and states

`n(n-1)(n-2) choose(n-3,k-3) = k(k-1)(k-2) choose(n,k)`.

There is no hidden `k≤n` or nonzero-binomial assumption. Natural subtraction and the vanishing factors handle the small/out-of-range cases.

For `D=i+j`, the coefficient of `X^i` in `(1+X)^(D-3) X^k`, multiplied by `D(D-1)(D-2)`, equals `choose(D,i)` times the following factor:

| k | Factor |
|---|---|
| 0 | `j(j-1)(j-2)` |
| 1 | `i j(j-1)` |
| 2 | `i(i-1)j` |
| 3 | `i(i-1)(i-2)` |

The `k=0,1,2` wrappers require `D≥3`; `k=3` holds for all natural `i,j`, because `i<3` gives zero and `i≥3` already forces `D≥3`. The mixed helper requires `i,j≥1`, but its wrapper handles `i=0` and `j=0` separately. Guarded coefficient shifts and binomial coefficients above degree supply the other zero cases. There is no negative-index lookup or cancellation of a potentially zero coefficient.

## Exact scope of the recorded experiments

Counts below were checked by independent arithmetic on the loop bounds and guards, without evaluating the project's polynomial/transfer routines.

* `topnext-algebra.json`: integer `3≤D≤89`, `0≤B≤floor((D+1)/2)`, `0≤i≤D`, `j=D-i`, `s=0`. This gives 126,604 parameter tuples and 253,208 direction evaluations. The only recorded first failure is vertical: `D=3,B=1,i=1,j=2`, cleared auxiliary gap `-13824`. The script continues through the full bounds after finding a failure and saves only the first failure per direction. No source or polygon condition is imposed in this scan.
* `topnext-source-probe.json`: all 1,259 reduced fractions `1≤a<b≤64`. The source word is the interior of the length-`b` mechanical word, and the transfer lookup is `A(i,j)=F.get((i+j-a,j),0)`. On `D=a+b-4`, all `i=0..D` with `D≥3` receive the three coefficient-identity comparisons: 77,314 positions and 231,942 identities. The lower polygon guard `bi+aj≥ab` selects 77,183 triples per direction. On this fixed layer the upper degree condition for both successive positions follows automatically. No nonzero filtering is applied. The artifact records no identity or raw horizontal/vertical inequality failure. These are finite checks of the script's transfer output, not universal source theorems or a fresh independent audit of the inherited transfer implementation.
* Its first vertical auxiliary-envelope failure is the actual reduced source `2/7`, `i=1,j=4`, `s=2`, raw triple `[4,8,12]`, auxiliary gap `-691200`. The raw inequality holds with `8²-4·12=16`. This cleanly distinguishes the rejected envelope from the target inequality.
* `vertical-envelope.json`: `1≤a≤64`, `a<b≤99`, `D=a+b-4≥3`, all `i+j=D` satisfying `bi+aj≥ab`, evaluated at each of `s=0,2`. There is **no coprimality restriction**. The 374,452 guarded index samples yield 748,904 evaluations. The first `s=0` failure is `a=2,b=6,i=1,j=3`, gap `-138240`; `2/6` is not a reduced-source witness. No `s=2` failure is recorded. This scan neither evaluates actual source switch counts nor proves the `s=2` envelope universally.

## Vertical candidate scope and remaining limits

The original transformed vertical coefficient lists have 365/49/48/32 terms in the large/two/one/zero cases, with respectively 0/2/23/20 negative coefficients. Thus only the large-index case has an all-positive list in that unrestricted interval transformation. It corresponds to `i≥3`, `B≥0`, `2B≤D+1`; its polynomial identity was not added as a vertical Lean theorem in the assigned modules.

The follow-up script fixes `i=0,1,2`, sets `B=t+3`, `N=B+1+c`, and hence `j=2t+c+5-i`, with nonnegative `t,c`. These are exactly the notes' small-index domain `B≥3` (source numerator `a≥4`), `N≥B+1`. Each of the six `(i,s)` cases, with `s=0` or `2`, has 68 saved positive coefficients and no negative entries. The prose's three switch-zero cases are therefore supported by the stored lists and parameter substitutions; the artifact additionally includes the three `s=2` cases. These are candidate symbolic certificates, not new formal vertical results. The notes explicitly retain the unresolved connection for small numerators and do not claim full-root completion.

The scripts have top-level experiment/output actions, including imports of `topnext_7955`; they were only read, never imported. No artifact was regenerated. Input SHA-256 values are recorded in the adjacent `markov_worker_000056_formula_audit_inputs.sha256.json`.
