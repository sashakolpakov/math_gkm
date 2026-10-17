"""Machine-authored preservation and source-bound validation summary; not admission authority."""
from pathlib import Path
import hashlib,json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5bf6837d'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
receipts=[]
for p in O.glob('build-*.json'):
 d=json.loads(p.read_text());d['_receipt']=str(p.relative_to(R));receipts.append(d)
checks={}
for m in mods:
 p=R/'research'/f'{m}.lean';h=sha(p)
 assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',p.read_text()),m
 good=[d for d in receipts if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 assert good,('missing final-source successful build',m)
 checks[m]=dict(source_sha256=h,build_receipts=[d['_receipt'] for d in good],olean_sha256=sha(O/f'{m}.olean'))
replays=[]
for p in O.glob('kernel-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and set(d['modules'])==set(mods) and all(d['modules'][m]==checks[m]['source_sha256'] for m in mods):replays.append(str(p.relative_to(R)))
assert replays,'missing current joint replay'
audits=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text())
 if set(d['sources'])==set(mods) and all(d['sources'][m]==checks[m]['source_sha256'] for m in mods):audits.append((p,d))
assert audits,'missing current axiom audit'
axp,ax=audits[-1]
assert all(set(a)<= {'propext','Classical.choice','Quot.sound'} for a in ax['declarations'].values())
bad=[d['_receipt'] for d in receipts if d.get('returncode')!=0]
validation=dict(modules=checks,kernel_replays=replays,axiom_audit=str(axp.relative_to(R)),closures=len(ax['declarations']),allowed_axioms=['propext','Classical.choice','Quot.sound'],rejected_builds=bad,limits='Inherited compiled imports reused; not a fresh whole-source rebuild or independent English/source audit.',completion=None)
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
inputs=json.loads((O/'input-hashes.json').read_text())
changed=[p for p,h in inputs.items() if sha(R/p)!=h]
assert not changed,changed
prev=json.loads((R/'evidence/markov-1c65a306/manifest.json').read_text())
assert all(sha(R/p)==h for p,h in prev.items())
root=sha(R/'MathGKM/Markov.lean')
contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
artifacts={}
for p in (R/'research').iterdir():
 if p.is_file() and ('5bf6837d' in p.name or 'M5BF' in p.name):artifacts[str(p.relative_to(R))]=sha(p)
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:artifacts[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(artifacts,indent=2)+'\n')
out=dict(request_id='5bf6837d0c5b4b818f68c99f57ad498a',artifacts=len(artifacts),artifacts_verified=all(sha(R/p)==h for p,h in artifacts.items()),unchanged_inputs=len(inputs),input_changes=changed,predecessor_artifacts=len(prev),root_sha256=root,contract_sha256=contract,modules=len(mods),closures=len(ax['declarations']),rejected_builds=len(bad),stop_file_present=(R/'.control/markov/STOP.json').exists(),completion=None)
(O/'last-verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out),flush=True)
