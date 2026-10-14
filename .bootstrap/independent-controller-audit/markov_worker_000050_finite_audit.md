# Worker 000050 finite-evidence observational audit

Request `a27f6d422b1a478c976694b9ca5c9a54`. Static inspection only: no experiment reruns, source imports, source edits, Lean commands, proposer contact, or successor interaction. The requested report and its adjacent 18-input hash record are the only outputs, under `/private/tmp/math_gkm_godel_20261013`. Historical experiment success was inspected rather than independently reproduced. Lean modules and validation receipts are audited separately.

## Subset expansion and [20,14,10]

`cut_probe_a27f.py` visits every Boolean word w of length n=0..8: sum 2^n = **511 words**. It appends B (`True`), then enumerates every subset of the n+1 resulting positions, including the empty subset. Therefore **174,762 subsets** means sum 2^n·2^(n+1), not distinct polynomial monomials, coefficient comparisons, or source fractions. Each subset contributes its product of explicit gap and selection polynomials. The unselected final suffix contributes 1. Zero contributions are omitted from the sparse dictionary.

For each word, the entire sparse polynomial is asserted equal to `states(w)[2]`, the separately implemented inherited ambient transfer: **511 finite polynomial identities**. This is algorithmic independence between the subset enumeration and transfer recurrence, not a universal finite-subset theorem or independent Lean replay.

The same script checks **54,525 y-column triples**. For every n-word with m true letters, s ranges 0..n+1 and j ranges 0..n+m, with all three coefficients read using zero defaults. It tests the raw gap `F(s,j+1)^2-F(s,j)F(s,j+2)`. The bounds include every potentially nontrivial start under the common y-degree bound n+m+2, and retain internal/endpoint zeros. No polygon or source-family filter is present. Only the first failure is stored; the scan continues.

The first witness is `w=[true,false,true,true,true,true,true]=BAB^5`, with s=1 and j=2,3,4, giving **[20,14,10]** and gap **-4**. This is one selected-position coefficient of the transfer of w followed by one additional B. The reported full s=1 slice is `8+20y+20y^2+14y^3+10y^4+6y^5+2y^6`.

Its virtual counts are a=m+1=7, b=n+2=9. Under i=a+s-j, the displayed points are (6,2),(5,3),(4,4), reversing the orientation of the root's equivalent (1,-1) triple. All have i+j=8<=15 and 9i+7j>=63, so they satisfy the pinned 7/9 polygon. The word is not palindromic. The documents explicitly use the inherited source-central-palindrome requirement to exclude it from source central words; thus this is an arbitrary-word diagonal obstruction, **not** a source counterexample. The Python experiment itself neither checks those memberships nor establishes the source exclusion.

## Positive-state probe: weighted comparisons

`transfer_probe_a27f.py` uses h=g-f, H=(1+y)f, F=H+h. It asserts nonnegative h coefficients, the exact sum identity, and degree_x(h)=N-1, where N=len(w)+1. These assertions concern only the sampled words.

For a polynomial assigned degree d, the comparison is

`(s+1)(d-s-1)·middle^2 - (s+2)(d-s)·low·high`.

It is the comparison for coefficients divided by binomial(d,s), after clearing positive factors. It is stronger than the raw coefficient gap and is not the literal target inequality. The degree is N for f,H,F and N-1 for h. The mixed H/h comparison uses degree N weights. No polygon guard is applied; zeros are kept by dictionary defaults. Starts s run 0..d-2, and j through N+sum(w)+2, including out-of-support zeros.

Coverage is all **1,023 Boolean words of lengths 0..9**, plus every reduced interior fraction **1<=a<b<=45**, recorded as **627 source words** using the imported mechanical-word/state model. Endpoint fractions 0/1 and 1/1 are absent. Counts are rectangle triples, including zero triples:

| Sample | f,H,F,mixed: each | h |
|---|---:|---:|
| Arbitrary words | 134,143 | 117,764 |
| Source words | 933,069 | 903,916 |

All tests continue after first failures, but only the first per label is stored. The arbitrary h witness [2,11,32] has weighted gap -42 but **raw gap +57**; the arbitrary f witness [2,48,676] has weighted gap -744 but **raw gap +952**. These are failures of the stronger weighted component conditions, not raw LC failures. For source 1/3, w=A, s=j=0, the mixed H/h witness [0,1,1] and [1,1,0] has weighted gap -2. Their total [1,2,1] has weighted gap 0 and raw gap +3; the ordinary unweighted mixed H/h expression is +1. No source f,h,H,F failure is recorded, but this is finite evidence only.

**Prose qualification:** the mathematics document calls the source-1/3 example a negative “mixed horizontal gap” without naming the normalization in that paragraph. It is negative only for the weighted comparison used in the script. Read as a claim about the ordinary raw mixed gap, that sentence would be false. The later BA^9 paragraph explicitly says “weighted gap.”

