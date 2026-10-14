"""Machine-authored evidence manifest. Local validation, not admission authority."""
import pathlib,json,hashlib,time,re
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-28b112de'
mods=['MarkovPalindrome28b1','MarkovSquares28b1','MarkovWordWitness28b1',
 'MarkovPolygonWord28b1','MarkovWordRigidity28b1','MarkovSupportedGoal28b1']
runs=[]
for p in sorted(o.glob('run-*.json')):
 j=json.loads(p.read_text());j['record']=str(p.relative_to(r));runs.append(j)
items=[]
for m in mods:
 p=r/'research'/f'{m}.lean';data=p.read_bytes();sha=hashlib.sha256(data).hexdigest()
 good=[x for x in runs if x['source']==str(p.relative_to(r)) and x['sha256']==sha and x.get('returncode')==0]
 bs=[x for x in good if x['command'][0].endswith('/lean')]
 ks=[x for x in good if x['command'][0].endswith('/leanchecker')]
 deps=[]
 if bs:
  for name in re.findall(r'^import (\S+)',data.decode(),re.M):
   for d in bs[-1]['lean_path'].split(':'):
    q=pathlib.Path(d)/(name.replace('.','/')+'.olean')
    if q.is_file():
     deps.append(dict(module=name,path=str(q),sha256=hashlib.sha256(q.read_bytes()).hexdigest()));break
 items.append(dict(module=m,source=str(p.relative_to(r)),sha256=sha,
  status='compiled and kernel-replayed' if bs and ks else 'compiled only' if bs else 'unaccepted draft',
  builds=[x['record'] for x in bs],kernels=[x['record'] for x in ks],direct_import_binaries=deps,
  axiom_output=bs[-1]['stdout'] if bs else None))
rootsha=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()
manifest=dict(request_id='28b112de527c4d3ea1fa665cec2dc394',modules=items,root_sha256=rootsha,
 rejected_attempts=[x['record'] for x in runs if x.get('returncode',1)!=0 and not x.get('timeout')],
 timeouts=[x['record'] for x in runs if x.get('timeout')],
 scope='Named-module fresh source compilation and kernel replay using inherited compiled imports; not independent full-source verification',completion=None)
(o/'validation.json').write_text(json.dumps(manifest,indent=2)+'\n')
ops=dict(temporary_storage='Higher-priority sandbox denies .scratch; unique research/evidence paths used.',
 failures=['A shell here-document failed before execution because default temporary storage is denied.',
 'Some source lookups returned missing-file; actual existing definitions were located with rg.',
 'Rejected Lean attempts are preserved in validation.json; their diagnostic placeholder axioms are not accepted.'],
 source_retrieval='Hosted publisher retrieval succeeded; no shell networking used.',
 packages_updated=False,controller_modified=False,root_sha256=rootsha,
 stop_file_present=(r/'.control/markov/STOP.json').exists(),
 validation_limitation='Inherited compiled imports; no fresh full-source or independent English audit.')
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
allok=all(x['status']=='compiled and kernel-replayed' for x in items)
report=dict(request_id='28b112de527c4d3ea1fa665cec2dc394',
 summary='Established universal positive-square representations and an exact source-word characterization by polygon support, yielding a checked root reformulation. Full Conjecture63 remains unresolved.',
 actions=['Reconciled the interrupted worker and identified duplicated horizontal-row work: evidence/markov-28b112de/reconciliation.json.',
 'Proved canonical source palindrome and universal positive weighted-square identities: research/MarkovPalindrome28b1.lean and research/MarkovSquares28b1.lean.',
 'Proved exact positive monomial witnesses and prefix-floor constraints: research/MarkovWordWitness28b1.lean and research/MarkovPolygonWord28b1.lean.',
 'Proved source-family rigidity and an exact root equivalence: research/MarkovWordRigidity28b1.lean and research/MarkovSupportedGoal28b1.lean. Actual validation status: evidence/markov-28b112de/validation.json.',
 'Executed exact tropical and square experiments: evidence/markov-28b112de/polygon-tropical-23.json and square-check.json.',
 'Recorded mathematical derivations and all correspondence obligations: research/markov-28b112de-mathematics.md and research/markov-28b112de-correspondence.md.'],
 observations=['The new identities preserve literal raw coefficients and universal source paths; they do not prove the remaining log-concavity inequalities.',
 '3,056,949 reduced words through b=23 gave exactly 171 supported words, one per reduced label. This is finite evidence only.',
 'The square identity matched all 627 source polynomials through b=45. Some half-polynomials fail vertical LC, so requiring their LC is not a valid general strategy.',
 'All six new modules compiled and kernel-replayed with permitted axiom closures.' if allok else 'Validation statuses are explicit per module; unaccepted drafts are not theorems.',
 'The pinned root is unchanged. Validation reused inherited imports; full-source verification and independent source/English audit remain required.'],
 agenda=['Use the exact support characterization to constrain any proposed matrix-word LC invariant; preserve source generators, endpoints and coprime counts.',
 'Investigate inequalities directly for the canonical positive-square pair; individual half-polynomial LC already fails.',
 'Resolve all remaining universal raw directions, then obtain fresh full-source and independent hash-bound correspondence auditing.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(statuses=[(x['module'],x['status']) for x in items],root=rootsha,all_checked=allok)))
