"""Machine-authored local evidence finalization; no controller records edited."""
from pathlib import Path
import json,hashlib,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-ed6bdbeb'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def save(n,x): (O/n).write_text(json.dumps(x,indent=2)+'\n')
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
builds={};failures=[]
for p in sorted(O.glob('build-*.json')):
 d=json.loads(p.read_text())
 if d.get('returncode')!=0:
  failures.append(dict(receipt=str(p.relative_to(R)),timeout=d.get('timeout',False),modules=d['modules']))
 for m,h in d['modules'].items():
  if m in sources and h==sources[m] and d.get('returncode')==0:builds[m]=str(p.relative_to(R))
assert set(builds)==set(mods)
replays=[]
for p in sorted(O.glob('replay-*.json')):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and d['modules']==sources and 'replay union passed' in d['stdout']:replays.append(p)
assert replays
audits=[]
for p in sorted(O.glob('axioms-*.json')):
 d=json.loads(p.read_text())
 if d['sources']==sources:audits.append(p)
assert audits
audit=json.loads(audits[-1].read_text())
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in audit['declarations'].values())
for m in mods:
 src=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',src),m
save('failed-build-index.json',failures)
save('validation.json',dict(modules=sources,build_receipts=builds,kernel_replay=str(replays[-1].relative_to(R)),
 axiom_audit=str(audits[-1].relative_to(R)),theorem_closures=len(audit['declarations']),permitted_axioms_only=True,
 fresh_whole_source_rebuild=False,independent_completion_audit=False,completion=None))
inputs=json.loads((O/'input-hashes.json').read_text())
changed=[p for p,h in inputs.items() if not (R/p).is_file() or sha(R/p)!=h]
prior=json.loads((R/'evidence/markov-3ae33435/manifest.json').read_text())
prior_changed=[p for p,h in prior.items() if not (R/p).is_file() or sha(R/p)!=h]
inherited=json.loads((R/'.control/markov/inherited.json').read_text())
ibad=[]
for p,d in inherited.items():
 if isinstance(d,dict) and 'sha256' in d:
  if hashlib.sha256(d['content'].encode()).hexdigest()!=d['sha256'] or sha(R/p)!=d['sha256']:ibad.append(p)
contract=json.loads((R/'.control/markov/contract.json').read_text())
canonical=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert canonical=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert not changed and not prior_changed and not ibad,(changed,prior_changed,ibad)
save('source-retrieval.json',dict(url=contract['source'],retrieval='Hosted web open and find, live 2026-10-17.',
 sections=['Seeds (5)','Numerator structure and recurrence (7)-(8)','Definitions 6.1-6.2','Conjecture 6.3'],
 scope='Source meaning consulted; not a new Lean axiom or independent completion audit.'))
files=list(O.iterdir())+list((R/'research').glob('*ed6bdbeb*'))+list((R/'research').glob('*MED6.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
save('manifest.json',manifest)
save('last-verification.json',dict(artifacts=len(manifest),artifact_mismatches=[],unchanged_inputs=len(inputs),
 input_changes=changed,previous_manifest_entries=len(prior),previous_changes=prior_changed,inherited_binding_failures=ibad,
 root_sha256=sha(R/'MathGKM/Markov.lean'),contract_canonical_sha256=canonical,
 contract_file_sha256=sha(R/'.control/markov/contract.json'),stop_present=(R/'.control/markov/STOP.json').exists(),
 selected_modules=len(mods),theorem_closures=len(audit['declarations']),failed_builds=len(failures),completion=None))
print(json.dumps(dict(modules=len(mods),closures=len(audit['declarations']),artifacts=len(manifest),unchanged_inputs=len(inputs),failed_builds=len(failures))))
