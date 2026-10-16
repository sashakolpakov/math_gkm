# Corrected short-cycle third columns

Machine-authored request f8ca2c8b49254c66801ae80a511a68c4. Compilation/replay status is recorded in evidence/markov-f8ca2c8b/validation.json; this narrative is not an independent admission receipt. The full pinned conjecture remains unresolved.

Write q=n+1. A path with numerator a=3 has the form false^n ++ [true,r], with r=true giving b=3q+1 and r=false giving b=3q+2. The generic cubic trace formula for longer words misses the all-top-state cycle of a three-letter product. For a projection-shaped Boolean matrix family g its additional cubic contribution is

    6 a₁(false) a₁(r) a₁(true).

After the actual source scaling by x^b this product is 1. Thus the cubic residual identity gains +6. Set s=2 when r=true and s=1 when r=false. The corrected integral identity is

    (1+X)^4 · 6 X^s [U³]P = N₃(n,[r]) + 6 X^s.

Here N₃ is the inherited integral seed vThirdSeedMEA, not an independently postulated coefficient array. Multiplication by (1−X)^6 and exact polynomial division by (1+X)^4 yields four sparse blocks J₀+X^q J₁+X^(2q) J₂+X^(3q) J₃. The correction changes J₀ before division. All identities are checked in the source modules, including n=0.

For a=2 the only reduced remainder is b=2q+1 and the path is false^n ++ [true]. A direct integral calculation uses the product of the two actual run matrices, avoiding the invalid long-cycle formula. Let F_n be the first coefficient of their b-entry and D_n the second coefficient of their d-entry. The new run identity is

    (1−X)² D_n = (1+X)² [q−(q+1)X+X^(q+1)].

Define

    C_n = X^(q+2)(D_n+D_(n+1)−X−1) − X² F_(n+1)² − X³ F_n².

The corrected source identity is

    (1+X)^5 · 6 X^(q+2) [U³]P = N₃(n,[]) + 6 C_n.

The coefficient identities follow directly from the source trace relation through degree three. The cleared correction uses the checked closed forms of D and F, and again gives four sparse blocks. The Boolean triple count at the two-letter word is (2,1,0,1,0), including the cyclic distance-two count 1. A rejected candidate used 0 at that position; the corrected ring identity is retained with its successful receipt. This correction does not change the pinned source family.

For all three families, inversion of (1−X)^6 gives an exact coefficient expression E(q,j) in falling factorials with threshold guards. It is 120 times the coefficient of the uniformly scaled polynomial 6 X^s [U³]P. Thus it equals 720 times the raw coefficient at the shifted index. The candidate all-integer adjacent inequalities for E are split into finitely many symbolic index regions and the finitely many q=1,2,3,4 cases; q is universally quantified beyond those base cases. Leading, internal and trailing zeros are retained. Cancelling the common positive factor 720² yields the raw integer inequality without normalization.

The compiled assembly exhausts a=1 using the inherited source-one result, a=2 and a=3 using the corrected formulas, and a≥4 using vertical_third_ge_fourM762. Its exact all-path declaration is vertical_third_allMF8. The compiled residual equivalence root_iff_interiorMF8 removes only i=3 from the vertical residual and retains every other condition. Neither that residual nor the root is proved.

Finite experiments compare 201 fractions (q=1 through 64, then 97,129,257, in each family), 22,715 coefficient values and 22,313 raw adjacent inequalities, retaining 2,010 zeros. They have no role as assumptions in the Lean proofs. Evidence: evidence/markov-f8ca2c8b/experiments.json.
