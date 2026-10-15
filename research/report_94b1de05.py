"""Machine-authored source-bound local inventory and preservation checks."""
from pathlib import Path
import hashlib,json,re,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-94b1de05'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
runs=[(p,json.loads(p.read_text())) for p in O.glob('run-Markov*.json')]
mods={}
for p,d in runs:
 if d.get('mode')!='build' or d.get('returncode')!=0:continue
 src=R/d['source'];m=src.stem
 if m in ['MarkovAuditM94','MarkovFullCoeff0FA','MarkovFullCoeff1FA']:continue
 if sha(src)!=d['sha256']:continue
 mods[m]=dict(module=m,source=d['source'],sha256=d['sha256'],build=str(p.relative_to(R)))
if sys.argv[1]=='audit':
 text='\n'.join('import '+m for m in sorted(mods))+'\n/-! Machine-authored 94b1de05. Local axiom inventory only. -/\n'
 decls=[]
 for m,d in sorted(mods.items()):
  for name in re.findall(r'^theorem\s+(\w+)',(R/d['source']).read_text(),re.M):
   decls.append('MathGKM.Markov.'+name)
 for n in decls:text+='#print axioms '+n+'\n'
 (R/'research/MarkovAuditM94.lean').write_text(text)
 (O/'accepted-modules.json').write_text(json.dumps(sorted(mods),indent=2)+'\n')
 (O/'declarations.json').write_text(json.dumps(decls,indent=2)+'\n')
 print(dict(modules=len(mods),theorems=len(decls)))
else:
 unions=[(p,json.loads(p.read_text())) for p in O.glob('kernel-union-*.json')]
 for m,d in mods.items():
  d['replays']=[str(p.relative_to(R)) for p,x in runs if x.get('mode')=='replay' and x.get('returncode')==0 and x.get('source')==d['source'] and x.get('sha256')==d['sha256']]
  d['union_replays']=[str(p.relative_to(R)) for p,x in unions if x.get('returncode')==0 and x.get('modules',{}).get(m)==d['sha256']]
  d['kernel_replay_passed']=bool(d['replays'] or d['union_replays'])
 audits=[(p,x) for p,x in runs if x.get('source')=='research/MarkovAuditM94.lean' and x.get('mode')=='build' and x.get('returncode')==0 and x.get('sha256')==sha(R/'research/MarkovAuditM94.lean')]
 ax=[]
 if audits:
  p,x=audits[-1]
  for name,ls in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",x['stdout']):
   axioms=[a.strip() for a in ls.split(',') if a.strip()];assert set(axioms)<={'propext','Classical.choice','Quot.sound'}
   ax.append(dict(declaration=name,axioms=axioms))
  for name in re.findall(r"'([^']+)' does not depend on any axioms",x['stdout']):ax.append(dict(declaration=name,axioms=[]))
 rejected=[dict(receipt=str(p.relative_to(R)),source=x.get('source'),timeout=x.get('timeout',False),skipped=x.get('skipped',False)) for p,x in runs if x.get('returncode')!=0]
 result=dict(request_id='94b1de05f66043aeb7a32e517aeb2a6f',modules=list(mods.values()),axiom_audit=ax,audit_receipts=[str(p.relative_to(R)) for p,_ in audits],rejected_attempts=rejected,limits='Local source-bound compilation and replay reuse inherited imports. No fresh whole-source rebuild, independent completion audit or root closure.',completion=None)
 (O/'validation.json').write_text(json.dumps(result,indent=2)+'\n')
 initial=json.loads((O/'initial-hashes.json').read_text());checks={k:dict(expected=v,actual=sha(R/k)) for k,v in initial.items()};assert all(v['expected']==v['actual'] for v in checks.values())
 (O/'preservation.json').write_text(json.dumps(dict(checks=checks,all_unchanged=True),indent=2)+'\n')
 files={}
 for p in list(O.iterdir())+list((R/'research').glob('*94b1de05*'))+list((R/'research').glob('*M94.lean'))+[R/'research/MarkovAuditM94.lean']:
  if p.is_file() and p.name!='artifact-verification.json':files[str(p.relative_to(R))]=sha(p)
 (O/'artifact-verification.json').write_text(json.dumps(dict(files=files),indent=2)+'\n')
 print(dict(modules=len(mods),replayed=sum(x['kernel_replay_passed'] for x in mods.values()),audited=len(ax),rejected=len(rejected),preserved=len(checks),artifacts=len(files)))
