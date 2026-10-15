# Degree-pair transport

Machine-authored live request 89ce11adb69243f8836fc68470d6d524.
This is a new sufficient certificate, not a universal proof of Conjecture63.

For fixed cut count s and coefficient index j, let A_d,B_d,C_d be the
literal degree-layer coefficients at j,j+1,j+2. For unordered d<=e define

    G_dd = B_d^2-A_d C_d,
    G_de = 2 B_d B_e-A_d C_e-A_e C_d  (d<e).

The weighted gap is exactly sum G_de w_d w_e. Sort each pair increasingly.
A negative mass at (a,b) may be paid from positive mass at (c,d) if

    a<=c and a+b<=c+d.

For nonnegative increasing log-concave weights, w_a w_b<=w_c w_d.
If b<=d this is monotonicity. Otherwise first balance (a,b) to
(a+b-d,d) by log-concavity, and then increase the first coordinate to c.
Zeros cause no division problem. The Lean module also proves that adjacent
LC plus nonnegativity and monotonicity supplies the needed cross inequalities.

A finite nonnegative transport M from negative to positive pairs with

    G(x)=R(x)+sum_y M(y,x)-sum_y M(x,y),  R>=0,

therefore proves the weighted gap nonnegative: each moved mass contributes
M(x,y)(w_y1 w_y2-w_x1 w_x2)>=0, and R contributes nonnegatively.
The new exact Python max-flow routine checks this identity independently
after finding a flow; it does not merely test a sampled weight sequence.
The Lean ordered-pair convention uses
2B_d B_e-A_d C_e-A_e C_d, whose total is twice the gap. It is equivalent
to the unordered convention: first double every unordered mass, then distribute
it equally across the pair's distinct orientations (one on the diagonal, two
off the diagonal). Transport edges can be split across their source and target
orientations in the same way. Fractional flows are
allowed over the reals. No change to raw coefficient normalization is made.

The first nontrivial certificate found is source 3/4, s=1, j=2:
G(2,4)=-1, G(3,3)=1, G(3,4)=3, G(4,4)=5.
Move one unit from (2,4) to (3,3); the rest is nonnegative.

Finite certificates are evidence for a proposed universal existence theorem
on mechanical source words. They do not prove that theorem. Arbitrary Boolean
words need not have such certificates: the separate arbitrary-word experiment
already has a negative complete gap. Horizontal and vertical directions are
not covered by the proposed fixed-cut certificate.

The immediate predecessor completed; all 102 artifacts and six inherited
inputs matched. Its earlier c416 interruption was already reconciled and was
not replayed. Build diagnostics and exact experiments are retained under
evidence/markov-89ce11ad/. Final validation status is separate from this derivation.
