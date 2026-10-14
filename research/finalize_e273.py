"""Machine-authored e27336bc research receipts; not independent admission."""
from pathlib import Path
import json,hashlib,re,datetime
out=Path('evidence/markov-e27336bc')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
runs=[(p,json.loads(p.read_text())) for p in out.glob('run-*.json')]
modules=[]
for src in sorted(Path('research').glob('Markov*E273.lean')):
 h=sha(src);rs=[(p,r) for p,r in runs if r['source']==str(src) and r['sha256']==h]
 builds=[(p,r) for p,r in rs if r.get('returncode')==0 and r['command'][0].endswith('/lean')]
 replays=[(p,r) for p,r in rs if r.get('returncode')==0 and r['command'][0].endswith('/leanchecker')]
 axioms=[x for p,r in builds for x in r['stdout'].splitlines() if 'depends on axioms' in x]
 assert not any('sorryAx' in x for x in axioms)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',src.read_text())
 modules.append(dict(module=src.stem,source=str(src),sha256=h,compiled=bool(builds),replayed=bool(replays),builds=[str(p) for p,r in builds],replays=[str(p) for p,r in replays],axiom_lines=axioms,olean_sha256=sha(out/(src.stem+'.olean')) if (out/(src.stem+'.olean')).exists() else None))
contract=json.loads(Path('.control/markov/contract.json').read_text())
root=sha('MathGKM/Markov.lean');ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
rec=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,root_sha256=root,contract_canonical_sha256=ch,imports='Pinned inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False,completion=None)
(out/'validation.json').write_text(json.dumps(rec,indent=2)+'\n')
fail=[dict(record=str(p),source=r['source'],timeout=r.get('timeout',False),returncode=r.get('returncode')) for p,r in runs if r.get('returncode')!=0]
(out/'operational-observations.json').write_text(json.dumps(dict(provenance='Machine-authored live worker e27336bc',rejected_attempts=fail,capabilities=json.loads((out/'capabilities.json').read_text()),record_collision='Concurrent ChooseShape and SparseKernel builds received identical time.time_ns. SparseKernel record replaced ChooseShape receipt. Module-specific snapshots survived. Validator filenames now include module/mode; ChooseShape was recompiled with a fresh printed axiom closure. No mathematical claim relies on the overwritten receipt.',read_failures=['Shell heredoc could not create temporary file under denied system temp directory; switched to apply_patch and Python -c.','Several guessed inherited filenames/globs and the installed Lean Checker source path were absent; no external source was accessed.','One progress-document patch had a context mismatch and made no change; a subsequent append recorded the update.'],meaning='Tool failures, timeouts, and records are operational evidence, never mathematical results.'),indent=2)+'\n')
(out/'source-read.json').write_text(json.dumps(dict(url=contract['source'],method='Hosted web open and find, 2026-10-14',sections=['Equation (5)','Equation (7)','Definitions 6.1 and 6.2','Conjecture 6.3'],observations=['Published target uses ordinary coefficients and all three principal directions.','Pinned root was not changed.','No external assertion was imported as an axiom.'],independent_completion_audit=False),indent=2)+'\n')
paths=list(out.glob('*'))+list(Path('research').glob('*e273*'))+list(Path('research').glob('*E273.lean'))
hashes={str(p):sha(p) for p in paths if p.is_file() and p.name!='artifacts.json'}
(out/'artifacts.json').write_text(json.dumps(dict(provenance='Machine-authored e27336bc; hash binding, not proof admission',hashes=hashes),indent=2)+'\n')
print(json.dumps(dict(modules=[dict(module=x['module'],compiled=x['compiled'],replayed=x['replayed']) for x in modules],rejected_attempts=len(fail),hashes=len(hashes),root_sha256=root,contract_sha256=ch)))
