"""Finalize this research evidence only; never modifies controller records."""
from pathlib import Path
import hashlib,json
from finish_f88f6a75 import finish
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f88f6a75'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
v=json.loads((O/'validation.json').read_text())
assert len(v['modules'])==18 and v['theorem_closures']==118
c=json.loads((R/'.control/markov/contract.json').read_text())
canon=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert canon=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
bindings=dict(request_id='f88f6a75cab54deb828cd05d7806b3e4',contract_canonical_sha256=canon,
 root_sha256=sha(R/'MathGKM/Markov.lean'),contract_file_sha256=sha(R/'.control/markov/contract.json'),
 toolchain=(R/'lean-toolchain').read_text().strip(),stop_file=(R/'.control/markov/STOP.json').exists(),
 validation_sha256=sha(O/'validation.json'),correspondence_sha256=sha(R/'research/markov-f88f6a75-correspondence.md'),
 independent_completion_audit=False,fresh_whole_source_rebuild=False,completion=None)
(O/'final-bindings.json').write_text(json.dumps(bindings,indent=2))
unaccepted=[str(p.relative_to(R)) for p in (R/'research').glob('*MF88.lean')
 if p.stem not in v['modules'] and not p.stem.startswith(('ReplayIsolated','MarkovAudit'))]
assert not unaccepted,unaccepted
(O/'unaccepted-drafts.json').write_text(json.dumps(dict(unaccepted_current_sources=unaccepted,
 historical_rejected_snapshots='evidence/markov-f88f6a75/failed-build-index.json',
 predecessor_drafts='Unchanged and not promoted by this run'),indent=2))
report=dict(request_id=bindings['request_id'],completion=None,
 summary='Closed every numerator-three horizontal inequality and every lower vertical inequality with j+2<=q. Full pinned Conjecture63 remains unresolved.',
 actions=[
  'Read required documents and audits; reconciled both interrupted workers without replaying completed side effects: evidence/markov-f88f6a75/reconciliation.json.',
  'Compiled and jointly kernel-replayed 18 modules; audited 118 theorem closures using only permitted axioms: evidence/markov-f88f6a75/validation.json.',
  'Verified prior inputs, predecessor artifacts and pinned bindings; see evidence/markov-f88f6a75/last-verification.json and final-bindings.json.'
 ],
 observations=[
  'Proved complete numerator-three horizontal raw log-concavity for every q>=1, both residues and all columns and rows, including zeros, with path/polygon transport: research/MarkovThreeHorizontalMF88.lean.',
  'Proved the exact lower diagonal-convolution representation and all LowerShapeME9C obligations. Consequently every numerator-three lower vertical triple with j+2<=q is closed at every column: research/MarkovLowerDiagonalMF88.lean and research/MarkovLowerVerticalMF88.lean.',
  'Proved Conjecture63 iff ThreeUpperVerticalDiagonalMF88 and OtherFourM9E2. Both residuals remain open: research/MarkovUpperVerticalResidualMF88.lean.',
  'Finite experiments passed 77,964 source coefficient comparisons retaining 1,929 zeros, 1,661,420 polygon-valid triples across all directions, and 72,243 additional lower vertical checks: evidence/markov-f88f6a75/source-experiment.json and lower-source-experiment.json. These are experiments, not proofs.',
  'Kernel-proved two auxiliary positivity-shortcut failures, neither a root refutation: research/MarkovLowerDiagnosticsMF88.lean. Preserved four rejected builds and capability failures: research/markov-f88f6a75-operational.md.',
  'Inherited compiled imports were reused. No fresh whole-source rebuild or independent completion audit occurred: research/markov-f88f6a75-correspondence.md.'
 ],
 agenda=[
  'Investigate ThreeUpperVerticalDiagonalMF88 or OtherFourM9E2; the full numerator-three horizontal direction and lower vertical region are closed. See research/markov-f88f6a75-next.md.',
  'For lower diagonals, investigate parameter variation in the exact ramp-weight convolution. The unrestricted parameter minor fails at t=0; retain that obstruction and all negative mixed terms.',
  'Preserve all remaining families, directions, zeros and endpoints. Completion requires universal proofs, every correspondence bridge, fresh whole-source validation and an independent hash-bound audit.'
 ])
(O/'report.json').write_text(json.dumps(report,indent=2))
(R/'research/markov-f88f6a75-checkpoint-final.md').write_text('''# Final checkpoint

Request f88f6a75cab54deb828cd05d7806b3e4. Full pinned root and exact negation
remain open; completion=null.

18 modules compiled and jointly kernel-replayed; 118 theorem closures use only
permitted axioms. See evidence/markov-f88f6a75/validation.json. Inherited compiled
imports were reused; no fresh whole-source rebuild or independent completion
audit occurred.

Complete numerator-three horizontal raw log-concavity is proved, including
every central row and column. The exact lower convolution closes every
LowerShapeME9C obligation and all lower vertical inequalities with j+2<=q.
The strongest root reduction is root_iff_upper_vertical_diagonalMF88; both
ThreeUpperVerticalDiagonalMF88 and OtherFourM9E2 remain open.

Finite source experiments: 77,964 coefficient comparisons, 1,929 zeros,
1,661,420 polygon-valid triples across all directions, and 72,243 further
lower vertical checks, with no source failure. These are experiments.
Two auxiliary shortcut failures are kernel-proved and do not refute the root.

Four failed build snapshots are preserved; all final mathematical sources are
in the validated bundle. No foreground subprocess remains pending. Read the
mathematics, correspondence, operational and next-action reports before reuse.
''')
finish()
