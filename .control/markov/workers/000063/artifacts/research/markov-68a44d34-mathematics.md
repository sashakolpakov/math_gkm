# Cross-cut degree-layer obstruction and mixed-run counts

Machine-authored live request 68a44d341d1c48e791034745c94024de.
Final validation receipts determine build and separate kernel-replay status.
The full pinned Conjecture63 remains unresolved.

For the actual source path R^33 L, the extended word is B^33 A B^34 and
the label is 67/69. The fixed-degree d=39 layer at cut counts 4,5,6 has
constant coefficients [18513,185504,1862728], with adjacent gap -72949448.
These auxiliary contributions sit at the polygon-valid raw horizontal
positions (71,0),(72,0),(73,0). Their full raw coefficients are
[814385,10424128,109453344], with gap 19525283006944. Thus this invalidates
fixed-degree cross-cut log-concavity as a universal source invariant;
it does not refute the pinned root. The source-connected Lean statements
source_fixed_degree_horizontal_failure68 and source_full_raw_triple68
compile. Separate kernel replay status is recorded in validation.json.

To retain actual multiplicities without enumerating exponentially many masks,
set the coefficient variable y to zero in the marked degree transfer.
Every mask has constant coefficient one. With x marking cut count and z
marking its individual polynomial degree, write t=z+x*z^2 and
S_n(t)=sum_(k=0..n-1) t^k. For arbitrary p,q, the derived exact generating
function of B^p A B^q is

    1 + x*z*S_q + x*z^2*S_p + x*z*t^p + x^2*z^3*S_(p+1)*S_q.

This counts each mask exactly once; no coefficient normalization occurs.
The constant coefficient of degreeLayer(w,s,d) is [x^s z^d] of this
polynomial. For a shifted atom x^r z^h t^n, it is choose(n,s-r) when
r<=s and h+n+s-r=d, and zero otherwise. The general coefficient formula
therefore consists of three single contributions and one rectangular
double sum. count-formula.json checks 28,899 exact coefficient identities
against an independently implemented forward transfer for p,q<=12.

For p=n,q=n+1 and degree n+6, the cut-count 4,5,6 values reduce to

    L = n*choose(n+1,2),
    M = (n+1)*choose(n,3),
    R = n*choose(n-1,4)+2*choose(n,5)+choose(n-1,5).

The source witness n=33 was discovered after 73,707 fixed-degree count
inequalities on 237 actual sources. The search stopped at this failure.
The root boundary coefficients remain the usual binomial coefficients.

## Unbounded obstruction

The explicit formulas simplify to

    L=n^2(n+1)/2,
    M=n(n+1)(n-1)(n-2)/6,
    R=(8n-5)(n-1)(n-2)(n-3)(n-4)/120.

An exact identity gives

    720(LR-M^2)
      =n^2(n+1)(n-1)(n-2)(4n^3-143n^2+413n-220).

At n=33+t, the final cubic is 4t^3+253t^2+4043t+1430, strictly
positive for t>=0. MarkovCountDiagonal68a4 proves the actual triangular
multiplicities in the rectangular double sum, including all zeros.
MarkovCountGap68a4 connects the resulting formulas to the actual source
word. source_fixed_degree_horizontal_failure_all68 proves the failure
for every n>=33, with no upper bound. source_full_raw_holds_all68 proves
that all corresponding original horizontal triples are polygon-valid
and satisfy the raw inequality. The source labels are (2n+1)/(2n+3).
The proof does not enlarge the source family or alter any coefficient.

## Other finite experiments

crosscut.json checks several affine alignments of individual degree layers.
Fixing degree minus twice cut count already fails horizontally at source
3/5, and vertically at source 3/4. These two failures are experimental here.
Their complete raw source triples have positive gaps.

layer-directions-exhaustive.json records all 32,767 binary words of lengths
0 through 14, with cuts at most five. It checked 143,841 horizontal tests
before the first failure, 2,674,604 vertical tests and 6,598,525 diagonal
tests. No vertical or diagonal failure was seen in that finite exhaustive
range. The stress scan on 164 words found both horizontal and vertical
fixed-degree failures in the enlarged arbitrary-word family; neither is
presented as a source counterexample. No diagonal failure was found.

vertical-source.json independently finds a fixed-degree vertical failure at
the actual source 79/81 (path R^39 L), d=45, cuts 4,5,6 and y exponents
4,5,6. The layer triple is [20255130,1530059524,115703332360] with gap
-2503891401900224. The full raw triple at (79,4),(79,5),(79,6) is
[1052700916,106849324804,8979215652392], with positive gap
1964349668836093647344. This vertical observation is experimental only;
it has not been formalized in Lean.

raw-source.json independently expands the literal pinned recurrence at
67/69, obtains 6,937 nonzero terms, and reproduces the three raw boundary
values and polygon guards. This is an independent implementation check,
not an independent English/source completion audit.

## Operational scope

All 80 predecessor artifact hashes and six inherited-index hashes match;
the predecessor raw log ends in completion. No partial mutation was replayed.
The pinned source was opened through hosted browsing, and two live searches
were executed. No retrieved theorem was adopted as an axiom or proof premise.
The complete source remains
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html.
The higher-priority policy denies .scratch. A shell here-document failed
before creating the intended file; apply_patch created it subsequently.
Failed builds and replay timeouts are retained as operational evidence.
Local checks reuse inherited compiled imports, so they are not a fresh
whole-source rebuild. The pinned root and all correspondence obligations
remain unchanged. Full Conjecture63 is unresolved.