## Virtual-polygon state probe

`polygon_state_probe_a27f.py` tests the decomposition (yf,g); the JSON field named `f` actually contains coefficients of yf, implemented by looking up f at j-1, with explicit zero at j=0. The virtual parameters are N=len(w)+1, a=sum(w)+1, b=N+1. It uses the same degree-N weighted gaps as above, not raw gaps.

Starts satisfy `0<=s<=N-2` and `0<=j<=min(a+s,floor(b*s/(b-a)))`. Substituting i=a+s-j shows these are the natural-index/pinned-polygon bounds for all three horizontal points of this virtual label. No reduced-fraction or actual-source test is imposed.

Coverage: **8,191 arbitrary words of lengths 0..12**, plus **75 seeded random words**: five repetitions at each combination of lengths 30,60,100 and probabilities .05,.2,.5,.8,.95, using seed 27469. The JSON reports 8,266 words. Each of f,g,mixed,F receives 934,981 exhaustive-word and 345,386 random-word comparisons: **1,280,367 each**. These are samples, not a statement covering all longer words.

The first/only stored failure label is arbitrary-word mixed, at w=BA^9, virtual a/b=2/12, s=2,j=2. The vectors [21,108,348] and [7,102,584] give weighted mixed gap -432. Their sum [28,210,932] has weighted gap **118,944**. Even the unweighted mixed expression is positive (7,332). The saved artifact therefore agrees with that paragraph's explicit restriction to a failed weighted auxiliary condition, without source identification. Operational notes retain an earlier ad hoc diagnostic with shifted weights; the saved probe uses the correct weights stated here.

## Second-row algebra envelopes

Both envelope probes evaluate a fixed integer polynomial `norm(s,N,m,t)` in the scripts, derived as a normalized numerator of the inherited second-row expression. They do not construct a word, evaluate its transfer, or compare the resulting norm values with extracted raw coefficients. Hence [48,112,336] is a normalized algebra-parameter triple, not a raw source triple.

With n=N-1, their cubic parameters are `A=4t`, `B=9m^2+13m+6`, `C=6m^2+6mn+8m+6n+6`, `D=(m+n+2)(m+n+1)`. The common tested expression is

`norm(s)=s[A(N-s)(N-s-1)(N-s-2)+B(s-1)(N-s)(N-s-1)+C(s-1)(s-2)(N-s)+D(s-1)(s-2)(s-3)]`.

The broad initial script, retained as `evidence/.../second-normal-initial.py`, intends N=4..60, m=0..N-1, t=0..2m, s=0..N-2, but stops at its first failure after **11 comparisons**. This occurs at N=4,m=1,t=2,s=1, with [48,112,336] and gap -3,584. It is not an exhaustive scan through N=60. From the inherited statistic definition (first-B indicator + last-B indicator + twice adjacent-B pairs), one B in a length-three word gives t at most 1; t=2 is unrealizable, as the documents acknowledge.

The current sharper script uses the same N,m,s ranges and integer t from 0 to 2m when m=N-1, otherwise 0..max(2m-1,0). It reports **3,206,630 comparisons**, matching the loop count sum_(N=4)^60 (N-1)(N^2-N+2), with no failure. It includes algebra parameters not necessarily realized by words, omits N<4 and N>60, and establishes no universal strengthening. Endpoint zeros at s=0 and zero-valued parameter cases are not filtered out. The current script writes the sharp JSON, while the retained initial script writes the broad JSON; they are deliberately separate artifacts.

## Sparse certificate attempts and assessment

`second_certificate_a27f.py` expands the same norm-gap polynomial using exact rational sparse arithmetic, with N=s+r+2. It clears denominators under the substitutions t=(2m-1)z/(1+z), then m=(1+(s+r)u)/(1+u), and records three shifted s cases. This is an attempted coefficient-sign certificate, not a source-word computation.

Reading the saved coefficient lists confirms their declared counts: s1 has **116 terms, 2 negative**; s2 has **116 terms, 4 negative**; s3 has **852 terms, 16 negative**. Negative monomial coefficients mean these proposed all-positive expansions fail; they do not by themselves establish a negative value of the polynomial on the admissible domain. The documents state this limitation and do not promote these attempts to proofs.

No numerical or coverage mismatch was found between the saved JSON and the inspected scripts. The prose has the source-1/3 normalization ambiguity identified above. The critical distinctions are raw versus weighted gaps, virtual labels versus actual source words, sampled equalities versus universal representations, and unrealizable algebra parameters versus source coefficients. Reading the evidence with the scripts resolves those distinctions; the ambiguous prose sentence should not be treated as a raw mixed-gap obstruction. The cut representation/root equivalence remains a reformulation, with its universal inequality unproved. No new mathematical strategy or proof suggestion is supplied here.
