# Markov campaign: checked partial results; full Conjecture 6.3 open

Actual live Codex/gpt-6-astra proposer, 13 October 2026. Agoh's 43 declarations
and final mathematical documentation passed independent review before this
campaign. Its uniform n-fold theorem and cancellation equivalence are complete.
The transition-system self-change result remains about its explicitly defined
Lean model, not arbitrary edits of the Python/Codex researcher.

## Target and source audit

The target is Evans--Veselov--Winn, [Arithmetic and Geometry of Markov
polynomials](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
Conjecture 6.3. See `evidence/markov/source-audit.md` for the original and later
primary-source review. Evans's [Saturation of Markov Polynomials](https://arxiv.org/html/2604.18333v1)
establishes support through matchings, without proving the required inequalities
between their counts. No primary resolution of full 6.3 was located.

`MathGKM/Markov.lean` defines the actual numerator recurrence. Its nested
polynomial variables are u=x² (outer) and v=y² (inner), with w=z² set to 1.
Homogeneity recovers w's exponent. `coeff P i j` is the raw integer coefficient;
there is no multinomial scaling. `WeakLC` checks consecutive triples along
(1,0), (0,1), and (1,-1), retaining zeros. All three positions must lie in the
polygon a*b<=b*i+a*j and i+j<=a+b-1. Short lines have no triples.

`Conjecture63` is a proposition, not a proved theorem. It includes both endpoints
and every finite Stern--Brocot path. `frame_reduced` proves that each generated
interior label is reduced and lies in (0,1). Coverage of every reduced rational
by this usual path indexing is mathematically audited, but not yet formalized.
The recurrence itself comes from source equation (8); a full Laurent-function
equivalence theorem is not part of this checkpoint.

## Accepted mathematics and exact scope

* `boundary_formula` proves the j=0 specialization P(u,0,1)=u^a(u+1)^(b-1)
  for every finite path. `edgeEval_coeff` connects this specialization to raw
  coefficients. `boundary_raw_logConcave` proves their adjacent inequality
  uniformly, with no denominator bound. This recovers a published boundary
  result; it is not a resolution of the interior conjecture.
* `CrossLC` imposes f(i)f(j+1)<=f(i+1)f(j) for all integer i<=j.
  `crossLC_smooth` and `crossLC_pascal` prove preservation under adding a
  shifted copy, and under every finite iteration. This stronger hypothesis
  handles zeros without assuming that ordinary local log-concavity alone
  excludes internal gaps. `coeffSeq_binomial_mul` proves the polynomial bridge.
* For nonnegative A,B,C with AC<=B², every coefficient sequence of
  (1+X)^n(A+BX+CX²) is log-concave, for every natural n. Negative indices are
  explicitly zero. The proof uses cross inequalities, not real-rootedness.
* Put A=(a-1)(a-2)/2, B=ab-4a+2, C=(b-1)(b-2)/2. For all natural 3<=a<b,
  `third_diagonal_expression_logConcave` proves log-concavity of
  (1+X)^(a+b-5)(A+BX+CX²). `sourceThird_factor` proves its exact algebraic
  equality with the displayed third-diagonal expression of the source.
  This removes the a/b<=3/5 restriction for that explicit expression.
  **The universal identity between this expression and our recursively
  generated Markov diagonal is still a formal obligation.**
  `ThirdDiagonalFormula` states it and `third_diagonal_of_formula` transfers
  log-concavity under precisely that hypothesis. No axiom supplies the identity.
* Checked examples include both endpoint conventions and all three directions
  at 1/2. The exact 1/3 numerator yields raw coefficients 1,2,3 on i=1.
  Multinomial normalization changes them to 1/3,1/3,1, which fails log-concavity.
  Thus the raw target cannot be replaced by this stronger normalization.
  Subtraction closure fails for (1,2,1)-(0,2,0)=(1,0,1), although both inputs
  satisfy the cross inequalities. The quadratic seed at (a,b)=(3,4) is
  1+2X+3X²: its discriminant is negative, yet its coefficients are log-concave.

The gap certificate for the third-diagonal seed was selected after the exact
experiment. With a=t+3,b=t+s+4, four times B²-AC equals

    4+38s+34s²+20t+69ts+21ts²+29t²+37t²s+3t²s²+16t³+6t³s+3t⁴.

`ring` proves the identity and nonnegativity proves the inequality universally.

## Observed experiments and decisions

1. Exact recurrence scan, denominator <=16: 79 fractions, 22,339 triples;
   no raw LC or support failure. The published 2/3 numerator agrees exactly.
   Normalized LC fails at 1/3, ruling out that stronger proof route.
2. The engine itself executed the pure-Python quadratic test: 1,275 parameter
   pairs passed AC<=B², with many negative discriminants. This led to the
   Pascal-smoothing route, rather than a claim of real-rootedness.
3. The third-diagonal factor matched all 57 eligible fractions in the initial
   data. Symbolic integer polynomial arithmetic produced the gap certificate.
4. A machine-selected conjecture asks whether each upper diagonal r, after
   removing (1+X)^max(d-2r,0), has nonnegative log-concave residual coefficients.
   This is distinct from published 6.3 and addresses only the diagonal direction.
   All 1,293 initial diagonals passed. The separate published factor-4
   Conjecture 8.1 passed at 2,018 critical coefficients.
5. A larger challenge, denominator <=28, checked 241 fractions, 229,476 raw
   triples, 6,822 residual diagonals, and 20,781 critical coefficients, with no
   failure. All tested raw triples were strict. None of these finite results
   proves its corresponding universal statement.

The diagonal counts retain zero-only lines below the polygon; these have
vacuous inequalities. Raw triple counts include only triples inside the polygon.

Scripts and complete results are in `evidence/markov/`. Failed compilation
observations are preserved as `compile-*.json`, including noncomputability
annotations, indexing simplification failures, and coefficient proof repairs.
These records preserve compiler output, not full snapshots of each old draft.
No failed draft is an accepted theorem.

## Engine chronology and validation

The actual proposer consumed the old round-2 request and bound the pre-existing
independent Agoh result to its pending Lean event. It did not claim that the
new engine response produced those earlier proofs. Markov has its own contract
`contracts/markov.json` and run `evidence/markov/research-run`.
All live responses have exact request bindings and `direct_bootstrap_proposer`
origin. Literature reads began before run initialization, as the record states.
Dependent mathematical choices follow actual returned observations. External
results carry event indices and action hashes; the engine correctly labels
them unverified external claims, even when ordinary Lean checks separately pass.
No controller changes were made. K is excluded from scheduling and utility.

Run `/opt/homebrew/bin/python3 evidence/markov/reproduce.py` for pinned Lean
compilation, axiom-closure inspection, and kernel replay. `build.json`,
`kernel.json`, and `MarkovAudit.log` are the acceptance evidence. These are local
checks by the live proposer, not a new independent supervisor review. The
only permitted axiom dependencies are propext, Classical.choice, and Quot.sound.

Next: prove `ThirdDiagonalFormula (frame path).mid` for every path with 3<=a<b,
or find a more informative obstruction to extending the residual approach.
Full horizontal and vertical interior inequalities, general diagonal residual
log-concavity, and formal rational-index coverage remain open here.
