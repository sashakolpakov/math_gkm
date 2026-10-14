"""Machine-authored validation manifest and local report; no admission authority."""
import pathlib,json,hashlib,time
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-05ef7fab'
mods=['MarkovFiniteQuintic05ef','MarkovSourceFinite05ef','MarkovSixthAll05ef',
 'MarkovHorizontalJet05ef','MarkovHorizontalWord05ef','MarkovHorizontalFactor05ef',
 'MarkovHorizontalSource05ef','MarkovHorizontalTwo05ef']
runs=[]
for p in sorted(o.glob('run-*.json')):
 x=json.loads(p.read_text());x['record']=str(p.relative_to(r));runs.append(x)
items=[]
for m in mods:
 p=r/'research'/f'{m}.lean';sha=hashlib.sha256(p.read_bytes()).hexdigest()
 matches=[x for x in runs if x['source']==str(p.relative_to(r)) and x['sha256']==sha and x.get('returncode')==0]
 bs=[x for x in matches if x['command'][0].endswith('/lean')]
 ks=[x for x in matches if x['command'][0].endswith('/leanchecker')]
 deps=[]
 if bs:
  for line in p.read_text().splitlines():
   if not line.startswith('import '):continue
   for d in bs[-1]['lean_path'].split(':'):
    q=pathlib.Path(d)/(line.split()[1].replace('.','/')+'.olean')
    if q.is_file():
     deps.append(dict(module=line.split()[1],path=str(q),sha256=hashlib.sha256(q.read_bytes()).hexdigest()));break
 items.append(dict(module=m,source=str(p.relative_to(r)),sha256=sha,builds=[x['record'] for x in bs],
  kernels=[x['record'] for x in ks],status='compiled and kernel-replayed' if bs and ks else 'compiled only' if bs else 'unaccepted draft',direct_import_binaries=deps))
rootsha=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()
manifest=dict(request_id='05ef7fab4f78419f9b5c3aa251540484',modules=items,root_sha256=rootsha,
 rejected_attempts=[x['record'] for x in runs if x.get('returncode',1)!=0 and not x.get('timeout')],
 timeouts=[x['record'] for x in runs if x.get('timeout')],
 scope='Fresh named-module compilation and replay against inherited compiled imports; not independent full-source verification',completion=None)
(o/'validation.json').write_text(json.dumps(manifest,indent=2)+'\n')
ops=dict(temporary_files='Higher-priority sandbox denies .scratch; research-local files used.',
 failures=['Two shell here-documents failed before code execution because default temporary storage was denied.',
 'Missing-file and unmatched-glob lookups failed; no mathematical inference.',
 'Two enlarged-word finite proof attempts timed out at 150 seconds; replaced by exact source-specific finite proof.',
 'Missing MarkovUnique098 import path corrected by appending existing pinned evidence directory.',
 'Rejected elaborations and unavailable theorem names retained in run records.'],
 stop_file='Absent at checked time; not a mathematical observation',packages_updated=False,
 controller_modified=False,root_sha256=rootsha)
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='05ef7fab4f78419f9b5c3aa251540484',
 summary='Closed the sixth-upper-diagonal gap and established an exact second-horizontal-row representation. Full pinned Conjecture 6.3 remains unresolved.',
 actions=['Reconciled inherited source hashes: evidence/markov-05ef7fab/reconciliation.json.',
 'Proved first_six_raw05ef in research/MarkovSixthAll05ef.lean, covering every source path and the first six upper diagonals.',
 'Proved source_horizontal_second05ef in research/MarkovHorizontalWord05ef.lean and exact factorization/statistic bounds in research/MarkovHorizontalFactor05ef.lean.',
 'Recorded builds, kernel replays, rejected attempts and source/import hashes: evidence/markov-05ef7fab/validation.json.'],
 observations=['All accepted theorem axiom prints use only permitted axioms.',
 'The source-specific finite base is proved using path uniqueness and ordinary kernel computation; experimental scans are not used as proof premises.',
 'The second horizontal row has a cubic factor controlled by adjacent BB pairs and endpoints. Current validation status of further source transfer is explicit in validation.json.',
 'Validation uses inherited imports. The pinned root is unchanged and full-source independent correspondence auditing remains outstanding.'],
 agenda=['Finish any unaccepted second-horizontal-row transfer drafts, then cover small denominators explicitly.',
 'Resolve remaining unbounded raw inequalities in all three directions.',
 'Obtain fresh full-source verification and independent hash-bound source/English audit before root closure.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(statuses=[(x['module'],x['status']) for x in items],root=rootsha)))
