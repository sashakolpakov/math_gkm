# Third-column progress

Machine-authored request 762ebbaeac124186a32c169420cce484. Full pinned
Conjecture63 remains unresolved. Consult validation.json for separate
compilation, axiom and isolated kernel-replay receipts.

The final source theorem vertical_third_ge_fourM762 in
MarkovThirdGeFourM762.lean states that for every finite
path with middle label (a,b,P), a>=4, and every natural j,

    coeff P 3 j * coeff P 3 (j+2) <= coeff P 3 (j+1)^2.

There is no remainder, denominator, run-length or index restriction. It compares
raw integer coefficients and retains zeros. MarkovThirdLargeSourceM762.lean
connects the checked count inequalities to the actual recurrence polynomial.

For the final source cone, write T=(frame rest).mid.a and L=(frame rest).mid.b.
Reduced-label coverage gives x=L-T, y=3T-2L, L=3x+y, T=2x+y. The two
translated quadrants x>=1,y>=4 and x>=2,y>=1 cover all reduced labels with
L>=7 and 2L<=3T. The boundary 3T=2L is excluded by coprimality and L>=7.
The third-order count arguments become (L,T,x+y,x,y). Each chart proves all
the inherited run/index chambers. Together with the checked complementary
cone, vAllbounds_reducedM762 covers every reduced (T,L) with L>=7.

The count sequence is 120 times the exact seed coefficient. Positivity on its
interior support, nonnegativity everywhere and the adjacent inequalities feed
the inherited CrossLC proof; this does not discard zero coefficients. Forward
Pascal smoothing and monomial shifting then transfer the inequality to the raw
third column. No inverse-smoothing principle is used.

MarkovResidualGeFourM762.lean is the final exact-reduction module; its equivalence is

    Conjecture63 <-> InteriorCore63GeFourM762.

Its residual third-column cases have a<=3. Higher horizontal lines, other
vertical lines and deeper diagonals remain. The residual is unproved.

The small-source work starts from the inherited checked four-block quotient
identities for a=4,5,6 and every coprime remainder r. New coefficient adapters
express 720 times a literal raw coefficient as an integer zero-extended sum of
quintic falling-factorial terms. The chamber certificates compare these sums
directly, hence need neither positivity-to-CrossLC conversion nor deconvolution.
Finite initial-run exceptions are handled by exact source expansions. All eight small-family all-index assemblies and the combined a>=4 source theorem
compiled. Final axiom/replay status is recorded in validation.json.

The new remainder experiment checked 265 fractions, 155,353 exact coefficient
comparisons and 154,823 adjacent inequalities, retaining 125,006 zeros. A separate
small-family check covered 48 fractions, 8,440 coefficient comparisons and 8,344
adjacent inequalities, retaining 3,592 zeros. Both are finite experiments only.

Final validation: all 263 new mathematical modules passed compilation, permitted
axiom auditing and isolated kernel replay, including vertical_third_ge_fourM762
and root_iff_interiorGeFourM762. The residual remains unproved. The dependency
inventory records 1,911 reused compiled source modules; these were not freshly
rebuilt or replayed by this run. All statements remain partial research results,
with no independent English/source completion audit or root proof.
