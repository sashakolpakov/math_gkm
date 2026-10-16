"""Machine-authored live request 295093095f844a1189c05bb526265c75."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-29509309'; O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((R/'.control/markov/inherited.json').read_text())
(O/'inherited-decoded.txt').write_text('\n\n'.join(p+'\n'+v['content'] for p,v in idx.items()))
d={'request_id':'295093095f844a1189c05bb526265c75','inherited':{p:sha(R/p)==v['sha256'] for p,v in idx.items()}}
m=json.loads((R/'evidence/markov-0d346fa7/manifest.json').read_text())
d['latest_manifest']={'count':len(m),'mismatches':[p for p,h in m.items() if not (R/p).exists() or sha(R/p)!=h]}
for n in ['000136','000137','000148']:
 p=R/f'.control/markov/workers/{n}/events.jsonl'
 es=[json.loads(s) for s in p.read_text().splitlines() if s.strip()]
 receipt=json.loads((p.parent/'receipt.json').read_text()); changes=receipt.pop('changes')
 d[n]={'events_sha256':sha(p),'events_count':len(es),'last_events':es[-2:],'receipt':receipt,'change_count':len(changes),'change_mismatches':[p for p,v in changes.items() if v['after'] and (not (R/p).exists() or sha(R/p)!=v['after'])]}
d['reconciliation']='Inspected interrupted workers 136/137 and completed predecessor 148, including raw event tails and actual effects. No old side effect replayed.'
d['capabilities']={'scratch':'Higher-priority policy denies access; unique durable research/evidence paths used.','heredoc':'zsh here-document failed to create temporary file; use durable scripts.','sage':shutil.which('sage'),'gap':shutil.which('gap')}
(O/'reconciliation.json').write_text(json.dumps(d,indent=2)+'\n')
snapshot={}
for base in ['MathGKM','research','contracts','docs']:
 for p in (R/base).rglob('*'):
  if p.is_file(): snapshot[str(p.relative_to(R))]=sha(p)
for n in ['MISSION.md','lakefile.toml','lake-manifest.json','lean-toolchain','.control/markov/contract.json']:snapshot[n]=sha(R/n)
(O/'before.json').write_text(json.dumps(snapshot,indent=2)+'\n')
lp=str(R/'evidence/markov-0d346fa7')+':'+json.loads((R/'evidence/markov-0d346fa7/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp))
for old,new in [('validate_0d346fa7.py','validate_29509309.py'),('ReplayIsolatedM0D3.lean','ReplayIsolatedM295.lean'),('audit_0d346fa7.py','audit_29509309.py')]:
 s=(R/'research'/old).read_text().replace('0d346fa7','29509309').replace('M0D3','M295'); (R/'research'/new).write_text(s)
print(json.dumps({k:({x:v[x] for x in ['events_count','change_count','change_mismatches']} if k.startswith('000') else v) for k,v in d.items()},indent=2))
