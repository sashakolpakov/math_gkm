# Raw compensation for the second horizontal row

Machine-authored request f52ba1417d354fe7831df8391636160f. Full pinned Conjecture63 remains unresolved. Build, replay and axiom receipts are separate evidence; draft existence is not validation. No novelty claim is made.

The inherited all-word identity for an arbitrary A–core–B word has core length n, number m of B letters, and statistic t (first-B indicator plus last-B indicator plus twice the number of adjacent BB pairs). It gives 0≤t≤2m and, for n≥3,

    2 [v²]P = u^m (1+u)^(n−3) Q(u),
    Q = 4t +(9m²+13m+6)u
          +(6m²+6mn+8m+6n+6)u² +(m+n+2)(m+n+1)u³.

The earlier source proof used the extra condition n≤2m or t=0 to prove Q itself log-concave. That condition is not available for every word. The present argument works directly with the smoothed polynomial. It uses no source balance and does not infer raw LC by canceling smoothing.

Put k+l=n and define H(k,l,m,t) as the cubic falling-factorial expression secondHMF52. The exact coefficient identity is

    n(n−1)(n−2) [u^k]((1+u)^(n−3)Q) = choose(n,k) H(k,n−k,m,t).

The raw gap is controlled by

    G(k,l,m,t) = (k+1)(l+1)H(k,l,m,t)²
                −kl H(k−1,l+1,m,t)H(k+1,l−1,m,t).

For m≥1 and 0≤t≤2m, a quadratic Bernstein identity reduces G to its two endpoint gaps and one mixed expression. Splitting k and l into 1, 2, or at least 3 produces eight charts (k=l=1 is excluded by n≥3). After m=z+1, every coefficient in all 24 exact expansions is nonnegative. Lean verifies the ring identities and signs, with no interpolation or external CAS assumption. The m=0 case forces t=0 and follows from the inherited cubic/binomial theorem.

The coefficient bridge cancels only the positive scalar n(n−1)(n−2) and the positive index factors. Indices beyond degree n have a zero right coefficient and are covered explicitly. Monomial shifting and the common factor 2 preserve the raw inequality. Cores of length at most two use the inherited exact seven-case calculation.

The final theorem raw_word_second_allMF52 covers every Boolean core, every natural horizontal starting index, and every zero coefficient. The source specialization source_second_via_wordMF52 uses the already checked exact raw matrix/source equality. This establishes an enlarged-family second-row result, not a new region of the source residual: actual source j=2 was already known. The remaining exact residual stays research/MarkovResidualMF8.lean. All twelve modules passed source-bound compilation, isolated kernel replay and the permitted-axiom audit (37 theorem closures).

## An infinite smoothing-rescue family

For n≥2 take the arbitrary word A B A^n B. Its core has length n+1, one B, and statistic t=1. MarkovSmoothingRescueMF52 proves the exact factorization

    2[v²]P = u(1+u)^(n−2) Q_n(u),
    Q_n = 4 +28u +(12n+32)u² +(n+4)(n+3)u³.

For every n≥14 the seed fails its first adjacent inequality: 28²<4(12n+32). Nevertheless every raw second-row inequality holds, by the all-word theorem. This is an actual polynomial family for which smoothing repairs the residual failure, not a cancellation of log-concavity.

The same module proves that A B A^n B is not sourceWord28(path) for any path when n≥2. Its counts would be a=2,b=n+3, but its first two letters have one B, whereas the source mechanical-prefix theorem requires floor(4/(n+3))=0. Thus the seed failure is not a root witness. All seven declarations in this module passed compilation, isolated replay and the axiom audit.

For n=16 an independent exact experiment gives raw coefficients [2,42,490] and gap 784, versus seed coefficients [4,28,224] and reversed gap 112. The universal factorization, seed failure and raw LC are theorems; this displayed raw-triple calculation is experimental evidence.

## Experiments

The full-degree grouped-pair probe tested 2,347 enlarged words, with 1,290,238 comparisons for each of the grouped B mixed gap and the two component gaps. There were no failures. It included the full degree triangle and a zero boundary; 363,883 tested centers had at least one zero component. These computations do not prove a global invariant.

A separate low-row probe tested 1,103 words through row eight. The A-update mixed term failed 3,819 times, while all tested aggregate gaps survived. At word ABA, row 2 and starting index 0, the two summands have triples [0,0,5] and [2,9,13]; their mixed gap is −10, the component-gap sum is 55, and the full gap is 45.

Splitting the grouped B mixed expression into its two directed terms also fails: already at complete source word AAAAA B (1/6), one directed term is −7. Thus a proof cannot silently replace the aggregate condition by both directed conditions. The actual raw source inequality is not reversed.

The separate smoothed-cubic verification passed 272,859 parameter-envelope comparisons, 41,759 coefficient identities and adjacent checks on 2,140 arbitrary cores, and 8,954 comparisons with independently generated source coefficients. It retained zeros. None of these finite computations is a proof premise.

## A checked-symbolic but unformalized terminal-A lead

For A–core–A, the inherited HJet8934 invariant suggests the same raw factorization with monomial u^(m−1) and cubic

    J = 4t +(9m²+7m+2−4r)u +(6m²+6mn+4n)u² +(m+n)(m+n+1)u³,

where r is the final-B indicator and t is the first-B indicator plus twice the adjacent-BB count. The bound is 0≤t≤2m−r. For m≥1 the same eight index charts, both r values, and all three Bernstein terms have nonnegative exact polynomial expansions after m=z+1 (48 charts). Independent full-polynomial checks matched 41,697 coefficients and adjacent inequalities across 2,140 cores. The m=0 case cancels a factor u and reduces to a positive quadratic. No universal terminal-A coefficient or inequality theorem was formalized in this run. The exact scripts and outputs are retained as a lead, not imported as assertions.
