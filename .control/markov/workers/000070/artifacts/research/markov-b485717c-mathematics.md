# Cut-site activity obstructions to horizontal aggregation

Machine-authored live request b485717c0c2e4ae9b5526ee78a83dc99.
The pinned full Conjecture63 remains open. No novelty claim.
Final compilation and replay status belongs to validation.json.

The all-word horizontal ambient inequality is an inherited open candidate.
One possible approach would prove closure under positive external fields at
individual cut positions. The new experiments and proofs examine this stronger
claim. The field multiplies a mask by the product of its selected site activities;
it does not change the Boolean source word, identify different masks, or delete
zeros. All activities one recover exactly the original cut polynomial.

MarkovCutActivityB485 defines the fixed-cut polynomial with these activities,
proves equality with the corresponding coefficient of siteEval340, and proves
uniform specialization to cutCoeffA27 for every word and every cut count.
The inherited source bridge is A(i,j)=[y^j]cutCoeff(s), i+j=a+s.
Thus consecutive cut counts with j fixed correspond to horizontal raw indices
only at uniform activities. An activity-deformed failure is not a raw failure.

## A positive palindromic activity family

At source 1/8 the exact word is A^6 B. Assign activities
(1,t,t,1,t,t,1). This list is palindromic and strictly positive for t>0.
The y^2 coefficients at cut counts 2,3,4 are exactly

    L=1+2t,
    M=1+14t+15t^2,
    R=12t+59t^2+28t^3+t^4.

The complete gap is

    M^2-LR=1+16t+143t^2+274t^3+168t^4-2t^5.

Substitution t=n+86 gives the negative of

    43464915+113474404n+5195117n^2+89854n^3+692n^4+2n^5.

Consequently all integer t>=86 reverse this auxiliary horizontal inequality.
The exact formulas, universal integer threshold, positivity and palindrome,
and the uniform raw comparison are checked in the Activity modules.
At t=1 the actual source triple (1,2),(2,2),(3,2) is [3,30,100], gap 600.
The source labels, coprimality and all three polygon guards are proved.

## Even geometric activities fail

At source 7/10, path RRLL, the exact word is BBABBABBB. Assign site k
activity t^(8-k), k=0,...,8. For t>=1 these activities are positive,
nonincreasing, and satisfy every adjacent log-concavity equation with equality.
At j=9, cut counts 3,4,5 correspond at t=1 to raw positions (1,9),(2,9),(3,9).
The coefficient polynomials are recorded fully in geometric-symbolic.json and
the GeometricSlice modules. Their gap is t^19 H(t), where

    H(t)=-14+1427t+4577t^2+6941t^3+7530t^4+9148t^5+
      10646t^6+11609t^7+14378t^8+17465t^9+16371t^10+
      13376t^11+11532t^12+10119t^13+8361t^14+7419t^15+
      6191t^16+3478t^17+1034t^18+109t^19-12t^20-5t^21.

Every coefficient of H(n+8) is strictly negative. The generated ring identity
and positivity argument prove the failure for every integer t>=8.
Final compilation and separate replay receipts are recorded in validation.json.
The actual t=1 raw triple is [12,472,5092], gap 161680. Its source and polygon
bridge are kept separate from the deformed inequality.

This obstruction strengthens the previously inherited complete-log-concavity
polarization obstruction: it concerns actual one-variable coefficient LC after
specializing sites to a geometric external field, without taking derivatives.
It does not contradict a possible proof of the uniform-source horizontal
inequality. In particular, individual positional-energy fibers need not admit
a center-pair injection; compensation between them is necessary.

## Exact experiments and independent checks

The activity probe tests literal integer transfer recurrences. The subsequent
mask enumeration computes each subset contribution independently and preserves
all 128 masks on the seven-site word and all 512 masks on the nine-site word.
Its symbolic outputs are subsequently checked as ring identities in Lean.
The independent raw recurrence implementation matches 785 coefficient positions
on sources 1/8, 7/10 and 7/11, including zeros outside the polygon. The raw
7/11 comparison [1,96,1806] has gap 7410; its nonuniform plateau-field failure
is experimental only. Finite probes and computations are not universal proofs.

The broad arbitrary-activity probe checked 265,022 triples, the log-concave
site-shape probe 31,812, and the geometric probe 6,712, stopping when their
recorded failure was reached. These counts include zero coefficients and do
not mean distinct source triples. The seven-site simplification searched 199
heavy-site configurations, stopping at the displayed witness. The additional
R^m L^2 family probe checked 104 deformed triples for m=1,...,26 and bases
2,3,4,8; no failure at bases 2,3,4 was found there. That last finite observation
supplies no universal permitted deformation interval. Its nominal 45-second
cap was tested after each family member; completion was 51.24 seconds.

The live published target and targeted searches were consulted. No search
result supplied a theorem used as an axiom; no claim of literature completeness
is made. Source: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html

## Final validation and boundaries

All nine mathematical modules compiled and passed separate explicit-module
kernel replay. Every new theorem's axiom closure was printed in MarkovAuditB485
and contained only the permitted standard axioms. Two rejected elaborations
and one timed-out build are retained; repaired sources passed later checks.
Inherited compiled imports were reused, so this is not a fresh whole-source
rebuild. No independent English/source completion audit occurred. All
foreground sessions completed. Prior artifacts, the six inherited inputs,
the root and the contract are checked again in preservation.json.
The first finalizer invocation confused the request's canonical-JSON contract
hash with its file-byte hash. Both were unchanged; the distinction was repaired
and the failed invocation and partial effects retained in finalizer-failure.json.
