"""Machine-authored final source-bound inventory; mathematical and operational scope separate."""
from pathlib import Path
import json,re
from validate_0a5fcabe import R,O,sha
runs=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
unions=[dict(receipt=str(p.relative_to(R)),**json.loads(p.read_text())) for p in sorted(O.glob('kernel-union-*.json'))]
accepted={};axioms={};audits=[]
for d in runs:
 if d.get('returncode')!=0 or d['mode']!='build' or sha(R/d['source'])!=d['sha256']:continue
 m=Path(d['source']).stem
 if 'Audit' in m:
  audits.append(d['receipt'])
  for n,ax in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^\]]*)\]",d['stdout'],re.S):axioms[n]=[a.strip() for a in ax.split(',') if a.strip()]
  for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",d['stdout']):axioms[n]=[]
 elif m.endswith('M0A5') and m!='MarkovFourCycleLocalM0A5':
  accepted[m]=dict(module=m,source=d['source'],sha256=d['sha256'],build=d['receipt'],olean_sha256=sha(O/f'{m}.olean'))
assert all(set(a)<={'propext','Classical.choice','Quot.sound'} for a in axioms.values())
for m,d in accepted.items():
 s=(R/d['source']).read_text();names=re.findall(r'^theorem (\w+)',s,re.M)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',s),m
 d['declarations']=names;d['axiom_audit_complete']=all(n in axioms for n in names)
 d['replays']=[u['receipt'] for u in unions if u.get('returncode')==0 and u['modules'].get(m)==d['sha256']]
 d['kernel_replay_passed']=bool(d['replays'])
limits='Inherited compiled imports reused. No fresh whole-source rebuild or independent hash-bound English/source completion audit. Pinned root unresolved.'
(O/'validation.json').write_text(json.dumps(dict(request_id='0a5fcabe0a82461493719b3bbf93f60a',modules=list(accepted.values()),axiom_audit=axioms,audit_receipts=audits,limits=limits,completion=None),indent=2)+'\n')
initial=json.loads((O/'initial-hashes.json').read_text());checks={k:dict(before=h,after=sha(R/k)) for k,h in initial.items()}
assert all(x['before']==x['after'] for x in checks.values())
assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
(O/'preservation.json').write_text(json.dumps(dict(all_unchanged=True,checks=checks),indent=2)+'\n')
failed=[d for d in runs+unions if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_attempts=[dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in failed],capabilities='capabilities.json',limits=limits),indent=2)+'\n')
pending=[p.stem for p in (R/'research').glob('Markov*M0A5.lean') if p.stem not in accepted and 'Audit' not in p.stem and p.stem!='MarkovFourCycleLocalM0A5']
summary=dict(modules=len(accepted),replayed=sum(d['kernel_replay_passed'] for d in accepted.values()),axiom_closures=len(axioms),unreplayed=[m for m,d in accepted.items() if not d['kernel_replay_passed']],unaudited=[m for m,d in accepted.items() if not d['axiom_audit_complete']],preserved=len(checks),rejected_attempts=len(failed),timeouts=sum(d.get('timeout',False) for d in failed),pending=pending,completion=None)
(O/'pending-candidates.json').write_text(json.dumps(dict(unaccepted=pending,redundant_build='MarkovFourCycleLocalM0A5 duplicates the first three declarations of MarkovFourCycleM0A5 and is excluded from imports and replay unions.',completion=None),indent=2)+'\n')
files=list(O.glob('*'))+list((R/'research').glob('*0a5fcabe*'))+list((R/'research').glob('Markov*M0A5.lean'))
manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ['artifact-verification.json','final-check.json']}
(O/'artifact-verification.json').write_text(json.dumps(dict(files=manifest),indent=2)+'\n');summary['artifacts']=len(manifest)
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary),flush=True)
