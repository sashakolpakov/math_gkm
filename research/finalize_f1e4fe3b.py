"""Machine-authored source-bound inventory; not root admission."""
from validate_f1e4fe3b import R,O,sha
import json,re,hashlib
mods=['MarkovBinomialMixedMF1E','MarkovBinomialInteriorMF1E','MarkovSourceInteriorMF1E','MarkovResidualMF1E','MarkovInteriorWitnessMF1E']
receipts=[(p,json.loads(p.read_text())) for p in sorted(O.glob('*.json')) if p.name.startswith(('build-','replay-'))]
audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
v={'request_id':'f1e4fe3b99d84d70bd218f29dcffcb3c','modules':{},'excluded':{},'diagnostic_sources':['research/MarkovSmoothProbeMF1E.lean'],'completion':None,'scope':'New mathematical sources compiled and separately replayed over inherited compiled imports; no fresh whole-source rebuild or independent source/English completion audit. The standalone smooth probe duplicates a helper for build diagnosis and is not included in the admitted mathematical inventory.'}
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
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
before={p:h for p,h in json.loads((O/'before.json').read_text()).items() if 'f1e4fe3b' not in p and 'MF1E' not in p}
changed=[p for p,h in before.items() if not (R/p).exists() or sha(R/p)!=h]
assert not changed,changed
oldchecks={}
for tag in ['f25b03a1','5703599b','81f80b2d']:
 man=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 assert all((R/p).exists() and sha(R/p)==h for p,h in man.items())
 oldchecks[tag]=len(man)
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary={'request_id':v['request_id'],'compiled_replayed_audited_modules':len(v['modules']),'audited_theorem_closures':sum(len(d['theorems']) for d in v['modules'].values()),'excluded':v['excluded'],'unchanged_prior_inputs':len(before),'inherited_manifest_counts':oldchecks,'unsuccessful_receipts':sum(d.get('returncode')!=0 for p,d in receipts),'root_sha256':root,'canonical_contract_hash':ch,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None}
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
bindings={}
for script,result in [('probe_kernel_f1e4fe3b.py','kernel-probe.json'),('experiment_interior_f1e4fe3b.py','interior-experiments.json')]:
 bindings[script]={'source_sha256':sha(R/'research'/script),'result':result,'result_sha256':sha(O/result),'classification':'finite exact computation, not proof'}
(O/'experiment-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
report={
 'request_id':v['request_id'],
 'summary':'Proved unbounded middle regions of raw coefficient log-concavity in all three directions. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Reconciled workers 133--135 and verified 527 inherited artifacts: evidence/markov-f1e4fe3b/reconciliation.json.',
  f"Compiled and kernel-replayed {len(v['modules'])} mathematical modules; audited {summary['audited_theorem_closures']} theorem closures: evidence/markov-f1e4fe3b/validation.json.",
  f"Verified {len(before)} unchanged prior inputs and pinned root/contract hashes: evidence/markov-f1e4fe3b/final-check.json. New artifact bindings: manifest.json and last-verification.json."
 ],
 'observations':[
  'Proved a uniform interior LC theorem for binomial smoothing of any nonnegative finite seed, allowing internal zeros and non-LC seeds: research/MarkovBinomialInteriorMF1E.lean.',
  'Connected the criterion to actual source horizontal, vertical and diagonal raw coefficients. At diagonal depth r, both offsets at least r+r² suffice: research/MarkovSourceInteriorMF1E.lean.',
  'Proved Conjecture63 iff InteriorCore63MF1E, retaining the unproved complement of these regions and all inherited guards: research/MarkovResidualMF1E.lean.',
  'Constructed an actual-source middle-region witness at every diagonal depth r>=6, with all old residual and polygon guards: research/MarkovInteriorWitnessMF1E.lean.',
  'Finite experiments passed 179 source-polynomial comparisons, 350 newly covered source triples and 2,069 generic-seed triples, including 130 zero triples. Experiments are not proofs: evidence/markov-f1e4fe3b/interior-experiments.json.',
  'Only permitted axioms occur in audited closures. Inherited compiled imports were reused; no whole-source rebuild or independent completion audit occurred: research/markov-f1e4fe3b-correspondence.md.',
  f"Preserved {summary['unsuccessful_receipts']} unsuccessful build receipts, including timeouts, and recorded capability restrictions: research/markov-f1e4fe3b-operational.md."
 ],
 'agenda':[
  'Investigate sharper polygon-derived residual support and source-specific control of mixed terms near the remaining edges: research/markov-f1e4fe3b-next.md.',
  'Retain every unresolved clause of research/MarkovResidualMF1E.lean; middle-region coverage is not full-source resolution.',
  'Discharge all source-correspondence obligations before claiming exact-root completion.'
 ],
 'completion':None
}
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
manifest={str(p.relative_to(R)):sha(p) for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
manifest.update({str(p.relative_to(R)):sha(p) for p in (R/'research').iterdir() if p.is_file() and ('f1e4fe3b' in p.name or 'MF1E' in p.name)})
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'canonical_contract_hash':ch},indent=2)+'\n')
print(json.dumps(summary));print('Verified artifacts',len(manifest))
