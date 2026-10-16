# Terminal-A compensation and limits of enlargement

Machine-authored request 263d8c71d1e34c09988ae5004b76a354. The exact pinned
Conjecture63 remains unresolved. No historical novelty claim is made. The
source-bound compilation, replay, and axiom inventory is validation.json in
evidence/markov-263d8c71; only modules listed there are accepted evidence.

For an original A/B core w, put n=length(w), m=count_B(w), r=its final-B
indicator, and t=its first-B indicator plus twice its adjacent-BB count.
For a nonempty core, the checked combinatorial bound is t+r≤2m. The terminal-A
raw polynomial P is the b-entry of rawWord80(A w A). For n≥3 the new exact
identity is

    2u [v²]P = u^m (1+u)^(n−3) J(u),
    J = 4t +(9m²+7m+2−4r)u
           +(6m²+6mn+4n)u² +(m+n)(m+n+1)u³.

MarkovTerminalWordFormulaM263 proves this from the inherited HJet8934
invariant and connects terminalWordM263 to the literal raw matrix product.
Multiplication by u replaces a would-be u^(m−1) expression; the identity is
valid without separating m=0 or introducing a negative exponent.

For the real polynomial (1+u)^(n−3)J, the falling-factorial coefficient
identity is

    n(n−1)(n−2) c_k = choose(n,k) H(k,n−k,m,t,r).

The exact adjacent gap has the numerator

    G = (k+1)(l+1)H(k,l)² − kl H(k−1,l+1)H(k+1,l−1).

For m≥1 and r=0 or 1, the quadratic Bernstein identity in t reduces its
nonnegativity on 0≤t≤2m−r to two endpoint gaps and their mixed term. Splitting
k,l into 1,2,or ≥3 gives eight nonempty charts. Both values of r give 48
checked nonnegative polynomial expansions after m=z+1. Ordinary Lean ring
normalization and positivity check each expansion. No numerical interpolation
or external algebra assertion enters the proof.

For m=0 the parameter bound forces r=t=0. J has coefficients
[0,2,4n,n(n+1)]; its CrossLC property and binomial smoothing follow directly
for n≥3. The common positive coefficient-clearing factor is canceled only
under n≥3. Beyond-degree coefficients vanish explicitly. Cores of length at
most two are covered by seven literal polynomial calculations.

MarkovTerminalAllM263 then transports through multiplication by u and the
common factor 2 to every natural horizontal starting index, retaining zeros.
Combining this terminal-A theorem with the inherited terminal-B theorem gives
`raw_starting_secondM263` for every original A/B word beginning with A, with
no balance or length restriction. MarkovSourcePrefixSecondM263 specializes
it to every finite prefix of every sourceWord28(path), including the empty
prefix. It asserts only the second horizontal row, not full prefix WeakLC.
This removes no new source residual region: source j=2 was already known.

## Atomic-word obstruction

The original B expands to AC. Extending to arbitrary atomic A/C words is
invalid even for the first horizontal row. For ACAC^5 the raw b-entry has
coefficients [4,6,10] at (3,1),(4,1),(5,1), and 36<40.
MarkovAtomicObstructionM263 proves these coefficients and the strict reversal.
It also proves adj8934(r,expand80(w))=0 for every original word w and both
preceding bits r. The displayed word has adjacent C's, so it cannot equal
expand80(w), in particular not an expanded source word. This is a formal
exclusion from the attempted enlargement, not a refutation of Conjecture63.

## Positive-mixture obstruction

The compatibility experiment found two original words of the same length
eight and B-count four, both beginning with A and ending with B:

    W0=AAAABBBB,   W1=AABABABB.

Their raw row-four triples at horizontal starting index one are
[2,38,252] and [0,2,138]. Each satisfies its adjacent inequality. Their mixed
gap is −124; their own gaps are 940 and 4. Thus the positive combination
2P(W0)+31P(W1) has [4,138,4782] and gap −84. This disproves closure under
arbitrary positive mixtures even at fixed word counts and endpoints.

MarkovMixtureObstructionM263 is the checked complete formal certificate:
it expands both finite raw polynomials using ordinary ring proofs, extracts
the stated coefficients, and excludes the mixture from every frame numerator.
The exclusion uses the boundary: each component has u^4(1+u)^7 at v=0,
so the mixture has leading boundary coefficient 33, whereas boundary_formula
makes every source boundary polynomial monic. The module compiled, passed
isolated replay, and passed the permitted-axiom audit. MarkovMixtureScopeM263
also checks that the left endpoint of this triple is outside InPolygon(4,8)
and excludes both special endpoint polynomials. This witness does not refute
even the polygon-restricted positive-mixture candidate.

## Polygon guards and a coordinate enlargement failure

A follow-up scan of equal-count words of core length at most nine, restricting
to reduced positive counts and all three horizontal polygon guards, made
3,637,384 comparisons without a mixed-gap failure. This initially suggested
a restricted compatibility candidate. The subsequent full-degree structured
stress test **refuted that candidate** in all three directions. Its 3,262
pairs made 5,186,997 horizontal, 5,186,997 vertical, and 5,317,945 diagonal
comparisons. The result records 194,479, 197,147, and 151,977 negative mixed
gaps respectively. No zero was filtered; none occurred in those guarded
comparisons. Thus the earlier finite success must not remain an active
unqualified compatibility conjecture.

The stress test also exposed an individual vertical failure: the original
word A^10 B^3 has reduced counts a=3,b=13, starts with A, and ends with B.
Its raw coefficients at (3,0),(3,1),(3,2) are [1,8,82], and 64<82.
All three points lie in InPolygon(3,13). MarkovClusteredObstructionM263
contains an **unvalidated draft** certificate: an ordinary ring expansion,
literal coefficients and polygon guards, exclusion as a source word using
the length-five mechanical prefix constraint, and exclusion as any source
polynomial using the inherited universal source third-column theorem.
Both build attempts timed out (150 seconds, then 120 seconds after splitting
off an intermediate prefix). This module is excluded from validation.json;
none of its declarations is claimed as a checked theorem. The exact experiment
distinguishes an enlarged original-word failure from the actual source 3/13; an independent
finite computation of the latter gives [1,8,34].

A separate clustered-word horizontal scan tested 1,362 reduced-count words
through its last pair (36,67), making 2,590,027 polygon-guarded comparisons
without a failure. This does not prove a horizontal enlargement theorem;
it shows that the vertical obstruction does not by itself settle that separate
question. Pairwise positive-mixture closure is already unavailable.

## Exact experiments

The terminal-A identity test checked 25,289 coefficient identities and 21,813
adjacent inequalities on 1,173 cores. It retained 9,387 zero-containing triples.
The atomic-word scan completed 4,245 inputs and 445,698 row comparisons,
retaining 219,804 zero-containing triples. Its 64 failures were all in row one.
The same-count compatibility scan tested 18,086 word pairs and 2,171,676
mixed inequalities. It found 869 terminal-A and 516 terminal-B mixed failures,
retaining 1,174,005 comparisons containing zeros. Full inputs are determined
by the retained programs and seeds. All these scans are finite evidence only.

The full root still requires the unchanged residual InteriorCore63MF8 and
all source-correspondence obligations. In particular, the new row result
cannot remove higher horizontal rows, remaining vertical columns, or deeper
diagonals, and neither enlargement obstruction is a source counterexample.
