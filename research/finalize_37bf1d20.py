"""Machine-authored source-bound evidence inventory. Not root admission."""
from validate_37bf1d20 import R,O,sha
import json,re,hashlib,datetime
mods=json.loads((O/'mathematical-modules.json').read_text())
receipts=[(p,json.loads(p.read_text())) for p in sorted(O.glob('*.json')) if p.name.startswith(('build-','replay-'))]
audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
rid='37bf1d20e23d45ac82d81edbb57c3fd5'
v={'request_id':rid,'modules':{},'excluded':{},'completion':None,'scope':'New mathematical sources compiled and jointly kernel-replayed over inherited compiled imports; no fresh whole-source rebuild or independent source/English completion audit.'}
for m in mods:
 s=R/'research'/f'{m}.lean';h=sha(s);txt=s.read_text();ds=re.findall(r'^theorem\s+(\w+)',txt,re.M)
 assert not re.search(r'\b(sorry|admit|native_decide|unsafe|partial)\b|^axiom\b',txt,re.M),m
 bs=[(p,d) for p,d in receipts if d.get('mode')=='build' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 rs=[(p,d) for p,d in receipts if d.get('mode')=='replay' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 axs=[(p,d) for p,d in audits if d['sources'].get(m)==h and all(n in d['declarations'] for n in ds)]
 if not bs or not rs or not axs:
  v['excluded'][m]={'source_sha256':h,'compiled':bool(bs),'replayed':bool(rs),'axiom_audited':bool(axs)};continue
 v['modules'][m]={'source':str(s.relative_to(R)),'source_sha256':h,'olean_sha256':sha(O/f'{m}.olean'),'build':str(bs[-1][0].relative_to(R)),'replay':str(rs[-1][0].relative_to(R)),'axiom_audit':str(axs[-1][0].relative_to(R)),'theorems':ds}
assert not v['excluded'],v['excluded']
assert any(d.get('mode')=='replay' and d.get('returncode')==0 and set(d['modules'])==set(mods) for p,d in receipts)
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
before={p:h for p,h in json.loads((O/'before.json').read_text()).items() if '37bf1d20' not in p and 'M37B' not in p}
changed=[p for p,h in before.items() if not (R/p).exists() or sha(R/p)!=h]
assert not changed,changed
oldchecks={}
for tag in ['ac3d4ab9','f1e4fe3b']:
 man=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 assert all((R/p).exists() and sha(R/p)==h for p,h in man.items())
 oldchecks[tag]=len(man)
for p,d in json.loads((R/'.control/markov/inherited.json').read_text()).items():assert sha(R/p)==d['sha256']
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary={'request_id':rid,'compiled_replayed_audited_modules':len(v['modules']),'audited_theorem_closures':sum(len(d['theorems']) for d in v['modules'].values()),'excluded':v['excluded'],'unchanged_prior_inputs':len(before),'inherited_manifest_counts':oldchecks,'unsuccessful_receipts':sum(d.get('returncode')!=0 for p,d in receipts),'root_sha256':root,'canonical_contract_hash':ch,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'completion':None}
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
bindings={}
for script,result in [('experiment_37bf1d20.py','experiments.json'),('gain_probe_37bf1d20.py','residual-gain.json'),('large_gain_37bf1d20.py','large-gain.json')]:
 bindings[script]={'source_sha256':sha(R/'research'/script),'result':result,'result_sha256':sha(O/result),'classification':'finite exact computation, not proof'}
(O/'experiment-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
report={
 'request_id':rid,
 'summary':'Proved the all-index moment adapter and additional raw log-concavity regions in all three directions. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Reconciled interrupted-worker effects and verified 164 inherited manifest artifacts plus six index inputs: evidence/markov-37bf1d20/reconciliation.json.',
  'Compiled and jointly kernel-replayed nine mathematical modules; audited 30 theorem closures: evidence/markov-37bf1d20/validation.json.',
  f"Verified {len(before)} unchanged prior inputs and pinned root/contract hashes: evidence/markov-37bf1d20/final-check.json. Artifact bindings: manifest.json and last-verification.json."
 ],
 'observations':[
  'Proved an exact raw-gap/moment equivalence for every integer index, including negative indices, endpoints, zeros and signed seeds: research/MarkovMomentAllM37B.lean. Actual-source adapters cover all three forward-factor ranges: research/MarkovSourceMomentM37B.lean. The general source sign remains unproved.',
  'Proved a discriminant support criterion and its literal source coefficient consequences in all three directions: research/MarkovMomentSupportM37B.lean and research/MarkovSourceSharpM37B.lean.',
  'Proved Conjecture63 iff InteriorCore63M37B; the residual remains unproved: research/MarkovResidualM37B.lean.',
  'Proved an unbounded actual-source family R^(6t^2+2t-1)LL, t>=1, at depth 6t, lying in the previous residual and satisfying the new criterion while failing three earlier criteria: research/MarkovSharpWitnessM37B.lean.',
  'Proved the symmetric two-point support obstruction and a non-source polynomial LC failure; neither refutes the root: research/MarkovSupportObstructionM37B.lean.',
  'Finite checks passed 241 source comparisons, 230901 source triples including 100832 zero triples, and 15066 generic triples. Further checks verified 538 newly covered diagonal residual triples and 38 larger horizontal/vertical residual triples. Experiments are not proofs: evidence/markov-37bf1d20/experiments.json, residual-gain.json and large-gain.json.',
  'All audited closures use permitted axioms. Inherited compiled imports were reused; no whole-source rebuild or independent completion audit occurred. Exact scope: research/markov-37bf1d20-correspondence.md.',
  f"Preserved {summary['unsuccessful_receipts']} unsuccessful build receipts and recorded capability restrictions; all foreground processes ended: research/markov-37bf1d20-operational.md."
 ],
 'agenda':[
  'Investigate the actual source weighted-moment bound beyond support-only estimates; the all-index adapter is now available: research/markov-37bf1d20-next.md.',
  'Retain every unresolved clause in research/MarkovResidualM37B.lean, including reverse-factor ranges.',
  'Discharge every source-correspondence obligation before claiming exact-root completion.'
 ],
 'completion':None
}
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
manifest={str(p.relative_to(R)):sha(p) for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
manifest.update({str(p.relative_to(R)):sha(p) for p in (R/'research').iterdir() if p.is_file() and ('37bf1d20' in p.name or 'M37B' in p.name)})
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'canonical_contract_hash':ch},indent=2)+'\n')
print(json.dumps(summary));print('Verified artifacts',len(manifest))
