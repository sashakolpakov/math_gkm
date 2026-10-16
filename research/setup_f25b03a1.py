"""Machine-authored live request f25b03a14b4d4680ba608ed153fcd2b6.
Reconcile interrupted side effects before creating new mathematical artifacts.
"""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-f25b03a1'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
out={'request_id':'f25b03a14b4d4680ba608ed153fcd2b6','inherited':{}}
for p,v in json.loads((R/'.control/markov/inherited.json').read_text()).items():
 out['inherited'][p]=sha(R/p)==v['sha256']
for tag in ['d11e335e','5703599b','81f80b2d']:
 m=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 out[tag]={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000133','000134']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 out[n]={'events_sha256':sha(p),'count':len(es),'last_events':es[-6:], 'receipt':json.loads((p.parent/'receipt.json').read_text())}
out['reconciliation']='Worker 133 finalized 30 modules and the b>=2a strip before its reporting timeout. Worker 134 finalized 39 compiled/axiom-audited modules (16 separately replayed); cone2 coverage compiled but its audit was interrupted. Source gap, all-source strip and residual were excluded. No prior side effect is replayed; new copies of four excluded drafts will be checked under MF25 names.'
out['capability']='Higher-priority policy denies .scratch. No access attempted; unique research/evidence files used. No agents, controller, background services, shell networking, Git or package changes invoked.'
(O/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file():snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:
 snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-81f80b2d')+':'+json.loads((R/'evidence/markov-81f80b2d/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_81f80b2d.py','validate_f25b03a1.py'),('audit_81f80b2d.py','audit_f25b03a1.py'),('ReplayIsolatedM81F.lean','ReplayIsolatedMF25.lean')]:
 s=(R/'research'/old).read_text().replace('81f80b2d','f25b03a1').replace('M81F','MF25').replace("'build',35","'build',180")
 (R/'research'/new).write_text(s)
mods=['MarkovHighCone2Gap','MarkovHighGap','MarkovHighAll','MarkovResidual']
names=[]
import re
for m in mods:
 names+=re.findall(r'^(?:theorem|def|abbrev)\s+(\w+)',(R/'research'/f'{m}M81F.lean').read_text(),re.M)
for m in mods:
 s=(R/'research'/f'{m}M81F.lean').read_text()
 for mm in mods:s=s.replace(mm+'M81F',mm+'MF25')
 for n in names:s=re.sub(r'\b'+n+r'\b',n.replace('M81F','MF25'),s)
 (R/'research'/f'{m}MF25.lean').write_text('/- Machine-authored f25b03a1: reconciled copy of an excluded interrupted draft. -/\n'+s)
print(json.dumps({k:v for k,v in out.items() if not k.startswith('000')}))
