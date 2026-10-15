"""Machine-authored live research request 89ce11adb69243f8836fc68470d6d524."""
from pathlib import Path
import json, hashlib, shutil
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-89ce11ad';o.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in json.loads((r/'evidence/markov-320fe46f/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
rec=dict(request_id='89ce11adb69243f8836fc68470d6d524',artifact_checks=checks,inherited_checks=ic,reconciliation='Immediate predecessor completed. Its reconciliation explicitly resolved interrupted c416 effects, including Tail replay and repaired Raw320f source. No incomplete side effect replayed.',root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),stop_file_present=(r/'.control/markov/STOP.json').exists(),capability_limits=['Higher-priority policy denies .scratch; using unique durable research/evidence paths.','Shell heredoc failed: temporary-file creation denied. No mathematical implication.','Initial STOP read reported absent file.'],capabilities={x:shutil.which(x,path='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin') for x in ['sage','gap','lean','lake']})
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-320fe46f')+':'+json.loads((r/'evidence/markov-320fe46f/inherited-lean-path.json').read_text()))+'\n')
(r/'research/validate_89ce.py').write_text((r/'research/validate_320f.py').read_text().replace('markov-320fe46f','markov-89ce11ad'))
(r/'research/markov-89ce11ad-checkpoint.md').write_text('Machine-authored live request 89ce11ad. Mission/design and independent audits read. Exact root remains open. Investigating higher-cut weights. Predecessor completed; all inherited checks recorded. Policy denies .scratch.\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],stop=rec['stop_file_present'],capabilities=rec['capabilities'])))
for k,v in idx.items():
 print(k,v['sha256'])
 if k not in ['RESUME.json','evidence/independent-markov/MATHEMATICAL_REVIEW.md','evidence/independent-markov/markov_round5_target_definition_audit.md','evidence/independent-markov/markov_residual_scope_audit.md']:print(v['content'])
