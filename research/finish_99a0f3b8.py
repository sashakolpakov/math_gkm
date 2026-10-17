"""Machine-authored binding/manifest checks; no controller mutation."""
from pathlib import Path
import json,hashlib,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-99a0f3b8'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def validate(mods):
 records=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
 chosen={}
 for m in mods:
  good=[(p,d) for p,d in records if d.get('returncode')==0 and d.get('modules',{}).get(m)==sha(R/'research'/f'{m}.lean')]
  assert good,m
  chosen[m]=str(max(good,key=lambda z:z[0].name)[0].relative_to(R))
 replays=[(p,json.loads(p.read_text())) for p in O.glob('replay-*.json')]
 good=[(p,d) for p,d in replays if d.get('returncode')==0 and set(d['modules'])==set(mods) and all(sha(R/'research'/f'{m}.lean')==h for m,h in d['modules'].items())]
 assert good,'no matching replay'
 replay=max(good,key=lambda z:z[0].name)
 audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
 good=[(p,d) for p,d in audits if set(d['sources'])==set(mods) and all(sha(R/'research'/f'{m}.lean')==h for m,h in d['sources'].items())]
 assert good,'no matching audit'
 audit=max(good,key=lambda z:z[0].name)
 for m in mods:
  src=(R/'research'/f'{m}.lean').read_text()
  assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',src),m
 data=dict(modules={m:sha(R/'research'/f'{m}.lean') for m in mods},compilation=chosen,replay=str(replay[0].relative_to(R)),axioms=str(audit[0].relative_to(R)),theorem_closures=len(audit[1]['declarations']),scope='Local builds, isolated joint kernel replay, allowed axiom closures. Compiled inherited imports reused; no fresh whole-source rebuild or independent completion audit.')
 (O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2))
 (O/'validation.json').write_text(json.dumps(data,indent=2))
 return data
def finish():
 hashes=json.loads((O/'input-hashes.json').read_text())
 # This run's initial setup script was captured by its own baseline and is unchanged.
 changed=[k for k,h in hashes.items() if not (R/k).exists() or sha(R/k)!=h]
 assert not changed,changed
 prev=json.loads((R/'evidence/markov-97b019af/manifest.json').read_text())
 assert all(sha(R/k)==h for k,h in prev.items())
 artifacts=list(O.glob('*'))+[p for p in (R/'research').glob('*') if '99a0f3b8' in p.name or (p.suffix=='.lean' and p.stem.endswith('M99A'))]
 manifest={str(p.relative_to(R)):sha(p) for p in artifacts if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
 (O/'manifest.json').write_text(json.dumps(manifest,indent=2))
 out=dict(artifacts=len(manifest),unchanged_inputs=len(hashes),predecessor_artifacts=len(prev),root_sha256=sha(R/'MathGKM/Markov.lean'),contract_sha256=sha(R/'.control/markov/contract.json'),stop_file=(R/'.control/markov/STOP.json').exists(),completion=None)
 (O/'last-verification.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
if __name__=='__main__':
 import sys
 if sys.argv[1]=='validate':print(json.dumps(validate(sys.argv[2:])))
 elif sys.argv[1]=='finish':finish()
