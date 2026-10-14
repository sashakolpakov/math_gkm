# Worker 000051 formula audit

Request `487ae88398fa4257b0567f68f6371317`. Read-only static mathematical audit of `MarkovLowerBlocks487`, `MarkovRunJet487`, `MarkovLowerSequence487`, and `MarkovLowerFormula487`, their scope documents, and the existing finite probe. No experiment reruns, Lean invocation, source edits, proposer contact, or successor interaction. The report and adjacent input hashes are the only outputs. Compilation/replay and the cyclic-trace/source/interior modules are audited separately; statements below describe the actual mathematical source, not new replay certification.

## Finding: one prose equality is incorrect

`research/markov-487ae883-mathematics.md:59` says that the first-center gap of L, when the right coefficient is nonzero, equals `(a-1)^2+4c(c-1)`. This omits **4a^2**. With the actual definitions and a>c,

`L1^2-L0*L2 = (3a-1)^2 - (a+c-1)*4(a-c) = 4a^2+(a-1)^2+4c(c-1)`.

For example a=3,c=2 gives the actual triple [4,8,4] and gap 48, whereas the stated prose expression gives 12. `MarkovLowerSequence487.lean:19` asserts the inequality, not the erroneous gap equality. Its case split and arithmetic are consistent with the correct expression. This prose discrepancy does not invalidate the stated sequence inequality or alter the raw coefficient formula. No source correction was made.

## Exact source blocks

`lowerRun487 n` is A followed by n B letters, with A=false and B=true. `lowerSub487 n z` replaces each false in z by A B^n and each true by A B^(n+1). The source pair update is the actual concatenation recursion `(L,R)->(LR,R)` or `(L,LR)`, starting from (A,B); `sourceWord28` is the concatenation of the resulting pair.

`source_lower_blocks487` is a disjunction for every finite path:

- either the path is all true, including the empty path;
- or there are n and a Boolean word z containing both letters, with the actual source word exactly `lowerSub487 n z`, and actual labels `a=n*length(z)+count_B(z)`, `b=(n+1)*length(z)+count_B(z)`.

The proof splits at the first false path letter. It does not replace the source by an arbitrary word with matching counts, and proves no converse that every z is a source. Setting c=length(z), r=count_B(z) gives c>=2, 0<r<c, a=cn+r, b=c(n+1)+r, and c=b-a. The n=0 case is explicitly allowed. The non-Pell conditions matter: neither r=0 nor r=c is silently treated as a mixed-run source.

The all-true path true^k has source word A B^(k+1), label a=k+1,b=k+2,c=1. Thus this branch is a single block; it is not a source word consisting entirely of B letters.

## Run coefficients and the length guard

Write S_n=y+...+y^n, S_0=0, and M_n=T_A T_B^n. `lowerMatrix_jets487` states the following exact ordinary coefficients in excess variable x:

`[x^0]M_n = [[0,0],[2S_n,1]]`,

`[x] (M_n)_12=1`, `[x](M_n)_11=2S_n+y^(n+1)`, and `[x](M_n)_22+2S_n=H_n`.

The recurrence is H_0=1 and `H_(n+1)=H_n+1+3y+4yS_n`. `lowerH_coeff487` gives `[y^0]H_n=n+1`, `[y]H_n=3n`, and, for j>=2, `[y^j]H_n=4 max(n+1-j,0)`. In the Lean statement the last expression is natural subtraction before casting to integers, which implements the stated zero truncation. All n, including n=0, are covered.

The generic `LowerShape487` requires zero top row at x=0, bottom-right constant 1, and upper-right first coefficient 1. Under these hypotheses multiplication preserves the shape, adds `lowerJet=d1+c0`, and makes the product's trace first coefficient equal to that sum. Consequently a nonempty list of blocks has additive lowerJet; **trace additivity requires at least two blocks** in `lower_trace_sum487`.

That guard is mathematically necessary. A single block has `[x]tr(M_n)=H_n+y^(n+1)`, not H_n. The code retains precisely this difference in its separate Pell formula. Additivity applies to the first trace coefficient; no commutativity or order independence of the full transfer matrix, nor of higher coefficients, is asserted.

## Slice formula and endpoint

`lower_trace_two_lengths487` requires length(z)>=2 and gives

`[x]tr(T_lowerSub(n,z)) = c H_n + r(1+3y+4yS_n)`.

