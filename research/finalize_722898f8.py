"""Machine-authored source-bound validation and preservation inventory; no completion claim."""
from pathlib import Path
import json,re,hashlib,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-722898f8'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
unions=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('kernel-union-*.json'))]
accepted={}
for d in runs:
 if d.get('returncode')==0 and d.get('mode')=='build' and 'Audit' not in d['source'] and sha(R/d['source'])==d['sha256']:
  m=Path(d['source']).stem;accepted[m]=dict(module=m,source=d['source'],sha256=d['sha256'],build=d['receipt'])
for m,d in accepted.items():
 d['replays']=[x['receipt'] for x in runs if x.get('returncode')==0 and x.get('mode')=='replay' and x.get('source')==d['source'] and x.get('sha256')==d['sha256']]
 d['union_replays']=[x['receipt'] for x in unions if x.get('returncode')==0 and x.get('modules',{}).get(m)==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'] or d['union_replays'])
inherited=[d for d in runs if d.get('returncode')==0 and d.get('mode')=='replay' and Path(d['source']).stem not in accepted and sha(R/d['source'])==d['sha256']]
if '--audit-source' in sys.argv:
 names=[]
 for d in accepted.values():names+=re.findall(r'^theorem (\w+)',(R/d['source']).read_text(),re.M)
 s=''.join(f'import {m}\n' for m in accepted)+'/-! Machine-authored 722898f8. Checked-build theorem closure inspection. -/\n'+''.join(f'#print axioms MathGKM.Markov.{n}\n' for n in names)
 (R/'research/MarkovFinalAuditM722.lean').write_text(s)
 (O/'final-audit-inventory.json').write_text(json.dumps(dict(modules=list(accepted),declarations=names),indent=2)+'\n')
 print(len(accepted),'modules;',len(names),'declarations in audit source');sys.exit(0)
axioms={};audits=[]
for d in runs:
 if d.get('returncode')==0 and d.get('mode')=='build' and 'Audit' in d['source'] and sha(R/d['source'])==d['sha256']:
  audits.append(d['receipt'])
  for name,ax in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",d['stdout'],re.S):axioms[name]=[a.strip() for a in ax.split(',') if a.strip()]
  for name in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",d['stdout']):axioms[name]=[]
assert all(set(v)<=set(['propext','Classical.choice','Quot.sound']) for v in axioms.values())
for d in accepted.values():
 names=re.findall(r'^theorem (\w+)',(R/d['source']).read_text(),re.M)
 d['axiom_audit_complete']=all(n in axioms for n in names)
 d['unaudited_declarations']=[n for n in names if n not in axioms]
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',(R/d['source']).read_text()),d['source']
limits='Inherited compiled imports reused. Compilation, separate kernel replay and axiom inspection are distinguished. No fresh whole-source rebuild or independent completion audit. Exact root remains unresolved.'
(O/'validation.json').write_text(json.dumps(dict(request_id='722898f8801743d7b87c8028ab0979f7',modules=list(accepted.values()),inherited_replays=[dict(source=d['source'],sha256=d['sha256'],receipt=d['receipt']) for d in inherited],unreplayed_modules=[m for m,d in accepted.items() if not d['kernel_replay_passed']],unaudited_modules=[m for m,d in accepted.items() if not d['axiom_audit_complete']],axiom_audit=axioms,audit_receipts=audits,limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());checks={k:dict(before=v,after=sha(R/k)) for k,v in initial.items()}
assert all(v['before']==v['after'] for v in checks.values())
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_unchanged=True),indent=2)+'\n')
failed=[d for d in runs+unions if d.get('returncode')!=0 and not d.get('skipped')]
skipped=[d for d in runs if d.get('skipped')]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_attempts=[dict(receipt=d['receipt'],timeout=d.get('timeout',False),returncode=d.get('returncode')) for d in failed],skipped_queued_builds=[d['receipt'] for d in skipped],limits=limits,capabilities='capabilities.json',notation_repair='notation-repair.json',temporary_layout_repair='shape-layout-repair.json'),indent=2)+'\n')
files=list(O.glob('*'))+list((R/'research').glob('*722898f8*'))+list((R/'research').glob('Markov*M722.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ['artifact-verification.json','final-check.json']}
(O/'artifact-verification.json').write_text(json.dumps(dict(files=manifest),indent=2)+'\n')
summary=dict(modules=len(accepted),replayed=sum(d['kernel_replay_passed'] for d in accepted.values()),inherited_replays=len(inherited),axiom_closures=len(axioms),unreplayed=[m for m,d in accepted.items() if not d['kernel_replay_passed']],unaudited=[m for m,d in accepted.items() if not d['axiom_audit_complete']],preserved=len(checks),artifacts=len(manifest),rejected_attempts=len(failed),skipped_builds=len(skipped),completion=None)
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary),flush=True)
