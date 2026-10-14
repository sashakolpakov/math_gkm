# Type aggregation and an exact Pell deformation

Machine-authored request a3c53fa7bcea4aaf80795a13558baa99. The full pinned
Conjecture63 remains unresolved. No historical novelty claim is made.

The preceding worker ruled out an injection preserving each decorated-edge
overlay. This run tested a coarser invariant: only the total number of deleted
C-sites across the two paths. Put weight t on each C-site's extra constant
edge, keeping every A-site's weight equal to one. The positive matrices are

    A = [[v,1],[uv,u+1]],   C_t = [[v+t,1],[uv,u]].

The scalar functional is (v,1) M (1,u)^T. In the Pell family its core is
(AC_t)^(a-1) A. At t=1 this is the literal source a/(a+1).

## Exact finite experiment

type_refinement_a3c5.py computes the coefficient polynomial in t at each
raw (i,j). Its specialization at t=1 is checked against the unrefined positive
recurrence. Over every reduced interior source with denominator at most 31,
377,267 triples were tested. There were 92 vertical and 16 diagonal triples
with at least one negative coefficient in the gap polynomial, and no horizontal
failures. This is finite evidence, not a universal horizontal theorem.

The first vertical failure is source 10/11 at (10,0),(10,1),(10,2):

    1, 20+9t, 270+288t+84t^2;
    middle^2-low*high = 130+72t-3t^2.

At t=1 its raw coefficients are 1,29,642 and its gap is 199. The negative
coefficient therefore rules out type-count-preserving pair comparisons, not
the actual unweighted source inequality. The first diagonal negative example
occurs at source 11/21 and is retained in type-refinement.json. Its unweighted
gap is likewise positive. Neither witness is a root refutation.

The short arbitrary-word scan was exploratory confirmation of an inherited
obstruction. It stops at length 12 and sees horizontal and vertical failures;
earlier evidence already contains diagonal failures at larger length. Its
lack of a diagonal failure is not evidence for a universal arbitrary-word claim.

## Universal checked identities

Define P_0(t)=1, P_1(t)=(u+v)^2+u and

    P_(a+2)(t) = ((u+v)^2+u+t v) P_(a+1)(t) - t u v P_a(t).

MarkovTypeMatrixA3c5 proves that P_a(t) is the matrix scalar above
for every integer t and every a>=1; its entries are nonnegative for t>=0. The proof is a direct two-by-two
Cayley-Hamilton identity and two-step induction. MarkovDeformedSourceA3c5
proves P_(n+1)(1) equals the protected source polynomial on n right steps.

Under u=x,v=xy, write P_a(x,xy;t)=x^a R_a(x,y;t). This identity and the exact
coefficient shear are proved. R_0=1, R_1=1+x(1+y)^2, and

    R_(a+2)=(1+t y+x(1+y)^2)R_(a+1)-t y R_a.

The first two x-coefficients through y-degree two are established by a
simultaneous jet invariant, with base cases a=3,4 and a two-step induction.
In particular, for every a>=3 and integer t, the raw moving triple is

    [u^a v^0]P_a=1,
    [u^a v^1]P_a=2a+(a-1)t,
    2[u^a v^2]P_a=6a(a-1)+8(a-1)(a-2)t+3(a-2)(a-3)t^2.

The factor two clears an integer formula; it is removed from the final
inequality. This is not factorial normalization. All indices and zero
coefficients in the identities retain their literal ordinary-polynomial meaning.

## Exact threshold and actual source specialization

For a=n+3, twice the gap is

    G(n,t)=(2-t^2)n^2+(18+16t+5t^2)n+36+32t+8t^2.

MarkovDeformationThresholdA3c5 proves, for real t>=0,

    (for every natural n, G(n,t)>=0) iff t^2<=2.

In the forward obstruction, a natural n is obtained above an explicit real
bound; this is an unbounded theorem, not a finite scan. The real theorem is
about the displayed gap polynomial. The formal matrix/coefficients interface
in this run uses integer t; no additional formal real-weight transport is
claimed. This distinction does not affect the exact integer cases t=1,2.

At t=2, a=n+40, twice the gap is -2n^2-78n-16. Thus every such weighted
matrix violates this vertical inequality. At the actual source weight t=1,
a=n+3, twice the gap is n^2+39n+76, strictly positive. The three actual
positions have checked polygon membership. The source result concerns one
moving vertical triple in the Pell family; it proves no whole-direction or
all-rational inequality. Existing related unweighted partial results remain
inherited, and no novelty is asserted for that specialization.

## Validation and next mathematical use

Final source hashes, builds and kernel replays are recorded in validation.json.
Rejected drafts and diagnostic output remain in run records. Only successful
final builds and replays count as accepted local evidence. Inherited compiled
imports were reused; this is not a fresh whole-source rebuild or independent
English/source audit. The unchanged full root still has no closed proof.

The horizontal type-refined inequality is a concrete unproved candidate
remaining after this test. A useful next investigation would identify whether
the no-consecutive-C restriction suffices for that direction, or locate a
source-family failure of the stronger refinement. Vertical/diagonal proofs
must allow compensation between type-count classes as well as overlay classes.

Live source consulted: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html
Hosted searches did not provide an external theorem used in the proofs.
