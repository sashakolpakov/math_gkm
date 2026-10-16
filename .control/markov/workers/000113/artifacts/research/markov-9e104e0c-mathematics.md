# Horizontal completion through row four and a vertical residual

Machine-authored research request 9e104e0c0bd245b08fe1674f6fdfedec.
The full pinned MathGKM.Markov.Conjecture63 remains unresolved. Accepted
declarations are identified by source-bound build, replay and axiom receipts
in evidence/markov-9e104e0c/validation.json. No historical novelty claim.

## Complete third and fourth horizontal rows

The inherited fourth-row proof required a>=3,b>=9. The new integral/real
polynomial bridge retains a common monomial instead of a negative exponent:

    24 u^3 [v^4]P = u^a (1+u)^(b-9) Q_4(u), b>=9.

This identity holds for every source numerator a. At a=2 the first three
coefficients of Q_4 vanish. The five remaining coefficients are positive and
satisfy the adjacent inequalities for every b>=9: substitution b=9+x gives
nonnegative polynomial certificates, checked by ring normalization and order
reasoning. The inherited eight-term interval-support lemma gives CrossLC,
including the leading zeros. Pascal smoothing and a monomial shift give the
raw inequality by extracting coefficients at i+3,i+4,i+5 on the displayed
left side. There is no division by u and no truncation of a negative power.
The factor 24 is uniform, not an individual coefficient normalization.

Fourteen literal source paths exhaust 2<=a<b<=8 with gcd(a,b)=1. Each full
polynomial is expanded from the protected recurrence by Lean ring arithmetic;
its third and fourth rows and their inequalities are then checked by ordinary
kernel arithmetic. The assembly uses the inherited injectivity of path labels,
so these are exhaustive finite base cases, not sampled paths. The numerator-one
case uses its inherited full theorem. Coefficients past the degree vanish by
the source support theorem.

The resulting horizontal_third_allM9E1 and horizontal_fourth_allM9E1 hold for
every source path and every natural starting index, retaining zeros and without
a denominator bound. horizontal_first_fiveM9E1 assembles j=0,1,2,3,4.

root_iff_interiorM9E1 proves the exact equivalence with InteriorCore63M9E1.
The residual keeps the inherited top-strip and diagonal restrictions and the
original polygon guards. Its new restrictions are a>=2, j>=5 horizontally,
and i>=2 vertically; numerator one and vertical i=0,1 use inherited proofs.
Both endpoint obligations remain accounted for by the inherited equivalence.
The residual is unproved.

## An integral positive representation for every vertical residual

Write h=1+v and put u=h^2 Z. The original positive alphabet has B=A C, with

    A=[[v,1],[uv,u+1]],  C=[[v+1,1],[uv,u]].

Use Q=[[1,-1],[0,h]]. Define the integral polynomial matrices

    K_A=[[v(1+hZ),2+hZ],[vhZ,1+hZ]],
    K_C=[[1+vZ,Z],[vZ,Z]],  K_B=K_A K_C.

The checked letter intertwining identities are

    A(h^2Z,v) Q=Q K_A,
    B(h^2Z,v) Q=h Q K_B.

Induction gives the corresponding identity for every word, with factor h to
its B-count. For the actual source word W, that count is a and its original
upper-right entry is P. Taking the sum of the first-row entries of the
intertwining equation and canceling the nonzero polynomial h gives

    P(h^2Z,v)=h^(a-1) E(K_W),
    E(M)=M.a+M.b-M.c-M.d.

This is vertical_rescaled_sourceM9E1. The proof is entirely integral: it never
inverts a polynomial or relies on evaluation at one nonzero real point.
All entries of K_A and K_C are coefficientwise nonnegative. Every actual W
begins with A, and

    E(K_A M)=v(M.a+M.b)+(M.c+M.d).

Thus E(K_W) is coefficientwise nonnegative. Define
R_i(v)=[Z^i]E(K_W). Coefficient extraction proves for every path and every i

    h^(2i) [u^i]P=h^(a-1) R_i,   R_i in Z[v], R_i>=0 coefficientwise.

When 2i+1<=a, cancellation yields

    [u^i]P=h^(a-2i-1) R_i.

vertical_positive_factorM9E1 covers every i with prescribed exponent
max(a-2i-1,0): in the complementary range choose the already nonnegative raw
column as the quotient. This is a prescribed factor, not a maximal valuation.
For high i, R_i itself has an EXTRA factor h^(2i-a+1) relative to the raw
column. Its LC cannot be transported backwards through that factor.
Neither positivity nor this identity establishes residual LC.

## Second vertical residual: a symbolic candidate for further work

The exact experiment vertical_second_9e104e0c.py uses truncated matrix algebra,
not numerical interpolation. Write b=aq+r, 1<=r<a, q>=1. A source with a>1
decomposes into a cyclic sequence of blocks K_A^q K_C and K_A^(q+1) K_C,
with r long blocks. The proposed adjacent-long count is s=max(2r-a,0).
The inherited block decomposition is formal; its specific cyclic count and
the following moment-to-column assembly have NOT been formalized in this run.

Normalize T_q=v^(-q) K_A^q K_C in Laurent polynomials. Its constant term is
diag(1,0). Let alpha_q=[Z]T_q.a, beta_q=[Z^2]T_q.a, and f_q=[Z]T_q.b.
Direct block algebra gives [Z]T_q.c=v f_q and

    f_(q+1)-f_q=2 v^(-q-1).

Set D=(a-r)alpha_q+r alpha_(q+1) and

    K=(a-r)(2 beta_q-alpha_q^2)+r(2 beta_(q+1)-alpha_(q+1)^2)
       +2v[a f_q^2+2r f_q(f_(q+1)-f_q)+s(f_(q+1)-f_q)^2].

The candidate polynomial is

    Q_q=v^(2q+1)(D^2+K-2hD+2h^2).

The candidate actual-source identity, for a>=5, is

    2 R_2=v^(b-2q-1) Q_q(a,r,s,v).

For q=1 its six ascending coefficients are

    8s,
    16r^2,
    24r^2+24ar+8a-40r,
    17r^2+34ar+9a^2-45r-5a+2,
    6r^2+18ar+12a^2-16r-16a+4,
    r^2+4ar+4a^2-3r-6a+2.

The saved q=1,...,12 polynomials are exact symbolic output, not admitted
source formulas. Their comparison with the literal recurrence truncation at
u-degree two passed on all 1,608 reduced inputs with 5<=a<=21,
1<=q<=12,1<=r<a: 177,576 coefficient identities and 24,120 residual adjacent
tests. The tested residuals had no reversed inequality. This does not prove
the source formula or LC for arbitrary q,a,r.

## Other experiments and operational scope

The separate vertical scan covered every reduced 1<=a<b<=44: 603 fractions,
27,513 prescribed quotient columns, 1,375,803 adjacent residual tests and
930,859 raw zero positions. No division, negativity, interval-support or LC
failure occurred. For b<=16 the full matrix/source identity checked 32,846
coefficients across 79 fractions. All are finite experiments.

Sage and SymPy were unavailable; GAP was located but not used. Hosted search
retrieved the published target and related primary work, without a general
proof being retrieved or any external assertion being used as an axiom.
Source: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
This run reuses inherited compiled imports. It is not a fresh whole-source
rebuild or an independent completion audit. Construction and Agoh stand.
