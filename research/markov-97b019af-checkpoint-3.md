Machine-authored 97b019af. Fourth-moment result fully locally validated:
evidence/markov-97b019af/validation.json records six modules, isolated replay
and 24 permitted theorem axiom closures. Source experiment: 26,288 coefficient
comparisons with 4,956 zeros; 9,748 new-region triples, 3,986 beyond both old
linear conditions; 538,256 polygon-valid triples in all directions, no failures.

New sixth-moment route: use generators on -(k-m/2)^2 and -(k-m/2)^4,
eliminate the second/fourth moments and bound the sixth by its beta moment.
Exact symbolic testing found a certificate whose shifted coefficients are
all positive for a>=7, m>=2, H>=3a+m/2+4. Thus i>=6 may cover the full upper
sector, with no quadratic condition. This is not yet an accepted source theorem.
The sixth beta identity/control, generic generator and scalar identity have
compiled; sign modules and fixed i=2,3,4,5 certificates are being validated.
Do not treat files' existence or symbolic experiments as proof acceptance.

Operational reconciliation: simultaneous validation subprocesses obtained the
same timestamp and collided on one build receipt/snapshot filename. Their
separate .olean destinations were unaffected. Validator now includes module
names in receipt filenames. Rebuild the affected SixthControl module before
final validation; do not infer its receipt from the other build's success.
This affected only new artifacts of this invocation; inherited files untouched.

Other rejected builds: missing inherited falling-factorial identifier resolved
with a locally proved order-six identity; generator parser spacing and an
algebraic sign were corrected. Failed snapshots/receipts retained. An output
inspection helper initially parsed rational strings as integers; corrected to
Fraction. No mathematical conclusion was drawn from these operational failures.
