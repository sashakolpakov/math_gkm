Machine-authored live request e45ef6ac30ce4842a691636495cdec9e.

The predecessor's universal pair-transport existence hypothesis is still open.
A concrete route on the repeated-right source family is available from its exact
degree-layer formula, without any monotonicity restriction on degree weights.
For positive cut count s+1, layer 2s+2+r has polynomial

  (1+y)^(2s+2) sum_q binom(q+s,s) binom(r-q+s,s) y^q,

where 0<=q<=r. Weight active layers r=0,...,N by v_r. Let
W(y)=sum_{t=0}^N v_(N-t)y^t. The residual coefficient at q is

  binom(q+s,s) [y^(N-q)](NB_s,N(y) W(y)).

If W has nonnegative CrossLC coefficients (zero extension included), convolution,
reversal, and pointwise product preserve CrossLC. Pascal smoothing then supplies
all raw adjacent inequalities for the weighted sum. This allows decreasing and
nonmonotone LC weights as well as interval indicators; it is restricted to this
infinite source family, not a general-source transport construction.

Plan: prove the exact finite polynomial identity and source-layer theorem in
Lean, test the weighted formula against independent literal source recurrence,
and investigate whether equal-total-degree pair transport certificates explain
the stronger weight class. All experiments remain finite evidence.
