# Raw ordered-gap partition model

Machine-authored research derivation, 2026-10-14. This is not a proof of
Conjecture 6.3 or a claim of historical novelty.

Write the inherited raw generators as A and B. Then B=AC, where

    H = [[v,1],[uv,u]],
    A = H + diag(0,1), C = H + diag(1,0).

Expand each original B into AC, retaining the exact order. A source middle
word begins with A and ends with C; its length is a+b. Remove those endpoints
to get a core of length a+b-2. The source numerator is

    (v,1) product(core matrices) (1,u)^T.

MarkovGasF80 proves this for every finite source path. Introducing t times
each diagonal projector records deleted sites. At every core position select
either H or its diagonal projector. H is rank one: H=(1,u)^T(v,1).
The selected H sites split the deleted positions into ordered gaps.

Each empty gap contributes u+v. Each nonempty gap containing only A contributes
u. Each nonempty gap containing only C contributes v. A gap containing both
letters contributes zero. If r sites were deleted, p gaps are nonempty all-A,
q gaps are nonempty all-C and e gaps are empty, the mask contributes

    t^r u^p v^q (u+v)^e,       r+p+q+e=a+b-1.

The first-gap renewal identity is proved over every commutative ring in
MarkovRenewalF80. MarkovCutsF80 independently gives the full mask expansion
by induction and proves there are exactly 2^core.length masks, including
zero masks and multiplicities of masks with equal weights. MarkovBlocksF80
collapses each weight to zero or the stated shifted-binomial form and gives
an exact sum for every raw coefficient; consult validation for its status.

Consequently a nonzero mask contributes choose(e,k) at (i,j)=(p+k,q+e-k).
This is a positive combinatorial formula for the literal raw coefficients,
not factorial normalization and not inversion of a smoothing transform.
The t-homogeneity identity displayed above is a direct combinatorial deduction;
the current Lean source bridge specializes t=1. The inherited homogeneous
source bridge remains the authority for recovering the omitted w exponent.

The unresolved problem is comparison of sums over masks on the exact source
words. Individual binomial summands being log-concave does not prove that
their sum is log-concave. Pairwise synchronization of scalar product summands
already fails for actual Farey pairs (synchronization-12.json). Any injection
or inequality proof must exploit the source order more precisely.

Enlargement obstructions:

* Balanced ABAAAAB starts with A, ends with B, has coprime counts 2/7, but its
  raw upper-right coefficients at (1,4),(1,5),(1,6) are 6,8,12. Thus 64<72.
  MarkovObstructionF80 proves balance, coprimality, the exact coefficients and
  the failed GlobalLC18 inequality with ordinary kernel computation. It also
  computes the actual source word at path LLR as AAABAAB. This is a refutation
  only of a broadened sufficient condition; it is not a source counterexample.
* Circularly balanced rotations also fail: ABAAAAAAA has vertical [1,4,17].
  The current finite evidence for rotations is experimental, not a Lean claim.
* All four entries still passed the exact 489-source-fraction scan through
  denominator 40. This does not establish a universal matrix invariant.

The mask enumeration agreed exactly with the source recurrence on all 41
reduced interior fractions through denominator 11, with 54,793 admissible
masks. Histograms for 2/5, 3/5 and 5/8 are preserved in masks-11.json.

Hosted sources consulted live: the [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
[Christoffel words and the strong Fox conjecture](https://arxiv.org/html/2212.04561),
and [Saturation of Markov Polynomials](https://arxiv.org/html/2604.18333v1).
The latter two concern different polynomials or support, respectively; neither
supplies a proof of the raw universal coefficient inequalities here. No retrieved
assertion is an added Lean axiom.
