# Lower numerator-two horizontal log-concavity

Machine-authored live request af6200bf65064e34b8d9216a2d53d5b2. Completion null.
The statements below refer to the source-bound Lean validation receipts.

For every finite path with numerator index 2 and denominator 2q+1,
`source_two_lower_halfMAF6` proves

    A(i,j) A(i+2,j) ≤ A(i+1,j)²

for every natural i,j with 2j+1≤b, equivalently j≤q. This is the entire
lower horizontal half, not merely a central row or finitely many rows.
`lower_binomial_lcMAF6` proves the entire arithmetic subproblem left open by
worker 58e57003. All coefficients are literal integers, without normalization.

## Shifted finite summation

Write D(j,d,i)=lowerValM58E j d i for q=j+d, and

    T(i,h)=C(2d,h) K(j,i,h),  0≤h≤i−2,
    K(j,i,h)=C(2i−2−h,i)[C(j+i+1,2i−1−h)+C(j+i,2i−1−h)].

T is zero outside that range. The inherited exact source formula identifies
A(i,j)=D(j,d,i). The new `lower_term_sumMAF6` identifies D with the sum of T
over the common range 0≤h≤2d, proving all added terms zero.

The new global inequality, valid for j≥2 and all natural i,h,k, is

    T(i,h) T(i+2,k)
      ≤ T(i+1,min(h+1,k)) T(i+1,max(h+1,k)−1).

This is a shifted min/max condition, not a substitution of lattice meet/join
for the inherited floor/ceiling midpoint premise. A separate Lean proof supplies
its summation implication. For nonnegative a,b,c, let

    f₁(x)=a(x−1), f₂(x)=c(x), f₃(x)=b(x), f₄(x)=b(x−1),

where shifted functions are zero at x=0. Apply Mathlib's finite four-functions
theorem on Fin(n+2). For x>0 put h=x−1, k=y: lattice meet/join become precisely
min(h+1,k) and max(h+1,k). For x=0 nonnegativity handles the zero product.
Assuming b(n+1)=c(n+1)=0, both padded sums equal the desired unshifted sums.
Thus (Σa)(Σc)≤(Σb)². No infinite sums, division by coefficients, or positivity
of individual summands are assumed. Applying this with n=2d proves D is LC.

## Global summand proof

Nonzero T(i,h) has h+2≤i≤j+h+2 and h≤2d. These guards are proved; zero
products are handled before using ratios. The proof uses only scaled identities:

    Hden(i,h) K(i+1,h)=Hnum(j,i,h) K(i,h),
    Dden(j,i,h) K(i+1,h+1)=Dnum(j,i,h) K(i,h),

where

    Hnum=(j+i+1)(j−i+h+2)(2i−1−h),
    Hden=(i+1)(i−1−h)(2i+1−h),
    Dnum=(j+i+1)(2i−1−h)(2j+4+h),
    Dden=(i+1)(2i−h)(2j+3+h).

The first identity is newly derived from the inherited scaled core formula
and ordinary choose recurrences; the second is inherited. All denominator
factors used for sign transfer are proved strictly positive on the guards.

If k≤h, compare Hnum(j,i,h)/Hden(i,h) against the next-row ratio at k.
For p=h−k, r=i−h−2, t=j−i+k, all nonnegative, the cross-multiplied difference
becomes a polynomial with nonnegative coefficients. Lean `ring` checks the
explicit expansion and `positivity` proves its sign. The binomial weights
are unchanged in this case.

If k=h+1, use the inherited local mixed-core inequality. This is the only
branch requiring j≥2; its j=1 failure remains intact.

If k≥h+2, compare Dnum(j,i,h)/Dden(j,i,h) with the next-row ratio at k−1.
Substitute p=k−h−2, r=i−k, t=j−i+h+2, all nonnegative. The second exact
nonnegative polynomial certificate proves the comparison. The inward binomial
inequality C(2d,h)C(2d,k)≤C(2d,h+1)C(2d,k−1) supplies the changed weights.
`choose_inwardMAF6` proves this independently, including zero tails.

All polynomial expansion generation is ordinary Python integer arithmetic;
the resulting identities and sign arguments are checked in Lean. Python output
is not a premise. The j=0 and j=1 source rows use the inherited unconditional
boundary_raw_logConcave and horizontal_one_raw46 theorems.

## Exact remaining scope and a real gain

`root_iff_interiorMAF6` proves Conjecture63 ↔ InteriorCore63MAF6. Its only
change to the previous residual is to discharge horizontal triples with a=2
and 2j+1≤b. Vertical and diagonal clauses, every other guard, and all reverse
factor ranges remain. The residual is not proved.

For every n≥0, the path lowerPathM58E (n+5) 1 represents 2/(2n+13).
At row j=n+5 and starting column i=3 it satisfies all preceding residual
guards, including failure of the mixture, variance, sharp and central-row
criteria. `lower_previous_guardsMAF6` proves these facts and polygon membership
for columns 3,4,5. `lower_gain_rawMAF6` proves the raw inequality there.

## Upper-row alternative: obstruction

The all-index Fibonacci coefficient formula is now packaged as
`fib_coeff_allMAF6`, including i=0 and degree-tail zeros. `squareSummandMAF6`
splits the actual sum of squares by column allocation h; `square_summand_formulaMAF6`
proves that summing it gives the exact numerator-two coefficient for all q,i,j.
This is a different decomposition from T above.

At q=7,j=8,i=1,h=0,k=1 the shifted condition fails: the left product is 3306
and the right product is 3263. `square_summand_failsMAF6` proves the strict
reversal. The actual source is 2/15 and its polygon-valid raw triple is
[4,277,3378]; 4·3378≤277². `square_obstruction_sourceMAF6` proves the source
labels, polygon guards, coefficient values and LC. This refutes this particular
summand certificate, not any clause of the pinned root.

An additional exact rational Sturm experiment found a non-real-rooted candidate
upper row already at that same source and row: after stripping its initial zero,
the degree-seven polynomial has five distinct negative roots and is squarefree.
This root-count assertion has NOT been formalized. See upper-sturm-v2.json.
The v1 file reports distinct-root deficits, which alone do not imply failure
of real-rootedness when repeated roots occur; v2 separately records squarefree
deficits. No universal real-rootedness or log-concavity claim follows from scans.
