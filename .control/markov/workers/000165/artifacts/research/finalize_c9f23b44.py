"""Machine-authored c9f23b44. Research validation and immutable boundary checks."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c9f23b44'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
receipts=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
builds={}
for m,h in sources.items():
 matches=[p for p,d in receipts if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 assert matches,m
 builds[m]=str(max(matches).relative_to(R))
 s=(R/'research'/f'{m}.lean').read_text()
 s=re.sub(r'/\-.*?\-/','',s,flags=re.S);s=re.sub(r'--[^\n]*','',s)
 assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',s),m
replays=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and d.get('modules')==sources and 'replay union passed' in d.get('stdout',''):replays.append(p)
replay_attempts=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 replay_attempts.append(dict(receipt=str(p.relative_to(R)),returncode=d.get('returncode'),timeout=d.get('timeout',False),matching_sources=d.get('modules')==sources))
audits=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text())
 if d.get('sources')==sources:audits.append((p,d))
assert audits,'No successful matching closure audit'
ap,ad=max(audits,key=lambda x:x[0])
decls=[n for m in mods for n in re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M)]
assert set(decls)==set(ad['declarations'])
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in ad['declarations'].values())
validation=dict(request_id='c9f23b44907d4f9aa7cfc15e4a2c4b47',modules=mods,source_sha256=sources,successful_builds=builds,compiled_sha256={m:sha(O/f'{m}.olean') for m in mods},joint_replay=str(max(replays).relative_to(R)) if replays else None,joint_replay_passed=bool(replays),replay_attempts=replay_attempts,axiom_audit=str(ap.relative_to(R)),theorem_closures=len(decls),permitted_axioms_only=True,completion=None,limits='Inherited compiled imports reused; no fresh whole-source rebuild or independent English/source completion audit. Replay failure, if any, is explicit and is not promoted to successful validation.')
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before=json.loads((O/'before.json').read_text());changes=[p for p,h in before.items() if sha(R/p)!=h]
assert not changes,changes
prior=json.loads((R/'evidence/markov-ad504da6/manifest.json').read_text());prior_changes=[p for p,h in prior.items() if sha(R/p)!=h]
assert not prior_changes,prior_changes
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest();assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
fails=[dict(receipt=str(p.relative_to(R)),timeout=d.get('timeout',False),returncode=d.get('returncode')) for p,d in receipts if d.get('returncode')!=0]
check=dict(input_files=len(before),changed_inputs=changes,predecessor_artifacts=len(prior),changed_predecessor_artifacts=prior_changes,root_sha256=root,contract_sha256=contract,stop_file_present=(R/'.control/markov/STOP.json').exists(),rejected_builds=fails,completion=None)
(O/'final-check.json').write_text(json.dumps(check,indent=2)+'\n')
manifest={}
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:manifest[str(p.relative_to(R))]=sha(p)
for p in (R/'research').iterdir():
 if p.is_file() and ('c9f23b44' in p.name or 'MC9F' in p.name):manifest[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
bad=[p for p,h in manifest.items() if sha(R/p)!=h];assert not bad
last=dict(artifacts=len(manifest),artifact_mismatches=bad,unchanged_inputs=len(before),unchanged_predecessor_artifacts=len(prior),root_sha256=root,contract_sha256=contract,validation_sha256=sha(O/'validation.json'),manifest_sha256=sha(O/'manifest.json'),completion=None)
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps(dict(modules=len(mods),theorem_closures=len(decls),last_verification=last,rejected_builds=len(fails))))
