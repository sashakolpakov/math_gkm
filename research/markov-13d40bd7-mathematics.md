# Request 13d40bd7: third horizontal row

The full pinned Conjecture63 remains unresolved; completion is null. This worker
changed direction from the inherited diagonal slices to horizontal row j=3.
The source-bound validation inventory is authoritative about accepted builds.

For a>=2 and b>=7 define q=(2a-b)_+, t=min(b-a,(3a-b)_+),
z=(3a-2b)_+. The exact source identity proved by horizontal_third_formulaM13D is

    6 [v^3]P(u,v) = u^(a-2) (1+u)^(b-7) Q(u),

where Q has ascending coefficients

    24z,
    24t+(72a-120)q,
    27a^3-18a^2+21a-6+24(a+b-7)q,
    27a^3+27a^2b-114a^2+3ab+33a+6b-18,
    9a^3+18a^2b-54a^2+9ab^2-51ab+87a+3b^2-3b-18,
    (a+b-1)(a+b-2)(a+b-3).

Thirteen polynomial charts prove nonnegativity of all six coefficients and
four adjacent log-concavity gaps. Natural parameter coverage is exhaustive,
including the a=2 boundary. Interval support handles both possible initial
zeros. CrossLC and multiplication by (1+u)^(b-7) transport these inequalities.
No raw coefficient is individually normalized or divided out.

The source derivation is algebraic: evaluate u=x>0, conjugate both literal
Cohn matrices to a common constant projection, and divide their scalar factors.
The checked source trace retains x^a(1+x)^b and (1+x+v). Generic local cyclic
second and third moments give D,K,L using exact source pattern counts q,t,z.
Compact rational moment formulas yield Q after denominator clearing. Equality
on positive real x yields a polynomial identity; injectivity of integer-to-real
coefficient mapping returns the raw integer identity. The final assembly is
MarkovHorizontalThirdSourceM13D. Its horizontal_third_rawM13D proves the raw
row inequality for every natural i. Consult validation.json for replay and audits.

Exact finite experiments: 6,702 parameter seeds; 444 literal source fractions
with b from 7 through 40; 20,536 coefficient identities, 9,127 zero positions,
10,521 polygon-valid horizontal triples. All passed. These are experiments,
not substitutes for the universal source identity or the pinned root.

The interrupted previous worker was reconciled against 328 artifact hashes and
310 raw events. All 58 inherited mathematical modules now have successful replay
coverage; 402 inherited named axiom closures use only permitted axioms. No
unfinished old side effect was blindly replayed. Inherited compiled imports
were reused; this is not a fresh rebuild of the entire source dependency tree.

Failed compiler attempts and denied capabilities are retained in evidence.
MarkovHorizontalMomentEvalM13D and MarkovHorizontalScaledDM13D are failed
superseded candidates with duplicate declaration names; do not import them
alongside the successful compact MarkovHorizontalScaledM13D.

All seven correspondence obligations and remaining scope are discussed in
markov-13d40bd7-correspondence.md. Other horizontal rows, vertical interiors,
higher diagonal slices, and universal root closure remain open.
