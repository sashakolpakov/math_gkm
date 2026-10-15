"""Machine-authored local validation and immutable-input preservation record."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv=json.loads((O/'audit-inventory.json').read_text())
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
replays=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in O.glob('kernel-union-*.json')]
mods=inv['accepted']
for d in mods:
 assert d['sha256']==sha(R/d['source'])
 d['replays']=[x['receipt'] for x in replays if x.get('returncode')==0 and x.get('modules',{}).get(d['module'])==d['sha256']]
 assert d['replays'],d['module']
aud=[d for d in runs if d.get('returncode')==0 and d.get('source')=='research/MarkovAuditCC.lean' and d['sha256']==sha(R/'research/MarkovAuditCC.lean')][-1]
axioms={}
for name,ax in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",aud['stdout'],re.S):
 axioms[name]=[a.strip() for a in ax.split(',') if a.strip()]
for name in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",aud['stdout']):axioms[name]=[]
assert set(axioms)==set(inv['theorems']),(set(inv['theorems'])-set(axioms))
assert all(set(v)<=set(['propext','Classical.choice','Quot.sound']) for v in axioms.values())
limits='Inherited compiled imports reused; local source builds and kernel union replay only. No fresh whole-source rebuild or independent hash-bound completion audit. Exact root remains open.'
(O/'validation.json').write_text(json.dumps(dict(request_id='cc599cf12cc74c9e84112aac7bc0f9ac',modules=mods,axioms=axioms,audit=aud['receipt'],limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());checks=[dict(path=k,before=v,after=sha(R/k)) for k,v in initial.items()]
assert all(d['before']==d['after'] for d in checks)
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_unchanged=True),indent=2)+'\n')
failed=[d for d in runs if d.get('returncode')!=0]
drafts=[str(p.relative_to(R)) for p in (R/'research').glob('Markov*CC.lean') if p.stem not in inv['modules']+['MarkovAuditCC']]
(O/'operational-observations.json').write_text(json.dumps(dict(failed_builds=[dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in failed],excluded_drafts=drafts,limits=limits,foreground_status='All invoked foreground subprocesses have returned; no deferred external action requests.',capabilities='capabilities.json'),indent=2)+'\n')
files=list(O.glob('*'))+list((R/'research').glob('*cc599cf1*'))+list((R/'research').glob('Markov*CC.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name!='artifact-verification.json'}
(O/'artifact-verification.json').write_text(json.dumps(dict(files=manifest,verified=len(manifest),status='Hashes computed from current artifacts; not mathematical evidence'),indent=2)+'\n')
print(dict(modules=len(mods),theorems=len(axioms),preserved=len(checks),artifacts=len(manifest),failed_builds=len(failed),excluded_drafts=len(drafts)))
