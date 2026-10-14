"""Machine-authored research checkpoint; no controller changes."""
import pathlib,json,hashlib,shutil
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-9a720f77';o.mkdir(exist_ok=True)
(r/'research/markov-9a720f77-tmp').mkdir(exist_ok=True)
v=json.loads((r/'evidence/markov-061840e8/validation.json').read_text())
events=r/'.control/markov/workers/000026/events.jsonl'
out=dict(request_id='9a720f77696445aab32325da611c5097',root_sha256=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest(),modules=[dict(source=m['source'],hash_matches=hashlib.sha256((r/m['source']).read_bytes()).hexdigest()==m['sha256'],status=m['status']) for m in v['modules']],event_log_sha256=hashlib.sha256(events.read_bytes()).hexdigest(),tail=[json.loads(x) for x in events.read_text().splitlines()[-6:]],reconciliation='Timeout happened after six successful builds/replays and saved report. Final item_76 completed exit 0. No interrupted side effects need replay.',capabilities={x:shutil.which(x) for x in ['sage','gap','lean','lake']},failures=['Shell heredoc failed because default temporary directory denied. .scratch is explicitly denied by active permissions; unique research directory used instead.','Read attempt for research/MarkovRaw18.lean failed: nonexistent file.'])
(o/'reconciliation.json').write_text(json.dumps(out,indent=2)+'\n')
(r/'research/markov-9a720f77-checkpoint.md').write_text('# Checkpoint 9a720f77\n\nMachine-authored experimental research. Full pinned root remains open.\nRead MISSION.md and DESIGN.md, exact contract, inherited index, independent target/residual/core audits. Reconciled prior timeout: all six module builds/replays and final report completed. No prior mutations replayed.\n\nResearch direction: use exact matching representation to investigate remaining Pell directions and direction-specific closure.\n')
print(json.dumps({k:v for k,v in out.items() if k!='tail'},indent=2))
