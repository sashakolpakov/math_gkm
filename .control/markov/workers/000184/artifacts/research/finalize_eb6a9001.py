"""Machine-authored final preservation manifest; no admission authority."""
from pathlib import Path
import hashlib,json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-eb6a9001'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
v=json.loads((O/'validation.json').read_text());mods=list(v['modules'])
assert all(sha(R/'research'/f'{m}.lean')==h for m,h in v['modules'].items())
for m in mods:
 b=json.loads((R/v['successful_builds'][m]).read_text())
 assert b['returncode']==0 and b['modules'][m]==v['modules'][m]
ax=json.loads((R/v['axiom_receipt']).read_text())
assert all(set(x)<= {'propext','Classical.choice','Quot.sound'} for x in ax['declarations'].values())
replays=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and d['modules']==v['modules']:replays.append(str(p.relative_to(R)))
assert replays
inputs=json.loads((O/'input-hashes.json').read_text())
changes=[p for p,h in inputs.items() if not (R/p).is_file() or sha(R/p)!=h]
assert not changes,changes
prev=json.loads((R/'evidence/markov-b3eed364/manifest.json').read_text())
assert all(sha(R/p)==h for p,h in prev.items())
inh=json.loads((R/'.control/markov/inherited.json').read_text())
assert all(sha(R/p)==x['sha256'] for p,x in inh.items())
root=sha(R/'MathGKM/Markov.lean')
contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
bad=[]
for p in O.glob('build-*.json'):
 if json.loads(p.read_text()).get('returncode')!=0:bad.append(str(p.relative_to(R)))
artifacts={}
for p in (R/'research').iterdir():
 if p.is_file() and ('eb6a9001' in p.name or 'MEB6' in p.name):artifacts[str(p.relative_to(R))]=sha(p)
for m in mods:artifacts[f'research/{m}.lean']=sha(R/'research'/f'{m}.lean')
artifacts[f"research/{ax['module']}.lean"]=sha(R/'research'/f"{ax['module']}.lean")
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:artifacts[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(artifacts,indent=2)+'\n')
out=dict(request_id='eb6a900170904ab59255de637301f446',artifacts=len(artifacts),artifacts_verified=all(sha(R/p)==h for p,h in artifacts.items()),unchanged_inputs=len(inputs),input_changes=changes,predecessor_artifacts=len(prev),root_sha256=root,contract_canonical_sha256=contract,contract_file_sha256=sha(R/'.control/markov/contract.json'),pins={p:sha(R/p) for p in ['lean-toolchain','lakefile.toml','lake-manifest.json']},modules=len(mods),theorem_closures=len(ax['declarations']),kernel_replays=replays,rejected_builds=bad,stop_file_present=(R/'.control/markov/STOP.json').exists(),completion=None)
(O/'last-verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out),flush=True)
