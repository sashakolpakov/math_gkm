# Supervisor monitoring review: interrupted worker 000028

Request: 26ca8e85115d41ff961f5f8dc987b479.

The independent auditor was unavailable because its selected model also returned a capacity error. This note records the supervising session's read-only source and receipt inspection; no new Lean execution, source repair, mathematical advice, or proposer contact occurred.

## Retained results and limits

- MarkovPellLowerSum26ca compiled successfully for its final source hash. right_lower_sum26ca proves a finite raw coefficient sum with 2*s+3 summands for the repeated-right source, assuming s<=n, i+j=n+s+2, i>=s+1 and j>=2*s+2. These region assumptions remain explicit.
- MarkovPellLowerFormula26ca compiled successfully for its final source hash. It specializes the exact identity to s=0,1,2, with respective coordinate bounds (i>=1,j>=2), (i>=2,j>=4), and (i>=3,j>=6). This gives exact coefficient polynomials, not new log-concavity inequalities.
- No successful separate kernel-replay record was present for either module at this inspection.
- MarkovPellLowerLC26ca is an unaccepted draft. Its validation command started in the event log but no completed command/result or successful receipt was present. Do not treat its horizontal/vertical theorem declarations as verified.
- Exact finite scans remain experimental evidence only.
- The worker ended with selected model is at capacity; the host reports missing_or_malformed_report. This is an operational interruption, not an inequality counterexample.

## Observed receipts

- run-1791959937710322000.json: research/MarkovPellLowerSum26ca.lean; returncode=1; current_hash_matches=False; sha256=83df55f33c4ddd46789424dee3d058b9c3231178300d6254e1d18579ffc280ab; kernel_replay=False.
- run-1791960066921400000.json: research/MarkovPellLowerSum26ca.lean; returncode=1; current_hash_matches=False; sha256=adcc77fb937c59d2a7e1aad30d969355e6458011eead5f3b183051ac88f8cb49; kernel_replay=False.
- run-1791960131533347000.json: research/MarkovPellLowerSum26ca.lean; returncode=0; current_hash_matches=True; sha256=96eefeee6b90f9e113bcdecece026d9c35555e52c611a7e275e994158efe6a70; kernel_replay=False.
- run-1791960219876421000.json: research/MarkovPellLowerFormula26ca.lean; returncode=1; current_hash_matches=False; sha256=0d672a69c69fa4cbbb267e30327feeeb20492c8038dbc260b3e164e644aaae48; kernel_replay=False.
- run-1791960269375439000.json: research/MarkovPellLowerFormula26ca.lean; returncode=0; current_hash_matches=True; sha256=e22119248a72d8bedf55f28b3e09254f5c9a3fef9d919de408d6e1f416f1bf89; kernel_replay=False.
