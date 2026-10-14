"""Machine-authored live research worker a27f6d42; no controller mutation."""
import pathlib,json,hashlib,os,shutil,importlib.util
out=pathlib.Path('evidence/markov-a27f6d42');out.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()
old=json.loads(pathlib.Path('evidence/markov-b5dbe087/artifacts.json').read_text())
checks=[dict(path=p,expected=h,actual=sha(p),match=sha(p)==h) for p,h in old['hashes'].items()]
inherited=json.loads(pathlib.Path('.control/markov/inherited.json').read_text())
index=[dict(path=p,embedded_sha256=hashlib.sha256(v['content'].encode()).hexdigest(),recorded_sha256=v['sha256']) for p,v in inherited.items()]
contract=json.loads(pathlib.Path('.control/markov/contract.json').read_text())
rec=dict(request_id='a27f6d422b1a478c976694b9ca5c9a54',predecessor='b5dbe087bddc41aaa420318d5cb776a1',hash_checks=checks,inherited_index=index,root_sha256=sha('MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),resolution='Immediate predecessor completed. All retained artifact hashes checked; no side effects replayed. Its reconciliation of interrupted generation 48 is retained and read. No new interrupted effects identified.')
(out/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(out/'capabilities.json').write_text(json.dumps(dict(sage=shutil.which('sage'),gap=shutil.which('gap'),sympy=importlib.util.find_spec('sympy') is not None,scratch='Higher-priority permission denies reads; no access attempted. Durable unique research and evidence paths used.',heredoc='zsh failed creating temporary here-document file before Python ran; switched to apply_patch and python -c.',missing_paths='Three guessed predecessor script paths and MarkovAmbientTransfer5c90.lean did not exist; actual paths found from artifact manifest.'),indent=2)+'\n')
lp=str(pathlib.Path('evidence/markov-b5dbe087').resolve())+':'+json.loads(pathlib.Path('evidence/markov-b5dbe087/inherited-lean-path.json').read_text())
(out/'inherited-lean-path.json').write_text(json.dumps(lp))
pathlib.Path('research/validate_a27f.py').write_text(pathlib.Path('research/validate_b5db.py').read_text().replace('markov-b5dbe087','markov-a27f6d42'))
pathlib.Path('research/markov-a27f6d42-checkpoint.md').write_text('# Research checkpoint\n\nMachine-authored request a27f6d422b1a478c976694b9ca5c9a54. Mission and design read in full; pinned target and independent target/residual/math audits read. Immediate predecessor completed and all artifact hashes reconciled. Full root remains unresolved.\n\nInvestigating source-specific transfer component inequalities and possible global closure, preserving all raw directions. No experiment is a proof. No controller records changed.\n')
print(json.dumps(dict(hashes=len(checks),mismatches=[r['path'] for r in checks if not r['match']],root=rec['root_sha256'],contract=rec['contract_canonical_sha256'],stop=pathlib.Path('.control/markov/STOP.json').exists())))
