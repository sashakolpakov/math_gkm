# Horizontal jet and scope of the experiments

Machine-authored research, 2026-10-14. Full Conjecture 6.3 remains open.

For a raw A--core--B word, put n=core.length and m=core.count(B).
At v=0 the generators are scalar multiples of the same rank-one matrix.
If (p,q) is the first row after A and the core processed so far, then

* p(0)=0 and q(0)=u^m(1+u)^n;
* (u+1)[p'(0)+(u+1)q'(0)]
  =q(0)[u+1+nu+m(u+3)].

Here the derivatives mean first coefficients, so no factorial or normalization
enters. MarkovRowJetB46 proves the invariant over every commutative ring.
Multiplication by the final B gives

    (u+1)[v]P = u^(m+1)(u+1)^n[(3m+2)+(n+m+2)u].

The cancellation for n>=1 is in the integral polynomial ring; n=0 gives 2u
directly. MarkovHorizontalB46 connects the word to every actual source path
and proves ((swap P).coeff j).coeff i=coeff P i j. The resulting label form is

    [v]P_(a/b) = u^a(1+u)^(b-3)[(3a-1)+(a+b-1)u], b>=3.

MarkovHorizontalLCB46 proves the zero-extended CrossLC predicate and literal
integer raw horizontal inequality on j=1, for every path and every natural i.
The first-row source result is known in published Theorem 6.6; this work is
a checked exact bridge and no historical novelty is claimed.

MarkovVerticalBoundaryB46 uses the triangular u=0 specialization to prove
[u^0]P=v^b(v+1)^(a-1), and its raw vertical coefficient inequality for every
path and natural j. This is likewise a boundary result, not the interior goal.

The actual source at 2/5, path LR, has horizontal row j=2 equal to
u^2(14+28u+15u^2). Its quadratic factor has discriminant -56 and is positive
at every real argument; the raw coefficients satisfy 14*15<=28^2. Thus a
real-rootedness requirement is stronger than horizontal raw LC. The Lean
example supplies the exact source identity and algebraic certificates.
source_horizontal_nonreal_zero46 additionally constructs
z=(-14+i sqrt(14))/15 and proves its imaginary part nonzero and its evaluation
in the actual integer source row, mapped to complex numbers, equal to zero.
See the final validation manifest for its build/replay receipts.

## Source formula discrepancy, separate from the conjecture

The live [publisher text](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was retrieved on 2026-10-14. Its Theorem 4.2 displays

    A_(i,1)=(3a-1) choose(b-2,i-a)+(b-2) choose(b-3,i-a-1).

At a=2,b=3,i=3 this is 6. The actual recurrence gives 4; the explicit
source polynomial displayed in section 3 also gives 4. Theorem 4.1 instead
has the second prefactor b-2a, which gives 4 and agrees with the checked
linear factor above. printed_row_formula_mismatch46 proves the exact
recurrence value and displayed numeric value. This does not refute 6.3.
No protected root or paper statement has been silently altered.

## Finite experiments and revisable guidance

word-directions-16.json checks 32,767 raw A--core--B words of length <=16.
No horizontal failure occurred, whereas 2,625 words failed vertically and
5,688 diagonally. This motivates the unproved broader horizontal-only claim.
It does not justify enlarging the word family for the full root. Under B->AC,
these expanded words have no consecutive C letters; a future horizontal
argument might exploit that restriction. This is advice, not a proved lemma.

The exact rational Sturm routine found the same nonreal source horizontal
example at 2/5 when fractions were ordered by denominator. Earlier exploratory
output found a larger example first; both remain preserved. No numerical
root routine or Sturm output is a Lean theorem.

Circularly balanced, reduced words with the prescribed A/B endpoints can
also fail unrestricted diagonal LC: ABBABABABABAB, counts 7/13, has coefficients
2,6,20 at (5,3),(6,2),(7,1). However (5,3) is outside the canonical 7/13
polygon, and the actual source coefficients are 0,4,20. This is only an
obstruction to an enlarged GlobalLC18 sufficient condition. It does not
refute a polygon-guarded enlargement. A separate guarded scan through
denominator 26 checked 933 reduced rotations and found no failure. That
guarded enlargement too remains entirely unproved.

All experiments use exact integer or rational arithmetic. None provides a
source-family witness reversing the pinned raw inequality. No root completion
or certified research-controller improvement is claimed.
