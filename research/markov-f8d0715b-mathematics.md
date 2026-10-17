# Second middle row and a uniform total-gap column

Machine-authored live request f8d0715be053400395d9ac23a673f230.
The exact pinned Conjecture63 and its negation remain unproved. The final
accepted sources, hashes and local validation scope are in
evidence/markov-f8d0715b/validation.json when present.

## Complete second middle row

Write b=3q+epsilon, epsilon=1 for r=true and epsilon=2 for r=false.
For every q>=1, both residues and every natural starting column c,
MarkovMiddleSecondAllMF8D proves

    A(c,b-q-2) A(c+2,b-q-2) <= A(c+1,b-q-2)^2.

This includes every column, all denominators, small parameters and zero
tails. The new row follows the predecessor's first middle row b-q-1.
There is direct transport to every path with numerator label three. The
polygon theorem separately verifies all three positions when 3<=c and
c+2<=q+4. Positions outside this polygon range are not mislabelled as valid
triples even though the unrestricted coefficient theorem also covers them.

Inside the strip 2(q+4)<=b, the actual correction at depth k=1 has degree
at most two. Hence every coefficient of column at least three is precisely
the inherited top-template coefficient. Put d=b-2(q+4), T=q+1. Then

    T=d+7 for epsilon=2; T=d+8 for epsilon=1.

The exact topMass gap is proved for every i,d,T on these two bands. If
i+2>T the right neighbor is zero, giving the non-strict inequality directly.
For i<=5 the inherited universal fixed-column theorems apply. For i>=13,
the inherited widened-domain inequality applies because
4T+5<=4d+3i follows from T<=d+8. The intervening i=6,...,12 are closed by
the seven new MarkovMiddleSecondC9MF8D through C15MF8D modules.

For each such i and C=7 or 8, set T=h+i+2 and d=h+i+2-C. A positive
integer multiple of the exact gap factors as

    product_(0<=j<i) (h+i+2-j)^2 * (h+2) * P_(i,C)(h),

where P has strictly positive rational/integer coefficients. Lean checks
the expanded identity by ring normalization, proves positivity for every
rational h>=0, and transports back to the literal integer topMass values.
This is not interpolation from finitely many denominators. The certificate
generator and exact coefficient data are generate_second_f8d0715b.py and
second-certificates.json. These generated data are proof certificates only
after the accompanying Lean identities have been checked.

Columns c<=4 are supplied by the inherited actual middle-row jet theorem.
Outside 2(q+4)<=b, the inherited lower-region theorem covers j<=q+3.
The only remaining parameter/residue cases are (q,r)=(4,false),(5,false),
(5,true),(6,true). MarkovMiddleSecondExceptionsMF8D checks their complete
bounded support with ordinary kernel reduction. The inherited degree theorem
handles every larger starting column. No finite bound remains in the final
second-row theorem.

## Total raw gap at starting column five

Use the exact middle parameterization q=x+2k+B, with B=5 for true and 4
for false. Let R_c=middleRawMD02(x,k,r,c), the actual source coefficient at
column c+3 and row j=b+2-(q+3+k). This representation includes both the
template and the positive correction, and retains all zero coefficients.

MarkovMiddleRationalMF8D proves a generic equality between the natural
binomial expression and its rational polynomial expression middleQMF8D.
It does not assume a coefficient inequality at fractional parameters.
MarkovMiddleTotalC5MF8D checks, separately for both residues, an exact identity
for R_3^2-R_2 R_4. After multiplication by a positive integer clearing factor,
its ordinary x,k monomial coefficients are all positive. This proves the
gap sign for every natural x,k, with both parameters unbounded. The identity
contains the complete total gap, including all negative mixed contributions;
no invalid addition-preservation principle is used.

MarkovMiddleFiveResidualMF8D attaches this to the actual raw horizontal triple
at columns 5,6,7 for every admissible middle row. It gives the all-path
transport and proves all three polygon memberships in this domain.
The positive auxiliary scale and rational casts are removed before the raw
inequality; there is no renormalization of Markov coefficients.

The 3/47 example at row 26 has raw values
[1156389762,23428067880,322989865552], total gap
175372190835798415776 and mixed gap -8305174134422880. It illustrates why
retaining the full gap matters. These particular numbers were calculated
experimentally in source-examples.json, separately from the universal Lean
proof chain.

## Exact remaining root

MiddleTailMF8D asserts nonnegativity of middleGapMD02 for every r,c,x,k
with c>=3 and k>=2. In source coordinates this retains starting columns
at least six and every middle depth after the first two rows. The new theorem is

    Conjecture63 iff MiddleTailMF8D and ThreeOutsideMiddleMD02 and OtherFourM9E2.

All three conjuncts remain open. The latter two are unchanged and preserve
every other row, vertical and constant-i+j direction, source family, endpoint
and universal quantifier. The exact equivalence does not settle any source
coverage or independent completion-audit obligation by itself.

## Unaccepted follow-ups and experiments

Positive total-gap polynomial candidates were generated for source starting
columns six and seven, and for columns eight and nine after the exact integer
shift k->k+1. Their six attempted builds timed out; no successful Lean receipt
exists for those modules in this invocation. They and their uncompiled
dependent source/residual drafts are explicitly excluded from validation.json.
Do not infer acceptance from the positive Python coefficients or file names.

The support-aware candidate sets
K=max(0,ceil((i+1-B)/3)), expands the total rational gap at k=K+y, and asks
for nonnegative ordinary x,y coefficients. Exact finite probes at i=7..12
and both residues passed. No uniform-in-i positivity theorem is proved.
Earlier unshifted tests expose negative coefficients at some larger columns,
consistent with the inherited fractional-parameter obstruction.

Exact Sturm probes reject blanket real-rootedness of the middle correction
and its high-column tail. A coordinatewise midpoint-log-concavity test of
the top kernel also fails, e.g. d=0 and (s,i)=(0,0),(2,2) give
44352>44100. These are auxiliary route failures, not source counterexamples.

The direct source experiment passed 7,987 coefficient comparisons (216 zeros),
1,902 second-row triples on 68 rows, 6,380 middle-gap checks, and 681,789
polygon-valid triples across all directions. These are finite observations,
not universal proof premises. The exact root remains unresolved.
