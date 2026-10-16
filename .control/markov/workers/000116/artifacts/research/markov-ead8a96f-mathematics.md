# Universal second column and a third-column seed

Machine-authored live experimental research, request ead8a96ffc1e4391a573c70eab8b255a.
Full pinned Conjecture63 remains unresolved. No historical novelty claim.
Validation receipts and exact source hashes are in evidence/markov-ead8a96f/validation.json.

## Completed second-column result

`vertical_second_allMEA` in MarkovVerticalTwoAllMEA.lean proves, for every
finite source path and every natural j, the literal integer inequality

    coeff P 2 j * coeff P 2 (j+2) <= coeff P 2 (j+1)^2.

There is no denominator, run-length, path-length or coefficient-index bound.
Zeros remain present. The theorem applies beyond polygon-valid triples as well.
`vertical_first_threeMEA` combines this with the inherited columns i=0,1.

The new work supplies the previously missing source numerators a=2,3,4.
Write q=n+1, b=aq+r, 1<=r<a. The five small families have (a,r) equal to
(2,1), (3,1), (3,2), (4,1), (4,3). Reducedness excludes (4,2).
The q=1 cases use the inherited checked right-branch source theorem.
The q>=2 cases use exact sparse quotient blocks defined in MarkovSmallBlocksMEA.

For a=3,4 the checked source identity is

    (1-v)^4 * 2 [u^2]P = v^(b-2q-2) (J0+v^q J1+v^(2q) J2).

The blocks are proved by ring identities against the inherited sparse
numerator. The factor (1+v)^(5-a) is cancelled in the polynomial ring; no
log-concavity-preserving division rule is assumed.

For a=2 the two-letter trace contains an extra upper-left-product term.
`hsource_two_momentsMEA` proves the exact correction, and
`vertical_two_residualMEA` establishes

    2v R_2 = N(n,2,1,0;v)+2v.

The raw cleared identity becomes

    (1-v)^4 * 2v [u^2]P = J0+v^q J1+v^(2q) J2.

This proves the correction that the preceding worker had only tested finitely.

The coefficient adapters use the truncated integer cubic

    F(j,k)=(j-k+3)(j-k+2)(j-k+1) when k<=j, and 0 otherwise.

Convolution with the sparse blocks gives six times the coefficients of the
cleared polynomial, hence twelve times the original raw coefficients.
The factor is constant across each sequence; it is not a normalization of
individual coefficients. Negative indices and exterior zeros are retained.

The five MarkovSmallLC*MEA modules prove every adjacent gap for these integer
sequences. For q>=8, index chambers are parameterized by nonnegative integers;
each gap is an exact polynomial with nonnegative coefficients. The finitely
many run lengths 2<=q<=7 are checked over the entire proved support interval,
with exterior zeros proved separately. These are universal Lean proofs,
not an extrapolation from a scan. CrossLC is unnecessary for this direct raw
coefficient argument.

`root_iff_interiorMEA` proves Conjecture63 iff InteriorCore63MEA. This residual
is unproved. It retains horizontal rows j>=5, vertical columns i>=3, and the
inherited deeper diagonal region, with all original polygon guards and
endpoint handling. Completing a strip does not resolve the full target.

## Third-column source identity and remaining inequality

`vertical_third_general_momentMEA` proves the third-column residual identity
for every run n and predecessor source denominator at least four. Let
D,K,L be the checked first three cyclic local moments of the normalized
two-block alphabet, and h=1+v. Then

    6 R_3 = v^b (D^3+3DK+L-3h(D^2+K)+6h^2 D-6h^3).

The formal statement uses evaluation at every nonzero real v. The following
integral polynomial construction removes that restriction from the source
factorization. Let t=v^(n+2), and scale both normalized block matrices by t.
The resulting blocks are integral: the short block is v times the swapped
run block; the long block is the next swapped run block. Define D',K',L'
by the explicit scaled local expressions in MarkovThirdSeedMEA. The theorem
`vThirdSeed_normalizedMEA` proves D'=tD, K'=t^2K and L'=t^3L in the combined
seed expression

    N3 = D'^3+3D'K'+L'-3ht(D'^2+K')+6h^2t^2D'-6h^3t^3.

`vertical_third_all_run_factorMEA` proves the polynomial identity, for every
actual source decomposition with a>=7,

    6 [u^3]P = v^(b-3q-3) (1+v)^(a-7) N3.

Both exponents are justified. Polynomial evaluation, integer-to-real mapping
and cancellation are checked; no value v=0 or v=-1 is excluded from this
polynomial identity. `vThirdSeed_nonnegMEA` proves coefficient nonnegativity
for these actual source seeds. `vertical_third_of_seedMEA` gives the explicit
conditional CrossLC transport. Its CrossLC premise is NOT proved.

The seed depends on the predecessor only through the five checked Boolean
cyclic counts. The Python script uses length a and true count a-r, followed
by max(a-2r,0), min(r,max(2a-3r,0)), max(a-3r,0). The script's symbolic seed
has been compared finitely with the source; equality of its saved coefficient
tables with the Lean seed is not separately formalized.

## Experimental records

The small-family experiment covers 400 source fractions, 56,560 coefficient
identities, 55,760 all-index adjacent inequalities, 32,320 polygon-valid triples,
and 23,440 raw zero positions. No failure was found.

The third-column candidate experiment covers 1,656 fractions with a>=7,
216,408 coefficient comparisons, 40,572 seed adjacent inequalities,
51,684 polygon-valid raw triples, and 161,412 raw zeros. It checks interval
support in those finite seeds. No failure was found. This is not universal LC.

The additional third-sparse-candidate.json is explicitly an interpolation
candidate: (1-v)^6 N3 appears to split into four blocks delayed by 0,q,2q,3q,
of degrees 8,9,10,12 in v and degree at most three in q. Four training values
q=16..19 determine its table; 28 held-out run lengths checked 8,128 symbolic
coefficients without failure. This identity is NOT proved for every q.
Prove it from run-jet recurrences before using it as a formal coefficient
formula. Tool outcomes and interpolation are not mathematical closure.
