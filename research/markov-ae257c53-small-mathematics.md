# Small third-column source identities

Machine-authored research, request ae257c53. These are exact source identities,
not third-column log-concavity proofs. Consult the final validation inventory.

Write path = false^n ++ true :: rest, L = (frame rest).mid.b,
T = (frame rest).mid.a. Its source labels satisfy a=L and
b=L*(n+1)+(L-T). For L>=4 and n>=1, b>=3*(n+2). The inherited third-moment
formula therefore yields the integral polynomial identity

    6*vresidual(path,3) = X^(b-3*(n+2))*vThirdSeed(n,rest).

For 4<=L<=7, cancellation in the integral polynomial ring gives

    6*(1+X)^(7-a)*[u^3]P = X^(b-3*(n+2))*vThirdSeed(n,rest).

The new proof uses the already proved all-order cleared factorization. It
never treats log-concavity as preserved under division by (1+X).

For a=4,5,6 and r=b mod a coprime to a, each of the four inherited numerator
blocks vJ_k is exactly divisible by (1+X)^(7-a). The eight families are
(4,1), (4,3), (5,1), (5,2), (5,3), (5,4), (6,1), (6,5).
The sThirdARblockKMAE2 ring identities prove these literal divisions. The
sThirdARsourceMAE2 source adapters prove

    (1-X)^6*(6*[u^3]P)
      = X^(b-3*(n+2)) * sum(k=0..3, X^(k*(n+1))*J_k(n+1,X)).

All exponents are natural and justified by the displayed hypotheses. The
small source adapters currently require n>=1. The a=2,3 corrections and all
small-family LC theorems remain separate obligations.

Exact finite tests cover 64 actual fractions, q=n+1 in
{2,3,4,5,8,17,41,97}, with 7,880 coefficient identities, 7,752 adjacent
inequalities, and 3,440 zeros. These are not proofs. In addition, all 160
symbolic gap charts obtained from the 20 inherited index chambers and eight
small families have nonnegative polynomial coefficients. This is a useful
candidate certificate, but the coefficient extraction, exhaustive chamber
coverage, and inequality proofs still need Lean verification. Data and scripts
are preserved in small-blocks.json and small-gap-candidates.json.
