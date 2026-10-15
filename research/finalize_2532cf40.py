"""Machine-authored source-bound validation inventory. No root completion claim."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-2532cf40'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
unions=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('kernel-union-*.json'))]
accepted={};axioms={};audits=[]
for d in runs:
 if d.get('returncode')!=0 or d.get('mode')!='build' or sha(R/d['source'])!=d['sha256']:continue
 if 'Audit' in d['source']:
  audits.append(d['receipt'])
  for name,ax in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",d['stdout'],re.S):axioms[name]=[a.strip() for a in ax.split(',') if a.strip()]
  for name in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",d['stdout']):axioms[name]=[]
 else:
  m=Path(d['source']).stem;accepted[m]=dict(module=m,source=d['source'],sha256=d['sha256'],build=d['receipt'])
assert all(set(v)<=set(['propext','Classical.choice','Quot.sound']) for v in axioms.values())
for m,d in accepted.items():
 names=re.findall(r'^theorem (\w+)',(R/d['source']).read_text(),re.M)
 d['declarations']=names
 d['replays']=[x['receipt'] for x in runs if x.get('mode')=='replay' and x.get('returncode')==0 and x.get('source')==d['source'] and x.get('sha256')==d['sha256']]
 d['union_replays']=[x['receipt'] for x in unions if x.get('returncode')==0 and x.get('modules',{}).get(m)==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'] or d['union_replays'])
 d['axiom_audit_complete']=all(n in axioms for n in names)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',(R/d['source']).read_text()),d['source']
inherited=[d for d in runs if d.get('mode')=='replay' and d.get('returncode')==0 and Path(d['source']).stem not in accepted]
limits='Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit. Exact root unresolved.'
v=dict(request_id='2532cf404bcc4c2ab8a1684e4f887eb2',modules=list(accepted.values()),inherited_replays=inherited,axiom_audit=axioms,audit_receipts=audits,limits=limits,completion=None)
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());checks={k:dict(before=h,after=sha(R/k)) for k,h in initial.items()}
assert all(x['before']==x['after'] for x in checks.values())
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_unchanged=True),indent=2)+'\n')
failed=[d for d in runs+unions if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_attempts=[dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in failed],capabilities='capabilities.json',limits=limits,all_foreground_executions_joined=True),indent=2)+'\n')
files=list(O.glob('*'))+list((R/'research').glob('*2532cf40*'))+list((R/'research').glob('Markov*M253.lean'))+list((R/'research').glob('Markov*M253.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ['artifact-verification.json','final-check.json']}
(O/'artifact-verification.json').write_text(json.dumps(dict(files=manifest),indent=2)+'\n')
summary=dict(modules=len(accepted),replayed=sum(d['kernel_replay_passed'] for d in accepted.values()),axiom_closures=len(axioms),unreplayed=[m for m,d in accepted.items() if not d['kernel_replay_passed']],unaudited=[m for m,d in accepted.items() if not d['axiom_audit_complete']],inherited_replays=len(inherited),preserved=len(checks),artifacts=len(manifest),rejected_attempts=len(failed),timeouts=sum(d.get('timeout',False) for d in failed),completion=None)
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary),flush=True)
