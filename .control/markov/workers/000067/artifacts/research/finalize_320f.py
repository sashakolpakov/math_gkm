"""Machine-authored status and byte preservation audit; not root admission."""
from pathlib import Path
import json,hashlib,re
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-320fe46f'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=sorted(p.stem for p in (r/'research').glob('*320f.lean'))
runs=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
valid={}
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p)
 rr=[(a,b) for a,b in runs if b['source']==str(p.relative_to(r)) and b['sha256']==h]
 builds=[(a,b) for a,b in rr if b['mode']=='build' and b.get('returncode')==0]
 replay=[(a,b) for a,b in rr if b['mode']=='replay' and b.get('returncode')==0]
 axioms=sorted(set(x.strip() for _,b in builds for aa in re.findall(r'depends on axioms: \[([^]]*)\]',b['stdout']) for x in aa.split(',') if x.strip()))
 valid[m]=dict(source=str(p.relative_to(r)),sha256=h,compiled=bool(builds),replayed=bool(replay),build_records=[str(a.relative_to(r)) for a,b in builds],replay_records=[str(a.relative_to(r)) for a,b in replay],printed_axioms=axioms,axioms_permitted=bool(builds) and set(axioms)<=set(['propext','Classical.choice','Quot.sound']))
 if (o/f'{m}.olean').exists():valid[m]['olean_sha256']=sha(o/f'{m}.olean')
inherited=[str(p.relative_to(r)) for p,x in runs if x['source']=='research/MarkovOneCutTailC416.lean' and x['mode']=='replay' and x.get('returncode')==0]
(o/'validation.json').write_text(json.dumps(dict(modules=valid,inherited_tail_replay=inherited,scope='Current-source builds and explicit-module kernel replay; inherited imports reused. No fresh whole-source rebuild, independent verifier, or root closure.'),indent=2)+'\n')
old=json.loads((o/'reconciliation.json').read_text())
checks=[dict(path=c['path'],expected=c['actual'],actual=sha(r/c['path'])) for c in old['artifact_checks']+old['inherited_checks']]
checks += [dict(path='MathGKM/Markov.lean',expected=old['root_sha256'],actual=sha(r/'MathGKM/Markov.lean')),dict(path='.control/markov/contract.json',expected=old['contract_sha256'],actual=sha(r/'.control/markov/contract.json'))]
(o/'preservation.json').write_text(json.dumps(dict(checks=checks,mismatches=[c for c in checks if c['expected']!=c['actual']],stop_file_present=(r/'.control/markov/STOP.json').exists()),indent=2)+'\n')
failures=[dict(record=str(p.relative_to(r)),returncode=x.get('returncode'),timeout=x.get('timeout',False),seconds=x['seconds']) for p,x in runs if x.get('returncode')!=0]
(o/'operational-observations.json').write_text(json.dumps(dict(rejected_builds_or_timeouts=failures,capability_limits=old['capability_limits']+['Other guessed inherited filenames did not exist; actual nearby modules were found with rg.','Sage unavailable; GAP present and unused.'],replay_driver=dict(path='research/ReplayKnown6d2c.lean',sha256=sha(r/'research/ReplayKnown6d2c.lean'),pinned_reference='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/src/lean/LeanChecker.lean',body_reviewed=True),overlap_note='IncreasingSource was edited while its first build was finishing; that old build failed and produced no accepted object. A later current-source build succeeded and its resulting object passed separate replay.',admission='Rejected elaborations and tool outcomes are operational evidence only.'),indent=2)+'\n')
(o/'literature.json').write_text(json.dumps(dict(primary_source='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',actions=['Live open of publisher source','Find Definitions 6.1 and Conjecture 6.3'],consulted=['Equation (7)','Definitions 6.1–6.2','Conjecture 6.3'],external_results_imported_as_axioms=False),indent=2)+'\n')
paths=list(o.glob('*'))+[r/'research'/f'{m}.lean' for m in mods]
paths += [p for p in (r/'research').glob('*320f*') if p.is_file()]
paths=[p for p in paths if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
hashes={str(p.relative_to(r)):sha(p) for p in sorted(set(paths))}
(o/'artifacts.json').write_text(json.dumps(dict(request_id='320fe46fcee34a5a829606c8fa65b08e',hashes=hashes),indent=2)+'\n')
bad=[p for p,h in hashes.items() if sha(r/p)!=h]
(o/'artifact-verification.json').write_text(json.dumps(dict(artifacts=len(hashes),mismatches=bad,verified=not bad),indent=2)+'\n')
print(json.dumps(dict(modules={m:dict(compiled=x['compiled'],replayed=x['replayed'],axioms_permitted=x['axioms_permitted']) for m,x in valid.items()},inherited_replays=len(inherited),failures=len(failures),artifacts=len(hashes),preserved=all(c['expected']==c['actual'] for c in checks),mismatches=bad)))
