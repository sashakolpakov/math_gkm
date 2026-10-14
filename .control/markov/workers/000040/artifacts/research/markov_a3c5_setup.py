"""Machine-authored research setup for a3c53fa7; read-only reconciliation."""
import pathlib,json,hashlib,datetime,shutil
r=pathlib.Path('/Users/sasha/math_gkm'); o=r/'evidence/markov-a3c53fa7';o.mkdir(exist_ok=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
idx=json.loads((r/'.control/markov/inherited.json').read_text())
rec={'request_id':'a3c53fa7bcea4aaf80795a13558baa99','time':datetime.datetime.now(datetime.timezone.utc).isoformat(),'inherited':{k:{'embedded_hash_matches':hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256'],'current_sha256':sha(r/k),'indexed_sha256':v['sha256']} for k,v in idx.items()},'root_sha256':sha(r/'MathGKM/Markov.lean'),'contract_canonical_sha256':hashlib.sha256(json.dumps(json.loads((r/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),'capabilities':{'python':'/opt/homebrew/bin/python3','sage':shutil.which('sage'),'gap':shutil.which('gap'),'scratch':'Higher-priority policy prohibits .scratch reads; retained unique research/evidence files used.'}}
prior=r/'.control/markov/workers/000039/events.jsonl'
rec['previous_events_sha256']=sha(prior)
lines=prior.read_text().splitlines()
rec['previous_event_lines']=len(lines)
rec['previous_tail']=[json.loads(s) for s in lines[-3:]]
rec['reconciliation']='Immediately preceding worker completed. Its manifest records three successful builds and replays. Earlier timeout 000038 was reconciled there: final monotonicity module replay unconfirmed, not used here. No inherited mutation replayed.'
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
(r/'research/markov-a3c53fa7-checkpoint.md').write_text('# Research checkpoint a3c53fa7\n\nMachine-authored. Full pinned root remains open. Read mission/design, contract, inherited index, target/residual/core audits, latest report and artifacts. No inherited side effects replayed. Investigating aggregate coefficient comparisons in the exact positive word model. See evidence/markov-a3c53fa7/reconciliation.json.\n')
print(json.dumps({k:v for k,v in rec.items() if k not in ['previous_tail','inherited']},indent=2))
