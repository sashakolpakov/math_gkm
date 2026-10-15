"""Machine-authored final receipts. Partial validation remains explicitly partial."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-00a02b28'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv=json.loads((O/'audit-inventory.json').read_text())
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
unions=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('kernel-union-*.json'))]
mods=inv['accepted']
known={d['module'] for d in mods}
for d in runs:
 if d.get('returncode')==0 and d.get('mode')=='build' and 'MarkovAudit' not in d['source'] and sha(R/d['source'])==d['sha256']:
  m=Path(d['source']).stem
  if m not in known:
   mods.append(dict(module=m,source=d['source'],sha256=d['sha256'],build=d['receipt'],late_build=True))
   known.add(m)
for d in mods:
 assert d['sha256']==sha(R/d['source'])
 d['replays']=[x['receipt'] for x in runs if x.get('returncode')==0 and x.get('mode')=='replay' and x.get('source')==d['source'] and x.get('sha256')==d['sha256']]
 d['union_replays']=[x['receipt'] for x in unions if x.get('returncode')==0 and x.get('modules',{}).get(d['module'])==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'] or d['union_replays'])
aud=[d for d in runs if d.get('returncode')==0 and d.get('source')=='research/MarkovAuditM00.lean' and d['sha256']==sha(R/'research/MarkovAuditM00.lean')][-1]
axioms={}
for name,ax in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",aud['stdout'],re.S):
 axioms[name]=[a.strip() for a in ax.split(',') if a.strip()]
for name in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",aud['stdout']):axioms[name]=[]
assert set(axioms)==set(inv['theorems'])
assert all(set(v)<=set(['propext','Classical.choice','Quot.sound']) for v in axioms.values())
limits='Inherited compiled imports reused. Source-bound ordinary Lean compilation and separate kernel replay are distinguished in each module receipt. No fresh whole-source rebuild or independent completion audit. Exact root remains open.'
(O/'validation.json').write_text(json.dumps(dict(request_id='00a02b28b63542b5b3888c4b2b6f03ff',modules=mods,kernel_replay_complete=all(d['kernel_replay_passed'] for d in mods),unreplayed_modules=[d['module'] for d in mods if not d['kernel_replay_passed']],axiom_audit=[dict(declaration='MathGKM.Markov.'+k,axioms=v) for k,v in axioms.items()],axiom_scope=inv['scope'],audit_receipts=[aud['receipt']],limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());checks=[dict(path=k,before=v,after=sha(R/k)) for k,v in initial.items()]
assert all(d['before']==d['after'] for d in checks)
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_unchanged=True),indent=2)+'\n')
failed=[d for d in runs+unions if d.get('returncode')!=0]
drafts=[str(p.relative_to(R)) for p in (R/'research').glob('Markov*M00.lean') if p.stem not in inv['modules']+['MarkovAuditM00']]
(O/'operational-observations.json').write_text(json.dumps(dict(failed_attempts=[dict(receipt=d['receipt'],mode=d.get('mode','union replay'),returncode=d.get('returncode'),timeout=d.get('timeout',False),skipped=d.get('skipped',False)) for d in failed],excluded_drafts=drafts,limits=limits,early_failures='early-failures.json',capabilities='capabilities.json'),indent=2)+'\n')
for d in mods:
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',(R/d['source']).read_text()),d['source']
(O/'source-token-check.json').write_text(json.dumps(dict(checked=[d['source'] for d in mods],forbidden_tokens_found=[]),indent=2)+'\n')
files=list(O.glob('*'))+list((R/'research').glob('*00a02b28*'))+list((R/'research').glob('Markov*M00.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ['artifact-verification.json','final-check.json']}
(O/'artifact-verification.json').write_text(json.dumps(dict(files=manifest),indent=2)+'\n')
summary=dict(modules=len(mods),replayed=sum(d['kernel_replay_passed'] for d in mods),public_axiom_closures=len(axioms),preserved=len(checks),artifacts=len(manifest),rejected_attempts=len(failed),excluded_drafts=len(drafts),completion=None)
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary),flush=True)
