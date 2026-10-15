"""Machine-authored evidence checkpoint; never changes controller records."""
from pathlib import Path
import json,hashlib,re
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-6d2c5a67'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovAlignedCount6d2c','MarkovAlignedLC6d2c','MarkovAlignedPrefix6d2c','MarkovAlignedObstruction6d2c','MarkovTrimLinear6d2c','MarkovAlignedInterval6d2c']
records=[]
for p in sorted(o.glob('run-*.json')):
 x=json.loads(p.read_text());x['receipt']=str(p.relative_to(r));records.append(x)
known=json.loads((o/'known-kernel-replay.json').read_text()) if (o/'known-kernel-replay.json').exists() else None
validation={}
for m in mods:
 h=sha(r/'research'/f'{m}.lean');rr=[x for x in records if x['source']==f'research/{m}.lean' and x['sha256']==h]
 builds=[x for x in rr if x['command'][0].endswith('/lean') and x.get('returncode')==0]
 replays=[x for x in rr if x['command'][0].endswith('/leanchecker') and x.get('returncode')==0]
 kp=bool(known and known.get('returncode')==0 and known['sources'].get(m)==h and f'replay passed {m}' in known['stdout'])
 validation[m]=dict(sha256=h,build=builds[-1]['receipt'] if builds else None,official_replay=replays[-1]['receipt'] if replays else None,explicit_known_module_replay='evidence/markov-6d2c5a67/known-kernel-replay.json' if kp else None,printed_axioms=builds[-1]['stdout'] if builds else None)
(o/'validation.json').write_text(json.dumps(dict(modules=validation,scope='Pinned kernel replay of new declarations over inherited compiled imports; no fresh whole-source rebuild, no independent English/source completion audit.'),indent=2)+'\n')
fail=[dict(receipt=x['receipt'],timeout=x.get('timeout',False),returncode=x.get('returncode')) for x in records if x.get('returncode')!=0]
ops=dict(rejected_builds_and_replay_timeouts=fail,other_observations=[
 '.scratch is denied by higher-priority filesystem policy; no .scratch access attempted. Durable research/evidence files used.',
 'Initial raw_source_6d2c.py assertion failed after a broad string replacement altered an expected value. Rejected source preserved as raw-source-rejected.py; explicit expected [1,14,91] corrected and independent recurrence succeeded.',
 'A search named missing research/MarkovCutSliceA27.lean; no mathematical conclusion drawn.',
 'leanchecker --help treated the flag as an ignored flag and attempted default module Math_gkm, which is absent. This is a capability invocation failure, not a mathematical result.',
 'Pinned LeanChecker source read to diagnose search-path enumeration. ReplayKnown6d2c preserves its replayFromImports body and substitutes explicit module names for recursive discovery. No controller or checker installation was changed.',
 'The explicit-known-module replay driver also timed out after 100 seconds with no captured progress; the discovery-cost hypothesis is not established as the cause. Its run is not counted as successful replay.',
 'Process inspection with ps was denied by the sandbox. No permission escalation or external process action followed.',
 'Hosted source search executed. No retrieved assertion used as a new axiom; no package changes or external actions pending.'
 ])
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
contract=json.loads((r/'.control/markov/contract.json').read_text())
old=json.loads((r/'evidence/markov-68a44d34/artifacts.json').read_text())['hashes']
idx=json.loads((r/'.control/markov/inherited.json').read_text())
pres=dict(root_sha256=sha(r/'MathGKM/Markov.lean'),canonical_contract_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),stop_file_present=(r/'.control/markov/STOP.json').exists(),predecessor_hash_count=len(old),predecessor_mismatches=[p for p,h in old.items() if sha(r/p)!=h],inherited_mismatches=[p for p,v in idx.items() if sha(r/p)!=v['sha256']])
(o/'preservation.json').write_text(json.dumps(pres,indent=2)+'\n')
files=[p for p in o.rglob('*') if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
files += [p for p in (r/'research').iterdir() if p.is_file() and ('6d2c' in p.name)]
hashes={str(p.relative_to(r)):sha(p) for p in files}
(o/'artifacts.json').write_text(json.dumps(dict(request_id='6d2c5a67e4e14b3993f3b98af6bf0e61',hashes=hashes),indent=2)+'\n')
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in hashes.items()]
(o/'artifact-verification.json').write_text(json.dumps(dict(count=len(checks),mismatches=[x for x in checks if x['expected']!=x['actual']],checks=checks),indent=2)+'\n')
print(json.dumps(dict(modules={m:{k:v for k,v in x.items() if k!='printed_axioms'} for m,x in validation.items()},artifacts=len(checks),preservation=pres,rejected=len(fail))))
