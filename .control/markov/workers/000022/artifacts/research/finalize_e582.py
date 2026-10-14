"""Machine-authored local evidence manifest; not independent admission."""
import hashlib,json,pathlib,time,re
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-e5822cfc'
mods=['MarkovQuinticExprE582','MarkovQuinticJetE582','MarkovQuinticBoundsE582',
 'MarkovQuinticSourceE582','MarkovSixthE582','MarkovQuinticCountsE582',
 'MarkovSmallQuinticE582','MarkovSixthLongE582']
records=[]
for p in sorted(o.glob('run-*.json')):
 d=json.loads(p.read_text());d['record']=str(p.relative_to(r));records.append(d)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
validation=[]
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p)
 rs=[d for d in records if d['sha256']==h and d['source']==str(p.relative_to(r))]
 builds=[d['record'] for d in rs if d.get('returncode')==0 and 'leanchecker' not in d['command'][0]]
 kernels=[d['record'] for d in rs if d.get('returncode')==0 and 'leanchecker' in d['command'][0]]
 imports=[]
 for imp in re.findall(r'^import (\S+)',p.read_text(),re.M):
  for base in (rs[-1]['lean_path'].split(':') if rs else []):
   ip=pathlib.Path(base)/pathlib.Path(*imp.split('.')).with_suffix('.olean')
   if ip.exists():imports.append(dict(module=imp,path=str(ip),sha256=sha(ip)));break
 validation.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,builds=builds,kernels=kernels,direct_import_binaries=imports))
bad=[d['record'] for d in records if d.get('returncode')!=0 and not d.get('timeout')]
timeouts=[d['record'] for d in records if d.get('timeout')]
root_hash=sha(r/'MathGKM/Markov.lean')
val=dict(request_id='e5822cfcbab4405195d110889f9273f6',modules=validation,root_sha256=root_hash,
 rejected_attempts=bad,timeouts=timeouts,scope='Fresh named-module checks with inherited compiled imports; not independent full-source root rebuild',completion=None)
(o/'validation.json').write_text(json.dumps(val,indent=2)+'\n')
ops=dict(capability_failures=[dict(capability='SymPy',observation='ModuleNotFoundError; no installation attempted'),
 dict(capability='requested .scratch working storage',observation='Denied by higher-priority permissions; research and evidence paths used'),
 dict(capability='four simultaneous 90-second kernel replays',observation='All timed out; successful serial/pair retries listed in validation.json')],
 rejected_compilations=bad,timeout_records=timeouts,dependency_updates=False,protected_edits=False,
 root_sha256=root_hash,stop_checked=True,background_processes=False,other_models=False,
 validation_limit='Inherited compiled dependencies; not fresh independent full-source validation')
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='e5822cfcbab4405195d110889f9273f6',
 summary='Proved the universal quintic word identity and raw sixth-upper-diagonal log-concavity for every source with denominator at least twenty, also for numerator at least ten. Full pinned Conjecture 6.3 remains unresolved.',
 actions=['Read required documents and audits; reconciled prior artifacts in evidence/markov-e5822cfc/reconciliation.json.',
 'Proved word_quinticE582 in research/MarkovQuinticJetE582.lean, replacing the inherited interpolation premise with a universal ring induction.',
 'Proved source statistic bounds and quintic coefficient inequalities in research/MarkovQuinticSourceE582.lean, research/MarkovQuinticCountsE582.lean, research/MarkovQuinticBoundsE582.lean and research/MarkovSmallQuinticE582.lean.',
 'Proved sixth_raw_logConcaveE582 and sixth_raw_longE582 in research/MarkovSixthE582.lean and research/MarkovSixthLongE582.lean.',
 'Compiled and kernel-replayed all eight new modules; per-module evidence in evidence/markov-e5822cfc/validation.json and exact experiments in evidence/markov-e5822cfc/quintic-check.json.',
 'Recorded mathematics and all correspondence obligations in research/markov-e5822cfc-mathematics.md and research/markov-e5822cfc-correspondence.md.'],
 observations=['The sixth diagonal is proved for a>=10 or b>=20, with raw coefficients and zeros retained. The remaining b<=19, a=2,...,9 cases were tested but are not formally discharged here.',
 'The universal word formula includes four-letter and endpoint statistics. A false exploratory statistic bound was rejected and replaced before the inequality proof.',
 'Exact checks found no formula/count-bound failure among 16,376 words and no raw failure among 10,836 sixth-diagonal triples from 383 source fractions through denominator 35. Finite evidence only.',
 'Successful axiom closures contain only permitted axioms. Rejected elaborations and four kernel timeouts are retained. Validation uses inherited compiled imports.',
 'The pinned root is unchanged. All foreground sessions completed. Full remaining diagonals, horizontal/vertical inequalities and independent hash-bound source/English completion auditing remain open.'],
 agenda=['Discharge the finite remaining sixth-diagonal range b<=19, a=2,...,9 using actual source words and a kernel-checked finite base.',
 'Investigate invariants controlling unbounded remaining slices and horizontal/vertical raw inequalities while preserving exact source-word restrictions.',
 'Require fresh full-source verification and independent hash-bound source/English auditing before root closure.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(modules=[dict(module=v['module'],compiled=bool(v['builds']),kernel=bool(v['kernels'])) for v in validation],rejected=len(bad),timeouts=len(timeouts),root_sha256=root_hash)))
