# Shifted source and universal bounds checkpoint

Machine-authored e108e0e26f6d456c97155a7914deaabe. Full root remains open.

MarkovCentralSourceME10 now compiles. Its formula is exact for all h,k>=0
with q=2k+h+[r] positive and all physical coefficient columns c+3. Here [r]
is 1 for the true residue and 0 for false. T=q+k. The template is the short sum

  sum_l C(c+l,c) C(h+2c+4,c+3-l) [C(T,c+l)+4 C(T+1,c+l+2)].

The correction is correctionShortME10 (h+[r]) k c r. No signed offset is
truncated. Every still-open central row is represented with h<=3. Source path
and polygon attachments compile. The old x offset is exactly h-4.

Compiled shifted moment/deficit modules and a new centered scalar certificate
prove the weak template margin for c>=10 and T>=c+3. The complete correction
has a proved relative bound 3^(c+2)*correction <=24*template. The factor24
accounts for a near-center binomial comparison that did not satisfy the older
factor21 proof's hypotheses. The shifted final nonzero triple is also proved
strictly log-concave, for all natural h and c, by exact scalar algebra.

The combined high-column theorem and exact root residual are still being
checked. Their drafts must not be assumed proved before matching receipts.
Joint replay and permitted-axiom auditing of this run have not yet occurred.

Finite experiment central-experiment.json passed 7,016 coefficient comparisons
retaining 645 zeros, 6,586 raw gaps, 7,016 relative bounds, 3,789 weak margins,
and 590,991 polygon-valid triples in all directions on 79 source polynomials.
These are finite exact experiments, not universal proof evidence.
