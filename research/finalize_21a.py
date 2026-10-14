"""Machine-authored evidence binding; no controller writes, worker 21afc594."""
import hashlib,json,pathlib,re
root=pathlib.Path('/Users/sasha/math_gkm')
out=root/'evidence/markov-21afc594'
sources=['MathGKM/Markov.lean','MathGKM/MarkovIndices.lean',
         'research/MarkovDegree21a.lean','research/MarkovHomogeneous21a.lean']
digest=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
records=[]
for p in sorted(out.glob('run-*.json')):
    for r in json.loads(p.read_text()): records.append((str(p.relative_to(root)),r))
modules={}; axioms={}; rejected=[]
for source in sources:
    sha=digest(root/source)
    matched=[(p,r) for p,r in records if r['source']==source and r['sha256']==sha and r['returncode']==0]
    builds=[(p,r) for p,r in matched if r['command'][0]=='lean']
    kernels=[(p,r) for p,r in matched if 'leanchecker' in r['command'][0]]
    assert builds and kernels,source
    modules[source]=dict(sha256=sha,compile=builds[-1][0],kernel=kernels[-1][0])
    for name,raw in re.findall(r"'([^']+)' depends on axioms: \[([^]]*)\]",builds[-1][1]['stdout']):
        aa=[x.strip() for x in raw.split(',') if x.strip()]
        assert set(aa)<=set(['propext','Classical.choice','Quot.sound']),(name,aa)
        axioms[name]=aa
for p,r in records:
    if r['returncode']!=0: rejected.append(dict(receipt=p,source=r['source'],sha256=r['sha256']))
assert modules['MathGKM/Markov.lean']['sha256']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
artifacts=['research/markov-21afc594-checkpoint.md','research/markov-21afc594-correspondence.md',
           'research/validate_degree_21a.py','research/cohn_words_21a.py','research/finalize_21a.py',
           'evidence/markov-21afc594/cohn-words.json']
report=dict(request_id='21afc5949a0649388be45f280b6747f2',completion=None,
    status='locally rebuilt and kernel-replayed partial coefficient bridges',
    independent_audit=False,root_unchanged=True,modules=modules,theorem_axioms=axioms,
    rejected_attempts=rejected,artifacts={s:digest(root/s) for s in artifacts},
    stop_exists=(root/'.control/markov/STOP.json').exists(),
    remaining=['formal source homogeneous/Laurent identity','Newton polygon equality',
               'universal raw coefficient inequalities in all three directions',
               'independent hash-bound English/source completion audit'])
(out/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
