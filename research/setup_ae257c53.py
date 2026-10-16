"""Machine-authored reconciliation and research setup for ae257c53. No control writes."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ae257c53'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
assert all(v['expected']==v['actual'] for v in ic.values())
v=json.loads((R/'evidence/markov-03d5764d/validation.json').read_text())
for name,d in v['modules'].items():
 assert sha(R/d['source'])==d['sha256']
 assert sha(R/'evidence/markov-03d5764d'/f'{name}.olean')==d['olean_sha256']
 assert d['kernel_replay_passed'] and d['axiom_audit_complete']
prior=json.loads((R/'evidence/markov-03d5764d/reconciliation.json').read_text())
logs={}
for n in (118,119):
 p=R/f'.control/markov/workers/{n:06}/watchdog.log'
 logs[str(n)]=dict(sha256=sha(p),text=p.read_text())
 assert sha(p)==prior['workers'][str(n)]['log_sha256']
hist=json.loads((R/'.control/markov/workers/000120/final.json').read_text())
(O/'reconciliation.json').write_text(json.dumps(dict(inherited=ic,prior_modules=len(v['modules']),interrupted_logs=logs,prior_reconciliation=prior['finding'],last_report=hist,finding='Worker 120 completed; interrupted workers 118/119 had snapshot failures already reconciled. No snapshot side effect replayed.'),indent=2)+'\n')
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']+list((R/'research').glob('*.lean'))+list((R/'research').glob('*.md'))+list((R/'research').glob('*.py'))
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
lp=str(R/'evidence/markov-03d5764d')+':'+json.loads((R/'evidence/markov-03d5764d/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by higher-priority policy; never accessed.',disk=shutil.disk_usage(R)._asdict(),web='Hosted publisher retrieval succeeded; source sections read.'),indent=2)+'\n')
for kind in ('validate','audit'):
 s=(R/f'research/{kind}_03d5764d.py').read_text().replace('03d5764d','ae257c53').replace("+'M03'","+'MAE2'")
 (R/f'research/{kind}_ae257c53.py').write_text(s)
print(json.dumps(dict(prior_modules=len(v['modules']),inherited=len(ic),stop=(R/'.control/markov/STOP.json').exists(),disk_free=shutil.disk_usage(R).free)))
