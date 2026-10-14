# Worker 000054 formula audit

Request `e27336bcd7374c768840a75b2276fcb8`. Static, read-only mathematical audit of the five requested kernel/binomial/shape modules, accompanying documents, and existing finite/symbolic artifacts. No experiment reruns, source imports or edits, Lean commands, proposer contact, or successor interaction. Only this report and adjacent input hashes were written. Compilation, replay, provenance collision, and the quintic/band/interior modules are audited separately.

No formula discrepancy was found in this scope. The important precision is that “17 terms” means 17 indexed summands of the core kernel, plus the separate two-run correction; it does not mean 17 distinct nonzero specialized monomials.

## Run kernels and parameters

The univariate X in these modules indexes the original coefficient exponent j after extracting the excess slice; it is the variable of `lowerH487`, `runCOneBF`, and `runDTwoBF`. Put d=1-X and z=X^(n+1). The four run identities state, for every natural n including 0,

- d² H_n = h(n,X,z);
- d³ C_n = c(n,X,z);
- 2d⁴ D_n = e(n,X,z);
- 2d⁴ K_n = e(n,X,z)+2d c(n,X,z), with K_n=C_n+D_n.

They are ordinary polynomial identities proved in the source by induction from the actual scalar recurrences; no numerical matching hypothesis appears. The factors 2 and powers of 1-X clear formulas without dividing by an evaluated coefficient or specializing X=1. The script's historical `kernels.json` status says “not yet Lean proofs”; later theorem status is determined by the separate module receipts, not that historical candidate label.

For source transfer the path is exactly `true^n ++ false :: rest`. Let c=(frame rest).mid.b and r=(frame rest).mid.a. The full source labels are a=cn+r and b=c(n+1)+r, so c=b-a, c>=2, and 0<r<c. Every path containing a false letter has this form. All-true/Pell paths and the endpoint fractions 0/1,1/1 are outside these source identities' scope and are handled separately elsewhere.

The auxiliary q is `(2*r-c : ℕ)`, natural subtraction **before casting**, hence max(2r-c,0). This is not the potentially negative integer 2r-c. By contrast, c-r inside the polynomial kernels is ordinary ring subtraction. The abstract compressed/kernel identities quantify over all natural n,c,r, even parameter values not realized by sources; the actual source claims use frame/path hypotheses, not merely arbitrary counts.

## Cleared second slice and two-run term

`secondCompressed446 n c r` represents **twice** the raw second-excess slice for the source path above. The reviewed identity is

`(1-X)^4 secondCompressed = secondKernel(n,c,r,q,X,X^(n+1)) + [c=2]·2X^(2n+3)(1-X)^4`.

The source formula requires natural i,j and i+j=a+2. It imposes no polygon or nonzero-coefficient assumption. The whole-coefficient factor 2 is uniform, not factorial/binomial normalization of the target.

The correction is essential and separate from the core kernel. After formal inversion it contributes exactly **2 when c=2 and j=2n+3**, and zero otherwise. In an actual source c=2 means the rest label is 1/2, so r=1 and the full source is (2n+1)/(2n+3). The correction is therefore raw +1 at i=0 on this second slice. It is not a Pell term, and c=2 does not mean the full source denominator is 2. Neither q=0 nor the c=2 case removes it.

## What the 17-term formula asserts

The group indices are exactly

| Layer s | k values | Specialized exponents |
|---|---|---|
| 0 | 0..6 | 0..6 |
| 1 | 1..5 | n+2..n+6 |
| 2 | 1..5 | 2n+3..2n+7 |

Each contributes `a_sk(n,c,r,q) X^(s(n+1)+k)` to the core kernel and `a_sk B(j,s(n+1)+k)` to the inverted coefficient. All 17 coefficient-expression strings in `sparse-kernel.json` exactly match their current Lean definitions, ignoring whitespace. Some coefficients can be negative or zero. Exponents overlap for small n (n=0..4), so summands must be added rather than treated as separate support points. The full cleared numerator additionally contains the c=2 correction times (1-X)^4.

The shift function is

`B(j,k)=choose(j-k+3,3)` if k<=j, and 0 otherwise.

The guard precedes natural subtraction, so j<k is not accidentally converted into choose(3,3)=1. The formal power-series inverse of (1-X)^4 has coefficients choose(j+3,3). `coeff_of_fourth_differenceE273` applies that inverse using a finite coefficient antidiagonal, requiring only the polynomial identity `(1-X)^4 p=q`. There is no analytic convergence assumption.

