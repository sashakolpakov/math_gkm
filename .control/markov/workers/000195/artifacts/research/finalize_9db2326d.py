"""Machine-authored final local receipts and bindings; no controller mutation."""
from pathlib import Path
import hashlib,json,re
from finish_9db2326d import finish
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9db2326d'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
records=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
builds={}
for m,h in sources.items():
 good=[p for p,d in records if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 assert good,m
 builds[m]=str(max(good).relative_to(R))
 src=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',src),m
replays=[]
stages=[mods[:13],mods[13:]]
for stage in stages:
 good=[]
 for p in O.glob('replay-*.json'):
  d=json.loads(p.read_text())
  if d.get('returncode')==0 and d.get('modules')=={m:sources[m] for m in stage}:good.append(p)
 assert good,stage
 replays.append(str(max(good).relative_to(R)))
audits=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text())
 if d['sources']==sources:audits.append((p,d))
assert audits,'missing final axiom audit'
ap,ad=max(audits,key=lambda z:z[0].name)
(O/'validation.json').write_text(json.dumps(dict(modules=sources,compilation=builds,replays=replays,
 replay_stages=[dict(modules=stages[0],boundary='Inherited compiled imports'),dict(modules=stages[1],boundary='Inherited imports and locally checked stage A',stage_A_hashes={m:sources[m] for m in stages[0]})],
 axioms=str(ap.relative_to(R)),theorem_closures=len(ad['declarations']),scope='Local source compilation, two staged isolated kernel replays with selected names absent from each stage import environment, and explicit permitted-axiom closures. Stage-A source hashes are bound for stage B. Inherited compiled imports reused. No fresh whole-source rebuild or independent completion audit.'),indent=2))
failures=[dict(receipt=str(p.relative_to(R)),modules=d.get('modules'),timeout=d.get('timeout',False),returncode=d.get('returncode'),seconds=d['seconds']) for p,d in records if d.get('returncode')!=0]
(O/'failed-build-index.json').write_text(json.dumps(failures,indent=2))
drafts={}
for p in (R/'research').glob('*M9DB.lean'):
 if p.stem not in mods and not p.stem.startswith(('Replay','MarkovAudit')):drafts[p.stem]=sha(p)
(O/'unaccepted-drafts.json').write_text(json.dumps(dict(sources=drafts,reason='Not selected by matching compilation, replay and axiom receipts. Direct third-row batches timed out; they are not proof evidence.'),indent=2))
idx=json.loads((R/'.control/markov/inherited.json').read_text())
bindings={p:sha(R/p)==v['sha256'] for p,v in idx.items()}
contract=json.loads((R/'.control/markov/contract.json').read_text())
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
root=sha(R/'MathGKM/Markov.lean')
assert all(bindings.values()) and ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
(O/'final-bindings.json').write_text(json.dumps(dict(request_id='9db2326d4e514e22b19a30513b4cae50',bindings=bindings,root_sha256=root,canonical_contract_sha256=ch,stop_file=(R/'.control/markov/STOP.json').exists(),completion=None),indent=2))
print(json.dumps(dict(modules=len(mods),closures=len(ad['declarations']),failed_builds=len(failures),unaccepted_drafts=len(drafts))))
finish()
