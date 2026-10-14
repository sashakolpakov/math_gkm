# Pell matching formula and all diagonal inequalities

Machine-authored request 061840e8bcb9466891906a9db3f46cc3. The authoritative
local build/replay statuses are hash-bound in evidence/markov-061840e8/validation.json.
Full pinned Conjecture63 remains unresolved. No historical novelty claim is made.

Define E_0=P_0=1 and

    P_(n+1)=E_n+u P_n,
    E_(n+1)=P_(n+1)+v E_n.

These are the matching polynomials of alternating-edge paths (the graph
interpretation is explanatory; the formal definition is the positive recurrence).
Induction using Pascal's identity proves, for every n,i,j in the natural numbers,

    [u^i v^j] E_n = choose(n-j,i) choose(n-i,j),
    [u^i v^j] P_n = choose(n-j,i) choose(n-i-1,j).

All subtractions in this display are natural subtraction, including n=0.
Zero cases are retained. The proof factors the two summands into a common
binomial and applies Pascal, with the out-of-range cases proved zero.

On a fixed diagonal i+j=r<n, the P_n coefficients can be written as

    choose(n-r+i,n-r) choose(n-i-1,n-r-1).

The first factor has increasing upper index and the second decreasing upper
index. Each satisfies upper-index binomial log-concavity, and their pointwise
product does too. For r>=n the left endpoint of a consecutive triple is zero.
Thus every constant-total diagonal of P_n is log-concave without restrictions
on n, including zeros. MarkovPellDiagonal0618 proves this inequality directly.

The exponent shear u->xt, v->t sends [u^i v^j] to [t^(i+j)x^i].
MarkovPellShear0618 proves this coefficient transport by polynomial induction.
The actual source quotient at path replicate(n,true) equals the sheared P_(n+1).
This follows from the canonical source core and the existing literal positive
quotient matrices; its row state is exactly (E_n,P_n). Consequently

    [x^i] quotientSlice(replicate(n,true), i+j)
      = choose(n+1-j,i) choose(n-i,j).

This is an exact source identity, not an assumed coefficient formula.
The quotient residual is log-concave for every slice, and inherited interval
support promotes it to CrossLC. For this family a=n+1,b=n+2, the degree is 2a.
Every polygon point has i+j>=a, so every nonzero raw diagonal is in the upper
half where the inherited factorization is multiplication by
(1+x)^(2a-2r). Binomial smoothing transfers residual LC to raw LC. No invalid
inverse-smoothing argument is used for the lower half: it has no polygon points.

The final theorem source_near_one_diagonal0618 quantifies over every actual
source path with b=a+1 and every polygon-guarded consecutive triple in direction
(1,-1). It covers infinitely many diagonals of unbounded degree. It does not
prove the horizontal or vertical directions for this whole family, and does not
prove diagonals for all other rational sources.

## Experiments and rejected strategies

The formula matched 54,858 coefficient checks through n=40. The raw arbitrary
gas-core scan examined every binary core through length 17 and found failures
in all three directions. Its first diagonal example is AAAAAAAAA C A C A
(nine A letters followed by CACA), with coefficients 6,8,11. It is not a source.

A refined exact enumeration of 33 source cores tracked each site's deletion
indicator. Preserving the coordinatewise sum of those indicators across pairs
cannot give the desired injection: for 1/3 and vertical raw coefficients 1,2,3,
the selected fiber has 2 center pairs and 3 endpoint pairs. All three principal
directions have examples of this finer obstruction. Raw pair counts need not
fail when a refined fiber fails. The experiment is refined-pairs.json.

Positive symmetric site weights also fail to preserve LC on a genuine source
core. The 1/4 core AAA with weights 2,1,2 has vertical coefficients 4,4,5.
MarkovSiteObstruction0618 proves the uniform-site source identity and checks
this deformed polynomial's failure. The uniform weights remain the actual
source, so this is not a root refutation. The 21,000 finite weighted tests are
in weighted-source-cores.json.

## Literature used

The [published Markov paper](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was retrieved live; its positive Pell recurrence is consistent with the new
matching representation. The Lean proofs use the pinned source recurrence.

[Leake--Mohammadi Yekta, arXiv:2609.39917v1](https://arxiv.org/html/2609.39917v1)
proves midpoint log-concavity of finite integer fibers of unimodular systems.
A common affine-fiber model for both raw indices would imply arbitrary-direction
concavity, which the inherited actual-source 1/9 example rules out. This is an
inference about that proposed application, not a claim refuting their theorem.
No external theorem is imported as a Lean axiom. The site-refined test separately
rejects a natural weight-preserving pairing strategy.

[Christoffel words and the strong Fox conjecture](https://arxiv.org/html/2212.04561)
was retrieved after the v3 HTML endpoint failed. It concerns a different
polynomial, and no correspondence to the pinned coefficients is asserted here.
