"""Machine-authored evidence finalizer; never alters protected or prior records."""
from pathlib import Path
import json,hashlib,datetime
out=Path('evidence/markov-0d052acb')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
modules=['MarkovTransitionFormulasD052','MarkovTransitionGapsD052','MarkovSecondTailD052','MarkovSmallRunsD052','MarkovSecondAllD052','MarkovSecondSourceD052','MarkovInteriorD052']
rows=[];fail=[]
for m in modules:
 p=Path('research')/(m+'.lean');h=sha(p)
 runs=[]
 for q in sorted(out.glob('run-'+m+'-*.json')):
  r=json.loads(q.read_text());r['record']=str(q);runs.append(r)
  if r.get('returncode')!=0:fail.append(dict(record=str(q),timeout=r.get('timeout',False),returncode=r.get('returncode'),source_sha256=r['sha256']))
 accepted=[r for r in runs if r.get('returncode')==0 and r['sha256']==h]
 builds=[r for r in accepted if '-build-' in r['record']]
 replays=[r for r in accepted if '-replay-' in r['record']]
 lines=[line for r in builds for line in r.get('stdout','').splitlines() if 'depends on axioms:' in line]
 rows.append(dict(module=m,source=str(p),sha256=h,compiled=bool(builds),replayed=bool(replays),builds=[r['record'] for r in builds],replays=[r['record'] for r in replays],axiom_lines=lines,olean_sha256=sha(out/(m+'.olean')) if (out/(m+'.olean')).exists() else None))
contract=json.loads(Path('.control/markov/contract.json').read_text())
cc=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
rec=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),request_id='0d052acbcc6844ae8cbc5f5d5f8e5a55',modules=rows,root_sha256=sha('MathGKM/Markov.lean'),contract_canonical_sha256=cc,imports='Pinned inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False,completion=None)
(out/'validation.json').write_text(json.dumps(rec,indent=2)+'\n')
ops=dict(rejected_attempts=fail,capabilities=json.loads((out/'capabilities.json').read_text()),other_observations=['Initial combined file-read output was truncated; required design and independent audits were read in separate subsequent calls.','STOP.json was absent at the recorded read; this is not a mathematical result.','A zsh glob for nonexistent source paths failed; bounded rg over actual source directories succeeded.','Initial small-run build required explicit Nat.choose unfolding and whitespace preventing the graph token ≤s. Failed generated sorryAx closures, if printed, are excluded from accepted receipts.','Expanded transition-gap build timed out; Horner-form retry compiled.','No supervisor execution request, background process, LLM invocation, controller edit, package update or Git access was used.'])
(out/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
paths=[p for p in out.iterdir() if p.is_file() and p.name!='artifacts.json']
paths += list(Path('research').glob('*0d052*'))+list(Path('research').glob('*D052.lean'))
hashes={str(p):sha(p) for p in sorted(set(paths)) if p.is_file()}
(out/'artifacts.json').write_text(json.dumps(dict(request_id=rec['request_id'],hashes=hashes),indent=2)+'\n')
bad=[p for p,h in hashes.items() if sha(p)!=h]
print(json.dumps(dict(modules=[dict(module=r['module'],compiled=r['compiled'],replayed=r['replayed']) for r in rows],rejected_attempts=len(fail),artifact_hashes=len(hashes),mismatches=bad,root_sha256=rec['root_sha256'],contract_sha256=cc)))
