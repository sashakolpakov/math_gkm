# Second vertical column: source family and a uniform integral seed

Machine-authored research request de6168c62b1546b38a157faf8594af21.
Full pinned MathGKM.Markov.Conjecture63 remains unresolved. Source-bound
validation receipts are in evidence/markov-de6168c6/validation.json. These are
local checks, not the required independent completion audit. No novelty claim.

## Completed infinite family

For every actual source with a<b<2a, every natural j satisfies

    A(2,j) A(2,j+2) <= A(2,j+1)^2.

This is vertical_second_near_oneMDE6 in MarkovVerticalSecondRightMDE6.lean.
There is no bound on a, b, path length, or j. All zeros are retained. For a>=5
put r=b-a and s=max(2r-a,0). The exact source identity is

    2 [u^2]P = v^(b-3) (1+v)^(a-5) Q(a,r,s;v),

where Q's six ascending coefficients are

    8s,
    16r^2,
    24r^2+24ar+8a-40r,
    17r^2+34ar+9a^2-45r-5a+2,
    6r^2+18ar+12a^2-16r-16a+4,
    r^2+4ar+4a^2-3r-6a+2.

The identity is vertical_second_formulaMDE6. Seed CrossLC is proved for every
natural 1<=r<a, using the two charts a=2(x+1)+y,r=x+1 and
a=2(x+1)+y,r=x+1+y, x,y>=0. All coefficient bounds and adjacent gaps reduce
to nonnegative polynomial expressions. The finite interval-support theorem
upgrades these bounds to CrossLC without removing the possible leading zero.
Pascal smoothing and a monomial shift transport CrossLC to raw coefficients.
The factor 2 is common to the entire polynomial, not a coefficient-dependent
normalization. The five cases 2/3,3/4,3/5,4/5,4/7 are checked by literal
recurrence expansion and ordinary kernel arithmetic. Reducedness and path
injectivity prove that these exhaust the remaining small numerators.

## Actual source restriction for all vertical runs

For any n and predecessor path w,

    sourceWord(false^n ++ true::w)
      = blockSub n (map not (sourceWord w)).

This is source_vertical_blocksMDE6. With q=n+1, the blocks represent A^q C
and A^(q+1) C in the positive vertical gauge inherited from worker 113. The
resulting indices satisfy a=b_old and b=a*q+r, r=b_old-a_old. Thus the block
choices are the complemented word of an actual predecessor, not arbitrary
binary choices. The inherited general source trace-moment theorem applies
to the two normalized blocks with their roles interchanged. Its exact source
counts yield the long-long count s=max(2r-a,0).

The new integral trace identity is T=(1+(1+v)Z)E, where E is the inherited
positive vertical residual functional. Normalize each A^q C by v^q and swap
the two coordinates to obtain the common constant projection diag(0,1).
All-run shape and trace transport are checked in
MarkovVerticalGeneralProjectionMDE6.lean. MarkovVerticalRunJetsMDE6.lean
proves the full block symmetry c=v*b and the exact normalized first-jet
difference f_(q+1)-f_q=2/v^(q+1), at nonzero real evaluations.

Writing alpha_q,beta_q,f_q for normalized a-entry jets of orders one,two
and b-entry jet of order one, the source identity is

    2 R_2(v) = v^b [D^2+K-2(1+v)D+2(1+v)^2],
    D=(a-r)alpha_q+r alpha_(q+1),
    K=(a-r)(2beta_q-alpha_q^2)+r(2beta_(q+1)-alpha_(q+1)^2)
      +2v[a f_q^2+2r f_q delta+s delta^2], delta=2/v^(q+1).

vertical_second_candidate_bridgeMDE6 proves this for all n and all actual
predecessors of denominator at least four, at every nonzero real evaluation.
It discharges the source/count bridge missing from worker 113's candidate.
It does not assert log-concavity.

## Integral polynomial factor for every run

Let A_n,B_n,F_n be the unnormalized integer-polynomial jets of A^(n+1)C
in v: upper-left orders one and two, upper-right order one. Define t=v^(n+1),
Dnum=(a-r)v A_n+r A_(n+1), and the integral polynomial

    N = Dnum^2 -(a-r)v^2 A_n^2-r A_(n+1)^2
      +2tv[(a-r)v B_n+r B_(n+1)]
      +2v[a v^2 F_n^2+4rv F_n+4s]
      -2(1+v)tv Dnum+2(1+v)^2 t^2 v^2.

This is vNseedMDE6. Clearing denominators and using equality on all positive
real evaluations proves the integer-polynomial identity

    2 [u^2]P = v^(b-(2n+4)) (1+v)^(a-5) N(n,a,r,s;v).

vertical_second_all_run_factorMDE6 proves this for every n and actual
predecessor of denominator at least five. vertical_second_source_factorMDE6
proves that every actual source with a>=5 has such a decomposition. The
exponents are nonnegative under these hypotheses; no truncated negative
exponent is used. N retains one uniform leading zero relative to worker
113's Q_q. vertical_second_of_seedMDE6 transports the explicitly stated
CrossLC hypothesis on N to raw vertical log-concavity. General CrossLC of N
is still open. Small a=2,3,4 outside the completed a<b<2a region also remain.

## Checked scalar recurrences and closed jet numerators

With h=1+v, the checked transfer matrix has trace h(1+hZ) and determinant v.
Its Cayley identity gives

    A_(n+2)=h A_(n+1)+h^2 v^(n+2)-v A_n,
    B_(n+2)=h B_(n+1)+h^2 A_(n+1)-v B_n,
    F_(n+2)=h F_(n+1)-v F_n.

All six initial polynomials are checked in vJet_initialMDE6. Induction then
proves vJet_closedMDE6: for q=n+1,

    (1-v)^2 A_n = 4v+v^q AP(q),
    2(1-v)^4 B_n = BL(q)+v^q BP(q),
    (1-v) F_n = 2-v^q-v^(q+1).

AP, BL and BP are explicit polynomials in MarkovVerticalJetClosedMDE6.lean.
They avoid divisions and remain true at v=1. They are actual jet identities,
not numerical interpolations taken as premises.

The exact symbolic calculation sparse_vertical_de6168c6.py suggests
(1-v)^4 N=H0+v^q H1+v^(2q) H2, with degrees 5,6,8 in v. The coefficient
tables are in sparse-candidate.json. This expanded sparse identity has not
been admitted as a Lean theorem in this run. It is a promising route to
piecewise cubic coefficient formulas and their LC inequalities, including
overlap cases and all zero positions. The preceding source and jet bridges
are checked independently of this remaining suggestion.

## Experiments and residual scope

The q=1 recurrence experiment checked 1,960 reduced fractions with 5<=a<=80,
269,310 coefficient identities, and 102,432 polygon-valid raw inequalities,
retaining 162,958 raw zero positions. A separate all-run experiment generated
the jets by their scalar recurrence and compared the integral N identity on
1,800 fractions with 1<=q<=20,5<=a<=17: 262,160 coefficient identities and
53,860 polygon-valid raw inequalities, retaining 218,060 zeros. Both also
tested the corresponding finite seed inequalities. No failures were observed;
these experiments are not universal proofs.

root_iff_interiorMDE6 proves Conjecture63 iff InteriorCore63MDE6. The residual
still includes all horizontal j>=5, vertical i>=3, vertical i=2 with 2a<=b,
and inherited deep diagonal regions, with the original polygon guards. Both
endpoints are accounted for by the inherited exact root equivalence. The
residual has not been proved. Construction and Agoh were not changed.
