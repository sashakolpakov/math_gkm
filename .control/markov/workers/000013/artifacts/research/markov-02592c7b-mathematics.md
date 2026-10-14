# First interior vertical row

Machine-authored research, request 02592c7b8f3c40b1a93a75e7a7278494.
The pinned Conjecture63 remains unresolved. This is not an independent audit.

Write b=aq+r with 0<=r<a. The candidate for a>=3 is

    [u] P_(a/b)(u,v) = v^(b-q) (1+v)^(a-3) Q_(a,r,q)(v),
    Q = 4 sum_(k=0)^(q-1) (ak+r)v^k
        + (3b-1)v^q + (a+b-1)v^(q+1).

The exact source recurrence matched this formula for all 561 fractions with
a>=3 and denominator<=45. The executable and full result are
research/vertical_formula_025.py and evidence/markov-02592c7b/vertical-formula.json.
This scan is not a universal source identity.

## Checked inequality component

MarkovVerticalRamp025 proves nonnegativity, interval support and CrossLC of
the zero-extended coefficient sequence, for every real a>=3, r>=0 and natural
q>=1. In particular the proof does not require a denominator bound or r<a.
The interior ramp gaps are 16a^2. The two terminal comparisons are proved
algebraically, with q=1 and the possible zero initial coefficient retained.

MarkovVerticalPoly025 identifies this sequence with the literal polynomial
coefficients, transports through arbitrary powers of (1+v) and monomial shifts,
and proves vertical_one_of_formula025. Its equality premise is explicit and
UNPROVED for general source paths. It must not be counted as an unconditional
first-interior vertical inequality. Numerators a=1,2 are also outside that
particular residual theorem.

## Source-specific bridge and proposed assembly

For a raw matrix M, let K(M)=(v+1)[u]M_11+[u]M_21. At u=0 each nonempty
word ending in B has M_21=M_22=0 and M_11=(v+1)M_12. The checked multiplication
identity is

    K(MN) = [u^0]N_11 K(M) + [u^0]M_11 K(N).

For the actual source matrix, tr(M)=(u+v+1)P and det(M)=u^a v^b.
When a>=2 its first determinant coefficient vanishes. The checked theorem
source_vertical_jet025 gives

    (v+1)^2 [u]P = K(M)-[u^0]M_11.

This is an unconditional exact source/raw bridge, not the candidate Q formula.

MarkovVerticalBlocks025 proves that every source path is either entirely left
steps, or its actual matrix is a word in two blocks A^n B and A^(n+1) B,
with both block types present. It follows by splitting at the first right
step and commuting block substitution with the actual Farey pair recursion.
The block list retains the source order. No claim that arbitrary block words
are source words is used.

The following assembly is a mathematical derivation still needing its final
Lean statement and proof. For a single block A^n B the explicit jet is

    [u]M_21 = v^(n+2) + 2v sum_(k=0)^n v^k,
    K(M) = 4 sum_(k=0)^n k v^k
           +3(n+1)v^(n+1)+(n+2)v^(n+2).

MarkovVerticalRun025 formalizes these identities; consult the validation
manifest for its actual acceptance status. Put q=n+1 for the two block types.
Define the linear-in-(a,b) expression

    H(a,b,q)=4 sum_(k<q)(b-aq+ak)v^k +3b v^q +(a+b)v^(q+1).

The short block has K=H(1,q,q); the long block has K=v H(1,q+1,q).
Their constant upper-left entries are respectively v^q(v+1) and
v^(q+1)(v+1). The cleared multiplication identity therefore propagates

    v^q(v+1) K(M) = [u^0]M_11 H(a,b,q).

Combining with the source jet and [u^0]M_11=v^b(v+1)^a gives

    v^q(v+1)^3 [u]P = v^b(v+1)^a (H-v^q(v+1)).

Since H-v^q(v+1)=Q, cancellation gives the candidate when a>=3.
The final formal assembly must identify block counts with a,b, identify
q=floor(b/a), justify every exponent/cancellation, and handle a=1,2 separately.
These obligations are not hidden assumptions in any accepted theorem.

## Source reading and limitations

The published [Evans–Veselov–Winn source](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was read through hosted retrieval. Sections 4–6 give special lines and special
families; Section 2's variable permutations do not immediately transfer rows
within the pinned [0,1] representatives. No external theorem was added as an
axiom. No historical novelty claim is made for the candidate formula.

The other vertical lines, general horizontal rows and remaining diagonal
slices still need universal inequalities. No combination of the work in this
request and the inherited partial results proves the full pinned root.
