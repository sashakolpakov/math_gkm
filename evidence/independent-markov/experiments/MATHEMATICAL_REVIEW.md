# Independent finite Markov scan review

The project's `evidence/markov/scan.py` was copied unchanged and run in this
temporary directory. All generated files were written here. No active project
source, proof, coefficient file, or evidence was modified.

Reproduction succeeded. `source-status.json` confirms that both generated JSON
files exactly match the active scan's outputs and records the script hash.
`reproduction.json` records the copied script's run. `independent_checks.py` and
`independent-checks.json` contain the separate checks described below.

## Coverage and exact arithmetic

The 79 generated parameter pairs are distinct and their set equals the direct
enumeration of every pair 0<a<b<=16 with gcd(a,b)=1. All 79 path labels are
distinct. The original script's count-only assertion is therefore supplemented
by actual set equality and duplicate checks. Endpoints 0/1 and 1/1 are not
included among these 79 proper fractions; they are used in the initial data.

Every frame has ordered Farey-neighbor endpoints and the labeled middle is their
mediant. Denominators increase along the descendants, so pruning above 16 cannot
discard a later denominator at most 16. This is finite enumeration coverage;
no general Lean theorem of Stern--Brocot completeness is asserted here.

Polynomial arithmetic uses Python integers. Normalized arithmetic uses exact
rational numbers. There is no floating-point tolerance in any reported test.

## Source recurrence and coefficients

The three seeds and the child update agree with equations (5), (7), and (8) of
[Evans--Veselov--Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
The scan specializes the homogeneous numerator at w=1 and updates by
(1+u+v) times the fixed and middle numerators, minus u^a v^b times the old
numerator, where a/b is the fixed endpoint. The displayed 2/3 coefficients
agree term for term with the source's example.

As an independent recurrence check, every polynomial was lifted to the full
three-variable Laurent exponent triple
(2i-a+1, 2j-b+1, a+b-1-2i-2j). For all 78 generated edges the exact Laurent
polynomial identity old*new = fixed^2 + middle^2 holds coefficient by
coefficient. This retains z and is not merely a numerical specialization.
Integer exponents also handle the 0/1 endpoint correctly.

## Triple coverage and results

For each parameter the support equals all integer points satisfying
i,j>=0, bi+aj>=ab, and i+j<=a+b-1, and every coefficient is positive.
The independent checker enumerated all centers with both neighbors in that
polygon, rather than reusing the scan's starting-point loop. Its obligation
sets agree exactly with the scan, including zeros through zero extension if
they had occurred. Counts are:

| Direction | Triples | Raw failures |
| --- | ---: | ---: |
| Horizontal (1,0) | 7,164 | 0 |
| Vertical (0,1) | 7,164 | 0 |
| Constant i+j, direction (1,-1) | 8,011 | 0 |
| Total | 22,339 | 0 |

The normalized coefficients A_ij i! j! (d-i-j)! / d!, d=a+b-1,
fail 5,442 of the same inequalities. This is division by the multinomial
coefficient, so it changes the conjecture's predicate. The first failure is
at parameter 1/3 and positions (1,0),(1,1),(1,2): raw coefficients [1,2,3]
satisfy 2^2>=1*3; normalized coefficients [1/3,1/3,1] violate
(1/3)^2>=(1/3)*1. The original report lists only its first eight normalized
failures; the independent count examines all triples.

## Conclusion and limitation

All numerical claims requested for this finite scan are correct. The scan
supports the raw-coefficient target and rules out substituting the stated
normalized-coefficient property. It proves neither uniform log-concavity nor
uniform saturation. No proof strategy or mathematical implementation was
supplied to the active proposer during this review.
