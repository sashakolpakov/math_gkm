"""Machine-authored final immutable evidence checks; no controller changes."""
from pathlib import Path
import json,hashlib,re
from finish_e8743310 import validate,finish
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-e8743310'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'planned-validation.json').read_text())
v=validate(mods)
records=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
failed={str(p.relative_to(R)):d for p,d in records if d.get('returncode')!=0}
(O/'failed-build-index.json').write_text(json.dumps(failed,indent=2))
extra=[]
for p in (R/'research').glob('*ME87.lean'):
 if p.stem in mods or p.stem.startswith(('MarkovAudit','ReplayIsolated')):continue
 good=[str(q.relative_to(R)) for q,d in records if d.get('returncode')==0 and d.get('modules',{}).get(p.stem)==sha(p)]
 extra.append(dict(path=str(p.relative_to(R)),sha256=sha(p),matching_successful_builds=good,status='Outside final validated bundle; no mathematical closure inferred.'))
(O/'unaccepted-drafts.json').write_text(json.dumps(extra,indent=2))
pins={str(p):sha(R/p) for p in [Path('MathGKM/Markov.lean'),Path('.control/markov/contract.json'),Path('.control/markov/inherited.json'),Path('lean-toolchain'),Path('lakefile.toml'),Path('lake-manifest.json')]}
assert pins['MathGKM/Markov.lean']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(O/'final-bindings.json').write_text(json.dumps(dict(files=pins,canonical_contract_sha256=canonical,request_id='e874331060f545c891d1edabfa5a4db3',stop_file=(R/'.control/markov/STOP.json').exists()),indent=2))
(O/'capability-failures.json').write_text(json.dumps(dict(scratch='Denied by higher-priority policy; not accessed.',heredoc='Initial shell here-document could not create its temporary file. Used apply_patch and python -c.',sage='Unavailable.',sympy='Unavailable.',source_retrieval='Hosted publisher retrieval succeeded.',timeouts='See immutable failed-build-index.json. No timeout is mathematical evidence.'),indent=2))
(R/'research/markov-e8743310-checkpoint-final.md').write_text(
 '# Final checkpoint\n\nMachine-authored request e874331060f545c891d1edabfa5a4db3.\n'
 'Full pinned root and exact negation remain open; completion is null.\n\n'
 f'{len(mods)} modules compiled and jointly kernel-replayed; {v["theorem_closures"]} theorem closures passed the permitted-axiom audit. '
 'See evidence/markov-e8743310/validation.json for exact hash-bound receipts. Inherited compiled imports were reused; no fresh whole-source rebuild or independent completion audit occurred.\n\n'
 'Closed the entire numerator-three middle horizontal strip and the top five rows. '
 'path_horizontal_two_exceptionsME87 proves every horizontal row except the two central indices (b+1)/2 and (b+1)/2+1, with every column and denominator unbounded. '
 'root_iff_two_central_rowsME87 preserves the complete vertical/diagonal residuals and OtherFourM9E2. Both root residuals remain open.\n\n'
 'A signed-offset formula candidate matched 6,303 source coefficients, retaining 1,292 zeros. It has no accepted Lean source bridge. '
 'The centered scalar cutoff-nine failure is an auxiliary obstruction, not a refutation of the root.\n\n'
 f'{len(failed)} rejected build receipts and {len(extra)} unaccepted generated source(s) are preserved. '
 'All launched foreground work has ended, and no external action request is pending. Read the mathematics, operational, correspondence and next-action reports.\n')
print(json.dumps(dict(modules=len(mods),closures=v['theorem_closures'],failed_builds=len(failed),unaccepted_sources=len(extra))))
finish()