It holds for any z satisfying that guard, but its use for actual sources is through the exact source block theorem. `source_lower_slice487` then supplies the same all-true/mixed disjunction and, in the mixed case,

`cutCoeff(y,y,1,central(path)++[B],1) = c H_n+r(1+3y+4yS_n)-1-y`.

This is a polynomial identity in y at selection/excess count **1**, not an evaluation at y=1, and not a general formula for all excess counts. It relies on the inherited cyclic trace bridge audited by the parent.

Using a=cn+r and 0<r<c, its coefficients are exactly

`L0=a+c-1=b-1`, `L1=3a-1`, `Lj=max(4(a-c(j-1)),0)` for j>=2.

For 2<=j<=n+1 the coefficient is `4[c(n+1-j)+r]`; at j=n+1 it is 4r when this range exists. For j>=n+2 it is zero. When n=0 all j>=2 coefficients vanish. Thus the natural subtraction in H_n and the integer maximum in L agree without deleting any coefficient.

`source_pell_slice487 k` instead gives `H_(k+1)+y^(k+2)-1-y`. With a=k+1 this is the c=1 ramp plus a single **1 at j=a+1**, where the ramp alone is zero. It corresponds to i=0 on i+j=a+1. For k=0, the empty path is the actual source 1/2 and the slice is [1,2,1], including that endpoint. The separate root endpoint fractions 0/1 and 1/1 are not path midpoints and are not proved by these four modules; their treatment is outside this subaudit.

## Sequence inequality and indexing

`lowerSeq487` is defined for arbitrary integers a,c and natural j. Both its nonnegativity theorem and LC theorem assume a>=1 and c>=1, with no upper bound or nonzero-coefficient premise. The conclusion compares L_j,L_(j+1),L_(j+2) for every natural j.

At the first center the corrected gap is given above. At the second, if a>2c so the right coefficient is nonzero, the stated gap `4[(a-c)^2+3c^2+a-2c]` is correct. For triples entirely in the positive linear tail, the gap is 16c^2. Otherwise the proof explicitly detects a zero right endpoint and retains the zero in the inequality. There is no division by a coefficient. This theorem concerns the base ramp; it does not itself include the extra Pell endpoint, which is why the source transport uses the separate Pell branch.

The polynomial y index is the original v exponent j. On the first-excess slice i+j=a+1, a raw diagonal triple `(i,j+2),(i+1,j+1),(i+2,j)` reads L_(j+2),L_(j+1),L_j. Its reversed order yields the same endpoint product in LC. The run/formula modules retain ordinary integer coefficients, with no factorial/binomial weighting, and introduce no polygon replacement. The later source theorem's three original polygon guards and residual reduction are audited separately.

## Existing finite evidence

Static inspection of `lower-probe.json` and its producer finds **7,114 distinct reduced inputs**: all **6,857** fractions 1<=a<b<=150, plus **257** accepted coprime draws from 400 seeded attempts (seed 487; attempted b range 151..1500, actual accepted range 155..1497). The script performs no resampling to replace rejected noncoprime draws. The stored deterministic prefix exactly matches its declared enumeration.

The first-cut routine explicitly accumulates each possible single selected position after appending B. Its expected formula includes the c=1 endpoint delta. The recorded counts agree with sums over the saved inputs: **477,626 coefficients = sum(a+3)** and **463,398 adjacent triples = sum(a+1)**. Padding zeros are kept; the lists extend through j=a+2, one position beyond the natural i>=0 portion of this slice. No failure is recorded.

For the **101 inputs with b<=18**, the script computes the full ambient transfer but asserts equality only for first-excess coefficients at the list's bounded j indices. It does not assert equality of complete sparse dictionaries or explicitly check for further transfer terms beyond that range. Thus this is 101 finite coefficient-range cross-checks, not a universal source/transfer bridge.

The saved palindrome obstruction is B A B^7 A B, virtual reduced label 10/13, with [28,20,16] at s=1,j=2,3,4 and raw gap -48. Its virtual points (9,2),(8,3),(7,4) satisfy the pinned polygon, but the actual mechanical 10/13 central word is B^3 A B^3 A B^3. The witness differs from it and is not a source refutation. The JSON's `source:false` is a supplied classification, not an assertion tested by this probe.

Apart from the explicit first-gap prose error, the reviewed block/run/sequence/formula statements and their indexing are mathematically consistent at source level. All universal claims remain subject to the separate accepted compilation/replay and inherited-bridge audit. No proof strategy or implementation suggestion was supplied.
