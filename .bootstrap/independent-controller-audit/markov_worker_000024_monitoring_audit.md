# Independent monitoring audit: worker 000024

Request `28b112de527c4d3ea1fa665cec2dc394`. Read-only review of
`/Users/sasha/math_gkm/.control/markov/workers/000024/artifacts`.
No project edits, mathematical guidance or proposer contact. Active worker
000025 was left undisturbed.

## Finding

The universal source palindrome and weighted-square identities have the stated
raw polynomial meaning. The lower-support characterization really proves source
membership for the specified reduced A--core--B words; membership or LC is not
smuggled into its support premise. The resulting root equivalence retains the
full three-direction raw coefficient target, zeros and inherited endpoint
clauses. No substantive English/Lean mismatch or circular hypothesis was found.

These are structural identities and an exact reformulation, not a new LC proof.
Neither side of the root equivalence is established. The full conjecture remains
unresolved, and no historical novelty claim is made in this audit.

## Canonical palindrome and exact weighted squares

`sourceWord28` is defined from the actual Farey pair recursion. The checked
substitution law proves that it is exactly A--central--B, where `central28 path`
is palindromic for every source path. After the checked B-to-AC expansion,
`gasCore28 path` is also palindromic and has the exact raw source identity

    P = gasScalar80(u,v,1,gasCore28(path)).

This is not an assertion that an arbitrary palindrome or a word with merely
matching counts represents the source.

The general boundary quadratic is exactly

    v*x^2*M.a + u*v*x*y*M.b + x*y*M.c + u*y^2*M.d.

The sandwich, empty-word and singleton identities hold over arbitrary
commutative rings. At t=1, their recursive boundary updates preserve
coefficientwise nonnegativity in the integer bivariate polynomial ring.
`source_positive_squares28` therefore states that every actual source raw
numerator admits f,g∈ℤ[u,v], both coefficientwise nonnegative, with one of

    P = v*f^2 + u*g^2,
    P = f^2 + u*g^2,
    P = f^2 + v*g^2.

The representation is for P itself, with the exact displayed weights and no
normalization or scaling factor. Nonnegative coefficients, rather than strict
positivity or LC of f and g, are the formal requirements. No closure of LC under
squaring or addition is asserted. The reported failed LC triple in a half factor
is finite experimental evidence only; none of the Lean statements reviewed here
formalizes it as a source counterexample or assumes its validity.

## Lower-support premise and exact prefix constraints

The new definition is literally

    WordLower28(a,b,w) :=
      forall natural i,j,
        0 < coeff(rawWord80(w).b,i,j) -> a*b <= b*i+a*j.

It contains no source-membership condition, no LC predicate and no hidden
upper-degree condition. The fixed raw generators have coefficientwise
nonnegative entries, as proved for arbitrary word products, so positive support
is the appropriate nonzero support here.

For an arbitrary split x--r--y, the word-witness module proves strictly positive
raw coefficients at the exponent pair

    (count_B(y), length(x)+indicator(r=B)).

For A--x--r--y--B it separately proves positivity at

    (count_B(x)+1, length(y)+2).

These are exact coefficient-convolution results for the actual generators. They
do not rely on minimum-weight experiments or a no-cancellation assumption that
has not been checked.

Assume the A--core--B word has exactly a B letters and total length b, with
0<a<b and gcd(a,b)=1, and satisfies WordLower28. For k=count_B(x) and
l=length(x)+1, the two positive monomials force

    b*k <= a*l <= b*(k+1).

Coprimality and 0<l<b rule out equality at the upper bound. Hence k=floor(a*l/b).
The strict inequalities on l are proved from the actual word decomposition.
This is where the reduced-count hypothesis is used; it is not omitted or
silently generalized to noncoprime words.

`supported_take_floor28` applies the floor formula to every proper core prefix.
`supported_core_unique28` compares all prefix B-counts, using exact full length
and total count for the remaining prefixes, then proves equality of the Boolean
words. Empty cores are covered by the same length/count argument and do not
require a nonexistent proper-prefix witness.

Finally, `supported_word_is_source28` invokes the previously proved rational
coverage theorem for the positive coprime labels. The resulting actual source
has the same exact counts and satisfies lower support by the independently
proved source polygon-support theorem. Core uniqueness therefore identifies the
candidate word with this source's actual word. The conclusion includes the
source labels and the literal equality P=rawWord80(candidate).b.

Thus support is proved to force membership within this precise family; it is
not assumed to mean membership. The claim requires the exact two raw generators,
A/B endpoints, count equalities and coprimality. It does not say that arbitrary
polynomials with polygon containment, or arbitrary palindromes, are sources.

## Full-root equivalence

`SupportedWordGoal28` quantifies over every natural a,b and Boolean core w with
the stated positive reduced labels, exact A--core--B counts/length and WordLower28.
Its conclusion is `GlobalLC18` for the literal upper-right raw word polynomial.

The forward implication of `root_iff_supported_words28` identifies each such
word with an actual source, then uses the checked equivalence between guarded
source LC and global zero-extended raw LC. The reverse implication constructs
each source's canonical word, supplies its independently known support/count
properties, and invokes the inherited exact matrix-root equivalence.

`GlobalLC18` retains all horizontal, vertical and (1,-1) adjacent inequalities
at all natural indices. No positivity filter removes zeros. The root's separate
0/1 and 1/1 endpoint clauses remain handled by the inherited vacuous endpoint
proofs, rather than being dropped from the equivalence. Neither implication
assumes LC of the source word in the characterization theorem, and neither
establishes the unproved SupportedWordGoal28 by itself.

## Recorded verification inspected

Manifest: `evidence/markov-28b112de/validation.json`.
The six final source hashes match that manifest, the archived host change hashes
and live source bytes at audit time:

| Module | SHA-256 |
|---|---|
| MarkovPalindrome28b1 | d110c5a1bae5c7457cea27ba844ec34f587b4df13a1666ea5a727fe9987ea2e8 |
| MarkovSquares28b1 | 7e0f27376d06eeffb047335c429900161bfda2921bd8297ecebb5790c11bf4a0 |
| MarkovWordWitness28b1 | ab34b1e14dfd7f1455a2e357d28850b6afac28890fa91247599b407ac562a410 |
| MarkovPolygonWord28b1 | a8c4a4bccdaad70a22d77daa0cf73824c19aed99b9e7a42bd2d9aa5fff7803ad |
| MarkovWordRigidity28b1 | 7604f2d48d7cf07009ef6db3a339d927b432f77b8ad3c6ed24db74d3f40026b1 |
| MarkovSupportedGoal28b1 | 92bcf5df4f69003ebf41d1a619b0ba99b6090005e1a61cf290a96edf25d60697 |

All six compilations and six `leanchecker` replays have return code 0 and matching
source hashes. All twelve receipt byte hashes match the archived host record.
Eleven printed closures contain only subsets of `propext`, `Classical.choice`
and `Quot.sound`. Five rejected elaborations remain separately recorded with
return code 1; there are no recorded timeouts in this manifest. Listed
project-local import binary hashes matched; the external shared Mathlib
palindrome dependency was not independently rehashed in this monitoring check.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The host reports completion after 1182.74 seconds, mathematical resolution false
and no completion certificate.

This audit inspected source meaning and matching recorded named-module checks
with inherited compiled imports. It did not run a fresh independent full-source
rebuild. No discrepancy requiring one was found.
