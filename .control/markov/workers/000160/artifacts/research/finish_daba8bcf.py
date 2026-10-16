"""Machine-authored validation summary and immutable artifact bindings."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-daba8bcf'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
builds=[]
for m in mods:
 ps=[p for p in O.glob('build-*.json') if (d:=json.loads(p.read_text())).get('returncode')==0 and d.get('modules')=={m:sources[m]}]
 assert ps,m
 builds.append(str(sorted(ps)[-1].relative_to(R)))
ps=[p for p in O.glob('replay-*.json') if (d:=json.loads(p.read_text())).get('returncode')==0 and d.get('modules')==sources]
assert ps
replay=sorted(ps)[-1]
ps=[p for p in O.glob('axioms-*.json') if json.loads(p.read_text()).get('sources')==sources]
assert ps
audit=sorted(ps)[-1];ad=json.loads(audit.read_text())
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in ad['declarations'].values())
v={'request_id':'daba8bcf97ae4038b0d8ea8a63d4a71e','modules':mods,'sources':sources,
 'build_receipts':builds,'replay_receipt':str(replay.relative_to(R)),
 'axioms_receipt':str(audit.relative_to(R)),'closures':len(ad['declarations']),
 'permitted_axioms_only':True,'completion':None,
 'limits':'Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit.'}
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
owned=lambda p:'daba8bcf' in p or 'MDAB' in p
before=json.loads((O/'before.json').read_text());old={p:h for p,h in before.items() if not owned(p)}
changed=[p for p,h in old.items() if not (R/p).is_file() or sha(R/p)!=h];assert not changed,changed
latest=json.loads((R/'evidence/markov-4687d03f/manifest.json').read_text())
assert all(sha(R/p)==h for p,h in latest.items())
bad={m:re.findall(r'\b(?:sorry|admit|native_decide|axiom)\b',(R/'research'/f'{m}.lean').read_text()) for m in mods}
assert not any(bad.values()),bad
root=sha(R/'MathGKM/Markov.lean')
contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
attempts=[json.loads(p.read_text()) for p in O.glob('build-*.json')]
fc={'unchanged_inherited_inputs':len(old),'changed':changed,'rechecked_latest_artifacts':len(latest),
 'root_sha256':root,'canonical_contract_sha256':contract,'validated_modules':len(mods),
 'theorem_closures':v['closures'],'rejected_builds':sum(a.get('returncode')!=0 for a in attempts),
 'forbidden_proof_tokens':{m:x for m,x in bad.items() if x},
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None}
(O/'final-check.json').write_text(json.dumps(fc,indent=2)+'\n')
paths=[p for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']]
paths += [p for p in (R/'research').iterdir() if p.is_file() and owned(p.name)]
manifest={str(p.relative_to(R)):sha(p) for p in sorted(paths)}
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
last={'manifest_sha256':sha(O/'manifest.json'),'verified_artifacts':len(manifest),
 'artifact_bytes':sum((R/p).stat().st_size for p in manifest),
 'mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
 'unchanged_inherited_inputs':len(old),'root_sha256':root,'canonical_contract_sha256':contract,'completion':None}
assert not last['mismatches']
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps({'validation':v,'final_check':fc,'manifest':last}))
