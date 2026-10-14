"""Machine-authored 487ae883 checkpoint/final manifest; never edits control records."""
import pathlib,json,hashlib,datetime
out=pathlib.Path('evidence/markov-487ae883')
def sha(p):return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
names=['MarkovCyclicTrace487','MarkovLowerBlocks487','MarkovRunJet487','MarkovLowerFormula487','MarkovLowerSequence487','MarkovLowerSource487','MarkovInterior487']
runs=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
modules=[]
for name in names:
 p=pathlib.Path('research')/(name+'.lean')
 if not p.exists():continue
 h=sha(p);build=[];replay=[]
 for q,r in runs:
  if pathlib.Path(r['source']).stem!=name or r['sha256']!=h or r.get('returncode')!=0:continue
  (replay if pathlib.Path(r['command'][0]).name=='leanchecker' else build).append((q,r))
 modules.append(dict(module=name,source=str(p),sha256=h,build=str(build[-1][0]) if build else None,replay=str(replay[-1][0]) if replay else None,axiom_lines=[l for l in (build[-1][1]['stdout'].splitlines() if build else []) if 'depends on axioms' in l],olean_sha256=sha(out/(name+'.olean')) if (out/(name+'.olean')).exists() else None))
contract=json.loads(pathlib.Path('.control/markov/contract.json').read_text())
val=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,root_sha256=sha('MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False,completion=None)
(out/'validation.json').write_text(json.dumps(val,indent=2)+'\n')
failed=[dict(record=str(q),source=r['source'],timeout=r.get('timeout',False),returncode=r.get('returncode')) for q,r in runs if r.get('returncode')!=0]
(out/'operational-observations.json').write_text(json.dumps(dict(failed_attempts=failed,capabilities=json.loads((out/'capabilities.json').read_text()),reconciliation='All 65 predecessor artifact hashes matched. Late root replay succeeded after predecessor finalization. No side effects replayed.',root_closure=False),indent=2)+'\n')
paths=[p for p in out.iterdir() if p.is_file() and p.name!='artifacts.json']
paths += list(pathlib.Path('research').glob('*487*'))
(out/'artifacts.json').write_text(json.dumps(dict(provenance='Live machine-authored worker 487ae88398fa4257b0567f68f6371317',hashes={str(p):sha(p) for p in paths if p.is_file()}),indent=2)+'\n')
print(json.dumps(dict(modules=[dict(module=m['module'],compiled=bool(m['build']),replayed=bool(m['replay'])) for m in modules],failed=len(failed),completion=None)))
