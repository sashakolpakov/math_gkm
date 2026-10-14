# Source correspondence and scope, worker 16cb07ce

Machine-authored research audit, not an independent completion audit.
The exact pinned MathGKM.Markov.Conjecture63 remains unchanged and unresolved.
Validation receipts and rejected attempts live in evidence/markov-16cb07ce/.

## Established representations (consult final validation manifest)

Write d=a+b-1, s=u+v. The explicit recurrence starts with quotient seeds
1, 1+u*t, 1, and mutates by

    qnew=(1+s*t) qfixed qmid-u^a v^b t^(a+b) qopposite.

MarkovQuotient16cb proves over every commutative ring, for every finite path,

    P(u,v,s^2*t)=s^d q(u,v,t).

The numerator P is the inherited literal homogeneous source numerator. Both
source orientations and all three initial seeds are used; no division or
nonzero assumption is used in this identity.

MarkovDiagonal16cb identifies the coefficient of x^i in [w^r]P(x,1,w)
with A_(i,d-i-r) when i+r<=d, and with zero otherwise. This is an equality
of raw integer coefficients, retaining every zero. In particular every
constant-i+j target triple has its literal slice counterpart. The proof
uses homogeneous support to eliminate all but one coefficient in evaluation
at v=1; it does not confuse evaluation with extraction.

The new matrix construction uses

    A=[[1,1],[u,u+v]], B=[[1+v,1],[u,u]].

Start with endpoint pair A,B, let its middle be AB, and refine the pair to
(A,AB) or (AB,B). In a valid pair X,Y, determinants are the corresponding
u^a v^b, and tr(X), tr(Y), tr(XY) are (1+u+v) times their upper-right entries.
Cayley--Hamilton gives the exact two quotient mutations. The upper-right
entry therefore equals q(u,v,1) on every source path. All matrix entries
have nonnegative integer coefficients, so their products do as well.
The matrix and positivity modules compiled with permitted printed axiom closures.
All five new modules also passed kernel replay. The final manifest
evidence/markov-16cb07ce/validation-1791935811197121000.json records these results,
their exact source hashes, rejected attempts, and inherited compiled imports.

This is positivity of the full blowup quotient, not yet all prescribed
one-variable residuals. For 2r<=d the homogeneous degree-r part is the
prescribed residual. For 2r>d it instead contains the extra factor
(u+v)^(2r-d); removing a positive factor need not preserve positivity or LC.
No deconvolution implication is assumed. MarkovScaling16cb proves the exact
identity q(u,v,t)=q(u*t,v*t,1) in every commutative ring. A coefficient-level
slice adapter for the positive quotient remains separate from this scaling
identity and from the raw-slice adapter proved here.

## Required obligations

* Coverage: all results quantify over arbitrary finite paths. Inherited
  rational coverage and uniqueness remain available, with no denominator bound.
* Source family: the source numerator and seeds/recurrence are used directly.
  Matrix words are restricted to the actual paired Farey refinements. Arbitrary
  words in experiments are an enlarged family and cannot refute the root.
* Homogeneity and coefficients: inherited degree/homogeneous reconstruction
  and the new raw-slice equality preserve ordinary integer coefficients.
  The blowup changes representation; its coefficients are not silently
  substituted for the raw coefficients in the target.
* Polygon: no full lower support or Newton-polygon equality is newly proved.
  This remains a formal correspondence obligation.
* Directions, zeros, endpoints: the raw adapter concerns the constant-i+j
  direction only, including zeros and out-of-range zeros. Quotient positivity
  is not a horizontal, vertical, or diagonal root inequality. Endpoint seeds
  are retained; inherited endpoint LC theorems remain applicable.
* Assumptions: pinned Lean/Mathlib only, permitted axiom closures only. These
  are local builds/replays against inherited compiled project imports, not
  a full fresh source rebuild or independent hash-bound completion audit.
* Proof scope: no theorem of Conjecture63 or its negation is supplied. The
  universal LC inequalities, gaps/CrossLC transport, and polygon correspondence
  remain open. Completion must be null.

## Experiments and literature

The quotient recurrence was scanned at 489 reduced fractions with b<=40:
no negative coefficient or adjacent LC failure in any of three array directions.
This is finite integer computation only. It does not identify adjacent LC
with CrossLC when internal zeros are possible.

The enlarged word scan found ten failing words among 1022 words of lengths
1 through 9. AAAAABAB has vertical quotient coefficients [10,6,4], giving
36<40. No negative quotient coefficient was found in this finite scan.
The failure blocks unrestricted-word LC preservation; it is not a Markov
counterexample and no actual source path is claimed for that word.
An additional independent positive-matrix evaluation reproduced all ten word
obstructions and matched all 489 source quotient recurrences; see
evidence/markov-16cb07ce/positive-words.json.

Live primary sources consulted:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html
https://arxiv.org/html/2604.18333v1
The second paper treats saturation using snake-graph matchings. It was not
used as an axiom or as a proof of coefficient log-concavity. The new matrix
change of basis and quotient proofs are this worker's deductions; no claim
of historical novelty is made.
