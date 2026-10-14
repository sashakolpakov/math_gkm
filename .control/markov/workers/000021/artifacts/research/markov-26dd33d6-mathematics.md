# Fifth upper diagonal: removal of the numerator restriction

Machine-authored research for request 26dd33d6a67b4559b60690a5fd08502c.
The three new Lean modules compiled and passed kernel replay. The exact pinned
root remains open. No historical novelty claim is made.

The inherited quartic residual has coefficients (A,B,C,D,E)/24 with
A=qa4f8(m), B=qb4f8(n,m,s,t), C=qc4f8(n,m,s), D=qd4f8(n,m),
E=qe4f8(n). Here n=b-2 is core-word length, m=a-1 counts true letters,
s counts switches, and t counts AAA and BAB triples with A=false.

The new combinatorial bound is s<=2m, proved by charging each switch to a
true endpoint. Together with t<=n-m, for m=1,...,5 and n>=10 it gives

    B_low=B(n,m,2m,0) <= B <= B(n,m,0,n-m)=B_high,
    C_low=C(n,m,2m) <= C <= C(n,m,0)=C_high.

After n=x+10, the polynomials B_low, C_low, B_low^2-A*C_high,
C_low^2-B_high*D, and D^2-C_high*E have nonnegative coefficients in x.
The intended formal proof checks those identities by ring normalization and
positivity separately for each m. Monotonicity then gives all three adjacent
quartic inequalities. This complements the inherited m>=6 certificate.

Words of length at most nine form a finite, exhaustively defined list.
MarkovFiniteQuartic26dd proves membership from the length bound, then checks
the exact three integer inequalities with ordinary Lean decide. No
native_decide, oracle, or finite experiment is used as a proof premise.
This finite lemma has been compiled and kernel-replayed. It is a base case
for a universal argument, not a finite approximation to the conjecture.

The checked source bridge uses the inherited exact quartic identity, cancels
the common positive scale 24, and invokes the interval-support and binomial
smoothing transfer. The numerator-one family is already fully checked.
Small total degrees are handled by the actual polygon guard. The final theorem
first_five_raw_logConcave26dd states the literal integer inequality

    A(i,j+2) A(i+2,j) <= A(i+1,j+1)^2

for every source path, every natural r<=4 and all i,j with
i+j+2+r=a+b-1. The outside-polygon coefficient vanishing theorem removes
the polygon guard without deleting zeros. The new unbounded scope is r=4
with a=2,...,6; the other first-five cases assemble inherited results.

Exploratory certificate thresholds were 6,7,9,9,10 for m=1,...,5; the proof
uses the common bound 10 for clarity. Exact Python enumeration through length
13 found no quartic failure. Coarse statistic bounds alone admit 24 spurious
failures among small parameter tuples, demonstrating why the finite word
cases retain actual word realizability. Experiment data is in
evidence/markov-26dd33d6/small-exploration.json and is not a proof.

The hosted publisher page was retrieved and its Definitions 6.1--6.2 and
Conjecture 6.3 checked. The full target includes all three directions;
the proposed new result concerns only the fifth upper diagonal.
Source: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .

## Next-slice exploration, explicitly unproved

An exact truncated two-state calculation enumerated every binary core of
length at most sixteen: 131071 words per slice. No adjacent inequality
failed for residual degrees four or five. Degree six had two failing words;
the shortest recorded core 101111 has coefficients [0,0,2,4,6,10,7], with
6^2<4*10. This is the inherited enlarged-family obstruction, not an actual
source witness and not a refutation of Conjecture63.

For degree five, two candidate linear feature bases were inconsistent.
Adding prefix/suffix statistics yielded a candidate formula for the four
interior coefficients, fitting 1296 exact training words and 2050 further
deterministic random words of lengths 10 through 50. The fitting basis,
rational coefficients and seed are retained in quintic-fit-v3.json and
research/quintic_fit_26dd.py. They are NOT a universal identity or a checked
inequality. A useful next action is a matrix-jet induction retaining boundary
statistics, rather than assuming that interpolation proves the identity.

The v1 experiment mistakenly labeled the planned holdout count 2050 despite
stopping at an inconsistent training row; no holdout was executed in v1.
V2 corrects this bookkeeping and reports zero holdouts; v3 ran all 2050.
The rejected v1 record and code remain unchanged for audit.

The truncated recurrence implementation was additionally checked against
the inherited full positive matrix products on all 511 cores of length at
most eight, comparing 1533 slices with no mismatch. This is implementation
evidence only: evidence/markov-26dd33d6/slice-crosscheck.json.

For a future jet proof, write F_k=p_k+x*q_(k-1). The row recurrence gives
F'_5=F_5+x*F_4+x*q_3 on an A append and
F'_5=F_5+(x+1)*F_4-x*q_3 on a B append. Also
q'_3=F_3+q_2 for A and q'_3=F_3 for B. Thus the inherited cubic scalar,
quartic scalar and second-state quadratic formulas provide the lower jets
needed for an induction on the candidate quintic identity. These displayed
recurrence consequences are an informal derivation here; the quintic identity
and its coefficient inequalities remain unformalized.
