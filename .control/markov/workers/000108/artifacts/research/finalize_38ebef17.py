"""Machine-authored source-bound validation and preservation inventory."""
from pathlib import Path
import json,re,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-38ebef17'
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
 elif Path(d['source']).stem.endswith('M38E'):
  m=Path(d['source']).stem;accepted[m]=dict(module=m,source=d['source'],sha256=d['sha256'],build=d['receipt'],olean_sha256=sha(O/f'{m}.olean'))
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in axioms.values())
rec=json.loads((O/'recovered-validation.json').read_text())
for m,d in rec['modules'].items():
 for u in unions:
  if u.get('returncode')==0 and u.get('modules',{}).get(m)==d['sha256']:
   d['replay']=dict(sha256=d['sha256'],receipt=u['receipt']);d['replay_passed']=True
 if all(n in axioms or n in rec['axioms'] for n in d['declarations']):d['axiom_audit_complete']=True
for m,d in rec['modules'].items():
 for n in d['declarations']:
  if n in axioms:rec['axioms'][n]=axioms[n]
rec['pending_replay']=[m for m,d in rec['modules'].items() if not d['replay_passed']]
rec['pending_axioms']=[m for m,d in rec['modules'].items() if not d['axiom_audit_complete']]
(O/'recovered-validation.json').write_text(json.dumps(rec,indent=2)+'\n')
for m,d in accepted.items():
 names=re.findall(r'^theorem (\w+)',(R/d['source']).read_text(),re.M);d['declarations']=names
 d['replays']=[x['receipt'] for x in runs if x.get('mode')=='replay' and x.get('returncode')==0 and x.get('source')==d['source'] and x.get('sha256')==d['sha256']]
 d['union_replays']=[x['receipt'] for x in unions if x.get('returncode')==0 and x.get('modules',{}).get(m)==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'] or d['union_replays']);d['axiom_audit_complete']=all(n in axioms for n in names)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',(R/d['source']).read_text()),d['source']
limits='Inherited compiled imports reused; no fresh whole-source rebuild or independent hash-bound source/English completion audit. Short-run inequalities reprove earlier coverage. Exact pinned root unresolved.'
(O/'validation.json').write_text(json.dumps(dict(request_id='38ebef17ca8b4ee9b725755d9dcec986',modules=list(accepted.values()),axiom_audit=axioms,audit_receipts=audits,recovered_validation='recovered-validation.json',limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());checks={k:dict(before=h,after=sha(R/k)) for k,h in initial.items()}
assert all(x['before']==x['after'] for x in checks.values())
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_unchanged=True),indent=2)+'\n')
failed=[d for d in runs+unions if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_attempts=[dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in failed],capabilities='capabilities.json',replay_correction='First union included rebuilt unchanged inherited MarkovFullChamber0FA, causing duplicate declaration. Corrected selection replays only new M38E modules; earlier failed receipt retained.',limits=limits),indent=2)+'\n')
allmods=list((R/'research').glob('Markov*M38E.lean'))
pending=[p.stem for p in allmods if p.stem not in accepted and 'Audit' not in p.stem]
summary=dict(modules=len(accepted),replayed=sum(d['kernel_replay_passed'] for d in accepted.values()),axiom_closures=len(axioms),unreplayed=[m for m,d in accepted.items() if not d['kernel_replay_passed']],unaudited=[m for m,d in accepted.items() if not d['axiom_audit_complete']],preserved=len(checks),rejected_attempts=len(failed),timeouts=sum(d.get('timeout',False) for d in failed),pending=pending,completion=None)
(O/'pending-candidates.json').write_text(json.dumps(dict(uncompiled_or_unaccepted=pending,unreplayed=summary['unreplayed'],unaudited=summary['unaudited'],completion=None),indent=2)+'\n')
files=list(O.glob('*'))+list((R/'research').glob('*38ebef17*'))+allmods
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ['artifact-verification.json','final-check.json']}
(O/'artifact-verification.json').write_text(json.dumps(dict(files=manifest),indent=2)+'\n');summary['artifacts']=len(manifest)
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary),flush=True)
