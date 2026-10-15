"""Machine-authored final local receipts; no root completion claim."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-96dea62b'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv=json.loads((O/'audit-inventory.json').read_text())
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
mods=inv['accepted']
for d in mods:
 assert d['sha256']==sha(R/d['source'])
 d['replays']=[x['receipt'] for x in runs if x.get('returncode')==0 and x.get('mode')=='replay' and x.get('source')==d['source'] and x.get('sha256')==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'])
aud=[d for d in runs if d.get('returncode')==0 and d.get('source')=='research/MarkovAuditM96.lean' and d['sha256']==sha(R/'research/MarkovAuditM96.lean')][-1]
axioms={}
for name,ax in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",aud['stdout'],re.S):
 axioms[name]=[a.strip() for a in ax.split(',') if a.strip()]
for name in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",aud['stdout']):axioms[name]=[]
assert set(axioms)==set(inv['theorems'])
assert all(set(v)<=set(['propext','Classical.choice','Quot.sound']) for v in axioms.values())
limits='Inherited compiled imports reused. New modules individually compiled and separately replayed as recorded. No fresh whole-source rebuild or independent hash-bound completion audit. Exact root remains open.'
repaired=[x for x in runs if x.get('returncode')==0 and x.get('mode')=='replay' and 'M042.lean' in x['source']]
(O/'validation.json').write_text(json.dumps(dict(request_id='96dea62b6a264d13939c64cc19dbe945',modules=mods,kernel_replay_complete=all(d['kernel_replay_passed'] for d in mods),unreplayed_modules=[d['module'] for d in mods if not d['kernel_replay_passed']],axioms=axioms,audit=aud['receipt'],inherited_replays_repaired=[dict(source=d['source'],sha256=d['sha256'],receipt=d['receipt']) for d in repaired],limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());checks=[dict(path=k,before=v,after=sha(R/k)) for k,v in initial.items()]
assert all(d['before']==d['after'] for d in checks)
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_unchanged=True),indent=2)+'\n')
failed=[d for d in runs if d.get('returncode')!=0]
drafts=[str(p.relative_to(R)) for p in (R/'research').glob('Markov*M96.lean') if p.stem not in inv['modules']+['MarkovAuditM96']]
(O/'operational-observations.json').write_text(json.dumps(dict(failed_attempts=[dict(receipt=d['receipt'],mode=d['mode'],returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in failed],excluded_drafts=drafts,limits=limits,foreground_status='All invoked foreground subprocesses have returned; no external action requests pending.',capabilities='capabilities.json'),indent=2)+'\n')
for d in mods:
 text=(R/d['source']).read_text()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',text),d['source']
(O/'source-token-check.json').write_text(json.dumps(dict(checked=[d['source'] for d in mods],forbidden_tokens_found=[]),indent=2)+'\n')
files=list(O.glob('*'))+list((R/'research').glob('*96dea62b*'))+list((R/'research').glob('Markov*M96.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name!='artifact-verification.json'}
(O/'artifact-verification.json').write_text(json.dumps(dict(files=manifest,verified=len(manifest),status='Hashes bind artifacts; not mathematical evidence'),indent=2)+'\n')
print(dict(modules=len(mods),replayed=sum(d['kernel_replay_passed'] for d in mods),theorems=len(axioms),inherited_replays_repaired=len(repaired),preserved=len(checks),artifacts=len(manifest),failed_attempts=len(failed),excluded_drafts=len(drafts)))
