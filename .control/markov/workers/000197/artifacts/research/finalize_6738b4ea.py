"""Machine-authored final artifact indexes and immutable input checks."""
from pathlib import Path
import json,hashlib,time,re,sys
from finish_6738b4ea import validate,finish
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6738b4ea'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'planned-validation.json').read_text())
for m in mods:
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',(R/'research'/f'{m}.lean').read_text()),m
records=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
failed={str(p.relative_to(R)):d for p,d in records if d.get('returncode')!=0}
(O/'failed-build-index.json').write_text(json.dumps(failed,indent=2))
extra=[]
for p in (R/'research').glob('*M673.lean'):
 if p.stem in mods or p.stem.startswith(('MarkovAudit','ReplayIsolated')):continue
 good=[str(q.relative_to(R)) for q,d in records if d.get('returncode')==0 and d.get('modules',{}).get(p.stem)==sha(p)]
 extra.append(dict(path=str(p.relative_to(R)),sha256=sha(p),matching_successful_builds=good,status='Outside final validated bundle; do not assume any draft closure.'))
for p in O.glob('withdrawn-*.lean'):
 extra.append(dict(path=str(p.relative_to(R)),sha256=sha(p),status='Preserved withdrawn source; see withdrawal-reconciliation.json.'))
(O/'unaccepted-drafts.json').write_text(json.dumps(extra,indent=2))
(O/'capability-failures.json').write_text(json.dumps(dict(scratch='Denied by higher-priority filesystem policy; not accessed.',heredoc='Initial shell here-document could not create its temporary file. Used apply_patch and python -c thereafter.',process_listing='Attempted /bin/ps in cancel_superseded_6738b4ea.py raised PermissionError(1). No PID list and no signals were obtained. No bypass attempted.',queued_withdrawal='Two sequential batches terminated before their next missing source. One already-active FastC8 build completed, its matching bytes were restored, and no build was blindly replayed.',sage='Unavailable.',sympy='Unavailable.',source_retrieval='Hosted publisher retrieval succeeded.'),indent=2))
pins={str(p):sha(R/p) for p in [Path('MathGKM/Markov.lean'),Path('.control/markov/contract.json'),Path('.control/markov/inherited.json'),Path('lean-toolchain'),Path('lakefile.toml'),Path('lake-manifest.json')]}
assert pins['MathGKM/Markov.lean']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(O/'final-bindings.json').write_text(json.dumps(dict(files=pins,canonical_contract_sha256=canonical,request_id='6738b4ea67b64d608769e0669c472752',stop_file=(R/'.control/markov/STOP.json').exists()),indent=2))
if '--indexes-only' in sys.argv:
 print(json.dumps(dict(modules=len(mods),failed_builds=len(failed),unaccepted_sources=len(extra),canonical_contract_sha256=canonical)))
 sys.exit(0)
try:
 v=validate(mods)
 replay_ok=True
except AssertionError as e:
 if str(e)!='no matching replay':raise
 failures=[(p,json.loads(p.read_text())) for p in O.glob('replay-*.json')]
 failures=[(p,d) for p,d in failures if set(d.get('modules',{}))==set(mods) and d.get('returncode')!=0]
 assert failures,'Replay still pending; finalization postponed.'
 builds={}
 for m in mods:
  good=[str(p.relative_to(R)) for p,d in records if d.get('returncode')==0 and d.get('modules',{}).get(m)==sha(R/'research'/f'{m}.lean')]
  assert good,m
  builds[m]=good[-1]
 audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
 audits=[(p,d) for p,d in audits if set(d['sources'])==set(mods) and all(sha(R/'research'/f'{m}.lean')==h for m,h in d['sources'].items())]
 assert audits
 ap,ad=audits[-1];rp,rd=failures[-1]
 v=dict(modules={m:sha(R/'research'/f'{m}.lean') for m in mods},compilation=builds,replay=str(rp.relative_to(R)),replay_passed=False,axioms=str(ap.relative_to(R)),theorem_closures=len(ad['declarations']),scope='All listed modules compiled with ordinary Lean kernel checking and permitted axiom closure. Joint isolated replay did not complete successfully; this is an explicit operational validation limitation. Inherited imports reused; no whole-source rebuild or independent completion audit.')
 (O/'validation.json').write_text(json.dumps(v,indent=2));replay_ok=False
 (O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2))
(R/'research/markov-6738b4ea-checkpoint-final.md').write_text(
 '# Final checkpoint\n\nMachine-authored request 6738b4ea67b64d608769e0669c472752.\n'
 'Full pinned root remains open; completion is null.\n\n'
 f'{len(mods)} modules compiled and {v["theorem_closures"]} theorem closures passed the permitted-axiom audit. '
 f'Joint isolated replay passed: {replay_ok}. See evidence/markov-6738b4ea/validation.json for exact receipts and limitations.\n\n'
 'Proved the numerator-three middle horizontal inequalities at physical starting columns 8..12 and >=19, with unbounded parameters and both residues. '
 'The exact remaining middle condition is MiddleSixColumnsM673 (internal c=10..15), alongside unchanged ThreeOutsideMiddleMD02 and OtherFourM9E2.\n\n'
 f'{len(failed)} rejected build receipts and {len(extra)} sources outside the final bundle are preserved. '
 'The full-middle closure and seven-row residual drafts are unaccepted. All bounded build jobs have ended; no external request is pending. '
 'Read the next-action, mathematics, operational and correspondence reports.\n')
print(json.dumps(dict(modules=len(mods),closures=v['theorem_closures'],failed_builds=len(failed),unaccepted_sources=len(extra))))
finish()
