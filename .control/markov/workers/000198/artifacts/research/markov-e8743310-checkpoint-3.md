# Middle closure and top-row checkpoint

Machine-authored e874331060f545c891d1edabfa5a4db3. The complete middle strip,
path transfer, polygon transfer, and root_iff_outside_middleME87 have compiled.
The revised seven-row residual has also compiled after correcting the direction
of the raw-coefficient rewrite in the inherited unaccepted draft.

Top-five polynomial identities, all four nontrivial coefficient gap estimates,
and the quartic zero-tail lemma have compiled. The combined top-five LC module
is being rebuilt after routine proof errors. The two-central-row residual is
still a draft until its own build and later joint replay/audit succeed.

Finite source experiment: 36,504 formula/relative comparisons, retaining 3,806
zeros; 26,364 weak-margin checks; 11,154 lower-column strong-margin checks;
1,103,163 polygon-valid triples across all three directions; no failure.
Actual-moment experiment: 528 centered-variance checks and 210 new-margin cases;
no failure. These are not universal proofs.

The signed-offset extension x=-4,-3,-2,-1 passed 6,303 exact source coefficient
comparisons, retaining 1,292 zeros, with no checked gap failure. It is an
unproved candidate for the remaining central rows, not an accepted Lean bridge.
See evidence/markov-e8743310/central-extension.json and its script.

Failed receipts include the dense certificate timeout, two build timeouts on
small modules, and corrected Lean elaboration errors. Profiling the successful
MiddleClosed build reports only milliseconds in theorem elaboration/checking
despite 142 seconds total elapsed; the dominant operational cost was outside
those profiled phases. No stronger bottleneck attribution is established.

Full root and negation remain open; completion is null. Validation still reuses
inherited compiled imports, and no independent completion audit has occurred.
