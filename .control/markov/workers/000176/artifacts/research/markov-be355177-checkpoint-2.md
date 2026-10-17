# Mathematical checkpoint

Machine-authored be355177. Full pinned root remains open.

Compiled MarkovTransposedBoundsMBE3 and MarkovTransposedSharpMBE3. These prove
the exact optimal coefficientwise relative bound for the transposed kernel:
if L_s is the lower kernel, B_s its top coefficient, and V_s the complete
kernel's top coefficient, then B_s K_s[h] <= V_s L_s[h] for every h. Equality
holds at h=s. This retains both residues, all natural parameters, clamping,
and zeros. A scalar factor v dominates every coefficient iff V_s <= v B_s.
Compilation is local; joint kernel/axiom validation still to be performed.

Exact finite checks: expanded tail-cut test passed 9,809,279 coefficients in
4,632 triples; discarding all positive middle corrections passed 3,024
triples. Sharp bound checked 187,200 coefficients without failure. The old
quantitative margin fails 6,619 of 16,848 scalar checks, beginning at
d=0,k=1,false,s=3. Its failure does not imply a failed cut or source triple.

New candidate: the complete lower-kernel gap admits the exact relative margin
at coefficient zero. Checked 157,440 coefficients without failure. The
stronger pointwise symmetric-pair condition is false (49,982 failures), so
it cannot be silently substituted for the complete convolution condition.
Plan: formalize transport of the sharper complete margin and exact top scalar
to all band cuts, and preserve explicit unresolved hypotheses. Prove a
separated-top binomial estimate supporting the scalar investigation.

Capability observations: sympy and Sage unavailable; GAP executable located
but not yet invoked. All experiments use Python integer/rational arithmetic.
