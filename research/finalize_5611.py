"""Machine-authored local validation inventory, request 56112359.
This records results; it is neither a controller nor independent admission.
"""
import pathlib,json,hashlib,datetime
R=pathlib.Path('/Users/sasha/math_gkm');O=R/'evidence/markov-56112359'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
records=[(p,json.loads(p.read_text())) for p in sorted(O.glob('run-*.json'))]
mods=[]
for m in ['MarkovWeighted5611','MarkovWeightThreshold5611']:
 src=R/'research'/f'{m}.lean';hh=sha(src)
 good=[(p,d) for p,d in records if d['source']==str(src.relative_to(R)) and d['sha256']==hh and d.get('returncode')==0]
 builds=[(p,d) for p,d in good if '-o' in d['command']]
 replay=[(p,d) for p,d in good if d['command'][0].endswith('leanchecker')]
 assert builds and replay, (m,'missing final build/replay')
 p,b=builds[-1];q,c=replay[-1]
 axioms=[x for x in b['stdout'].splitlines() if 'depends on axioms' in x]
 assert axioms and all('sorryAx' not in x and 'Lean.ofReduceBool' not in x for x in axioms)
 mods.append(dict(module=m,source=str(src.relative_to(R)),sha256=hh,build=str(p.relative_to(R)),replay=str(q.relative_to(R)),axiom_lines=axioms,olean_sha256=sha(O/f'{m}.olean')))
v=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=mods,root_sha256=sha(R/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled imports reused; not a fresh whole-source rebuild',independent_audit=False)
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
failed=[dict(record=str(p.relative_to(R)),source=d['source'],stdout=d.get('stdout',''),stderr=d.get('stderr',''),timeout=d.get('timeout',False)) for p,d in records if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(rejected_elaborations=failed,capabilities='evidence/markov-56112359/capabilities.json',policy='Only final successful builds and replays are accepted as local evidence'),indent=2)+'\n')
report=dict(request_id='561123595ffe40b8aae85b885aeebd2e',completion=None,
 summary='Checked a sharp obstruction to independent C-site weighting and a valid common-weight horizontal inequality; full pinned Markov Conjecture63 remains unresolved.',
 actions=[
 'Read mission/design, exact contract, inherited index, independent target/residual/core audits and latest evidence; reconciled predecessor hashes and raw events: evidence/markov-56112359/reconciliation.json.',
 'Executed exact horizontal type-refinement, site-refinement and weighted experiments: evidence/markov-56112359/{words,pell,random,sites,weighted,minweight,symbolic}.json.',
 'Proved the weighted matrix/source bridge, universal coefficient nonnegativity, exact coefficient formulas, sharp integer threshold, common-weight inequality and source triple/polygon facts.',
 'Compiled and kernel-replayed both final modules: evidence/markov-56112359/validation.json.',
 'Saved mathematics and correspondence limits: research/markov-56112359-mathematics.md and research/markov-56112359-correspondence.md.'],
 observations=[
 'Pinned root and canonical contract hashes match. No proof or refutation of the full root was obtained.',
 'At the 6/7 alternating source word, weights [t,1,t,1,t] satisfy the displayed horizontal inequality exactly for integer 0<=t<=164; all t>=165 fail, despite nonnegative coefficients and palindromic weights. These are deformations, not source counterexamples.',
 'With the common weight [t,t,t,t,t], the same triple satisfies strict log-concavity for every nonnegative integer t. At source weight one its raw triple is [16,264,1004], and polygon membership is proved.',
 'The new common-weight horizontal scans found no negative gap coefficients in 1546474 tests, including 4180 short no-CC words, 89 Pell words and 250 seeded uneven words. These are finite tests, not necessarily distinct triples.',
 'Successful printed axiom closures contain only permitted axioms; local validation reuses inherited compiled imports and is not independent auditing.',
 f'{len(failed)} rejected elaborations and capability failures are preserved in operational-observations.json and capabilities.json. All foreground sessions completed.'],
 agenda=[
 'Investigate a common-C-weight horizontal invariant on canonical source words or no-CC words; arbitrary independent site weighting is now formally obstructed.',
 'Seek vertical and diagonal comparisons that allow compensation between type-count classes, retaining all raw coefficients and source restrictions.',
 'Require fresh whole-source rebuilding and independent hash-bound correspondence auditing before any exact-root completion claim.'])
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
hashes={str(p.relative_to(R)):sha(p) for p in list(O.iterdir())+list((R/'research').glob('*5611*'))+list((R/'research').glob('markov-56112359-*.md')) if p.is_file() and p.name!='artifact-hashes.json'}
(O/'artifact-hashes.json').write_text(json.dumps(hashes,indent=2)+'\n')
print(json.dumps(dict(modules=[m['module'] for m in mods],rejected_elaborations=len(failed),root_sha256=v['root_sha256'],contract_canonical_sha256=v['contract_canonical_sha256'],report='evidence/markov-56112359/report.json')))
