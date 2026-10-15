"""Machine-authored research worker c4169865f3444727be49165831b91f73."""
from pathlib import Path
import hashlib,json,os,shutil
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-c4169865';o.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in json.loads((r/'evidence/markov-7d905904/artifacts.json').read_text())['hashes'].items()]
ic=[dict(path=p,expected=v['sha256'],actual=sha(r/p)) for p,v in idx.items()]
events=[json.loads(s) for s in (r/'.control/markov/workers/000065/events.jsonl').read_text().splitlines()]
rec=dict(request_id='c4169865f3444727be49165831b91f73',artifact_checks=checks,inherited_checks=ic,last_event_types=[e.get('type') for e in events[-3:]],reconciliation='Immediate predecessor completed and reconciled earlier interruptions. Its final validation reports all five new modules replayed, and four older outstanding replays completed. No mutation replayed.',root_sha256=sha(r/'MathGKM/Markov.lean'),contract_sha256=sha(r/'.control/markov/contract.json'),stop_file_present=(r/'.control/markov/STOP.json').exists(),capability_limits=['Higher-priority policy denies .scratch; unique durable research/evidence files used instead.','Attempted inherited file research/MarkovMaskTerm340.lean did not exist; found actual MarkovCutTermFe01.lean.'],capabilities={x:shutil.which(x,path='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin') for x in ['sage','gap','lean','lake']})
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(o/'inherited-lean-path.json').write_text(json.dumps(str(r/'evidence/markov-7d905904')+':'+json.loads((r/'evidence/markov-7d905904/inherited-lean-path.json').read_text()))+'\n')
(r/'research/markov-c4169865-checkpoint.md').write_text('Machine-authored live request c4169865. Mission and design read in full; exact root and independent target/residual/core audits inspected. Latest completed evidence reconciled. Investigating general-source graded diagonal suffix positivity, with comparison to arbitrary words. Root remains unresolved. No .scratch access due to higher-priority denial.\n')
print(json.dumps(dict(artifacts=len(checks),inherited=len(ic),mismatches=[x for x in checks+ic if x['expected']!=x['actual']],stop=rec['stop_file_present'],last_events=rec['last_event_types'],capabilities=rec['capabilities'])))
