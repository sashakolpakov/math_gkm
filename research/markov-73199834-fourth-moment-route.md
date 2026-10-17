# Fourth-moment route: exact certificate, incomplete attachment

Machine-authored live research 73199834. This is revisable advice, not a
resolution of the upper sector or the pinned root. Consult validation.json
for the final accepted module list.

Write a=i+1, H=d+2i+9, m for the antidiagonal index, and
W(k)=steinPairM208(d,i,m,k)*steinCutM208(r,m,k). Let M=sum W,
V=sum W(k)(k-m/2)^2, K=sum W(k)(k-m/2)^4, L=sum W(k)Lp(k),
and S=sum W(k)steinScalarM208(a,H,k,m-k).

With the inherited E,C0,Cp and C=8a+14, define

    D = C*m^2/2-E,
    A = (a+m/2)(H+m/2)*m*(H-a-3+m/2),
    B = 16(2a+1)(2a+3),
    N = m(2a+m)[3m(2a+m)-4a],
    J = (C0+Cp*m^2/4)*D*B-Cp*(A*B+C*N).

The exact proposed certificate is

    B*D*(4a+7)*S + B[2(a+2)D+Cp]*L + Cp*C*(B*K-N*M) = J*M.

The pointwise identity and a generic finite-sum consequence are in
MarkovTopFourthMomentConditionalM731. The hypotheses L<=0,
B*K<=N*M, D>0 and Cp>=0 are explicit. Check the final validation receipt;
the source's existence alone does not establish its validity.

MarkovTopFourthMomentCertificateM731 proves J>0 for

    a>=3, m>=2, 4(m-2)<=(a-3)^2, 2H>=6a+m+8.

Its exact ring certificate factors out a*m*(m-1). After a=x+3,m=y+2,
H=3a+m/2+4+z, twice the remaining polynomial is R+(x^2-4y)Q,
where R has strictly positive constant and nonnegative coefficients and
Q has nonnegative coefficients. The generator checks this identity exactly;
Lean checks the resulting equality and positivity. No asymptotics are needed
for this certificate.

The following attachment work remains:

1. Prove the symmetric beta-binomial fourth central moment identity
   B*sum W0(k)(k-m/2)^4=N*sum W0(k), for
   W0(k)=binom(i+k,i)binom(i+m-k,i). The inherited normalized factorial
   moments through order four are available in MarkovTopBetaClearedMDCB.
2. Use radial covariance with the inward actual likelihood and the inward
   function -(k-m/2)^4 to derive B*K<=N*M. This includes the modified cut
   endpoints and zeros. No Gaussian approximation is legitimate here.
3. Prove D>0 and Cp>=0 on the stated domain. Exact shifted polynomial
   experiments gave 16 and 28 positive terms, respectively; these two
   sign bridges have not been formalized in this run.
4. Attach L<=0 using the inherited exact cut summation-by-parts identity
   and nonnegative energy. Mass positivity is also inherited.
5. Sum the groups, clear the positive scales, and transport to raw source
   coefficients with polygon checks. Only then may the new region be
   removed from the exact residual.

If these bridges succeed, a sufficient all-group condition would be
i>=2 and 8(r-1)<=(i-2)^2, with i+r<=d+2. This is a proposed consequence,
not an accepted raw-source theorem. The conditional statement does not
close the entire remaining wedge, even after attachment.

The exact experiment checked the beta fourth-moment identity and actual
moment bound in 210 cases; 88 satisfied the candidate quadratic condition,
including 47 beyond a>=2m. All passed. These are finite tests only:
evidence/markov-73199834/fourth-moment-experiment.json.

The separate scaling calculation explains why the actual q weight matters.
For a=alpha*R, m=2u*R, H=g*R, a heuristic local-variance calculation suggests
the leading actual numerator u(g+u)(g-2alpha)^2. Its factorization and sign
are formally proved in MarkovTopScalingCertificateM731; the limit argument
and uniform error control are not. The analogous q-free sign is
1-2u^2+alpha(3-4u) at g=3alpha+1, and it can be negative. Exact finite
integer sums already reject the q-free route, without relying on this heuristic.
