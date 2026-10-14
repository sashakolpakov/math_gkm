# Centered horizontal fibers and LC-positivity

Machine-authored research, request 65c4dfb883e140b0a62fddbffe247137.
The full pinned Conjecture63 remains open. No historical novelty is claimed.
Formal validation status is recorded separately in the final validation manifest.

Use the inherited, source-connected horizontal summands

    H(a,j,s,q) = choose(a-q,s) choose(s+q-1,q) choose(2s,j-q), s>0.

Out-of-range terms are zero. The inherited Lean horizontalTerm uses s-1.
For a fixed combined index k, pair the terms q and k-q in the coefficient of
F_s(t)^2-F_(s-1)(t)F_(s+1)(t). For q<k/2 the signed layer is

    D_q = 2 H_s(q)H_s(k-q)
          -H_(s-1)(q)H_(s+1)(k-q)-H_(s+1)(q)H_(s-1)(k-q).

For 2q=k use H_s(q)^2-H_(s-1)(q)H_(s+1)(q). Retain zeros.
The candidate condition is that every centered tail sum, from r to floor(k/2),
is nonnegative. This is equivalent, by grouping the two convolution orders,
to coefficientwise log-concavity after cutting off every q<r in each F_s.
The exact unsymmetrized convolution identity is formalized in
MarkovTruncatedFiber65c4; the regrouping equivalence in this paragraph is an
elementary paper derivation, not claimed as a separately checked Lean theorem.

This is the LC-positivity framework of Wang--Yeh. Their finite Abel argument
weights signed layers by a nonnegative increasing sequence. For a nonnegative
CrossLC sequence f, the centered products f(q)f(k-q) increase up to the center.
MarkovAbel65c4 checks this finite-sum transfer, including zero weights. Its tail
inequalities remain explicit hypotheses. They are NOT established for all H.
The source transfer from the new truncated-fiber proposition to every Pell
horizontal polygon triple is formalized using the inherited exact bridge.
It still has the truncated-fiber proposition as an unproved premise.

## Exact experiments

pair-probe.json covers all a=3,...,35, 0<=j<=2a, 1<=s<a and
0<=k<=2(a-s). There are 286187 nonzero fibers. All tested centered tails
are nonnegative; after removing zero layers the signs never change from
positive back to negative. At a=3,j=2,s=2,k=2, the layers are [-15,64].
Thus nonnegativity of individual layers is false, while their sum is 49.
The concrete layers and all cutoffs of that fiber are checked in Lean.

pair-random.json records seed 6504, 1500 trials and 703 nonzero fibers with
a<=499, again without a centered-tail or sign-order failure. These are finite
exact experiments and supply no universal statement.

pair-polynomial.json makes a different test. For each s=1,...,8, k=0,...,18
and 0<=j<=2(s+1)+k, replace a by s+k+1+X. Every binomial depending on a is
expanded as its falling-factorial polynomial over Q. This shift puts all
q<=k in the ordinary nonnegative-binomial range. All 19080 centered tails
have nonnegative ordinary X coefficients. This is finite symbolic evidence
for a stronger positivity candidate. It leaves arbitrary s,k and the region
a<s+k+1 unresolved. It is not a proof of universal coefficient positivity.

## A uniform refined fiber

For a=m+3, j=2, center excess s=2 and combined index k=2, write O(m) for
the outer layer and C(m) for the center layer. Direct binomial algebra gives

    2(O(m)+C(m)) = 31m^4+199m^3+435m^2+365m+98.

C(m)>=0 follows from the already proved individual-summand inequality.
Hence both centered tails are nonnegative for every m>=0. For any real
x,z>=0 and xz<=y^2, O(m)xz+C(m)y^2>=0. This is an unbounded parameter
certificate for ONE refined fiber, not for all fibers or the Markov goal.
MarkovFiberPolynomial65c4 checks the identity, positivity and weighted
inequality. It compiled and kernel-replayed successfully; the source hashes
and receipts are in the validation manifest. Its imports reuse inherited
compiled artifacts, rather than a fresh whole-source rebuild.

## Sources and applicability

[Wang--Yeh, Log-concavity and LC-positivity](https://arxiv.org/html/math/0504164v7),
Lemma 2.1 and Section 2, supplies the finite Abel framework and interpretation
of truncated coefficient arrays. Our array also depends on fixed a and j;
their results do not automatically prove its required tail inequalities.

[Chen--Sun, fan coordinates of type A_n](https://arxiv.org/html/2610.09312v1)
treats laminar interval products and the particular exponent map
L(k)=(k1+k2,...,kn+k(n+1)). No identification of this map with the pinned
Markov coefficient fibers was obtained. Its theorem is not imported or applied.

The [published Markov target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was retrieved live. No source statement is introduced as a Lean axiom.
