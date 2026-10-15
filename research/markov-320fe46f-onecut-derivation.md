# One-cut increasing-weight aggregation

Machine-authored live request 320fe46fcee34a5a829606c8fa65b08e.
This is a paper derivation until the corresponding Lean receipts establish
each assertion. The full pinned root remains unresolved.

Write R_k=1+2y+...+2y^k and P_k=R_k+y^(k+1). A source whose path is
R^n L rest has a full word made of c blocks A B^(n+bit), with r long blocks,
where c and r are the denominator and numerator of rest. The first block is
short and the last is long. Consequently c>=r+1 and r>=1.

Give every one-cut mask of degree d the same real weight w_d. Its polynomial
is exactly H_n+(c-r-1)J_n+(r-1)J_(n+1), where

    H_n = sum_(k<n) w_(k+2)(1+y)P_k + w_(n+1)P_n
            + sum_(k<=n) w_(k+1)(1+y)R_k,
    J_n = sum_(k<n) w_(k+1)(1+y)R_k + w_n R_n.

This retains actual mask multiplicities. The unweighted raw diagonal is
obtained with w_d=1. Geometric degree deformation uses w_d=z^d.
No weights in this argument are a normalization of raw coefficients.

For n>=3 the coefficients F_j of the full weighted polynomial satisfy:

    F_(n+1)=4r w_(n+1),
    F_n=(4c-2r-3)w_n+(3+6r)w_(n+1),
    F_(n-1)=(2c-1)w_(n-1)+(6c-2r-3)w_n+(4+6r)w_(n+1),
    F_j=(2c-1)w_j+(4c-1)w_(j+1)
          +4c sum_(d=j+2)^n w_d+2(c-r-1)w_n+(4+6r)w_(n+1)
        for 2<=j<=n-1.

For 2<=j<=n-3 the second difference is

    F_j-2F_(j+1)+F_(j+2)
      =(2c-1)(w_j-w_(j+1))+2c(w_(j+1)-w_(j+2))
          +(w_(j+2)-w_(j+3)).

At j=n-2 it is (2c-1)(w_(n-2)-w_n)+(w_(n-1)-w_(n+1)).
At j=n-1 it is (2c-1)(w_(n-1)-w_n)+(2+2r)(w_n-w_(n+1)).
All are nonpositive for nonnegative nondecreasing w. The j=0 and j=1
cases can be checked from the displayed basis polynomials; their sums also
have nonpositive second differences. Thus the expected stronger property
is concavity on indices 0,...,n+1, which implies coefficient log-concavity
there. Right outside this interval the coefficients vanish. Small n require
separate overlapping-boundary calculations.

The same linear concavity property holds for each J_n on 0,...,n+1 and for
H_n on that interval, making a run-by-run proof possible without dividing
by coefficients or assuming LC is preserved by sums. The nonnegative
linear combination argument applies to concavity, not to arbitrary LC sums.

Two cautions from actual experiments:

* Increasing weights alone do not suffice at higher cut count. Source 1/42,
  three cuts, degrees 1..3 with weights [1,1,10] gives [3228,342,40] and
  gap -12156. These weights are increasing but not log-concave.
* The proposed degree-minus-cut graded suffix criterion fails in horizontal
  and vertical directions, already at source 1/3. Gaps are 4-z and 4-3z.
  Their values at z=1 are positive; these are not source counterexamples.

Evidence: evidence/markov-320fe46f/monotone.json, cross.json,
minimal-cross.json. Experiments do not establish the universal formulas.
