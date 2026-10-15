# Revisable next actions

The exact pinned root remains open. Use final validation.json to distinguish
accepted proof modules from excluded drafts and interrupted attempts.

The initial fourth-slice coefficient bridge now extends through j=n+1.
`source_fourth_initial_allF2` proves every triple starting at j<n, retaining
raw zeros, for predecessor denominator at least five. The first shifted
coefficient at j=n+2 has a compact, source-connected correction:

    24 A_(a+4-j,j) = initial_convolution(j) + 16(c-r)K(K-1)(K-2),
    K = nc+r+c-2n-5,  j=n+2.

The validated `source_fourth_first_shiftF2` proves the
triple starting at j=n for n>=5. The corresponding exact remaining predicate
is `InteriorCore63NextF2`. It is not proved merely by its equivalence to the root.

Useful next choices include:

* Handle n=4 at the first shifted triple using lowCoeff4F2, lowCoeff5F2,
  lowCoeff6F2 and the correction above; the universal shape identity is only
  proved for indices at least five, so do not use it at index four.
* Extend the compact initial formula to predecessor cycles c=2,3,4. The
  finite experiment agrees there, but the source theorem still assumes c>=5.
  Existing determinant corrections have explicit X^b support; cyclic closure
  and all exceptional terms must be proved before transporting inequalities.
* Investigate an entire shifted block, rather than adding positions one by
  one. The cubic-zero local method and separate-variable divisibility give
  exact onset formulas; higher truncations may expose a uniform pattern.
  The six inherited full numerator chambers are experimental expressions
  unless their identification is separately checked.
* Reconsider representations for the untouched horizontal/vertical interiors
  and higher diagonals. A fourth-slice result alone cannot close the root.

The monolithic firstShiftGap0F2 draft timed out and is excluded. Its split
quartic-coefficient replacement is the intended accepted route. All failed
source snapshots and receipts remain. A later worker should not blindly rerun
setup scripts that create already-existing evidence directories.

Before a root claim, discharge source coverage, source family, homogeneous
raw coefficients, Newton polygon, every direction/zero/endpoint, permitted
assumptions and full proof scope, including the independent hash-bound audit.
