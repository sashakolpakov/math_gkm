"""Machine-authored source-bound final inventory; not root admission."""
from validate_f25b03a1 import R,O,sha
import json,re,hashlib
mods=['MarkovHighCone2GapMF25','MarkovHighGapMF25','MarkovHighAllMF25','MarkovResidualMF25','MarkovFallingGapMF25','MarkovSourceFallingMF25']
receipts=[(p,json.loads(p.read_text())) for p in sorted(O.glob('*.json')) if p.name.startswith(('build-','replay-'))]
audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
v={'request_id':'f25b03a14b4d4680ba608ed153fcd2b6','modules':{},'excluded':{},'completion':None,'scope':'New mathematical sources compiled and separately replayed over inherited compiled imports; no fresh whole-source rebuild or independent source/English completion audit.'}
for m in mods:
 s=R/'research'/f'{m}.lean'; h=sha(s);txt=s.read_text();ds=re.findall(r'^theorem\s+(\w+)',txt,re.M)
 assert not re.search(r'\b(sorry|admit|native_decide|unsafe|partial)\b|^axiom\b',txt,re.M),m
 bs=[(p,d) for p,d in receipts if d.get('mode')=='build' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 rs=[(p,d) for p,d in receipts if d.get('mode')=='replay' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 axs=[(p,d) for p,d in audits if d['sources'].get(m)==h and all(n in d['declarations'] for n in ds)]
 if not bs or not rs or not axs:
  v['excluded'][m]={'source_sha256':h,'compiled':bool(bs),'replayed':bool(rs),'axiom_audited':bool(axs)};continue
 v['modules'][m]={'source':str(s.relative_to(R)),'source_sha256':h,'olean_sha256':sha(O/f'{m}.olean'),'build':str(bs[-1][0].relative_to(R)),'replay':str(rs[-1][0].relative_to(R)),'axiom_audit':str(axs[-1][0].relative_to(R)),'theorems':ds}
old=json.loads((R/'evidence/markov-81f80b2d/validation.json').read_text())
irs=[(p,json.loads(p.read_text())) for p in O.glob('inherited-replay-*.json')]
v['completed_inherited_replays']={}
for p,d in irs:
 m=d['module'];s=R/'research'/f'{m}.lean'
 assert d['source_sha256']==sha(s)==old['modules'][m]['source_sha256']
 assert sha(R/'evidence/markov-81f80b2d'/f'{m}.olean')==old['modules'][m]['olean_sha256']
 if d.get('returncode')==0:v['completed_inherited_replays'][m]=str(p.relative_to(R))
assert len(v['completed_inherited_replays'])==23
assert not v['excluded'],v['excluded']
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
before={p:h for p,h in json.loads((O/'before.json').read_text()).items() if 'f25b03a1' not in p and 'MF25' not in p}
changed=[p for p,h in before.items() if not (R/p).exists() or sha(R/p)!=h]
assert not changed,changed
oldchecks={}
for tag in ['d11e335e','5703599b','81f80b2d']:
 man=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 assert all((R/p).exists() and sha(R/p)==h for p,h in man.items())
 oldchecks[tag]=len(man)
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary={'request_id':v['request_id'],'compiled_replayed_audited_modules':len(v['modules']),'audited_theorem_closures':sum(len(d['theorems']) for d in v['modules'].values()),'completed_inherited_replays':len(v['completed_inherited_replays']),'excluded':v['excluded'],'unchanged_prior_inputs':len(before),'inherited_manifest_counts':oldchecks,'unsuccessful_receipts':sum(d.get('returncode')!=0 for p,d in receipts),'root_sha256':root,'canonical_contract_hash':ch,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None}
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
report={
 'request_id':v['request_id'],
 'summary':'Proved universal raw vertical log-concavity for triples starting at j=2, and an arbitrary-degree raw-gap equivalence with actual-source adapters. Full pinned Conjecture63 remains unresolved.',
 'actions':[
  'Reconciled both interrupted workers and verified 526 inherited artifacts: evidence/markov-f25b03a1/reconciliation.json.',
  f"Compiled and kernel-replayed {len(v['modules'])} new mathematical modules; audited {summary['audited_theorem_closures']} theorem closures and completed 23 inherited certificate replays: evidence/markov-f25b03a1/validation.json.",
  'Recorded four exact experiments and their input bindings: evidence/markov-f25b03a1/experiment-bindings.json.',
  f"Verified {len(before)} unchanged prior inputs and pinned root/contract hashes: evidence/markov-f25b03a1/final-check.json. Artifact hashes are bound in manifest.json and last-verification.json."
 ],
 'observations':[
  'source_strip_fullMF25 proves A(i,2)*A(i,4) <= A(i,3)^2 for every source path and natural column, retaining zeros: research/MarkovHighAllMF25.lean.',
  'Conjecture63 is equivalent to InteriorCore63MF25. The residual remains unproved; its vertical clause now starts at j>=3: research/MarkovResidualMF25.lean.',
  'Proved an arbitrary-degree falling-factorial raw-gap criterion, including signed seeds and zero coefficients, and exact source adapters in the forward binomial-factor ranges: research/MarkovFallingGapMF25.lean and research/MarkovSourceFallingMF25.lean. No general gap-sign theorem is claimed.',
  'The denominator-48 high-cone experiment passed 31,155 coefficient identities and 21,011 inequalities, including 10,626 zero-containing triples. Signed-seed and higher-row experiments also passed; these are finite computations: evidence/markov-f25b03a1/.',
  'The enlarged-word probe reproduced known non-source vertical and diagonal failures, not a root refutation: evidence/markov-f25b03a1/word-directions.json.',
  'All audited closures use permitted axioms. Inherited compiled imports were reused; no fresh whole-source rebuild or independent completion audit occurred. Scope: research/markov-f25b03a1-correspondence.md.',
  f"Preserved {summary['unsuccessful_receipts']} failed or timed-out build receipts and recorded the .scratch policy restriction. All foreground executions ended: research/markov-f25b03a1-operational.md."
 ],
 'agenda':[
  'Investigate recurrence-preserved source raw-gap conditions using the new arbitrary-degree equivalences; their gap signs and reverse-factor ranges remain unresolved: research/markov-f25b03a1-next.md.',
  'Retain every unresolved clause in research/MarkovResidualMF25.lean; a further strip proof alone is not a uniform row-order argument.',
  'Discharge every source-correspondence obligation before claiming exact-root completion.'
 ],
 'completion':None
}
(O/'report.json').write_text(json.dumps(report,indent=2)+'\n')
manifest={str(p.relative_to(R)):sha(p) for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
manifest.update({str(p.relative_to(R)):sha(p) for p in (R/'research').iterdir() if p.is_file() and ('f25b03a1' in p.name or 'MF25' in p.name)})
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'canonical_contract_hash':ch},indent=2)+'\n')
print(json.dumps(summary));print('Verified artifacts',len(manifest))
