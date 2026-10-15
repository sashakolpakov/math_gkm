"""Machine-authored source-bound final inventory, not independent certification."""
from validate_13d40bd7 import R,O,sha
import json,re,hashlib
runs=[]
for p in sorted(O.glob('build-*.json'))+sorted(O.glob('replay-*.json')):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));runs.append(d)
accepted={};ax={};audits=[]
for d in runs:
 if d.get('returncode')!=0 or d['mode']!='build':continue
 for m,h in d['modules'].items():
  p=R/'research'/f'{m}.lean'
  if sha(p)!=h:continue
  if 'Audit' in m:
   audits.append(d['receipt'])
   for n,v in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",d['stdout'],re.S):ax[n]=[s.strip() for s in v.split(',') if s.strip()]
  else:
   names=re.findall(r'^theorem (\w+)',p.read_text(),re.M)
   assert not re.search(r'\b(sorry|admit|native_decide)\b',p.read_text())
   accepted[m]=dict(source=str(p.relative_to(R)),sha256=h,build=d['receipt'],declarations=names,olean_sha256=sha(O/f'{m}.olean'))
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in ax.values())
for m,d in accepted.items():
 d['axiom_audit_complete']=all(n in ax for n in d['declarations'])
 d['replays']=[r['receipt'] for r in runs if r['mode']=='replay' and r.get('returncode')==0 and r['modules'].get(m)==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'])
inherited=json.loads((O/'inherited-validation-refreshed.json').read_text())
oldreplays=[]
for p in (R/'evidence/markov-cfcbaf30').glob('kernel-union-*.json'):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));oldreplays.append(d)
for m,d in inherited['modules'].items():
 d['replays']=[r['receipt'] for r in runs+oldreplays if r.get('returncode')==0 and r.get('mode','replay')=='replay' and r.get('modules',{}).get(m)==d['sha256']]
 assert d['replays'],m
 assert sha(R/d['source'])==d['sha256']
(O/'inherited-validation-complete.json').write_text(json.dumps(inherited,indent=2)+'\n')
pending=[p.stem for p in (R/'research').glob('Markov*M13D.lean') if p.stem not in accepted and 'Audit' not in p.stem]
limits='Inherited compiled imports reused. No fresh whole-source rebuild or independent hash-bound English/source completion audit. Full pinned root unresolved.'
(O/'validation.json').write_text(json.dumps(dict(modules=accepted,axioms=ax,audits=audits,pending=pending,limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());own_checkpoint='research/markov-13d40bd7-checkpoint.md'
own_updates={p:dict(before=h,after=sha(R/p)) for p,h in initial.items() if p==own_checkpoint and sha(R/p)!=h}
(O/'own-checkpoint-updates.json').write_text(json.dumps(own_updates,indent=2)+'\n')
initial={p:h for p,h in initial.items() if p!=own_checkpoint}
changes={p:dict(before=h,after=sha(R/p)) for p,h in initial.items() if sha(R/p)!=h}
assert not changes,changes
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=json.loads((R/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest();assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary=dict(new_modules=len(accepted),new_replayed=sum(d['kernel_replay_passed'] for d in accepted.values()),axiom_closures=len(ax),unaudited=[m for m,d in accepted.items() if not d['axiom_audit_complete']],unreplayed=[m for m,d in accepted.items() if not d['kernel_replay_passed']],inherited_modules_replayed=len(inherited['modules']),inherited_axiom_closures=len(inherited['axioms']),preserved_inputs=len(initial),root_hash=root,canonical_contract_hash=ch,pending=pending,rejected_attempts=[r['receipt'] for r in runs if r.get('returncode')!=0],limits=limits,completion=None)
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
paths=list(O.glob('*'))+list((R/'research').glob('*13d40bd7*'))+list((R/'research').glob('Markov*M13D.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in paths if p.is_file() and p.name not in ['artifact-verification.json','last-verification.json']}
(O/'artifact-verification.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(summary),flush=True)
