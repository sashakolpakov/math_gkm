# Research checkpoint

Machine-authored request ffd747f5c7a147069d5bfcaffb3e60e8.
Read MISSION.md and docs/DESIGN.md completely, the exact pinned root, inherited
index, independent target/residual/mathematical audits and latest reports.
Full Conjecture63 is open; ThreeRemainingM1BB and OtherFourM9E2 are retained.
Selected investigation: universal lower-row representation, its source bridge
and coefficient shape. No new theorem or experimental conclusion yet.
The new candidate modules MarkovRowBinomialMFFD, MarkovRowOperatorsMFFD and
MarkovRowRecurrenceMFFD attempt a universal lower-row factorization. They are
now have accepted local builds. source_lower_row_pathMFFD proves the entire
lower source-row factorization for every numerator-three path and every j<=q,
with every raw column coefficient and zero retained. This is a representation
theorem, not a universal inequality. The first build found a reversed linear-combination sign
and a missing conversion from s<j+1 to s<=j; both were corrected. Two parallel
builds timed out at 100 seconds. Sequential builds passed after one further
definitional-equality correction. Kernel replay and axiom audit are pending.
The exact row-shape experiment checked 19,600 adjacent residual triples in
2*j+1<=n<=100, j<=25, with no failure. These are finite tests only. It also
produced candidate positive gap polynomials for H_5(11+d), d>=0; formal
identification, inequalities and source transfer are being attempted.
Update: the identity, CrossLC shape, guarded source transfer, and all q=1..4
small-row inequalities now compile. The small proof uses ordinary decide,
followed by the universal degree-tail theorem, and took about 128 seconds.
An alternative exact full-polynomial candidate was generated while waiting;
it is unused and has not been compiled. The source j=5 wrapper, exact residual,
degree bound and combined replay/audit are still pending.
The proposed fixed rational resolvent matched 31,785 finite coefficients;
its formal generating-function bridge remains unproved. Its broader domain
has negative examples (e.g. n=15,j=14,k=1 gives -22304), so positivity cannot
be asserted outside the intended 2j+1<=n shape domain.
Existing results already cover source horizontal rows 0 through 4; this
investigation must not count those again as new inequalities.
The managed policy denies .scratch, so uniquely named research/evidence paths
are used without attempting that denied access. Two guessed inherited file
names were absent; actual names were found by restricted rg enumeration.

Final validation update: all eleven selected mathematical modules compiled
and passed combined kernel replay; all 43 theorem closures use only permitted
axioms. The source j=5 wrapper, exact residual equivalence and degree bound
are proved. The unused alternative small-polynomial candidate is preserved
in evidence/markov-ffd747f5/unused-small-rows-candidate.lean. Full Conjecture63
and the general residual shape remain unproved. See validation.json and the
final correspondence/operational reports for the precise limits.
