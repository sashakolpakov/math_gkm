"""Machine-authored source-bound validation inventory; not root admission."""
from validate_ac3d4ab9 import R,O,sha
import json,re,hashlib
mods=['MarkovBinomialGapMAC3','MarkovSourceRegionMAC3','MarkovVarianceMAC3','MarkovBinomialVarianceMAC3','MarkovSourceVarianceMAC3','MarkovResidualMAC3','MarkovVarianceWitnessMAC3']
receipts=[(p,json.loads(p.read_text())) for p in sorted(O.glob('*.json')) if p.name.startswith(('build-','replay-'))]
audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
v={'request_id':'ac3d4ab98366433dacc719574d5ff03e','modules':{},'excluded':{},'completion':None,'scope':'New mathematical sources compiled and jointly kernel-replayed over inherited compiled imports; no fresh whole-source rebuild or independent source/English completion audit.'}
for m in mods:
 s=R/'research'/f'{m}.lean'; h=sha(s);txt=s.read_text();ds=re.findall(r'^theorem\s+(\w+)',txt,re.M)
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
before={p:h for p,h in json.loads((O/'before.json').read_text()).items() if 'ac3d4ab9' not in p and 'MAC3' not in p}
changed=[p for p,h in before.items() if not (R/p).exists() or sha(R/p)!=h]
assert not changed,changed
oldchecks={}
for tag in ['f25b03a1','f1e4fe3b']:
 man=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 assert all((R/p).exists() and sha(R/p)==h for p,h in man.items())
 oldchecks[tag]=len(man)
for p,d in json.loads((R/'.control/markov/inherited.json').read_text()).items():assert sha(R/p)==d['sha256']
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary={'request_id':v['request_id'],'compiled_replayed_audited_modules':len(v['modules']),'audited_theorem_closures':sum(len(d['theorems']) for d in v['modules'].values()),'excluded':v['excluded'],'unchanged_prior_inputs':len(before),'inherited_manifest_counts':oldchecks,'unsuccessful_receipts':sum(d.get('returncode')!=0 for p,d in receipts),'root_sha256':root,'canonical_contract_hash':ch,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None}
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
bindings={}
for script,result in [('probe_gap_ac3d4ab9.py','gap-probe.json'),('experiment_ac3d4ab9.py','experiments.json'),('moment_probe_ac3d4ab9.py','moment-experiments.json')]:
 bindings[script]={'source_sha256':sha(R/'research'/script),'result':result,'result_sha256':sha(O/result),'classification':'finite exact computation, not proof'}
(O/'experiment-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
report={
 'request_id':v['request_id'],
 'summary':'Proved broader raw log-concavity regions in all three directions using a weighted-variance criterion and exact polygon support. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Reconciled interrupted workers 136 and 137; verified 187 inherited manifest artifacts and all recorded worker-change hashes: evidence/markov-ac3d4ab9/reconciliation.json.',
  f"Compiled and jointly kernel-replayed seven mathematical modules; audited {summary['audited_theorem_closures']} theorem closures: evidence/markov-ac3d4ab9/validation.json.",
  f"Verified {len(before)} unchanged prior inputs and pinned root/contract hashes: evidence/markov-ac3d4ab9/final-check.json. Artifact bindings: manifest.json and last-verification.json."
 ],
 'observations':[
  'Proved raw LC for arbitrary nonnegative binomial mixtures under an asymmetric pair criterion or a weighted-variance criterion, retaining zeros and non-LC seeds: research/MarkovBinomialGapMAC3.lean and research/MarkovBinomialVarianceMAC3.lean.',
  'Proved exact polygon-derived lower residual support and connected both criteria to actual source coefficients in all three directions: research/MarkovSourceRegionMAC3.lean and research/MarkovSourceVarianceMAC3.lean.',
  'Proved Conjecture63 iff InteriorCore63MAC3. The complement remains unproved: research/MarkovResidualMAC3.lean.',
  'For every s>=5, constructed an actual source triple at depth 2s satisfying the variance criterion but neither the prior margin nor the pair criterion, with all residual and polygon guards: research/MarkovVarianceWitnessMAC3.lean.',
  'Finite checks passed 241 source comparisons, 3570 residual-support checks, 1908 source triples (1474 newly covered), and 44536 generic triples including 4487 zero triples: evidence/markov-ac3d4ab9/experiments.json. Experiments are not proofs.',
  'A proposed all-index moment adapter passed 473464 finite identities, including endpoints and zeros; it remains unformalized: evidence/markov-ac3d4ab9/moment-experiments.json.',
  'All audited closures use permitted axioms. Inherited compiled imports were reused; no whole-source rebuild or independent completion audit occurred: research/markov-ac3d4ab9-correspondence.md.',
  f"Preserved {summary['unsuccessful_receipts']} unsuccessful build receipts and capability limitations: research/markov-ac3d4ab9-operational.md."
 ],
 'agenda':[
  'Investigate source-specific weighted-moment bounds and the proposed all-index binomial adapter, keeping endpoint and reverse-factor gaps explicit: research/markov-ac3d4ab9-next.md.',
  'Retain every unresolved clause of research/MarkovResidualMAC3.lean.',
  'Discharge all source-correspondence obligations before claiming exact-root completion.'
 ],
 'completion':None
}
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
manifest={str(p.relative_to(R)):sha(p) for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
manifest.update({str(p.relative_to(R)):sha(p) for p in (R/'research').iterdir() if p.is_file() and ('ac3d4ab9' in p.name or 'MAC3' in p.name)})
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'canonical_contract_hash':ch},indent=2)+'\n')
print(json.dumps(summary));print('Verified artifacts',len(manifest))
