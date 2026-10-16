"""Machine-authored source-bound validation and preservation record."""
from validate_9e104e0c import R,O,sha
import json,re,hashlib
runs=[]
for p in sorted(O.glob('build-*.json'))+sorted(O.glob('replay-*.json')):
 d=json.loads(p.read_text());d['receipt']=str(p.relative_to(R));runs.append(d)
accepted={};axioms={};audits=[]
for d in runs:
 if d.get('returncode')!=0 or d['mode']!='build':continue
 for m,h in d['modules'].items():
  p=R/'research'/f'{m}.lean'
  if sha(p)!=h:continue
  if 'Audit' in m:
   audits.append(d['receipt'])
   for n,v in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",d['stdout'],re.S):
    axioms[n]=[s.strip() for s in v.split(',') if s.strip()]
  else:
   src=p.read_text();assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',src)
   accepted[m]=dict(source=str(p.relative_to(R)),sha256=h,build=d['receipt'],declarations=re.findall(r'^theorem (\w+)',src,re.M),olean_sha256=sha(O/f'{m}.olean'))
assert all(set(a)<={'propext','Classical.choice','Quot.sound'} for a in axioms.values())
for m,d in accepted.items():
 d['axiom_audit_complete']=all(n in axioms for n in d['declarations'])
 d['replays']=[r['receipt'] for r in runs if r['mode']=='replay' and r.get('returncode')==0 and r['modules'].get(m)==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'])
limits='Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit. Full pinned root unresolved.'
pending=[p.stem for p in (R/'research').glob('Markov*M9E1.lean') if p.stem not in accepted and 'Audit' not in p.stem]
(O/'validation.json').write_text(json.dumps(dict(modules=accepted,axioms=axioms,audits=audits,pending=pending,limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text())
initial={p:h for p,h in initial.items() if p!='research/markov-9e104e0c-checkpoint.md'}
changes={p:dict(before=h,after=sha(R/p)) for p,h in initial.items() if sha(R/p)!=h}
assert not changes,changes
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary=dict(new_modules=len(accepted),replayed=sum(d['kernel_replay_passed'] for d in accepted.values()),axiom_closures=len(axioms),unaudited=[m for m,d in accepted.items() if not d['axiom_audit_complete']],unreplayed=[m for m,d in accepted.items() if not d['kernel_replay_passed']],unchanged_inputs=len(initial),root_sha256=root,canonical_contract_hash=ch,pending=pending,rejected_attempts=[r['receipt'] for r in runs if r.get('returncode')!=0],limits=limits,completion=None)
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
paths=list(O.glob('*'))+list((R/'research').glob('*9e104e0c*'))+list((R/'research').glob('*M9E1.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in paths if p.is_file() and p.name not in ('artifact-verification.json','last-verification.json')}
(O/'artifact-verification.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(summary),flush=True)
