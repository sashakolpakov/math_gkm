# Independent Agoh statement audit

Primary source: Takashi Agoh, *An Intrinsic Factor of an Alternating Sum
Involving Certain Rational Functions*, INTEGERS 26 (2026), A9, nine pages,
[original PDF](https://math.colgate.edu/~integers/aa9/aa9.pdf),
[DOI](https://doi.org/10.5281/zenodo.18154119).

This is a source-statement and mathematical-meaning audit. It supplies no proof
route for the main theorem or conjecture. No retired project files were read.

## Statement inventory from the paper

Use the following notation, with sums and products inclusive of both endpoints:

\[
 G_{n,a}(X)=\sum_{i=0}^n\frac{(-1)^i\binom ni}{X^i+a},\qquad
 H_{n,a}(X)=\sum_{i=0}^n(-1)^i\binom ni
                  \prod_{\substack{0\le k\le n\\k\ne i}}(X^k+a).
\]

\[
 Q_{n,f}(X)=\sum_{i=0}^n\frac{(-1)^i\binom ni}{f(X^i)},\quad
 D_{n,f}(X)=\prod_{k=0}^n f(X^k),\quad
 N_{n,f}(X)=\sum_{i=0}^n(-1)^i\binom ni
                  \prod_{\substack{0\le k\le n\\k\ne i}}f(X^k).
\]

The following inventory records the claims, not their proofs:

| Location | Quantified mathematical claim |
| --- | --- |
| Theorem 1.1, p. 2; definitions (1.2)–(1.3), p. 1 | Every \(a\in\mathbb R\setminus\{-1\}\) and \(n\in\mathbb N\) satisfy \((X-1)^n\mid H_{n,a}\); the stated conclusion concerns the numerator of \(G_{n,a}\). |
| Theorem 3.1, p. 7; (3.1)–(3.2), pp. 6–7 | For every nonconstant real polynomial whose roots are all real, simple, and unequal to 1, the numerator of \(Q_{n,f}\) is divisible by \((X-1)^n\), for every \(n\in\mathbb N\). The exposition normalizes the leading coefficient. |
| Section 4, pp. 7–8, unnumbered conclusion | For monic real-rooted \(f\) of positive degree with \(f(1)\ne0\), including repeated roots, the numerator has a factor \(X-1\). The displayed calculation requires \(n>0\). |
| Final conjecture, p. 9 | For nonzero real-rooted \(f\), n-fold numerator divisibility is characterized by: \(f\) is a monomial, or all its roots are simple and unequal to 1. The sentence does not quantify \(n\). |

Source for this inventory: [Agoh, A9](https://math.colgate.edu/~integers/aa9/aa9.pdf).

## Independent interpretation requirements

These are mathematical interpretation checks for any proposed formalization.
They are not additional conclusions attributed to the paper.

**Polynomial versus pointwise assertions.** Divisibility is an assertion in
\(\mathbb R[X]\), not a statement about division of real values at a selected
point. At a real evaluation point x, the rational expression requires
\(f(x^i)\ne0\) for every \(0\le i\le n\). A polynomial identity is not restricted
to x different from zero merely because an intermediate rational expression is.

**Nonvanishing at 1.** The i=0 denominator is the constant f(1). Thus f(1)=0
makes the written rational sum undefined for every x, not just at x=1. A
formalization using totalized division must not silently assign the paper's
expression a different meaning in this case. The corresponding issue for G is
a=-1. The polynomial N remains a well-defined polynomial even for these inputs.

**Cleared versus reduced numerator.** N is the explicitly denominator-cleared
polynomial, and D is its selected common denominator. A reduced numerator is a
polynomial U in a representation Q=U/V with U,V relatively prime and V nonzero.
Its nonzero scalar normalization does not affect polynomial divisibility.
To identify the two divisibility claims, a formalization must record the link
Q=N/D and the absence of cancellation of X-1 from D. The relevant local value is
\(D_{n,f}(1)=f(1)^{n+1}\). Naming N `numerator` does not itself prove that link.

**Zero rational functions.** Their reduced numerator is zero; every polynomial
divides zero. Statements formulated using a finite root multiplicity of the
zero polynomial can therefore differ from the intended divisibility claim.
A nonzero constant f is a genuine case for any broader nonzero-polynomial
formulation, even though Theorem 3.1 explicitly concerns nonconstant f.

**Roots and scalar normalization.** Real-rooted means that the polynomial
splits completely over the reals, not merely that any listed real root is real.
A precise simple-root condition requires distinct linear factors exhausting the
degree (or an equivalent squarefreeness condition in this setting). A monic-only
formalization must identify its scope and any passage to nonzero scalar multiples.
A monomial convention should specify c X^m with c nonzero and whether m=0 is
included; the final conjecture's nonzero domain does not exclude constants.

**Multiplicity.** The main conclusions require at least n factors. They do not
assert exact multiplicity n or forbid a further factor. Adding either assertion
would change the target.

## Quantifiers in the final conjecture

Let P(n,f) abbreviate the n-fold reduced-numerator divisibility assertion, on a
domain where Q is defined, and let C(f) denote the stated root/monomial condition.
These are different statements:

\[
 \forall f\;\bigl[(\forall n\in\mathbb N,\ P(n,f))\leftrightarrow C(f)\bigr],
 \qquad
 \forall f\,\forall n\in\mathbb N\;[P(n,f)\leftrightarrow C(f)].
\]

The printed sentence leaves n implicit. A formal target must state which reading
is being audited, rather than treating the two as interchangeable. In particular,
n=0 makes the divisibility factor equal to 1. The active positive-n first-order
result also makes n=1 an essential quantifier check. These observations concern
statement selection; this report does not present a conjecture refutation.

The final conjecture additionally quantifies over nonzero real-rooted f without
explicitly excluding f(1)=0. Either retain definedness as part of the left-hand
property or state the repaired domain f(1) != 0 explicitly. Neither choice should
be silently described as a verbatim formalization of the unqualified sentence.
No conjecture-resolution claim is assessed here.

## Edge cases and evaluation checks

| Case | Required interpretation |
| --- | --- |
| n=0 | N=1. The main power is (X-1)^0=1; a first-order factor is not implied. |
| n=1 | Distinguish the existing first-order theorem from a claim requiring higher powers uniformly in n. |
| f=0 | The cleared polynomial is defined, but Q is not the paper's rational expression. |
| f(1)=0 or a=-1 | The i=0 denominator vanishes identically. |
| Some f(x^i)=0 at the evaluation point | The pointwise denominator-clearing statement needs its explicit hypotheses. |
| Nonzero constant f | Do not confuse the zero rational-function case with a polynomial of positive degree or an exact finite multiplicity claim. |
| Repeated roots | Included in the unnumbered Section 4 setting, excluded from Theorem 3.1's simple-root setting. |
| Complex roots | Outside the source's real-rooted hypotheses; any theorem covering them is an explicit extension. |
| Empty products | Equal 1, including the n=0 numerator definition. |
| Nonzero scalar normalization | Does not change divisibility by powers of X-1; an equality of particular normalized numerators needs its own convention. |

## Active exercise: exact scope

Inspected source snapshots:

- `MathGKM/AgohExercise.lean`, SHA256
  `61f532279f8b22c8b9f5ed37f31b2e5085111539aeba1bd4e33ea44c703a74f6`.
- `docs/round2/AGOH.md`, SHA256
  `f930385016fae775431799fbf3fb21315c7680d033e820dc612d1b30777b8452`.

The definition `numerator` is exactly N above, over real polynomials. The theorem
`first_order_factor` quantifies over every real polynomial f and every positive
natural n, and proves only \(X-1\mid N_{n,f}\). Its absence of a root condition
is a declared strengthening of this polynomial first-order statement, not a
formalization of the paper's n-fold result.

`clears_denominators` states the correct pointwise N=DQ identity with every
required denominator nonzero. `denominator_at_one` supplies nonvanishing there
under f(1) != 0. Its comment says "exactly" but the theorem itself proves the
forward implication only. No reduced-numerator equivalence is stated in the
active file. The active documentation correctly records that bridge as open.

`zero_order`, `missing_positive_n`, and `singular_counterexample` address genuine
missing-condition cases. Their scope should remain separate from the main
universal n-fold theorem. This review inspected their mathematical statements;
it did not perform a new Lean build.

## Source transcription defects relevant to auditing

The active exercise already contains an exact check that the geometric-series
region stated in the paper is insufficient. This is a defect in that proposed
justification, not a disproof of the main theorem; no replacement proof is given
here.

The Section 4 displays use T and W with inconsistent free indices and arguments.
A formalization should bind the intended excluded-index polynomial explicitly
rather than transcribe those ambiguities literally. Its displayed degree also
omits the exponent j carried by every factor: the corresponding expression has
leading degree \(j n(n+1)/2\), not \(n(n+1)/2\), for positive n. These local
issues do not by themselves settle either substantive n-fold claim.

The substantive next acceptance target remains the main n-fold statement with
its stated quantifiers and a precise numerator convention. The existing uniform
first-order exercise is useful, but does not discharge that target.
