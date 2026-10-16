# Pell summand order and a failed midpoint route

Machine-authored request a24fe23da04d441088b5fe10c2c4681e. Full Conjecture63
remains unresolved. Formal status is recorded in this run's validation.json;
the discussion below must not promote an unaccepted draft to a theorem.

Write

    H(a,j,k,q) = C(a-q,k) C(k+q-1,q) C(2k,j-q), k>=1,

with zero extension. The Lean `pellTermMA24 a j s q` uses k=s+1.
This is exactly the inherited horizontalTerm9a72, cast to real numbers.
For the actual Pell source a/(a+1), the raw coefficient at (i,j), with
i+j=a+k and k>=1, is the sum over q of H(a,j,k,q). This is an inherited
proved identity, not a match inferred from the new experiments.

The proposed midpoint certificate compared

    H(a,j,k,q) H(a,j,k+2,r)
      <= H(a,j,k+1,floor((q+r)/2)) H(a,j,k+1,ceil((q+r)/2)).

The initial 104226 exhaustive nonzero tests through a=20 and 26017 seeded
nonzero tests through a=500 found no failures. A later systematic scan found
24 failures, first at a=22,j=25,k=3,q=19,r=16. Thus this route is abandoned.
The earlier observations are preserved rather than silently replaced.

## Uniform positive results

Exact support is k+q<=a, q<=j<=q+2k. In the positive range put
A=a-q-k, B=k+q, D=j-q, E=2k-j+q. The q-ratio is

    H(q+1)/H(q) = A B D / ((a-q)(q+1)(E+1)).

For the adjacent k-values, the cleared reverse-TP2 gap is

    A B (E+3) - (A-1)(B+1)(E+1)
      = A(j+q-1)+(B+1)(E+1) >= 0.

Zero-support cases are split explicitly. The result is reverse total
positivity in k,q for all indices, and its global version for arbitrary
q<=r. Each q-row is CrossLC: it is a product of a reversed upper-binomial
sequence, a negative-binomial sequence and a reversed binomial row, with
the exact zero extension proved. Parameter LC is inherited. These facts
prove the midpoint comparison for every q<=r.

The parameter and diagonal ratios simplify to

    H(k+1,q)/H(k,q)
      = 2(2k+1)(a-q-k)(k+q)/(k(E+1)(E+2)),
    H(k+1,q)/H(k,q+1)
      = 2(2k+1)(a-q)(q+1)/(k(E+2)(j-q)).

The formal equations are multiplied through by denominators; no zero is
canceled. They prove the reverse cases q=r+1 and q=r+2 as well. For the
second case, after putting A=a-q,D=j-q,E=2k-D, the main scalar comparison
reduces to

    (E+4)D(A-1) >= (E+3)(D-1)A.

The source support gives A>=k+2, D>=2, E>=-2. The cleared gap is
A(2k+3)-(E+4)D, bounded below using
(E+4)D <= (k+2)^2 and A>=k+2. Together with two positive scalar factors,
this proves the comparison. Consequently q<=r+2 is a universally valid
band. The first excluded gap q=r+3 already fails.

## Exact obstruction and source distinction

At (a,j,k,q,r)=(22,25,3,19,16), the midpoint product is 60648000 and the
endpoint product is 61047000. This compares summands, not raw coefficients.
The actual source 22/23 has the polygon-valid horizontal raw triple

    [210,16340,641421] at (0,25),(1,25),(2,25),

which satisfies LC. This 22/23 triple is an exact Python observation; its Lean draft timed out.
The smaller 5/6 source witness below is separately checked in Lean.

There is an unbounded family of failures. For a=n+23,j=n+25,k=2,
q=n+21,r=n+18 the four summands are

    n+22, 40 C(n+21,3), 4 C(n+21,2), 6 C(n+22,2).

The paper calculation (not a completed Lean proof) gives three times endpoint product minus midpoint product as

    2(n+22)(n+21)(n+20)(n+1)>0.

All these parameters correspond to Pell source families; their summand
failure does not imply any reversed raw inequality.

Separately, at a=5,j=6,k=1 no constant shifted min/max certificate works,
even if the shift may be chosen specifically for these parameters. For
c<=1 the pair (q,r)=(4,0) fails; for c>=2 the pair (4,2) fails. The actual
5/6 raw source triple [1,25,172] satisfies LC. This disposes of both a fixed
shift and the tempting parameter-adaptive constant-shift repair.

## Summation and scope

The retrieved discrete Prekopa-Leindler theorem gives a mathematical
summation implication from the full midpoint comparison. The new Lean
conditional adapter keeps both the finite summation theorem and the
remaining reverse midpoint assertion as explicit propositions supplied as
arguments. The reverse assertion is FALSE; this conditional adapter is
therefore diagnostic only and must not be treated as a viable residual
route to the root. No external theorem is installed as an axiom.

No new full-source direction has been established by this run. The exact
root residual remains the inherited OtherSourcesM679, including Pell's
remaining horizontal and vertical inequalities, all other larger numerators,
and every earlier reverse-factor obligation.

Formalization limit: MarkovPellMidpointObstructionMA24 and MarkovPellUniformObstructionMA24 timed out and are not accepted modules. MarkovPellSharpMA24 depends on that unaccepted draft and was not built. The unbounded family identity above is a paper derivation, not a kernel-checked theorem. The accepted finite gap-three obstruction is in MarkovPellBandMA24 if listed in validation.json.