Consequently `secondCompressed_explicitE273` is valid for **every natural j**, not only a sampled or positive-support interval. `source_second_explicitE273` identifies it with 2A_(i,j) under the stated source path and slice condition. There is no hardcoded tail cutoff in `secondExplicit`; zero coefficients beyond the polynomial's support are retained through exact cancellation of the shifted-binomial summands. The expression alone is not a termwise positivity or LC certificate.

## Binomial shape guards

`choose_three_productE273` proves the standard product formula for d>=0. `chooseShift_polynomialE273` extends it precisely to k<=j+3:

`6B(j,k)=(j-k+1)(j-k+2)(j-k+3)` in integers.

For k=j+1,j+2,j+3 one factor is zero, agreeing with the guarded binomial. The formula is **not** asserted for k>j+3; those indices use the separate zero lemma. Thus the first three zero positions are handled exactly rather than by unguarded natural subtraction.

The abstract shape identities are:

- 3*secondExplicit = lowerShape for **3<=j<=n**;
- 3*secondExplicit = 8*upperShape(c,r,2n+2-j) for **n+3<=j<=2n+2**.

Their source versions multiply the actual coefficient by **6**, since secondExplicit=2A. The upper shape coordinate is an integer subtraction; the stated range ensures 0<=2n+2-j<=n-1. The lower interval is empty for n<3; the upper interval is empty for n=0. The identities do not bridge j=0,1,2,n+1,n+2 or j>=2n+3 as a combined general claim.

In the lower interval all layers s=1,2 vanish by their shift guards. In the upper interval layer s=2 vanishes; the applicable s=0,1 terms are converted to cubic products, including their allowed zero positions. Both intervals exclude j=2n+3, so the c=2 correction is shown zero **at those positions**, not dropped globally. The source shape theorems use actual rest paths and all natural i,j satisfying the slice equality; they neither substitute a virtual polygon nor filter zero coefficients.

## Existing finite parameter check

`experiment_e273.py` covers n=0..21, c=2..21, r=1..c-1: **4,620 parameter triples**. There is no coprimality/source-path condition. For each tuple it compares j=0..2n+7, including zero lookups, and tests adjacent starts j=0..2n+5. The saved counts match the loop arithmetic: **133,980 coefficient comparisons** and **124,740 adjacent comparisons**, with no saved failures.

The reference side is the inherited Python compressed-envelope formula, doubled and then given the same explicit c=2 correction. The other side evaluates the JSON sparse polynomials and guarded binomials. This is a finite Python-versus-Python algebra check, not a new family of source witnesses or a run of the compiled Lean theorem. Including the correction on both sides checks formula consistency with it retained; it does not independently derive the correction's origin or value. No nonnegativity assertion is separately made for every tested coefficient, and no infinite tail is exhaustively scanned.

## Transition candidates and tail paragraph

The script/artifact agree on seven starts: 0,1,2,n-1,n,n+1,n+2, with n>=5. For such n the later interior theorem's stated triple-start regions are 3..n-2 and n+3..2n. Their complement is exactly those seven starts plus the final region beginning at 2n+1, as the prose says. Small n=2,3,4 remain outside that seven-candidate regime.

Static parsing of every saved `gap_expression` confirms **75 monomials, all strictly positive integer coefficients**, after n=t+5,c=u+v+2,r=u+1. The lists of negative terms are empty. These are stored symbolic expansions; this audit did not rerun or independently re-expand them. The script builds **six times the doubled coefficient**, so its gap is 36 times the doubled-coefficient gap (144 times the raw source gap if coefficient identification holds). This is a uniform positive factor, not an index-dependent normalization.

For n>=5 the candidate coefficient indices stop at n+4, below the s=2 layer and the two-run correction, so the script's use of q=0 in these expressions does not omit an active q/correction contribution there. The artifact and prose explicitly mark the candidates as lacking new Lean coefficient-gap/inequality proofs; the five reviewed modules do not assert those transition LC results.

The final paragraph's first two doubled tail values, at j=2n+1 and 2n+2 for n>=2, agree with the upper shape at its coordinates 1 and 0: `32r(c+r)-48r+8c` and `16r^2`. The displayed final entry `8q+[c=2]2` is consistent with the highest kernel coefficient sparse25=8q and the separate correction, at j=2n+3. That index is outside the upper-shape range; the prose correctly labels its explicit source-tail bridge as not a newly established theorem. No proof direction from that paragraph is adopted or supplied here.

The scope documents correctly leave full second-slice LC and the root unresolved. Apart from the “17 terms” precision above, no numerical, indexing, factor, or formula mismatch was identified in this static subaudit. Accepted proof/replay scope remains governed by the parent's provenance audit.
