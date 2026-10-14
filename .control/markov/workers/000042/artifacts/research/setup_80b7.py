"""Machine-authored reconciliation, request 80b7912a. Read-only inherited inputs."""
import pathlib,json,hashlib,shutil,os,datetime
R=pathlib.Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-80b7912a'; O.mkdir(exist_ok=True)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
contract=json.loads((R/'.control/markov/contract.json').read_text())
prior=json.loads((R/'evidence/markov-56112359/validation.json').read_text())
events=[json.loads(s) for s in (R/'.control/markov/workers/000041/events.jsonl').read_text().splitlines()]
rec={'request_id':'80b7912a37f44a85a9093d9d5ef87118','time':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'root_sha256':sha(R/'MathGKM/Markov.lean'),'contract_canonical_sha256':hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 'predecessor':'561123595ffe40b8aae85b885aeebd2e','raw_event_count':len(events),'last_event_type':events[-1]['type'],
 'prior_modules':[{'module':m['module'],'current_source_hash':sha(R/m['source']),'expected_hash':m['sha256'],'matches':sha(R/m['source'])==m['sha256'],'replay':m['replay']} for m in prior['modules']],
 'reconciliation':'Latest predecessor completed both builds and kernel replays and emitted final report. Earlier interrupted workers were reconciled by subsequent completed reports. No inherited side effect replayed.'}
(O/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
caps={'python':os.sys.version,'sage':shutil.which('sage'),'gap':shutil.which('gap'),'temporary_files':'User-requested .scratch is denied by active higher-priority policy; no access attempted. Durable scripts/artifacts use research and evidence.', 'failures':['zsh here-document could not create its temporary file; switched to apply_patch and ordinary script execution.','Exploratory guessed filenames missing; used rg to locate actual files.']}
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
print(json.dumps(rec,indent=2));print(json.dumps(caps,indent=2))
