# Partial correspondence and exact remaining scope

Machine-authored request 50c262c5afce4cf0a717cbef7a352e92. This is not an independent
completion audit. The unchanged pinned root is MathGKM.Markov.Conjecture63,
SHA256 8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe (the authoritative
exact file hash is recorded and checked in final-bindings.json).

The primary source is [Evans–Veselov–Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (5), (7)–(11), Definitions 6.1–6.2 and Conjecture 6.3. Hosted source
retrieval succeeded. Required independent target, residual and mathematical audits
were read. No external assertion has been installed as a new Lean axiom.

## Coverage and source family

The root remains universal over arbitrary finite paths and the two endpoints.
The inherited source_three_rawM9E2 identifies every numerator-three path with
q>=1 and one of B=3q+1,B=3q+2. The new proofs use no finite denominator bound.
The actual correction recurrence is extended through j=q-1 and retained in full.
Its contribution is removed only after a proved degree bound makes its specific
coefficient zero. A new template identity is then proved by exact recurrence and
finite-sum transformations, not inferred from data.

The source bridge in MarkovMiddleTriangleModelM50C requires i>=3, q<=j+1,
B<i+j+q, i+j<=B+2 and B+2<=i+2j. It does not assert a source identity on the
remaining triangle. The further two-kernel global formula is conjectural and
explicitly excluded from every proof and completion claim.

## Homogeneity and coefficients

The root extracts raw integer coefficients of u=x^2 and v=y^2 with w=z^2 set to
one. The inherited fixed-degree interpretation recovers exponent B+2-i-j for
numerator three. The new proofs require total-degree bounds before natural
subtraction; outside that bound they use the actual degree-zero theorem.
Real casts occur in exact identities and are transported back to integer
inequalities. There is no factorial, binomial, or other coefficient normalization.
No potentially zero source coefficient is divided by.

## Polygon and directions, zeros and endpoints

The unchanged InPolygon predicate supplies the source bounds. The proved
inequalities hold for all natural indices in their stated regions; the path and
polygon wrappers in MarkovMiddleTrianglePathM50C attach them to the literal root
triples. The diagonal is (i,j+2),(i+1,j+1),(i+2,j). Inequalities are non-strict,
and all support zeros, degree tails, and crossing triples remain present.
The zeroth diagonal start is proved using actual polygon exclusion or the top
three diagonals. Endpoints remain in the inherited root equivalence chain.

The full inherited rational coverage, source/Laurent, homogeneous coefficient,
and Newton polygon correspondence chains are reused, not independently rebuilt
or certified afresh. No new final source/English audit discharging all these
obligations is claimed. The old audits identify the distinctions that must be
checked for eventual completion; this local result cannot replace that review.

## Assumptions and proof scope

Only pinned Lean 4.32.2 and read-only dependencies are used. Every submitted
mathematical theorem is audited for the permitted standard axiom closure.
Ordinary kernel computation is permitted; no admitted proof, custom axiom or
native evaluation axiom is used. The replay program is operational evidence,
not a theorem asserting its own soundness. Inherited compiled imports are reused.

root_iff_triangleM50C states Conjecture63 iff ThreeTriangleResidualM50C and
OtherFourM9E2. Both residuals remain open. The new all-row consequence closes
vertical columns i>=q+delta+4 and diagonal starts i>=q+delta+2 in numerator three,
not all coefficients of that family and not all larger numerators. The new
source-attached mixed-gap diagnostic refutes a proposed gluing shortcut while
the full raw inequalities at its witness remain strictly true.

No fresh whole-source rebuild, independent hash-bound completion audit, or proof
of the exact root or its negation occurred. Completion is null.
