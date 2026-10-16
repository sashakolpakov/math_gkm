# Checkpoint: source-prefix obstruction

Machine-authored request 10d1575180b64743bae4589161aa0716. Exact root unchanged and unresolved.

Read MISSION.md and docs/DESIGN.md completely, pinned contract, inherited index and independent target/residual/core audits. Verified 97 latest artifacts and all inherited hashes; inspected interrupted worker 121 raw events and checked 1,355 surviving artifacts. No prior side effect replayed. Details: evidence/markov-10d15751/reconciliation.json.

The grouped atomic A/C experiment covered 2,397 source-prefix states through denominator 30. It found that even the F state itself need not have log-concave rows: source 2/23, after 13 original letters, row 2, x-exponents 1,2,3 gives [2,5,13]. This is an auxiliary prefix, not the completed source residual or pinned raw polynomial. Both same-row and some grouped cross-row synchronization predicates also fail. H-state LC had no failure in this finite scan. Evidence: grouped-experiments.json. No universal claim follows.

New mathematical direction under development: conjugate the positive residual pair to the existing raw positive word model. For h=1+x, after k original letters define Q=h^k F(y/h²), P=h^(k-1)H(y/h²). After an initial A these are polynomials, and atomic updates become

    A: (Q,P) -> (y(Q+xP), Q+hP), with k -> k+1;
    C: (Q,P) -> ((1+y)Q+xyP, Q+xP), with k unchanged.

Writing Q=y f and P=g recovers the inherited gas-word pair recursion. A polynomial substitution identity, avoiding actual division, should connect this model to residual states for all words and all row indices. This would make the high-index divisibility explicit; it does not cancel LC backwards or prove the remaining inequality.

Scratch is denied by the developer permission policy and has not been accessed. New files under research/ are used. One exploratory read requested nonexistent files; their absence is operational only. Hosted publisher retrieval and searches supplied no full proof used in this work.

Final checkpoint: the integral pair conjugacy and all-path source adapter compile and passed kernel replay. The F-prefix failure is now proved for every source 2/(2n+5), n>=9. A separate polygon-valid raw failure on a prefix of 11/13 is proved and formally excluded from the entire source-word family; the actual 7/9 comparison is proved to hold. The all-source-prefix WeakLC enlargement is formally refuted. Seven modules and 40 theorem closures passed final local validation. Full Conjecture63 and its exact inherited residual remain unresolved. See markov-10d15751-mathematics.md, markov-10d15751-correspondence.md and evidence/markov-10d15751/validation.json.
