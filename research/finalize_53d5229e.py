"""Machine-authored validation and preservation records. No control changes."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-53d5229e'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv=json.loads((O/'audit-inventory.json').read_text())
runs=[dict(json.loads(p.read_text()),receipt=str(p.relative_to(R))) for p in O.glob('run-*.json')]
groups=[dict(json.loads(p.read_text()),receipt=str(p.relative_to(R))) for p in O.glob('replay-group-*.json')]
accepted=[]
for m in inv['modules']+['MarkovAudit53D']:
 p=R/'research'/f'{m}.lean';h=sha(p);ds=[d for d in runs if d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h and d.get('mode')=='build' and d.get('returncode')==0];assert ds,m
 replay=[d['receipt'] for d in runs if d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h and d.get('mode')=='replay' and d.get('returncode')==0]
 replay += [d['receipt'] for d in groups if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 accepted.append(dict(module=m,source=str(p.relative_to(R)),sha256=h,build=ds[-1]['receipt'],replays=replay))
ad=json.loads((R/accepted[-1]['build']).read_text());axs={n:sorted(x.strip() for x in a.split(',') if x.strip()) for n,a in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^]]*)\]",ad['stdout'])}
axs.update({n:[] for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",ad['stdout'])})
assert set(axs)=={n for _,n in inv['theorems']},(len(axs),len(inv['theorems']))
assert all(set(a)<={'propext','Classical.choice','Quot.sound'} for a in axs.values())
bad=[]
for m in inv['modules']:
 p=R/'research'/f'{m}.lean'
 if re.search(r'\b(sorry|admit|native_decide|axiom)\b',p.read_text()):bad.append(str(p))
assert not bad,bad
val=dict(request_id='53d5229e9f134234a21bc350e491d476',modules=accepted,axioms=axs,excluded=inv['excluded'],not_replayed=[a['module'] for a in accepted if not a['replays']],forbidden_tokens=bad,completion=None,limits='Pinned inherited compiled imports reused. No fresh whole-source rebuild or independent English/source completion audit. A successful local check is not controller admission.')
(O/'validation.json').write_text(json.dumps(val,indent=2)+'\n')
old=json.loads((O/'reconciliation.json').read_text());pres=[]
for p,h in {**old['pins'],**old['inherited']}.items():pres.append(dict(path=p,expected=h,actual=sha(R/p)))
assert all(x['expected']==x['actual'] for x in pres)
(O/'preservation.json').write_text(json.dumps(dict(checks=pres,all_unchanged=True),indent=2)+'\n')
fail=[d for d in runs if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(failed_build_or_replay_receipts=[dict(receipt=d['receipt'],timeout=d.get('timeout',False),returncode=d.get('returncode')) for d in fail],union_timeout='inherited-union-replay.json',capabilities='capabilities.json',unvalidated=inv['excluded'],limits=val['limits']),indent=2)+'\n')
files=[p for p in O.iterdir() if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
files += [p for p in (R/'research').iterdir() if p.is_file() and ('53D' in p.name or '53d5229e' in p.name)]
hashes={str(p.relative_to(R)):sha(p) for p in files}
(O/'artifacts.json').write_text(json.dumps(dict(hashes=hashes),indent=2)+'\n')
assert all(sha(R/p)==h for p,h in hashes.items())
(O/'artifact-verification.json').write_text(json.dumps(dict(verified=len(hashes),failures=[]),indent=2)+'\n')
print(json.dumps(dict(modules=len(accepted)-1,theorems=len(axs),not_replayed=val['not_replayed'],excluded=inv['excluded'],artifact_hashes=len(hashes),preserved=len(pres),failed_receipts=len(fail))))
