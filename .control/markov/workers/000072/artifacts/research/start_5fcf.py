"""Machine-authored request 5fcfae066f644b0aa5a8361d9d8412d0. Read-only reconciliation."""
from pathlib import Path
import hashlib,json,shutil
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-5fcfae06';O.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
prev=json.loads((R/'evidence/markov-75ad68f9/artifacts.json').read_text())['hashes']
checks=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in prev.items()]
i=json.loads((R/'.control/markov/inherited.json').read_text())
print('Inherited keys:',list(i))
inh=[dict(path=p,expected=v['sha256'],actual=sha(R/p)) for p,v in i.items() if isinstance(v,dict) and 'sha256' in v and (R/p).is_file()]
assert all(x['expected']==x['actual'] for x in checks+inh)
pins={p:sha(R/p) for p in ['MathGKM/Markov.lean','.control/markov/contract.json','.control/markov/inherited.json','MISSION.md','docs/DESIGN.md','lean-toolchain','lakefile.toml','lake-manifest.json']}
rec=dict(request_id='5fcfae066f644b0aa5a8361d9d8412d0',artifact_checks=checks,inherited_checks=inh,pins=pins,reconciliation='Immediate predecessor completed. Its 71 artifact hashes match; earlier interrupted c416 worker reconciliation is preserved in 320fe46f. No side effects replayed.',limits=['Higher-priority policy denies .scratch; use unique research/evidence artifacts.'],stop_file_present=(R/'.control/markov/STOP.json').exists(),capabilities={s:shutil.which(s) for s in ['sage','gap','lean','lake']})
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
leanpath=str(R/'evidence/markov-75ad68f9')+':'+json.loads((R/'evidence/markov-75ad68f9/inherited-lean-path.json').read_text())
(O/'inherited-lean-path.json').write_text(json.dumps(leanpath))
(R/'research/markov-5fcfae06-checkpoint.md').write_text('# Live checkpoint 5fcfae06\n\nMachine-authored. Full pinned Conjecture63 open. Read mission/design, root, independent target/residual/core audits, immediate predecessor mathematics and proof files. Verified predecessor and inherited hashes. Investigating cyclic 101/111 source-pattern identities and third-order trace expansion. No root changes.\n')
s=(R/'research/validate_75ad.py').read_text().replace('markov-75ad68f9','markov-5fcfae06')
(R/'research/validate_5fcf.py').write_text(s)
print(json.dumps(dict(artifacts=len(checks),inherited=len(inh),pins=pins,capabilities=rec['capabilities'])))
