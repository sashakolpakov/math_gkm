# Mathematical results

Machine-authored live request 831d426f49894488b2803a879f0bf56a.
Full pinned Conjecture63 remains unresolved. No historical novelty is claimed.

Write c=1 for false residue and c=2 for true residue, a=c, b=3-c,
q=d+2k+c, j=q+k+1, and P(d,k)=Q(q,r,k)=bandAtM139 d k r.
All displayed coefficients are ordinary integer polynomial coefficients.

## Closed forcing coefficients and extended shift

MarkovFibCoeffM831 proves, without a range hypothesis,

    F(n,j)_m = choose(j+1,m+1) choose(n-j-1+m+1,m).

Natural subtraction in this auxiliary formula is literal. When n>=j+1 it
simplifies to choose(j+1,m+1) choose(n-j+m,m). A finite Vandermonde sum,
not interpolation, proves the identity. MarkovFibShapeM831 proves positivity
exactly at m<=j, all adjacent inequalities, and zero-extended CrossLC.

The coefficient identity extends the parameter-shift recurrence to n>=j+1.
MarkovBandShiftM831 extends the corresponding Q shift to q>=k+1. Applying
the inherited row_diagonal_operatorMDAB then gives the exact identity

    P(d,k+2)-2P(d,k+1)+P(d,k)
      =4 G(d+2k+c+2,r,k+2).

Every forcing coefficient is nonnegative. Its coefficients through its
degree are strictly positive. The initial first differences are nonnegative.
MarkovBandPositiveM831 therefore proves nonnegativity for every d,k,m,
coefficientwise monotonicity in k, and strict positivity exactly for 0<=m<=k.
The identity also gives convexity in k. The predecessor's conditional
monotonicity in d is now unconditional. These are comparisons between
different factors; they are not within-row log-concavity statements.

## Exact positive sum and the boundary formula

Let H(d,s)=F(d+2s+1,s), and DP(H,k)=sum_(s<k)(k-s)H(s).
MarkovBandSumM831 proves

    P(d,k)=4[a DP(H(d),k+1)+b DP(H(d),k)].

Equivalently, by combining the two finite sums,

    P(d,k)_m=4 sum_(s=0..k) [3(k-s)+a]
                    choose(s+1,m+1) choose(d+s+m+1,m).

The formal theorem uses the double-prefix form. The last displayed form is
its elementary algebraic expansion and is separately reproduced in Python.
This exact formula follows from the shifted recurrence and two initial
polynomials. It uses neither the exploratory power-series change of variable
nor an external Jacobi-polynomial theorem.

At d=0, the binomial product becomes

    H(0,s)_m=choose(2m+1,m) choose(s+m+1,2m+1).

The inherited weighted hockey-stick identity evaluates both prefixes. Thus
the formerly conjectural boundary formula is now proved:

    P(0,k)_m=2 choose(2m+2,m+1)
      [a choose(k+m+3,2m+3)+b choose(k+m+2,2m+3)].

MarkovBoundaryPositiveM831 proves its equivalence to the predecessor's
denominator-cleared BandBoundaryFormulaM139. MarkovBandSumM831 discharges
both propositions unconditionally for every k,m and both residues, including
all zero tails. The positivity reduction is no longer merely conditional.

## Boundary factor log-concavity

MarkovBoundaryLCM831 proves every adjacent inequality for P(0,k). Its proof
uses exact binomial ratio identities, then a rational polynomial inequality
after substituting k=m+t+2 with m,t>=0. `ring_nf` and positivity check that
inequality; no numerical certificate is trusted. The off-support cases use
the actual zero tail.

MarkovBandCrossM831 proves the full interval-support bridge and establishes
CrossLC of the actual d=0 factor, as well as its binomial smoothings. It also
proves, for every d, equivalence between natural adjacent inequalities and
zero-extended CrossLC. It does NOT prove those inequalities for every d.

## Raw-source consequences and limits

The source factorization remains the predecessor's exact identity

    rawRow=lowerRow+X^2(1+X)^d Q.

MarkovBandSourceM831 proves raw coefficients in the entire source band are
at least their lower-row contribution, and transports this comparison to
all actual numerator-three paths. The domain is q>=2 and
2(q+k+1)+1<=sourceN(q,r), exactly as before. The general LC transport now
needs only its explicit coefficient-budget and scalar-margin assumptions;
its factor nonnegativity premise is discharged. The universal budget c=Q_1
remains false and is not reinstated.

The module also proves an explicit all-column boundary source coefficient
identity: at q=2k+c, the correction is boundaryBinomial(k,i-2,r) when i>=2
and zero otherwise. Its q>=2 hypothesis retains the exceptional q=1 case.

MarkovBandResidualM831 proves the uniform alternative factorization

    rawRow=X^2(1+X)^d R,
    R=Q+X rowH(sourceN,j).

It proves R nonnegative, positive at every index 0..j+1 and zero afterwards.
CrossLC of R suffices for every horizontal source triple, with all columns
and zeros retained. That CrossLC premise is unproved. In particular, the
new boundary-factor theorem does not prove LC of R or of the full source row.
ThreeBeyondThirdM964 and OtherFourM9E2 remain entirely required.

## Rejected stronger route and finite observations

MarkovBandObstructionM831 proves P(0,2,false)=72+96X+40X^2, strictly positive
at every real argument. Its adjacent coefficient gap is 6336. This factor
belongs to q=5,false in the existing source-band representation (the 3/17
family), but its real-root obstruction is purely auxiliary and is not a raw
source counterexample.

The direct source run tested 388 rows, 39,809 coefficients with 17,509 zeros,
39,033 raw triples (21,524 polygon-valid), 3,271 positive-sum comparisons,
and 2,541 factor adjacent inequalities. No failures occurred. A separate
2,214-row augmented-residual scan checked 175,275 adjacent inequalities
without failures; 46,494 proposed nonnegative mixed terms failed. Thus a
termwise nonnegative mixed-gap proof is not available from that scan.
The rational Sturm diagnostic tested 160 factors and found many nonreal
root examples. All scans are finite experiments, not universal proofs.

Compilation, theorem-axiom inspection and union kernel replay are recorded
separately in evidence/markov-831d426f/validation.json. No fresh whole-source
rebuild or independent completion audit is claimed.
