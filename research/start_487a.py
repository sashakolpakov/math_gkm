"""Machine-authored live worker 487ae883; reconciliation only, no controller edits."""
import json,pathlib,hashlib,shutil,importlib.util
out=pathlib.Path('evidence/markov-487ae883');out.mkdir(exist_ok=False)
def sha(p): return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
old=json.loads(pathlib.Path('evidence/markov-a27f6d42/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
events=[json.loads(l) for l in pathlib.Path('.control/markov/workers/000050/events.jsonl').read_text().splitlines()]
tail=events[-8:]
rec=dict(request_id='487ae88398fa4257b0567f68f6371317',checks=checks,root_sha256=sha('MathGKM/Markov.lean'),contract=json.loads(pathlib.Path('.control/markov/contract.json').read_text()),event_tail=tail,resolution='Predecessor finalizer completed before a late successful root replay. Its validation manifest is stale for MarkovCutRootA27: run-1792005749259901000.json records successful replay after finalization. No mutations replayed; obstruction replay remains unverified.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority permissions; no access attempted',failures=['Shell here-document could not create temporary file; Python did not run.','Guessed predecessor script filenames did not exist; actual paths discovered with rg.']),indent=2)+'\n')
lp=str(pathlib.Path('evidence/markov-a27f6d42').resolve())+':'+json.loads(pathlib.Path('evidence/markov-a27f6d42/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
pathlib.Path('research/validate_487a.py').write_text(pathlib.Path('research/validate_a27f.py').read_text().replace('markov-a27f6d42','markov-487ae883'))
pathlib.Path('research/markov-487ae883-checkpoint.md').write_text('# Checkpoint\n\nMachine-authored request 487ae88398fa4257b0567f68f6371317. Mission/design and required independent audits read. Predecessor final artifacts reconciled: late root replay succeeded after its manifest was written. Root unresolved. Investigating exact cut coefficients and source-word restrictions. No inherited side effect replayed.\n')
print(json.dumps(dict(checks=len(checks),mismatches=[r['path'] for r in checks if not r['match']],stop=pathlib.Path('.control/markov/STOP.json').exists())))
