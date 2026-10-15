# Fourth lower-slice backwards extraction

Machine-authored live request `94b1de05f66043aeb7a32e517aeb2a6f`.
The pinned `MathGKM.Markov.Conjecture63` remains unresolved. The final
source-bound validation inventory determines
which declarations passed local compilation and kernel replay.

For an actual predecessor `rest`, put c=(frame rest).mid.b and
r=(frame rest).mid.a. The run source is `replicate n true ++ false :: rest`.
Its labels are a=nc+r and b=a+c. The fourth lower slice is i+j=a+4.
All new source statements require c>=5 and retain raw integer coefficients.

The accepted inherited identity has the form

    (1-X)^8 P = H0 + X^n H1 + X^(2n) H2 + X^(3n) H3 + X^(4n) H4,

where P is 24 times the actual cut polynomial and H4 includes the actual
natural-count correction. The lower four degrees are bounded by 12,12,13,14;
the corrected H4 has degree at most 15.

The stable-tail proof has been generalized: if H4=(1-X)^8 R+L with deg L<=7,
the error numerator has degree at most 4n+k+7 whenever n+k>=7. Division by
the nonzero degree-eight factor forces the error coefficient at 4n+k to
vanish. The six inherited chamber identities and inequalities therefore give
`source_fourth_tailM94` for n+k>=7 and k<=5, including additional short-run
positions. No positivity or nonzero-coefficient hypothesis is added.

The new backwards extraction lemma is more general. If

    (1-X)^8 P = L + X^m H,
    deg L <= j+7, deg H <= 15, j <= m+7,

then deg P<=m+7. Reflect the identity at degree m+15 and P at degree m+7.
The even factor (1-X)^8 is invariant under reflection at degree eight.
The reflected L has zero coefficients through m+7-j. Thus P.coeff j is
exactly the coefficient at m+7-j of (reflect 15 H)/(1-X)^8, expressed as
a finite binomial convolution. The case P=0 is included explicitly.
`backward_coeffM94` and `source_fourth_backwardM94` establish this formally,
the latter for every 3n+7<=j<=4n+7 in the actual source family.

For the third block put j=3n+k, e=n-k. In each of six strict Farey chambers,
the backwards convolution simplifies to a polynomial in c,r,e, independent
of n separately. A common scale 7560 clears the binomial denominators.
The three values use e,e-1,e-2 with the same scale. The six explicit shapes
match the earlier symbolic third-block candidates exactly. Their adjacent
gaps have nonnegative coefficients in the nonnegative Farey coordinates
and e. All six algebraic certificates compiled after staging by the offset variable.
The stage keeps the identically zero degree-13 and degree-14 gap columns as
explicit checked identities. All six source adapters also compiled. The general block theorem covers
j=3n+k with 7<=k<=n, c>=5, without polygon or positivity assumptions.

The finite backwards experiment checked 360 cases, 3150 coefficient
identities, 2430 polygon-valid triples and 38 literal recurrence coefficients;
all passed. These computations are not universal proofs. The precise input
list is in `evidence/markov-94b1de05/backward-experiments.json`.

The middle fourth-slice interval, small predecessor cycles c=2,3,4,
higher diagonals, and both axial interiors remain root obligations.
Even a complete fourth slice would not resolve Conjecture63.

## Assembled source result

source_fourth_finalM94 has compiled. For every actual predecessor c>=5 and
every natural run n, it proves the raw fourth-slice inequality at every
starting j with 3n+7<=j<=4n+5 and i+j+2=a+4. There is no upper bound on
n,c,r or the predecessor path. This joins the third block to the strengthened
stable tail, including its valid shorter-run positions.

The variable-degree backward_coeff_generalM94 also compiled: if deg H<=s+8
and deg L<=j+7 in (1-X)^8 P=L+X^m H, with j<=m+s, it identifies P.coeff j
with the reflected-H binomial convolution at m+s-j. This is a prospective
interface for the two highest numerator blocks, not an inequality theorem.

The strengthened-tail experiment additionally checked 2140 cases, 11688
coefficient identities (3015 zeros), 5169 polygon-valid triples and 3480
literal recurrence coefficients. All passed; see experiments.json for the
exact finite inputs. Combined with the backwards experiment this is 14838
coefficient checks, 7599 polygon-valid triples and 3518 literal recurrence
comparisons. These totals count checks, not distinct universal instances.

## Exact residuals

root_iff_coreM94 proves Conjecture63 <-> InteriorCore63M94. The predicate
preserves the inherited axial obligations and all remaining diagonal cases,
removing only the proved initial and final fourth-slice regions. It is not
proved. run_fourth_iff_middleM94 separately proves that, for n>=4 and actual
c>=5, all polygon-valid fourth-slice triples are equivalent to those with
2n<j<3n+7. This uses the checked prefix and final interval and the inherited
polygon bound j<=4n+5. It does not omit any middle cases or remove zeros.

All mathematical compilation attempts are source-bound in the validation
inventory. The final replay and axiom results are appended below when complete.

## Final local validation

All 35 mathematical modules compiled and passed union kernel replay over the
inherited import boundary. All 260 audited theorem closures use only propext,
Classical.choice and Quot.sound. Nine rejected build attempts are retained,
including two bounded compilation timeouts. No rejected module is imported.
The protected root hash is unchanged. No fresh whole-source rebuild or
independent source/English completion audit occurred. All foreground executions
completed. Full Conjecture63 remains unresolved and completion is null.
