# Fibonacci grading and interval aggregation

Machine-authored live request 7d905904dcbe45a89408ca2cea9065c6.
This document separates compiled Lean statements from a paper derivation.
It does not resolve the pinned root or assert historical novelty.

Write A=false, B=true, and N=n+1 for the length of A^n B. This is the exact
word central28(replicate n false)++[true] for source 1/(n+2). Let s be the
number of cuts and d the degree of an individual cut weight.

The compiled MarkovFibonacciGrading7d90 proves, in every commutative ring,
that each such mask has weight (1+y)^d. Thus its entire degree layer is

    G(N,s,d;y) = c(N,s,d) (1+y)^d,

where c is the actual number of masks, not a chosen reweighting. It also
proves the exact change of variables h=z(1+y)-1 identifying the degree-marked
evaluation with the original cut evaluation at h. The incoming state is
changed to z^d(p+1)-1, so this identity does not silently assume an unchanged
state. MarkovFibonacciLayers7d90 proves coefficient log-concavity of every
nonnegative integer-weighted sum of two consecutive degree layers, for all
n,s,d and every coefficient index j, and connects it to all source paths
whose middle numerator is one. Separate replay status is in the receipts.

## Paper derivation of all consecutive degree intervals

The following count formula and full-interval proof are not yet formalized.
They are derived here, rather than inferred from the finite experiment.

Regard a cut mask as a binary string of length N, with s ones. If it has k
nonempty blocks of zeros, then d=s+1-k. To see this, each selected A supplies
one degree exactly when it immediately follows a selected site, counting a
virtual selected site before the word. A selected terminal B supplies one
additional degree. If r is the number of one blocks and L,R indicate selected
endpoints, the degree is s-r+L+R; k=r+1-L-R gives the formula.

If s<N there is at least one zero. Distribute N-s zeros into k positive
blocks, in choose(N-s-1,k-1) ways. The k-1 internal blocks of ones must be
positive, while the two endpoint blocks may be empty. Distributing s ones
gives choose(s+1,k) ways. Consequently, for 0<=d<=s,

    c(N,s,d) = choose(N-s-1,s-d) choose(s+1,d),

and it is zero outside this range. When s=N the unique mask has d=N+1;
when s>N there are no masks. These exceptional cases must not be evaluated
using truncated negative arguments in the displayed binomial formula.

For s<N set m=N-s-1. Restrict d to an arbitrary consecutive integer interval
[L,U] and put u_d=d! c(N,s,d) there and zero elsewhere. The nonzero support
before restriction is [max(0,s-m),s]. For adjacent positive terms,

    u_(d+1)/u_d = (s+1-d)(s-d)/(m-s+d+1).

The numerator factors decrease and the positive denominator increases with
d. Hence u is nonnegative, log-concave, and has interval support. Restricting
to [L,U] preserves these properties. This argument never divides by a zero
coefficient; ratios are used only inside the positive support.

Let v_k=1/k! for k>=0 and zero for k<0. This also is log-concave with interval
support, since v_(k+1)/v_k=1/(k+1). If f_j is the coefficient of y^j in the
interval sum, then for j>=0

    f_j = (1/j!) sum_d u_d v_(d-j).

The sum is a reflection of the convolution of a reflected u with v. All
sequences may be truncated beyond N+1 before using the finite convolution
theorem, since only finitely many d occur. Convolution preserves nonnegative
log-concavity with interval support, as do reflection and pointwise product.
Multiplication by 1/j! therefore proves coefficient log-concavity. The s=N
case is a single binomial power, and s>N is zero. This proves the proposed
Fibonacci interval statement on paper, including zero layers and endpoints
of intervals. Kernel-checked closure of this paper argument still requires
the block-count formula and the factorial/convolution transport in Lean.

## Executed checks and scope

research/fibonacci_counts_7d90.py independently enumerated 32,766 masks at
lengths N=1,...,14, checking the zero-block statistic and multiplicities.
It compared 789,820 transfer coefficient positions through N=40 with the
formula, and tested 13,032,096 interval inequalities without a failure.
The exact output is evidence/markov-7d905904/fibonacci-counts.json.
These finite checks are not the proof of the count formula or the interval
theorem, and do not extend source coverage.

The new Lean positive results concern auxiliary diagonal layers on the
numerator-one family. Full raw log-concavity of that family was already
established in inherited work. General mechanical words have reset factors
such as 1+2y+... and are not binomial powers; the reduction above cannot be
applied to them without a new argument.
