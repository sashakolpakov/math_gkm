# Independent mathematical review of Agoh main statements

This review is read-only with respect to the project. AgohExercise, AgohMain,
and AgohConsequences compiled successfully from independent copied source.
Every one of their 43 named theorems was checked for axiom dependencies: all
closures contain only propext, Classical.choice, and Quot.sound. No custom axiom
or proof placeholder is present. The build and axiom outputs and exact source
hashes are in report.json. No project mathematical proof or repair was supplied
by this reviewer.

Primary source: Takashi Agoh, INTEGERS 26 (2026), A9,
https://math.colgate.edu/~integers/aa9/aa9.pdf. The source statements were
cross-checked against the primary PDF and the earlier statement inventory at
/private/tmp/math_gkm_godel_20261013/agoh_source_statement_audit.md.

## Mathematical meaning

The definitions use every index from 0 through n, with the alternating signed
binomial coefficient and the excluded-index product exactly as intended.
`main` states divisibility by the full nth power in the denominator-cleared
polynomial for every real polynomial, including singular ones. This statement
is purely polynomial and does not give meaning to an undefined rational sum.

`main_regular` is the regular-domain version. Its proof proceeds through a
polynomial inverse modulo the nth power, not an assumed root restriction.
`rationalSum_eq_fraction` proves the exact link between the finite sum in the
rational function field and the specified cleared numerator/common denominator.
The nonvanishing hypothesis f(1) != 0 makes every denominator polynomial nonzero.
`reduced_numerator` then legitimately transfers divisibility to RatFunc.num by
coprimality of the common denominator with the nth power. Thus the canonical
reduced numerator, rather than a polynomial merely named numerator, is covered.

`theorem_1_1` specializes to f=X+a under a != -1. `paper_H` identifies the
displayed cleared polynomial. `paper_G` states its evaluation identity exactly
where every pointwise denominator is nonzero. `theorem_3_1` includes positive
degree, splitting over the reals, squarefreeness, and nonvanishing at 1. Its
root/degree hypotheses are correctly unnecessary for the stronger result but
record the published theorem's narrower scope. No monic normalization is needed.

## Boundary cases and totalized division

- n=0: the cleared numerator is 1 and the divisibility factor is 1. There is
  no erroneous positive-order conclusion. The regular rational sum is the
  nonzero constant 1/f(1).
- f=0: the cleared theorem is meaningful (numerator 1 at n=0, zero for
  positive n). The rational-function linking and reduced-numerator theorem
  cannot be applied, because their nonvanishing hypothesis fails.
- f(1)=0: the written sum has an identically zero i=0 denominator. The code
  explicitly separates the meaningful cleared polynomial theorem from the
  regular rational-function theorem; field division by zero is not used to
  erase the paper's domain condition.
- Pointwise zeros away from 1: rational functions remain algebraic objects;
  the pointwise bridge separately requires all evaluated denominators nonzero.
- Nonzero constant polynomials: the positive-n rational sum is zero, so its
  reduced numerator is zero and divisibility is the intended proposition.
- The conclusion is at least n factors, not exact multiplicity. Repeated-root
  and exceptional higher-multiplicity examples therefore create no mismatch.

## Consequence statements

`PaperAlternatives` permits monomials of degree zero. Although its definition
does not separately exclude a zero coefficient, every conjecture instance
requires f != 0 (and f(1) != 0), so its effective monomial convention is correct.
Splitting plus squarefreeness captures the other root alternative in the
specified real-polynomial domain.

The per-n and all-n readings put their quantifiers in genuinely different
places. The example (X+1)^2 lies in the regular, nonzero, real-split domain,
has a repeated root, is not a monomial, and satisfies the claimed divisibility
for every n. These statements refute necessity under both readings, including
every positive n, independently of the trivial n=0 case. The explicitly repaired
regular domain does not undermine this refutation: this witness is also in the
meaningful domain of the printed claim.

The H2/H3 formulas and extra-factor condition match the source. The Section 4
degree example correctly illustrates the missing multiplicity in the printed
degree. The nonsplit example is an illustration of the general theorem; no
separate formal nonsplitting assertion is present in that example's type.

No mathematical mismatch was found in these statements or inspected proof
arguments. Final source hashes all match, and the completed documentation accurately
matches the formal statements. Details are in DOCUMENTATION_REVIEW.md and
final-source-status.json.

## Additional checked equivalences

The final cleared_iff_reduced theorem proves equality of divisibility by every
power m, independently of the sum order n, on f(1) != 0. It therefore closes the
numerator-convention question even for exceptional higher multiplicities.
The root-list/squarefree equivalence is proved for nonzero split polynomials,
exactly the domain where a root list exhausts the polynomial. The equivalence
between all natural orders and all positive orders correctly handles order
zero as automatic. The explicit radical exceptional examples transfer the
fourth-order factor for n=3 to the reduced numerator with nonvanishing checked.

## Acceptance conclusion

The published first and third theorem targets are discharged by the stated
specializations of a stronger theorem. For every real polynomial regular at 1,
the reduced numerator has at least the nth power for every natural n; real
roots, simplicity, monicity, and positive degree are unnecessary. The regular
repeated-root witness refutes necessity in each recorded conjecture reading.
This is a substantive mathematical result, with no unresolved proof obligation
in the audited statements. Whether this stronger observation was previously
published elsewhere is a separate literature question and was not audited.


The final added cancellation_without_regularity theorem is also independently
compiled and audited. It correctly gives (X-1)/(X-1)=1 as a general example of
a cleared factor disappearing when the denominator vanishes at 1; it does not
claim this particular fraction is an Agoh sum.
