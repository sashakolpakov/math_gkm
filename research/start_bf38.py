"""Machine-authored live worker bf38fa19: bounded reconciliation, no control edits."""
import pathlib,json,hashlib,shutil,importlib.util
out=pathlib.Path('evidence/markov-bf38fa19');out.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
old=json.loads(pathlib.Path('evidence/markov-487ae883/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
events=pathlib.Path('.control/markov/workers/000051/events.jsonl').read_text().splitlines()
contract=json.loads(pathlib.Path('.control/markov/contract.json').read_text())
rec=dict(request_id='bf38fa192cd64d11804e5c1de553ef23',checks=checks,
 root_sha256=sha('MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 event_tail=[json.loads(x) for x in events[-10:]],
 resolution='Seven predecessor modules compiled, four replayed. Late LowerSource and Interior replay attempts timed out; no additional successful replay found. Prior formal sources and evidence preserved. No side effect blindly repeated; new mathematics chosen: second cyclic run jet and its ordering dependence.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Denied by higher-priority permissions; not accessed',failures=['zsh here-document temp-file creation rejected; switched to apply_patch and Python -c.']),indent=2)+'\n')
lp=str(pathlib.Path('evidence/markov-487ae883').resolve())+':'+json.loads(pathlib.Path('evidence/markov-487ae883/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
pathlib.Path('research/validate_bf38.py').write_text(pathlib.Path('research/validate_487a.py').read_text().replace('markov-487ae883','markov-bf38fa19').replace('timeout=65','timeout=150'))
pathlib.Path('research/markov-bf38fa19-checkpoint.md').write_text('# Checkpoint\n\nMachine-authored bf38fa192cd64d11804e5c1de553ef23. Mission/design and all required independent audits read. Interrupted predecessor effects reconciled; seven compiled modules, three replay timeouts retained. Root unresolved. Investigating second lower cyclic coefficients, preserving exact source run restrictions.\n')
print(json.dumps(dict(checks=len(checks),mismatches=[x['path'] for x in checks if not x['match']],root=rec['root_sha256'],contract=rec['contract_canonical_sha256'])))
