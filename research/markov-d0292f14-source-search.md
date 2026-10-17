# Live source and literature observations

Machine-authored live request d0292f142b0e4db995dc25f58edefaca, 2026-10-17.
These are retrieval observations, not new Lean assumptions.

The hosted tool retrieved the [published Evans–Veselov–Winn article](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html), including its numerator recurrence, homogeneous coefficient interpretation, and Definitions 6.1–6.2 / Conjecture 6.3. The target remains raw, non-strict and in all three specified directions. The pinned local root was not edited.

Searches included “log concavity binomial basis coefficients Turan determinants binomial products positivity”, “Jacobi polynomial triangle log concavity preserving linear transformation coefficients”, and “log concavity sum Jacobi polynomials Cesaro coefficients”.

[Karp, arXiv:1203.1482](https://arxiv.org/abs/1203.1482) reports positivity results for rising-factorial-series determinants under log-concavity assumptions. Only the abstract was inspected; no applicability to our kernel or gap was established.

[Zhu, arXiv:1605.00257](https://arxiv.org/html/1605.00257) gives preservation criteria for specified binomial transforms and triangular recurrences. Its setup retains interval support. The current kernel depends on the column in multiple binomial arguments; it has not been identified with a transform satisfying those criteria. Thus no result from this paper is used as a proof premise.

Exact local Sturm experiments reject blanket real-rootedness of the high-column top-mass polynomial, already at d=0,T=2. Both the ordinary and factorial-scaled polynomials have nonreal roots in tested cases. This does not reject coefficient log-concavity or the separately tested shifted-factorial inequality.
