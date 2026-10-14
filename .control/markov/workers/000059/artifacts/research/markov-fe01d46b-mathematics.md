# Exact cut enumeration and coefficient inequalities for individual terms

Machine-authored live research request fe01d46b39b940a4b22745b021f8d61c.
The full pinned Conjecture63 remains unresolved. No novelty claim. Final
compilation/replay status is in evidence/markov-fe01d46b/validation.json.

## Universal decomposition

The inherited A27 work already proves the positive cut recursion, explicit
gap weights, and the source coefficient bridge. Those results are reused,
not claimed as new. The new cutMasksFe01 explicitly enumerates masks with
exactly s selected sites. Its checked properties are: no duplicates; every
mask has the original word as its first components and s true second
components; its length is choose(length(w),s); and the sum of maskWeight340
is precisely cutCoeffA27. Multiplicity of equal *polynomial weights* is
retained even though their distinct masks occur once.

For every actual path with label a/b, put c=central28(path). The list
sourceTermsFe01(path,s) consists of these mask polynomials on c followed by B.
It contains exactly choose(b-1,s) terms, with no finite bound on the path,
denominator or s. For natural i,j,s with i+j=a+s, the proved identity is

    A(i,j) = coefficient_j(sum(sourceTermsFe01(path,s))).

The left side is the original integer coefficient, cast to the reals by a
checked ring map. This is an equality, not a coefficient normalization.
The source theorem is stated on actual natural indices; no negative-index
interpretation is silently supplied. The inherited support theorem handles
positions below i+j=a when needed.

## Every individual term is log-concave

Define the upper triangular Toeplitz entry T_p(a,b) to be coefficient_(b-a)
of p if a<=b, and zero otherwise. PolyPF2Fe01 says every ordered two-by-two
minor of this matrix is nonnegative. The new convolution proof is finite:

    (sum a_i c_i)(sum b_i d_i) - (sum a_i d_i)(sum b_i c_i)
      = sum_(i<j) (a_i b_j-a_j b_i)(c_i d_j-c_j d_i).

The coefficient multiplication identity is separately connected to finite
Toeplitz matrix multiplication. Consequently PolyPF2Fe01 is preserved by
ordinary polynomial multiplication. Its adjacent minor is exactly the raw
coefficient inequality p_k p_(k+2)<=p_(k+1)^2. No division, convergence,
external theorem or coefficient positivity premise is hidden in this step.

The inherited gap weights have coefficient lists [1,2,...,2] and
[1,2,...,2,1]. Both Toeplitz minor conditions are now proved for every run
length, including zero. A reverse-word induction classifies every skipped
gap into these two forms. A selected site additionally contributes either
1 or 1+y. Induction over the mask therefore proves PolyPF2Fe01 for *every*
individual mask, even before restricting to source words. Thus all actual
source terms are log-concave at all natural coefficient indices, zeros
included. The separate positive-term module establishes coefficientwise
nonnegativity, constant coefficient one, and positivity at every smaller
index whenever a later coefficient is positive; consult its validation status.

This does not prove that the sum is log-concave. Horizontal comparisons also
change the number of cuts, and vertical comparisons change both the number
of cuts and the y exponent. The root still requires all three directions.

## Two precise aggregation obstructions

At actual source 3/4, path [true,true], with s=1, the masks selecting only
the first or only the last site have weights

    p=(1+y)^2,  q=(1+y)^2(1+y+y^2).

At middle index 3 their mixed gap is
2 p_3 q_3-p_2 q_4-q_2 p_4=-1. Both masks' source membership, their polynomial
identities and this exact gap are checked. The complete source slice is
3+8y+8y^2+4y^3+y^4; its corresponding raw triple is [8,4,1], with positive
gap 8 and all three original polygon guards checked. Pairwise summand
synchronization is therefore unavailable even on actual source terms.

A further finite experiment tests whether the sum of the individual gaps
alone can pay for every negative mixed gap after discarding the positive
mixed gaps. It fails at source 5/6, s=1, middle y index 3: the individual
gaps total 10, negative mixed mass is 13, positive mixed mass is 19, and the
full gap is 16. This second budget computation is experimental only.

The new guarded palindrome example strengthens the scope distinction of
earlier auxiliary-word obstructions. The central word

    B A B B B B B B B A B

is a palindrome with nine B letters and length eleven, so its virtual label
is reduced 10/13. Its s=1 cut polynomial is

    12+29y+28y^2+20y^3+16y^4+12y^5+8y^6+4y^7.

The raw diagonal positions (9,2),(8,3),(7,4) all lie in InPolygon(10,13)
and have coefficients [28,20,16], with gap -48. Lean proves the raw-word
coefficient bridge, the expansion, the polygon guards and coprimality.
It also proves that this central word is not central28(path) for *any*
source path, using the inherited exact mechanical-word identity. Therefore
palindromicity, reduced counts and polygon guards do not suffice for the
enlarged-family statement. This is emphatically not a source counterexample.

A final source-polynomial check uses the actual path [R,R,R,L,L] at 10/13.
Its corresponding cut slice is 12+29y+28y^2+16y^3+4y^4, so its middle raw
coefficient at (8,3) is 16, whereas the auxiliary polynomial has 20 there.
MarkovGuardedSourceFe01 checks this difference and excludes equality with
the polynomial of any source path labeled 10/13. Its final validation status
is recorded separately from the earlier word-level exclusion.

## Actual experiments and literature

cut-experiment.json records 71 sources of denominator at most 15, 252442
exact mask identities and 2353612 adjacent term tests with no failure.
The pairwise mixed failure above was found after 19 synchronization tests.
Separate palindrome experiments distinguish the unrestricted and coprime
virtual families; they are never counted as source scans. All arithmetic
in these experiments is integer arithmetic, but finite tests are not proofs.

Hosted searches reread the [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
and explored matching/fence and log-concavity literature. No retrieved theorem
is used as an axiom or premise, and no literature completeness is claimed.
The finite determinant proof is constructed and checked in Lean here.

All successful local builds reuse pinned inherited compiled imports. Their
separate direct kernel replays are tracked by source hash. This is not a
fresh whole-source rebuild or independent source/English completion audit.

Final validation: all eight new modules compiled and completed separate direct kernel replay. All printed axiom closures contain only permitted axioms. Seven rejected elaboration attempts are retained. No foreground task remains. Completion is null.
