"""Machine-authored source-bound evidence inventory, not root admission."""
from validate_55306a3b import R,O,sha
import json,re,hashlib,datetime
rid='55306a3b34a648a9ba6d7e685f9d40d6'
mods=json.loads((O/'mathematical-modules.json').read_text())
receipts=[(p,json.loads(p.read_text())) for p in sorted(O.glob('*.json')) if p.name.startswith(('build-','replay-'))]
audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
v={'request_id':rid,'modules':{},'completion':None,'scope':'New sources compiled and jointly kernel-replayed over inherited compiled imports; no whole-source rebuild or independent completion audit.'}
for m in mods:
 s=R/'research'/f'{m}.lean';h=sha(s);txt=s.read_text();ds=re.findall(r'^theorem\s+(\w+)',txt,re.M)
 assert not re.search(r'\b(sorry|admit|native_decide|unsafe|partial)\b|^axiom\b',txt,re.M),m
 bs=[(p,d) for p,d in receipts if d.get('mode')=='build' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 rs=[(p,d) for p,d in receipts if d.get('mode')=='replay' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 axs=[(p,d) for p,d in audits if d['sources'].get(m)==h and all(n in d['declarations'] for n in ds)]
 assert bs and rs and axs,(m,bool(bs),bool(rs),bool(axs))
 v['modules'][m]={'source':str(s.relative_to(R)),'source_sha256':h,'olean_sha256':sha(O/f'{m}.olean'),
  'build':str(bs[-1][0].relative_to(R)),'replay':str(rs[-1][0].relative_to(R)),
  'axiom_audit':str(axs[-1][0].relative_to(R)),'theorems':ds}
assert any(d.get('mode')=='replay' and d.get('returncode')==0 and set(d['modules'])==set(mods) for p,d in receipts)
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
before={p:h for p,h in json.loads((O/'before.json').read_text()).items() if '55306a3b' not in p and 'M553' not in p}
changed=[p for p,h in before.items() if not (R/p).exists() or sha(R/p)!=h]
assert not changed,changed
oldchecks={}
for tag in ['37bf1d20','f1e4fe3b']:
 man=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 assert all((R/p).exists() and sha(R/p)==h for p,h in man.items())
 oldchecks[tag]=len(man)
for p,d in json.loads((R/'.control/markov/inherited.json').read_text()).items():assert sha(R/p)==d['sha256']
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary={'request_id':rid,'compiled_replayed_audited_modules':len(v['modules']),
 'audited_theorem_closures':sum(len(d['theorems']) for d in v['modules'].values()),
 'unchanged_prior_inputs':len(before),'inherited_manifest_counts':oldchecks,
 'unsuccessful_receipts':sum(d.get('returncode')!=0 for p,d in receipts),
 'root_sha256':root,'canonical_contract_hash':ch,
 'stop_file_present':(R/'.control/markov/STOP.json').exists(),
 'finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'completion':None}
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
bindings={}
for script,result in [('prefix_probe_55306a3b.py','prefix-experiments.json'),('slack_probe_55306a3b.py','slack-experiments.json'),('grid_probe_55306a3b.py','grid-experiments-reproduced.json')]:
 bindings[script]={'source_sha256':sha(R/'research'/script),'result':result,'result_sha256':sha(O/result),'classification':'finite exact computation, not proof'}
(O/'experiment-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
report={'request_id':rid,'summary':'Proved a linear weighted-moment certificate and an actual-source obstruction to every fixed rational center grid. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Reconciled interrupted-worker effects and verified 171 inherited manifest artifacts and six index inputs: evidence/markov-55306a3b/reconciliation.json.',
  f"Compiled and jointly kernel-replayed seven mathematical modules; audited {summary['audited_theorem_closures']} theorem closures: evidence/markov-55306a3b/validation.json.",
  f"Verified {len(before)} unchanged prior inputs and pinned root/contract hashes: evidence/markov-55306a3b/final-check.json. Artifact bindings: manifest.json and last-verification.json."],
 'observations':[
  'Proved exact slack identities and a linear weighted-moment sufficient condition, with conditional adapters in all three forward-factor directions: research/MarkovMomentSlackM553.lean and research/MarkovSourceLinearM553.lean. General source signs remain unproved.',
  'Proved that optimizing the center is equivalent to the original moment sign, retaining zero mass: research/MarkovOptimalCenterM553.lean. This equivalence supplies no unconditional source sign.',
  'For every positive natural d, proved that source 1/(16d+5), row 8d+2, rejects every center z/d despite satisfying the raw inequality at all three valid polygon positions: research/MarkovSourceGridM553.lean. This refutes a restricted certificate strategy, not the root.',
  'Verified the actual 2/11 residual triple [91,728,2340], its polygon and residual guards, a positive certificate at 3/2, and failure of all integer centers: research/MarkovSourceCenterWitnessM553.lean.',
  'Finite exact checks covered 383 sources and 511611 forward-factor triples, including 178193 zero triples. Prefix scans reproduced inherited obstructions; they are not new results. Evidence: slack-experiments.json and prefix-experiments.json in evidence/markov-55306a3b/.',
  'InteriorCore63M37B remains unchanged and unproved, including reverse-factor ranges. No whole-source rebuild or independent completion audit occurred: research/markov-55306a3b-correspondence.md.',
  f"Preserved {summary['unsuccessful_receipts']} unsuccessful build receipts and recorded capability restrictions: research/markov-55306a3b-operational.md."],
 'agenda':[
  'Investigate source/index-dependent linear moment bounds; every fixed rational center grid is insufficient. See research/markov-55306a3b-next.md.',
  'Retain every unresolved clause in research/MarkovResidualM37B.lean, including reverse-factor ranges.',
  'Discharge every source-correspondence obligation before claiming exact-root completion.'],
 'completion':None}
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
manifest={str(p.relative_to(R)):sha(p) for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
manifest.update({str(p.relative_to(R)):sha(p) for p in (R/'research').iterdir() if p.is_file() and ('55306a3b' in p.name or 'M553' in p.name)})
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'canonical_contract_hash':ch},indent=2)+'\n')
print(json.dumps(summary));print('Verified artifacts',len(manifest))
