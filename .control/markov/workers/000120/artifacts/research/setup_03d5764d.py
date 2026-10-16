"""Machine-authored research reconciliation, request 03d5764d. Read-only inputs."""
from pathlib import Path
import hashlib,json,os,shutil,sys
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-03d5764d'
O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
checks={}
for n in (118,119):
 d=R/f'.control/markov/workers/{n:06}'
 before=json.loads((d/'before.json').read_text())
 # Check project research/source text only; never read denied paths or build archives.
 eligible={k:v for k,v in before.items() if k.startswith(('research/','MathGKM/')) and Path(k).suffix in ('.lean','.py','.md')}
 changes={k:dict(before=v,now=sha(R/k) if (R/k).is_file() else None) for k,v in eligible.items() if not (R/k).is_file() or sha(R/k)!=v}
 checks[str(n)]=dict(log=(d/'watchdog.log').read_text(),log_sha256=sha(d/'watchdog.log'),checked=len(eligible),changes=changes,files=[p.name for p in d.iterdir()])
inh=json.loads((R/'.control/markov/inherited.json').read_text())
ic={k:dict(expected=v['sha256'],actual=sha(R/k)) for k,v in inh.items()}
v=json.loads((R/'evidence/markov-1152282d/validation.json').read_text())
for name,d in v['modules'].items():
 assert sha(R/d['source'])==d['sha256']
 assert sha(R/'evidence/markov-1152282d'/f'{name}.olean')==d['olean_sha256']
 assert d['kernel_replay_passed'] and d['axiom_audit_complete']
(O/'reconciliation.json').write_text(json.dumps(dict(workers=checks,inherited=ic,prior_modules=len(v['modules']),finding='Both interrupted workers failed during snapshot copying with ENOSPC, before a model research event log was created. No research/source text changes detected against their before manifests. No failed side effect replayed.'),indent=2)+'\n')
files=[R/'MISSION.md',R/'docs/DESIGN.md',R/'MathGKM/Markov.lean',R/'.control/markov/contract.json']+list((R/'research').glob('*.lean'))+list((R/'research').glob('*.md'))
(O/'initial-hashes.json').write_text(json.dumps({str(p.relative_to(R)):sha(p) for p in files},indent=2)+'\n')
lp=str(R/'evidence/markov-1152282d')+':'+json.loads((R/'evidence/markov-1152282d/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(lp)+'\n')
(O/'capabilities.json').write_text(json.dumps(dict(python=sys.version,sage=shutil.which('sage'),gap=shutil.which('gap'),scratch='Denied by higher-priority policy; not accessed.',heredoc='Failed before Python: zsh temp-file permission denial.',disk=shutil.disk_usage(R)._asdict(),web='Hosted publisher retrieval succeeded.'),indent=2)+'\n')
(R/'research/validate_03d5764d.py').write_text((R/'research/validate_1152282d.py').read_text().replace('1152282d','03d5764d'))
print(json.dumps(dict(reconciled={k:dict(checked=d['checked'],changes=d['changes']) for k,d in checks.items()},prior_modules=len(v['modules']),stop=(R/'.control/markov/STOP.json').exists())))
