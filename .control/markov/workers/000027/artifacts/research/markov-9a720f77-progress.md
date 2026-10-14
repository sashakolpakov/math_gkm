# Exact Pell-sum checkpoint

Machine-authored request 9a720f77696445aab32325da611c5097.
Full pinned Conjecture63 remains open.

At 06:23 UTC MarkovPellSum9a72 compiled with only permitted axioms.
It proves an exact raw coefficient formula for every repeated-right source,
including zeros outside its degree strip, and an equivalence between WeakLC
for the entire Pell family and two universal elementary binomial-sum inequalities.
The third direction is supplied by the previously completed diagonal theorem.
Kernel replay is pending at this checkpoint.

The reindexed candidate summands at total degree a+s are

    H(a,j,s,q) = choose(a-q,s) choose(s+q-1,q) choose(2s,j-q),
    V(a,i,s,p) = choose(s+p,p) choose(a-p-1,s-1) choose(2s,i-p).

These use integer binomial upper indices, with zero outside 0<=k<=n.
The s=0 boundary is handled separately in the experiment.
Both sums matched 49,600 exact raw coefficient comparisons for 1<=a<=25.
This reindexing is experimental pending an additional formal bridge.

Naive midpoint closure fails for both: H(22,25,3,19)*H(22,25,5,16)
=210*290700 > 5700*10640, the midpoint pair at s=4 and q=17,18.
The V counterexample has a=5,i=5,s=1,p=5,2 and 1*48>4*10.
These reject summand-wise proof strategies, not the inequalities of the sums.
Similarly, pairwise synchronization fails (horizontal a=3,j=2,s=2,q=0,2,
15>0; vertical a=2,i=2,s=1,p=0,2,6>0).

Exact Sturm experiments found non-real roots in actual Pell rows/columns:
vertical a=3,i=3 gives [1,8,26,20]; horizontal a=7,j=7 gives
[0,4,120,1320,6160,12600,11088,3432]. The experiment is finite evidence,
not an accepted theorem. SymPy is unavailable, so rational Sturm arithmetic
was implemented locally without installing dependencies.
