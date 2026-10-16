# Revisable next actions

Full pinned Conjecture63 remains unresolved. The latest complete reduction is
MarkovResidualFullMCE8.lean: its vertical clause has i>=4 and starting j>=2.
Horizontal j>=5 and the existing deep-diagonal clause remain unchanged.
Use evidence/markov-ce882be3/validation.json to identify admitted sources.

The new all-source theorem source_strip_fullMCE8 closes starting j=1 in every
slope range, with every natural i and zeros retained. It uses actual source
statistics, not an enlarged arbitrary-prefix claim. The intermediate
MarkovResidualMCE8.lean only removes b>=2a and is superseded by the full version.

One possible next action is the vertical starting j=2 strip. The exact symbolic
probe probe_next_strip_ce882be3.py gives a nonnegative coefficient expansion
in the source cone b>=4a (with a>=3 for the inherited ordinary fourth-row
factorization). Its source adapters and Lean proof are NOT done in this run.
The supporting finite source comparisons are next-strip-experiments.json;
experiments and positive symbolic expansion are not universal proofs.

For k=i-a, l=b-2-k, N=k+l, C=choose(N,k), use the low J0,H0 already defined.
Let c3,...,c7 be h4c3M511,...,h4c7M511 with all six statistics zero, and
I=sum_{r=0}^4 c_(r+3) falling(k,r) falling(l-3,4-r).
The proposed fourth-row coefficient formula is

24 falling(N,7) A(i,4) = C l(l-1)(l-2) I.

The next gap is
G2=4(N-5)(N-6)(l-1)H0^2 -3(N-3)(N-4)(l-2)J0 I.
The positive clearing identity should be

144 falling(N,5)^2(N-5)(N-6)(A(i,3)^2-A(i,2)A(i,4))
 = C^2 l^2(l-1) G2.

For a=A+1, all coefficients are nonnegative in five charts:
l=L+7,k=K; l=3,k=K+4; l=4,k=K+3; l=5,k=K+2; l=6,k=K+1.
These cover l>=3,N>=7. Their formal identities, zero/end-support treatment,
small-a source cases and the other slope ranges still require work.

Alternatively, investigate a uniform row-order gap representation; the present
finite-order formulas do not establish an induction over row order. Do not infer
that arbitrary positive residual summands, or arbitrary source-word prefixes,
are log-concave: inherited exact counterexamples rule out those shortcuts.

Every correspondence obligation and independent hash-bound source/English audit
remains necessary before a root completion claim. Retain the full residual.
