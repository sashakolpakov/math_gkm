# Mathematical checkpoint

Machine-authored request 1c65a30634f843b1b22e83fb453dc26d.
Full pinned MathGKM.Markov.Conjecture63 remains open. No novelty claim.

## Reversed-kernel moments

Use the actual inherited kernel

    K(j,s,r) = w(r) (j)_r / (s+j+3)_r,
    w(0)=1, w(r)=4r for positive r.

For 0<=h<=j, define

    S_h = sum_(r=0)^h K(j,s,r) K(j,s,h-r),
    T_h = sum_(r=0)^h (r-h/2)^2 K(j,s,r) K(j,s,h-r),
    U_h = sum_(r=0)^h (r-h/2)^4 K(j,s,r) K(j,s,h-r),
    v_h = T_h/S_h,
    y=s+j+4, z=y-h/2.

Every kernel entry in this range, S_h and z is strictly positive. All divisions
in the following identities have proved-positive denominators. Let
A_h=C(j,s,s+2,h), B_h=C(j,s+1,s+1,h) for the inherited reverse convolution C.
The new formal identities give

    y^2 B_h = z^2 S_h - T_h,
    y(y+1) A_h = (z^2+z) S_h + T_h.

They follow from the exact shift
K(j,s+1,r)=K(j,s,r)(y-r)/y and finite reflection r -> h-r.
For h>=1 the exact gap identity is

    y^3(y+1)(B_(h-1) A_h-B_h A_(h-1))
      = (2z+1) S_h S_(h-1) D(j,s,h),
    D(j,s,h)=(z+1)v_h-z v_(h-1)+z/4.

Thus the required reversed adjacent inequality is EQUIVALENT to D>=0, not
merely implied by it. This is proved in MarkovVarianceDriftM1C6.lean.
The sign for arbitrary remaining parameters is unproved.

## Two deficiency certificates

MarkovCertificate4M1C6.lean and MarkovCertificate5M1C6.lean prove positive
factorizations of the predecessor's integer-cleared gap at h=4 and h=5,
for every natural j=h+k and s. The core factors have respectively 18 and 35
strictly positive monomial coefficients. Their explicit symbolic identities
are checked with Lean ring; the experimental arrays supplied no trusted theorem.
MarkovUpperTailM1C6.lean removes precisely these two auxiliary steps and proves
the residual 6<=h<=j equivalent to UpperAdjacentMA45. It also proves all
auxiliary q-adjacent inequalities for j<=5, for every s. The parameter j is an
auxiliary polynomial degree, not a claim about all source numerators <=5.

## Universal parameter contraction and a failed shortcut

MarkovVarianceContractionM1C6.lean proves

    y^2 S_h(j,s+1) S_h(j,s) [v_h(j,s)-v_h(j,s+1)]
       = S_h U_h-T_h^2 >=0.

The sign is proved by the weighted second-moment inequality, itself derived
from a finite sum of nonnegative squared differences. Hence variance decreases
with s for every h<=j. Its bound 0<=v_h<=h^2/4 is also proved. This contraction
does not imply the required comparison between different h.

In fact monotonicity in h is false on the actual auxiliary kernel:

    v(15,2,14)=152528/25937,
    v(15,2,15)=75573/12884 < v(15,2,14).

MarkovMomentObstructionM1C6.lean proves these values, refutes the universal
monotonic-h shortcut, and proves the actual corresponding auxiliary adjacent
inequality through its strictly positive drift. This is NOT a source-family
counterexample and does not refute Conjecture63.

## Every auxiliary ratio at parameter zero

For a=s+3,b=t+3 the factorial-scaled reversed product coefficient is exactly

    sum_(r=0)^h w(r)w(h-r) (j-r+1)^overline(a) (j-h+r+1)^overline(b).

For h>=1 the weight product equals 16r(h-r), with the additional endpoint
weight 4h at each of r=0 and r=h. MarkovRisingConvolutionM1C6.lean proves the
formula with those endpoints retained. For s=0, the two required products have
(a,b)=(3,5) and (4,4). Their summands have degree at most ten in r; ordinary
finite power-sum identities give exact polynomial formulas in j,h.
MarkovPowerSumsM1C6.lean proves the needed finite power sums by induction.
MarkovFixedZeroFormulaM1C6.lean proves the actual coefficient identities

    A(j,h)=720 [X^(2j-h)] q(j,0)q(j,2),
    B(j,h)=576 [X^(2j-h)] q(j,1)^2,

where A and B are its explicitly displayed real polynomials, for 1<=h<=j.
Here q(j,s)[i]=w(j-i) choose(s+i+3,i), exactly the inherited q family.
For h=u+2 and j=u+2+k, MarkovFixedZeroPositiveM1C6.lean proves

    B(j,h-1)A(j,h)-B(j,h)A(j,h-1)
      = (u+1)(u+2)(u+2k+11) P(u,k) > 0,

where P is the explicit degree-18 polynomial zeroGapCoreM1C6. Every displayed
coefficient is positive. This identity and sign are checked by ordinary Lean
ring and positivity, universally for nonnegative real u,k. No interpolation
or finite coefficient scan is admitted as proof.

MarkovFixedZeroClosedM1C6.lean cancels the positive scalar scales and proves
every auxiliary q-adjacent inequality at s=0, for all j and n<2j. Combining
the inherited support and zero tails proves every ordered coefficient-ratio
comparison at s=0, and the translated sharp complete-margin inequality there.
The proof includes all lower/cutoff/final steps; no deficiency bound remains
in this parameter slice.

The exact remaining auxiliary condition is now PositiveParameterTailM1C6:
D(j,s,h)>=0 for all 1<=s, 6<=h<=j. Its equivalence to UpperAdjacentMA45 and
conditional transport to the actual horizontal source band are proved. This
condition is still OPEN. No full-root residual clause has been removed.

## Experiments

The exact rational moment probe tested 22365 comparisons and found 4217
failures of monotonicity in h. The normalized drift D/z decreased in s in
19074 grid comparisons and 400 additional stress comparisons; 7140 checks of
the proposed limiting drift were nonnegative. The asymptotic identification,
universal limiting sign, and normalized-drift monotonicity are NOT proved.

The fixed-s symbolic experiment found positive shifted-gap coefficients at
s=0,1,2 (225,323,437 terms). Its initial run completed s=0 then failed because
the Faulhaber list was too short for s=1; the corrected run is recorded. Finite
binomial-sum comparisons passed 7644 formula checks and 3675 gap checks.
The s=1,2 computations are not universal Lean results.

The actual source recurrence experiment covered 48 distinct labels, including
both endpoints and varied paths. It compared 12488 band coefficients, retaining
5605 zeros, and tested 119229 polygon-valid triples across all three directions.
No failures. These are finite experiments, not proofs or source-correspondence
bridges. See evidence/markov-1c65a306/source-experiment.json and the saved scripts.
