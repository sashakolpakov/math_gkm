# Worker 000042 finite-evidence observational audit

Request `80b7912a37f44a85a9093d9d5ef87118`. This is a static audit of existing scripts, six evidence JSON files, and the mathematics/correspondence/checkpoint documents. No experiment was rerun, no project code was imported or edited, no Lean command was invoked, and no worker/proposer was contacted. Only this report and its adjacent input-hash record were written, under `/private/tmp/math_gkm_godel_20261013`.

## Scope boundary

The documents distinguish the claimed universal results (all-direction log-concavity of the zero-weight deformation, exact polynomial-parameter identities, and nonnegative constant horizontal-gap coefficient) from the experimental first-order gap positivity. The source correspondence is at weight one; the zero-weight inequalities do not establish weight-one source inequalities. The formal constant/linear **polynomial parameter coefficient** formulas are not the same claim as nonnegativity of the **linear coefficient of a horizontal gap**. The latter remains experimental. Lean theorem/receipt verification is outside this subaudit.

The source-search JSON is a literature-search provenance record, not an enumeration of source polynomials. It lists three queries and one primary-page URL, says no retrieved theorem was adopted as a premise, and records `mathematical_resolution: false`. No external literature claim was independently checked here.

## First-order candidate

For fixed a,j the checker defines, with binomial coefficients extended by zero outside their natural range,

- `A0(q) = choose(a,q) choose(2q,j)`;
- `A1(q) = q choose(a-1,q) choose(2q,j-1)`;
- `G1 = 2 A0(k+1) A1(k+1) - A0(k) A1(k+2) - A1(k) A0(k+2)`.

The document's candidate ratio is `A1(k)/A0(k) = j k(a-k)/(a(2k-j+1))`. The bulk substitution is `r=2k-j>=0`, `m=a-k-2>=0`. The stored proposed identity is

`G1/A0(k)^2 = 4j(a-k)(a-k-1)(2k+1)T / [a(r+1)^2(r+2)^2(r+3)(r+4)(r+5)]`,

where

`T = 2(a-k)(2k+1)(k+1)(r+4)(r+5) - k(a-k)(2k+3)(r+2)(r+5) - (k+2)(a-k-2)(2k+3)(r+1)(r+2)`.

The actual `linear-gap.json` format matches `linear_sparse_80b7.py`, the documented fallback after SymPy was unavailable, rather than `linear_gap_80b7.py`. The fallback imports the existing sparse rational-arithmetic helper, resets its variable count to three, substitutes `k=(j+r)/2`, `a-k=m+2`, and expands T. The artifact lists 21 monomials, all with strictly positive coefficients. There is no numerical sampling in that sparse expansion.

A material evidential limit: `linear_sparse_80b7.py:14` writes the normalized-gap formula as a literal string. That script does **not** symbolically derive or assert the rational identity, nor does it extract A1 from the formal parameter polynomial. Its computed certificate is the expansion/signs of T. The rational identity is separately tested at finitely many integer inputs by `check_linear_80b7.py`.

## Exact finite-check coverage

`check_linear_80b7.py:7–18` ranges over `2<=a<=40`, `0<=k<=a-2`, `0<=j<=2k+2`. The recorded 22,100 checks agree with the loop count `sum_(a=2)^40 (a^2-1)`.

Every sample asserts `G1>=0`. Only samples with `r>=0` additionally assert the rational identity, using exact `Fraction` arithmetic. There are 20,540 such bulk samples. The remaining 1,560 are exactly `r=-1` and `r=-2`; these check positivity only, without division by A0(k). Thus `r_negative_boundaries_included: true` means these two finite boundary bands, not all support boundaries or a universal boundary theorem.

In the divided branch, `a>=2`, `k<=a-2`, and `j<=2k` ensure A0(k) is positive and all displayed denominator factors are positive. The zero convention is active elsewhere, including j=0, k=0, and boundary samples with A0(k)=0. The scan does not cover a=0 or 1, k outside 0..a-2, or j>2k+2. Its natural source-coordinate interpretation is `i=a+k-j`; the loop bounds keep i nonnegative. Neither checker asserts the A1 expression against coefficients extracted from P_a; the formal raw coefficient bridge remains a separate obligation, as the documents acknowledge.

