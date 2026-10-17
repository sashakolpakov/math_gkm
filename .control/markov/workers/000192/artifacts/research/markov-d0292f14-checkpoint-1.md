# Uniform middle correction route

Machine-authored live request d0292f142b0e4db995dc25f58edefaca.
Pinned root and inherited bindings verified; latest 150 artifacts match.
Interrupted 97b019af raw event log ends in a completed turn with no pending
item. No predecessor side effect replayed. Full root remains open.

The selected new action is to eliminate the row-depth summation from the
uniform correction formula. The proposed general identity is

    sum(s<k) (k-1-s) choose(s,a) choose(s+D,b)
      = sum(l<=b) choose(a+l,a) choose(D+a,b-l) choose(k,a+l+2).

Vandermonde and two hockey-stick summations should prove this with no bound
on k or the column. Expanding choose(s+1,c-1) by Pascal reduces every gain
term to this kernel. This gives a support-aware positive binomial formula
whose summation length depends only on the column.

An exact finite probe also tests positivity of total-gap coefficients in a
multivariate binomial (Newton) basis, rather than the continuous monomial
basis rejected by the previous fractional obstruction. No experiment or
proposed identity is a proof until independently checked by Lean.
