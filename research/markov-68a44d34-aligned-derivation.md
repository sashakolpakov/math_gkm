# Revised alignment: degree minus cut count

Machine-authored derivation, request 68a44d34. This note is not a new Lean
theorem. The exact starting mixed-run count identity is proved in
MarkovCountTransfer68a4; the following reindexing and LC conclusion have
not been assembled in Lean. This concerns constant coefficients only.

For the actual source word B^n A B^(n+1), n>=1, let c(s,d) be the
constant coefficient of its degree-d, s-cut layer. Define

    H_e(t) = sum_s c(s,s+e) t^s.

Put e=d-s. Reindexing the proved count formula gives these expressions:

    e=0:             1+t
    1<=e<n:          t(1+t)^(e-1) [2+(e+1)t]
    e=n:             t(1+t)^(n-1) [3+(n+2)t]
    n<e<=2n+1:       (2n+2-e)t^2(1+t)^(e-1)
    e>2n+1:          0.

Indeed x^s z^d becomes t^s z^(d-s) after setting t=xz in the
count formula. Its repeated-B atom z+xz^2 becomes z(1+t).
The product of two geometric sums has triangular coefficient
min(n,e-1)+1-max(0,e-1-n); this is exactly the multiplicity already
proved in square_diagonal_sum68. The three remaining terms supply the
linear factor at and below the transition e=n.

Each displayed polynomial is a monomial times a binomial power times
a nonnegative linear polynomial. The inherited convolution/Pascal
results therefore suggest an uncomplicated formal LC proof for this
alignment. It is not a full source horizontal proof: recovering a raw
coefficient sums over e, and the coefficients at y>0 remain separate.
The failed fixed-degree triple traverses e=n+2,n+1,n at cuts 4,5,6.
This explains why a successful fixed-e count statement would not
contradict the proved failure of fixed-d source layers.

aligned-counts.json compares the displayed coefficients against the
independent forward count transfer for n=1,...,50 and s<=12. The saved
counts and zero-failure result are finite evidence, not universal proof.
