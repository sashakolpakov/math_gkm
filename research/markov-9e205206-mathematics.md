# Numerator-three sources: positive cubes and four-slope kernels

Machine-authored request 9e205206685d4a9cbba612509f4cc95e. Full pinned
Conjecture63 remains unresolved. Final formal status is in this run's
validation.json. No historical novelty claim is made.

## Exact source classification and positive cubic formulas

Write F_0=1, F_1=u+v, F_(n+2)=S F_(n+1)-v F_n, S=u+v+1.
These are the inherited literal numerator-one polynomials, not new axioms.
Every numerator-three source path is false^n ++ [true,r]. Set q=n+1>=1,
x=F_(q+1), y=F_q. The complete source polynomials are

    r=true,  label 3/(3q+1): A_q=x³+v*x*y²+S*v*y³;
    r=false, label 3/(3q+2): B_q=S*x³+v*x²*y+v²*y³.

The classification uses the first-right split, exact label transformation,
and path injectivity at denominator three. The identities use the protected
recurrence and the proved Cassini identity

    S F_q F_(q+1)-u v^q = F_(q+1)²+v F_q².

All source polynomials with numerator three occur, with no denominator bound.
The q=0 extensions used for generating functions are algebraic auxiliary terms;
they are never asserted to be positive-slope sources of numerator three.

`root_iff_three_and_fourM9E2` gives the exact residual: these two entire families
must satisfy all three raw directions, and every numerator>=4 source must do
so. Neither conjunct is proved. This replaces a representation, not the root
or its scope, and does not claim a newly solved direction.

## Direct positive integer formula

`fibRawM9E2(n,i,j)` is 1 at i=0,j=n, zero at other i=0 positions, and for i>0
and i+j<=n is

    C(n-j-1,i-1) C(i+j,j).

It is zero outside that range. `fib_raw_formulaM9E2` identifies it with every
raw coefficient of F_n. A finite rectangular convolution is proved to equal
the actual coefficient of a polynomial product. Applying it twice gives every
coefficient of F_a F_b F_c. The cubic formulas above then yield `threeRawM9E2`,
using only guarded shifts, additions, and finite integer binomial sums.
The shifts check both lower bounds before natural subtraction. All zeros,
including n=0 and indices outside support, remain present.

`root_iff_three_arithmeticM9E2` retains all natural row/column indices in all
three directions and the entire OtherFourM9E2 clause. The arithmetic residual
is not proved. Its exact source equality is useful for future proof search
without repeated expansion of the Stern--Brocot recurrence.

## Four-state positive transfer

Let (f_0,g_0)=(1,0) and

    f_(q+1)=(u+v)f_q+g_q,   g_(q+1)=u f_q+g_q.

The first component equals F_q. Lift to (f³,f²g,fg²,g³). Its four-by-four
transition matrix is recorded explicitly in MarkovThreeTransferM9E2. Every
entry is a polynomial with nonnegative integer coefficients. The source
output functionals are also displayed as positive polynomials. The source
identity is proved, not inferred from finite agreement.

The transition splits exactly as T_0+u T_1+u² T_2+u³ T_3. T_0 is upper
triangular with diagonal v³,v²,v,1. This gives four geometric slopes for a
future coefficient comparison. The identity is a positive representation;
positivity alone does not establish any LC-preservation theorem.

## Symmetric-cube recurrence and explicit resolvent

Any homogeneous cubic in consecutive terms of f_(q+2)=s f_(q+1)-v f_q
satisfies an order-four recurrence. The checked scalar coefficients are

    e1=s³-2vs,  e2=vs⁴-3v²s²+2v³,  e3=v³ e1,  e4=v⁶.

Both source families therefore have generating series G_r(t) with
D G_r=N_r, where N_r is the explicit degree-three initial-condition polynomial.
At s=S the denominator factors exactly into

    D1=(1-vt)(1-v²t)-uvt,
    D2=(1-t)(1-v³t)-u[3(v²+v+1)+3u(v+1)+u²]t.

For any commutative ring, the coefficient of t^n in
1/((1-at)(1-bt)-ct) is proved equal to

    sum_(m=0)^n c^m sum_(k=0)^(n-m)
      a^k b^(n-m-k) C(m+k,m) C(n-k,m).

This is formal power-series inversion at constant coefficient one, without
analytic convergence or division of raw coefficients. If a,b,c have
nonnegative raw coefficients, each displayed polynomial does too. The product
of the two inverses supplies a finite four-slope kernel K_q; its coefficient
nonnegativity is proved. The exact source formula is the convolution of K
with N_r. The latter is SIGNED; no positive scalar seed decomposition or
inequality follows from the current formula alone.

The first combined kernel already shows a relevant limit: at q=2 its u^0
column is 1+v+2v²+2v³+2v⁴+v⁵+v⁶, and [1,1,2] fails vertical LC. This is
an exact Python observation about an auxiliary inverse kernel, not a source
polynomial or a claimed Lean theorem. Its expanded Lean draft timed out and
was removed from the final obstruction module; its build snapshot is retained.

## Experiments and rejected sufficient conditions

The exact source scan checked 60 formulas (q=1..30, both residue classes),
99,795 coefficient positions and 264,105 polygon-valid triples. The kernel
scan independently compared its finite binomial expansion with the quadratic
recurrence, checked 24 complete source kernel formulas, and checked 56,412
global raw triples including 37,278 triples containing zero. No source
inequality failure was found. These are finite experiments, not proofs.

The summand scan made 227,430 comparisons through q=14. The three cubic
summands individually passed its LC tests, but some mixed inequalities failed.
For actual source 3/5, the first and third summands have horizontal triples
[0,9,21] and [1,0,0] at (0,5),(1,5),(2,5). Their mixed inequality fails.
The complete source triple is [1,14,21], is polygon-valid, and satisfies LC.
These source values, polygon guards, raw inequality and failed mixed inequality
are separately checked in MarkovThreeObstructionM9E2 using ordinary kernel
reduction of the proved raw arithmetic formula.
Thus pairwise synchronization of every summand pair is not a valid universal
route. The r=true horizontal summand comparisons survived this finite test;
their universal validity remains unproved.

The initial Pell probe verified a positive two-state transfer through a=40
and found rhombus failures. It prompted the change to numerator three and is
preserved separately. No positive transfer alone is treated as LC preservation.
GAP factored the U-coefficients of the boundary-removed numerator exactly;
the output retains negative terms and supplies no Lean theorem.
