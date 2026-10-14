# Exact numerator-two column recursion

Machine-authored request 3af43e697b6b47c785aedffc7f2fb037. No root closure.
Write F_n for the inherited source Fibonacci numerator, S=u+v+1, and
P_q=F_(q+1)^2+v F_q^2. For q>=1 this is exactly the source at 2/(2q+1).
P_0=(u+v)^2+v is an auxiliary initial polynomial, not a source witness.

The checked Cassini identity gives the inhomogeneous recurrence

    P_(q+2)=(S^2-2v)P_(q+1)-v^2 P_q-4u v^(q+2).

Eliminating its geometric forcing gives

    P_(q+3)=(S^2-v)P_(q+2)-v(S^2-v)P_(q+1)+v^3 P_q.

MarkovFamilyRecurrence3af and MarkovFamilyEquation3af prove these for every q.
For H(t)=sum P_q t^q, MarkovGenerating3af proves D H=N exactly in formal
power series, with D=(1-vt)((1-t)(1-v^2 t)-u(u+2v+2)t), and

    N=(1-vt)(u^2+2uv+v(1+v)(1-t))-4uvt.

The Lean numerator is stated using P_0,P_1,P_2; the displayed simplification
is the elementary expansion of those seeds, also checked by the experiment.
There is no analytic convergence hypothesis.

Let C_i(q)=[u^i]P_q and G_i(t)=sum C_i(q)t^q. For every i>=0,
MarkovColumnSeries3af proves

    (1-t)(1-v^2t)G_(i+2) = C_(i+2)(0)+t(2(v+1)G_(i+1)+G_i).

Thus the arbitrary-column problem has a uniform positive recurrence, rather
than needing a separate denominator-cleared jet calculation for each column.
MarkovPositiveKernel3af supplies its inverse kernel

    K=1/((1-t)(1-v^2t)), [t^q]K=sum_(r=0)^q v^(2r).

It proves the exact recursion G_(i+2)=K times the RHS. Kernel coefficients
are nonnegative; their gaps matter. The q=1 slice is 1+v^2 and fails adjacent
LC. It is not legitimate to treat K as the inherited Pascal smoothing kernel.

Subtracting neighboring q-columns gives

    C_i(q+2)-C_i(q+1)
      =v^2(C_i(q+1)-C_i(q))+2(v+1)C_(i-1)(q+1)+C_(i-2)(q+1), i>=2.

The initial difference has the same positive expression with q=0 and with
v^2 C_i(0) as its first term. Source coefficient nonnegativity therefore
proves C_i(q+1)>=C_i(q) coefficientwise, for all i>=2, all q and all j.
MarkovColumnMonotone3af proves this. MarkovSourceReduction3af connects the
comparison to an actual next path with denominator b+2, and proves the exact
root equivalence: all q>=1 numerator-two GlobalLC inequalities, AND all source
paths with a>=3. Neither conjunct has been proved.

Exact finite tests through q=29 found no vertical LC failure in the coefficient
increments themselves. They did find synchronization failures on actual source
families: at q=1,i=2,j=1 the source triple is [1,5,6] and the increment triple
is [0,0,8], so the mixed inequality fails (0<8). In the increment recurrence,
the terms at q=1,i=2,j=4 include triples [8,24,28] and [0,0,1], which also fail
synchronization. These rule out that straightforward summation proof, not the
source conjecture. Evidence: source-column-strategies.json. Increment LC
remains an unproved auxiliary conjecture and does not entail source LC alone.

A further algebraic expansion of H, not formalized as a coefficient formula
in this worker, is

    H = v(1+v)/(1-v^2t)
      + sum_(k>=0) u^(k+2)(u+2v+2)^k t^k(1+vt)
          /((1-t)^(k+1)(1-v^2t)^(k+2))
      + sum_(k>=0) 2v u^(k+1)(u+2v+2)^k t^k(1+vt)
          /((1-vt)(1-t)^k(1-v^2t)^(k+2)).

Every displayed summand expands positively. At a fixed u-degree only finitely
many k contribute. No claim that their sum is LC is made, and any future use
as a Lean coefficient identity needs its remaining expansion bridge.
The proposed expansion matched 3,024 coefficients for q=0,...,15 in
evidence/markov-3af43e69/positive-expansion.json (finite evidence only).

The [publisher source](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
and hosted searches were consulted live. They supplied
no full proof used here; no external assertion was introduced as an axiom.
This is not an exhaustive literature or novelty audit.
