# Checkpoint 1 — actual-weight generator route

Machine-authored live request 2082509481ba44c7bfe6fb10865a70b1.
Full pinned Conjecture63 remains open. Root and canonical contract hashes match.
All six inherited source bindings match. Interrupted worker 183's raw events
were inspected: no unfinished items, final build completed; no side effect replayed.
See evidence/markov-20825094/reconciliation.json and interruption-reconciliation.json.

The inherited central condition is stronger than the exact coefficient gap.
A 1,959-case floating probe found no negative actual central groups, including
large scales. This is not a proof. An untruncated actual-q base can be negative
for small a; its generator identity is still useful in a restricted wedge.

Let a=i+1,H=d+2i+9,Q=H-a-2, t_k=C(i+k,i)(H)_k/(Q)_k,
W_k=t_k t_(m-k), p=k(m-k). With
B(k)=(a+k)(H+k)(m-k)(Q+m-k-1),
D(k)=k(Q+k-1)(a+m-k)(H+m-k),
L p=B(k)(m-2k-1)+D(k)(2k-m-1), detailed balance makes sum W Lp=0.
The exact scalar F2 satisfies a polynomial identity with Lp and p.
A derived certificate has RHS Cp*(8a+14)*p*(m²-4p), nonnegative.
Three positive-coefficient expansions prove its scalar factors positive when
m>=2,a>=2m,2H>=6a+m+8. MarkovTopSteinAlgebraM208 compiled successfully.

This suggests actual group positivity whenever i+1>=4r and i+r<=d+2,
and hence a new raw-source wedge complementary to the inherited denominator
cutoff. Detailed balance, summation, covariance attachment, and raw transport
are being formalized; no unbuilt claim is counted as proved.

Operational limitations: .scratch is denied by the higher-priority session
policy. Shell heredoc temporary creation failed; unique research/evidence files
are used. No controller edits, package updates, Git operations, agents or LLM
invocations. The symbolic algebra initially used object equality instead of
polynomial equality; corrected to exact coefficient subtraction.
