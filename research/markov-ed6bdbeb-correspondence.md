# Local correspondence and scope statement

Machine-authored request ed6bdbeb853b47bca338e8b2e6f2cdcd. This document is not
the separate independent hash-bound completion audit required by the contract.

The pinned root is MathGKM.Markov.Conjecture63 in MathGKM/Markov.lean, SHA256
8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe. It remains
unchanged. The [published source](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was retrieved through the hosted web tool, including its seeds, numerator
recurrence and Definitions 6.1–6.2 / Conjecture 6.3. The independent target,
residual-scope and mathematical reviews were read. Their historical source
snapshots are not represented as a fresh independent audit of this run.

Coverage: the new source formula covers every numerator-three path, both
residues and unbounded q>=1, through source_three_rawM9E2. It neither bounds
denominators nor proves the remaining numerator>=4 family. General rational
coverage is inherited, not freshly rebuilt or independently audited here.

Source family: the formal generating series used is the previously proved
series of the actual recurrence. The new proof extracts its correction; it
does not introduce an arbitrary positive coefficient family as a substitute.
Path wrappers explicitly transport the identities and raw inequalities. The
global source/Laurent correspondence remains an inherited component.

Homogeneity and coefficients: U,V are the literal squared variables of the
integer numerator with w=1. Transposition interchanges extraction order, and
rescaling extracts the exact known power v^(q+1) before taking the remaining
coefficient. No factorial/binomial normalization or coefficient deletion is
used. Integer-to-real casts preserve the exact inequalities. Homogeneous
degree and the omitted coordinate are inherited; the degree guard remains
explicit before every natural subtraction that represents a negative tail.

Polygon: the root's InPolygon predicate is unchanged. The new raw inequalities
hold on all indices in the specified regions, hence on their polygon-valid
triples. The source-to-Newton-polygon bridge is inherited and not rebuilt here.
The unsigned-loss diagnostic proves membership of each of its three points.

Directions, zeros and endpoints: the new raw results concern the vertical and
constant-i+j diagonal directions. Previously proved horizontal results remain
in the exact root reduction. Every correction zero boundary, source degree tail,
and crossing triple is retained. Small-column diagonal cases remain explicit
in ThreeCorrectionSupportMED6. Both endpoint clauses are retained in Conjecture63
and inherited reductions; no endpoint is redefined or silently removed.

Assumptions: selected new sources use ordinary Lean proofs, with no sorry,
admit, custom axiom or native_decide. Consult validation.json for actual build,
isolated replay and theorem-closure receipts. The operational replay checker is
unsafe Lean IO, not a mathematical declaration or axiom. The permitted theorem
closure is propext, Classical.choice and Quot.sound only.

Proof scope: root_iff_correction_supportMED6 is an equivalence to two OPEN
residuals, not a closed root theorem. The signed-absorption lemmas retain their
unproved mathematical hypotheses explicitly. Experiments are finite evidence.
Inherited compiled imports were reused; no fresh whole-source completion rebuild
or independent hash-bound English/source audit occurred. Completion is null.
