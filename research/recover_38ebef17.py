"""Machine-authored recovery inventory; reads preserved receipts without replaying mutations."""
from pathlib import Path
import json,re
from validate_38ebef17 import R,O,sha
old=R/'evidence/markov-8b851864';mods={};axioms={};done={}
for p in sorted(old.glob('run-*.json')):
 d=json.loads(p.read_text())
 if d.get('returncode')!=0 or d.get('mode')!='build' or sha(R/d['source'])!=d['sha256']:continue
 if 'Audit' in d['source']:
  for name,ax in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",d['stdout'],re.S):axioms[name]=[a.strip() for a in ax.split(',') if a.strip()]
  for name in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",d['stdout']):axioms[name]=[]
 else:mods[Path(d['source']).stem]=dict(source=d['source'],sha256=d['sha256'],build=str(p.relative_to(R)))
for p in old.glob('kernel-union-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0:
  for m,h in d.get('modules',{}).items():done[m]=dict(sha256=h,receipt=str(p.relative_to(R)))
pending=[];missing=[]
for m,d in mods.items():
 d['declarations']=re.findall(r'^theorem (\w+)',(R/d['source']).read_text(),re.M)
 d['replay']=done.get(m);d['replay_passed']=done.get(m,{}).get('sha256')==d['sha256']
 d['axiom_audit_complete']=all(n in axioms for n in d['declarations'])
 if not d['replay_passed']:pending.append(m)
 if not d['axiom_audit_complete']:missing.append(m)
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in axioms.values())
(O/'recovered-validation.json').write_text(json.dumps(dict(modules=mods,axioms=axioms,pending_replay=pending,pending_axioms=missing,limits='Inherited receipts checked against current source hashes. No fresh whole-source rebuild.',completion=None),indent=2)+'\n')
s=''.join(f'import {m}\n' for m in mods)+'/-! Machine-authored request 38ebef17. Recovery axiom audit. -/\n'+''.join(f'#print axioms MathGKM.Markov.{n}\n' for m in missing for n in mods[m]['declarations'])
(R/'research/MarkovRecoveryAuditM38E.lean').write_text(s)
print(json.dumps(dict(modules=len(mods),axiom_closures=len(axioms),pending_replay=pending,pending_axioms=missing)))
