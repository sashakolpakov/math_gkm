"""Machine-authored e45ef6ac. Evidence accounting, not mathematical admission."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-e45ef6ac'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovWeightedRunE45e','MarkovWeightedSourceE45e','MarkovWholeWeightsE45e','MarkovRunOrderE45e','MarkovPalindromeOrderE45e']
records=[]
for p in sorted(O.glob('run-*.json')):
 d=json.loads(p.read_text())
 if 'source' not in d or 'command' not in d:continue
 d['record']=str(p.relative_to(R));records.append(d)
validation={}
for m in mods:
 p=R/'research'/f'{m}.lean';h=sha(p)
 rs=[d for d in records if d['source']==str(p.relative_to(R)) and d['sha256']==h]
 bs=[d for d in rs if d['mode']=='build' and d.get('returncode')==0]
 ks=[d for d in rs if d['mode']=='replay' and d.get('returncode')==0]
 axioms=sorted(set(a.strip() for d in bs for group in re.findall(r'depends on axioms: \[([^]]*)\]',d['stdout']) for a in group.split(',') if a.strip()))
 validation[m]=dict(source=str(p.relative_to(R)),sha256=h,compiled=bool(bs),replayed=bool(ks),build_records=[d['record'] for d in bs],replay_records=[d['record'] for d in ks],printed_axioms=axioms,axioms_permitted=bool(bs) and set(axioms)<=set(['propext','Classical.choice','Quot.sound']),olean_sha256=sha(O/f'{m}.olean') if (O/f'{m}.olean').exists() else None)
audits=[d for d in records if d['source']=='research/MarkovAuditE45e.lean' and d.get('returncode')==0 and d['sha256']==sha(R/'research/MarkovAuditE45e.lean')]
audit_axioms=sorted(set(a.strip() for d in audits for group in re.findall(r'depends on axioms: \[([^]]*)\]',d['stdout']) for a in group.split(',') if a.strip()))
source_checks={m:not bool(re.search(r'\b(sorry|admit|native_decide)\b|^\s*axiom\s',(R/'research'/f'{m}.lean').read_text(),re.M)) for m in mods}
(O/'validation.json').write_text(json.dumps(dict(modules=validation,complete_new_theorem_axiom_audit=dict(records=[d['record'] for d in audits],printed_axioms=audit_axioms,permitted=bool(audits) and set(audit_axioms)<=set(['propext','Classical.choice','Quot.sound'])),source_policy_checks=source_checks,scope='Current-source builds and separate explicit-module kernel replay; inherited imports reused. No fresh whole-source rebuild or independent root-completion audit.'),indent=2)+'\n')
fail=[dict(record=d['record'],mode=d['mode'],source=d['source'],returncode=d.get('returncode'),timeout=d.get('timeout',False),stdout=d['stdout'],stderr=d['stderr']) for d in records if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_builds_and_timeouts=fail,capability_limits=['Policy denies .scratch. Unique research/evidence paths used instead.','Sage not found on supplied PATH. GAP found, not needed.','Initial combined reads were output-truncated; mission/design and required audits were reread separately.','Guessed nonexistent inherited filenames were harmless failed reads; actual files were located with rg.','First finalizer invocation failed before writes because run-*.json also matched experiment records. Explicit source/command filtering repaired it; see finalizer-failure.json.'],experiment_caps='probe-runs tests its time limit after each word; its 108-second completion exceeded its nominal 90-second cap. All executions remained foreground.'),indent=2)+'\n')
exps={}
for name in ['weighted-formula','probe-equal','probe-runs','run-order','run-exhaustive','directions','palindrome','order-witness','palindrome-witness']:
 p=O/f'{name}.json';d=json.loads(p.read_text())
 exps[name]=dict(path=str(p.relative_to(R)),sha256=sha(p),input_count=len(d.get('inputs',[])),summary={k:v for k,v in d.items() if k not in ['inputs']})
(O/'experiments-summary.json').write_text(json.dumps(exps,indent=2)+'\n')
rec=json.loads((O/'reconciliation.json').read_text())
checks=[dict(path=d['path'],expected=d['expected'],actual=sha(R/d['path'])) for d in rec['checks']+rec['inherited_checks']]
protected={'MathGKM/Markov.lean':rec['root'],'.control/markov/contract.json':rec['contract']}
checks += [dict(path=p,expected=h,actual=sha(R/p)) for p,h in protected.items()]
(O/'preservation.json').write_text(json.dumps(dict(checks=checks,mismatches=[d for d in checks if d['expected']!=d['actual']],stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
files=list(O.iterdir())+[p for p in (R/'research').iterdir() if 'e45e' in p.name.lower()]
files=[p for p in files if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(R)):sha(p) for p in sorted(files)}
(O/'artifacts.json').write_text(json.dumps(dict(request_id='e45ef6ac30ce4842a691636495cdec9e',hashes=hashes),indent=2)+'\n')
bad=[p for p,h in hashes.items() if sha(R/p)!=h]
(O/'artifact-verification.json').write_text(json.dumps(dict(checked=len(hashes),mismatches=bad),indent=2)+'\n')
print(json.dumps(dict(modules=validation,rejected=len(fail),artifacts=len(hashes),artifact_mismatches=bad,preservation_mismatches=[d for d in checks if d['expected']!=d['actual']]),indent=2))