## Mixed-invariant probes

The tested auxiliary pairs, with `h=vf+ug` and `q=(u+v)h`, are `h:(vf,ug)`, `A_g:(h,g)`, `AC_q:(q,vf)`, and `AC_g:(q+t vf,h)`. Their mixed horizontal gap is `2 x_(i+1,j)y_(i+1,j) - x_(i,j)y_(i+2,j) - x_(i+2,j)y_(i,j)`.

`source_invariant_80b7.py` enumerates every reduced interior pair `1<=a<b<=64` at t=1: the artifact records 1,259 source cores. It saves only the first failure per label and stops testing that label afterward; the total is a source count, not a number of gap checks or failing sources. Surviving labels h and AC_g are scanned throughout. The saved failures are:

| Label | Source | (i,j) | First triple | Second triple | Mixed gap |
|---|---|---|---|---|---:|
| A_g | 2/17 | (0,9) | [0,4,377] | [2,94,1715] | -2 |
| AC_q | 17/19 | (9,9) | [0,16,6008] | [2,370,26390] | -176 |

The displayed gaps follow directly from the recorded six integers. They concern pairs of auxiliary summands, not source log-concavity gaps. The source-core Python uses the imported mechanical-word/positive recurrence; this subaudit does not independently establish its inherited formal source bridge. Its current reproducer prints JSON and does not itself write `source-invariants.json`.

`invariant_probe_80b7.py` covers lengths 1..14, words beginning and ending false with no adjacent true letters, at t=0,1,2,10. These are 986 allowed words and 3,944 word/weight pairs. Empty words are excluded. Only two labels fail, so the early stop requiring all four failures does not trigger. As above, each failed label is skipped thereafter. The first recorded A_g witness is word `[0,0,0,1,0,0]`, t=0, (i,j)=(0,3), triples `[0,1,19]` and `[1,9,26]`, gap -1. The AC_q witness is `[0,1,0,0,1,0,0]`, t=10, (2,2), triples `[0,37,338]` and `[11,48,70]`, gap -166.

`mixed` uses zero lookup defaults and no positivity or polygon filter; the leading zeros in these witnesses are retained. It checks horizontal starts `0<=i<M`, where M is the largest u-exponent key in either input, and all j through the largest v-exponent key. Starts i>=M and rows beyond the maximum have identically zero mixed gaps. It returns only the first negative gap. Neither scan addresses vertical/diagonal mixed gaps or proves its surviving horizontal conditions.

## Product probe

`product_probe_80b7.py` forms `poly([False]*n) * poly([False]*m)` for all `0<=n<=m<=30`: 496 unordered pairs, agreeing with the artifact. It records no horizontal failure. Here n,m count letters in the all-A core word; `poly([])=u+v`, so the length-zero factor is not the multiplicative identity.

The coefficient convolution is exact integer arithmetic. Testing iterates stored low coefficients and uses zero defaults for the middle/high coefficients, without a polygon guard. The factors/products have nonnegative coefficients, so omitted zero-low starts cannot be negative horizontal gaps. No triple count, other directions, larger blocks, or universal product theorem is established.

## Assessment and provenance limits

No mismatch was found between the reviewed JSON contents, loop bounds, and explicit finite-versus-universal qualifications in the documents. The important distinction is that the positive T expansion, finite rational-identity checks, formal parameter coefficient identities, and universal first-order gap positivity are different claims. These finite artifacts do not establish a formal rational identity, the raw A1 coefficient bridge, or universal first-order gap positivity. The formal parameter identities are audited separately. Positivity of only the first-order gap coefficient would also not establish weight-one source log-concavity.

No `artifact-hashes.json` exists in this worker evidence directory. Current audit input hashes are captured separately in `markov_worker_000042_finite_input_hashes.json`; they bind this static inspection, not historical execution. Existing claims of experiment success were inspected rather than reproduced, as requested. No proof strategies or suggestions were provided.
