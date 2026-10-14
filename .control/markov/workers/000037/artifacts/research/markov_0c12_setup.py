"""Machine-authored research setup; no controller changes or replayed effects."""
import pathlib,json,hashlib,datetime
r=pathlib.Path('/Users/sasha/math_gkm'); o=r/'evidence/markov-0c12f51d';o.mkdir(exist_ok=False)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
d=json.loads((r/'.control/markov/inherited.json').read_text())
index={k:dict(recorded=v['sha256'],actual=sha(r/k),matches=sha(r/k)==v['sha256']) for k,v in d.items()}
events=(r/'.control/markov/workers/000036/events.jsonl').read_text().splitlines()
parsed=[json.loads(x) for x in events]
v=json.loads((r/'evidence/markov-65c4dfb8/validation.json').read_text())
checks=[]
for m in v['modules']:
 p=r/'research'/f"{m['module']}.lean"
 checks.append(dict(module=m['module'],source_matches=sha(p)==m['sha256'],build=json.loads((r/m['build']).read_text())['returncode'],replay=json.loads((r/m['replay']).read_text())['returncode']))
rec=dict(request_id='0c12f51d13954e288fe0129642b586e0',time=datetime.datetime.now(datetime.timezone.utc).isoformat(),inherited_index=index,prior_raw_events_sha256=sha(r/'.control/markov/workers/000036/events.jsonl'),prior_raw_event_count=len(events),prior_validation=checks,prior_last_events=parsed[-4:],reconciliation='Controller reported timeout, but predecessor saved its report, all three build/replay receipts, and final verification command completed. No final delivered JSON event occurs in the inspected ending. Preserve completed effects and do not rerun them.',root_sha256=sha(r/'MathGKM/Markov.lean'),capability_failures=['Shell here-document failed: cannot create temp file, operation not permitted. Developer denies .scratch reads; use research/evidence working artifacts instead.'])
(o/'reconciliation.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(dict(reconciliation=str(o/'reconciliation.json'),prior_validation=checks)))
