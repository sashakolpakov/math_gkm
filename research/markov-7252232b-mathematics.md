# Positive support and failed stronger inequalities

Machine-authored request 7252232b; full Conjecture63 remains open.

For an arbitrary Boolean core word w, put f_empty=g_empty=1. Prepending a
letter replaces (f,g) by (h+f,h) for true, and (h,h+g) for false, where
h=v*f+u*g. These polynomials are exactly the two components of the inherited
gas matrix product applied to the terminal column (1,u). The scalar partition
function is h. This is an exact positive recurrence, not a change of raw
coefficient normalization.

At word length n, both f and g have a positive coefficient at every degree-n
monomial. Moreover, a positive coefficient at (i,j) stays positive at every
(k,l) with k>=i, l>=j and k+l<=n. The induction uses positivity of sums and
shifts. Adding the lower-degree f or g is safe at degrees <=n by induction;
at degree n+1 positivity comes from the full top of h. The proof does not
assume that sums preserve log-concavity.

MarkovSupport725 proves these assertions and connects h to every exact source
numerator through source_gas80, with n+1=a+b-1. Hence every source coefficient
propagates northeast to the top degree. MarkovIntervals725 combines this with
the checked outside-polygon-zero theorem: every horizontal and vertical row
has interval positive support, including its zero extension to integers.
Consequently adjacent raw LC and CrossLC are equivalent for these two source
directions, with no additional no-gap hypothesis. Neither LC side is proved
by this equivalence.

## Quotient slices and the residual audit

The inherited rowStep774, with x the inner variable and t the outer variable,
has the same positive recurrence with h=f+x*t*g and an added t*f or t*g.
MarkovResidualSupport725 proves simultaneously that each row r has positive
support extending from any positive coefficient to index r, that the outer
degree is bounded by the word length, and that every diagonal coefficient
(r,r) within that length is positive. A separate wedge invariant proves
coefficients vanish when the inner index exceeds the outer index.

The exact source_word774 bridge identifies these polynomials with the actual
quotientSlice774, retaining letter order. Thus every quotient slice has
interval positive support. Its top coefficient at index r is positive for
r<b, and the whole slice is zero for r>=b. No finite path or denominator
bound enters this proof. The conditional upper-raw transfer now requires only
the adjacent residual LC inequalities, with the former interval-support
premise discharged. This addresses the specific zero-gap issue in the
independent residual audit. It does not prove those residual inequalities,
and cancellation in the lower-half factorization still gives no LC theorem.

Finite exact probes rejected two possible stronger inequalities. Coefficientwise
LC in the remaining variable fails at the actual word ABB (2/3). Factorial-
weighted horizontal LC fails at source 21/22, at j=24, i=0,1,2, where the raw
coefficients are 190,13965,514845. The reversed stronger inequality is
13965^2 < 2*190*514845; the raw inequality 190*514845 <= 13965^2 holds.
MarkovFactorialObstruction725 separately proves the exact 21/22 coefficients,
all three polygon memberships, the reversed factorial-weighted inequality,
and the valid raw inequality. This is a strategy obstruction, not a root
refutation. The other probes remain finite experimental evidence only.
