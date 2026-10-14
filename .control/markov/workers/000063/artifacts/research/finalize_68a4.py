"""Machine-authored evidence packaging; no admission authority claimed."""
from pathlib import Path
import json,hashlib,re
import sys,platform
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-68a44d34'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovCountTransfer68a4','MarkovCountCoeff68a4','MarkovCountDiagonal68a4','MarkovSourceCount68a4','MarkovCountGap68a4']
rows=[];fail=[]
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p);runs=[]
 for q in sorted(o.glob(f'run-{m}-*.json')):
  d=json.loads(q.read_text());d['receipt']=str(q.relative_to(r));d['stamp']=int(q.stem.split('-')[-1]);runs.append(d)
  if d.get('returncode')!=0:fail.append(dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False)))
 builds=[d for d in runs if '-build-' in d['receipt'] and d['sha256']==h and d.get('returncode')==0 and 'sorryAx' not in d.get('stdout','')]
 build=max(builds,key=lambda d:d['stamp']) if builds else None
 replays=[d for d in runs if '-replay-' in d['receipt'] and d['sha256']==h and d.get('returncode')==0 and build and d['stamp']>build['stamp']]
 replay=max(replays,key=lambda d:d['stamp']) if replays else None
 axioms=sorted({a.strip() for block in re.findall(r'depends on axioms: \[([^\]]*)\]',build.get('stdout','') if build else '',re.S) for a in block.split(',') if a.strip()})
 assert set(axioms)<=set(['propext','Classical.choice','Quot.sound'])
 rows.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,olean_sha256=sha(o/f'{m}.olean') if (o/f'{m}.olean').exists() else None,build=build['receipt'] if build else None,replay=replay['receipt'] if replay else None,printed_axioms=axioms,forbidden_source_tokens=re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',p.read_text())))
v=dict(status='local current-source compilation and separate kernel replay; inherited imports reused',modules=rows,builds_passed=sum(bool(d['build']) for d in rows),replays_passed=sum(bool(d['replay']) for d in rows),fresh_whole_source_rebuild=False,independent_english_audit=False,root_completion=False)
(o/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
c=json.loads((r/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':'),ensure_ascii=True).encode()).hexdigest()
pres=dict(root_sha256=sha(r/'MathGKM/Markov.lean'),canonical_contract_sha256=ch,stop_file_present=(r/'.control/markov/STOP.json').exists())
assert pres['root_sha256']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(o/'preservation.json').write_text(json.dumps(pres,indent=2)+'\n')
(o/'runtime.json').write_text(json.dumps(dict(python=sys.version,executable=sys.executable,platform=platform.platform(),lean_toolchain=(r/'lean-toolchain').read_text().strip(),ordinary_lean_binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean',git_environment=dict(GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null')),indent=2)+'\n')
(o/'operational-observations.json').write_text(json.dumps(dict(rejected_builds_or_replays=fail,capability_limits=['Higher-priority filesystem policy denies .scratch; durable research/evidence paths used.','A zsh here-document failed before file creation because its temporary file could not be created. The subsequent apply_patch created the new file.'],other_failures=['Initial rg AGENTS.md search returned no files; a dependent cat was consequently skipped and was executed separately.','Several guessed predecessor module paths did not exist; actual declarations were located through rg.','One apply_patch request was rejected for malformed final patch delimiter; no patch effects occurred, and the corrected patch succeeded.'],literature=dict(source='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',actions=['Hosted open of the pinned published source','Hosted searches for Markov log-concavity and fence-poset coefficient methods'],result='No retrieved theorem was adopted as a proof premise or axiom; no comprehensive novelty audit.'),background_processes_launched=False,external_action_requests_pending=False),indent=2)+'\n')
report=dict(request_id='68a44d341d1c48e791034745c94024de',summary='Proved an unbounded actual-source obstruction to fixed-degree cross-cut aggregation and an exact mixed-run count formula. Full Conjecture63 remains unresolved.',completion=None,actions=['Reconciled 80 predecessor artifacts and six inherited hashes: evidence/markov-68a44d34/reconciliation.json.','Derived and formalized exact mixed-run degree-layer count formulas and an unbounded source obstruction: research/MarkovCountGap68a4.lean.','Recorded current-source builds and separate kernel-replay outcomes: evidence/markov-68a44d34/validation.json.','Executed exact cross-cut experiments and independent literal source recurrence checks under evidence/markov-68a44d34/.','Saved derivations and scope limits: research/markov-68a44d34-mathematics.md and research/markov-68a44d34-correspondence.md.'],observations=[f"{v['builds_passed']} modules compiled and {v['replays_passed']} final builds separately kernel-replayed; printed axiom closures are permitted.",'For every n>=33, the actual source (2n+1)/(2n+3) has a fixed degree-(n+6) layer whose horizontal cut-count 4,5,6 triple fails log-concavity. Its complete raw polygon-valid triple satisfies the inequality.','At source 67/69 the auxiliary triple is [18513,185504,1862728], gap -72949448. The full raw triple is [814385,10424128,109453344], gap 19525283006944.','An exact finite experiment also found a fixed-degree vertical obstruction at source 79/81. Its complete raw triple satisfies the target; the vertical obstruction is not formalized.','The exact formula matched 28,899 independent coefficient checks. The arbitrary-word scan covered all words of length<=14 with cuts<=5; these are finite experiments.','Root and canonical contract hashes match. No fresh whole-source rebuild or independent completion audit occurred.'],agenda=['Use degree layers only for the diagonal aggregation route unless a valid cross-cut coupling is proved; fixed-degree horizontal LC fails on infinitely many actual sources.','Investigate degree-minus-cut alignment and other couplings using the exact mixed-run count formula, retaining actual multiplicities.','Resolve general mixed-source diagonal aggregation and the remaining horizontal/vertical raw inequalities, with full coverage, zeros, polygon guards and endpoints.'])
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
report['observations'].append('The revised degree-minus-cut count formula matched 35,750 identities and 30,250 inequalities: evidence/markov-68a44d34/aligned-counts.json. Its general derivation is not a new Lean theorem.')
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
files=[p for p in o.iterdir() if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
files += [p for p in (r/'research').iterdir() if p.is_file() and ('68a4' in p.name or '68a44d34' in p.name)]
hashes={str(p.relative_to(r)):sha(p) for p in sorted(files)}
(o/'artifacts.json').write_text(json.dumps(dict(provenance='Machine-authored request 68a44d341d1c48e791034745c94024de',hashes=hashes),indent=2)+'\n')
checks=[dict(path=p,expected=h,actual=sha(r/p)) for p,h in hashes.items()]
assert all(x['expected']==x['actual'] for x in checks)
(o/'artifact-verification.json').write_text(json.dumps(dict(verified=len(checks),all_match=True,checks=checks),indent=2)+'\n')
print(json.dumps(dict(validation=v,rejected=len(fail),verified=len(checks),preservation=pres)))
