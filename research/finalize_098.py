"""Machine-authored local evidence audit; does not declare root completion."""
import hashlib,json,pathlib,re
root=pathlib.Path('/Users/sasha/math_gkm')
out=root/'evidence/markov-098a5a66'
sha=lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
assert sha(root/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
build=json.loads((out/'build.json').read_text())
assert all(x['returncode']==0 and sha(root/x['source'])==x['sha256'] for x in build)
compiles=[(p,json.loads(p.read_text())) for p in sorted(out.glob('compile-*.json'))]
latest=compiles[-1]
assert latest[1]['returncode']==0
assert latest[1]['source_sha256']==sha(root/'research/MarkovUnique098.lean')
audit=(out/'MarkovCoverage098.log').read_text()+latest[1]['stdout']
assert 'sorryAx' not in audit
closures=re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",audit)
assert len(closures)==8
allowed={'propext','Classical.choice','Quot.sound'}
assert all(set(c.split(', '))<=allowed for _,c in closures)
for file in ['research/MarkovCoverage098.lean','research/MarkovUnique098.lean']:
    assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',(root/file).read_text())
kernels=[(p,json.loads(p.read_text())) for p in sorted(out.glob('kernel-*.json'))]
needed={'MathGKM.Markov','MathGKM.MarkovIndices','MarkovCoverage098','MarkovUnique098'}
successful={r['command'][-1]:str(p.relative_to(root)) for p,r in kernels if r['returncode']==0}
assert needed<=set(successful),successful
files=['MathGKM/Markov.lean','MathGKM/MarkovIndices.lean',
       'research/MarkovCoverage098.lean','research/MarkovUnique098.lean',
       'research/markov-098a5a66-correspondence.md',
       'research/validate_coverage_098.py','research/check_extra_098.py']
result=dict(request_id='098a5a660b784698a1c14a1849419cdd',
    status='local kernel-checked indexing bridge; full conjecture open',completion=None,
    source_sha256={f:sha(root/f) for f in files},
    theorem_axioms={n:c.split(', ') for n,c in closures},
    build='evidence/markov-098a5a66/build.json',
    successful_compile=str(latest[0].relative_to(root)),kernel_receipts=successful,
    rejected_compile_attempts=[str(p.relative_to(root)) for p,r in compiles if r['returncode']!=0],
    independent_audit=False,root_unchanged=True,
    remaining=['source-family Laurent correspondence','homogeneity/raw-coefficient bridge',
               'Newton polygon identification','universal inequalities in all three directions',
               'independent hash-bound English/source closure audit'])
(out/'validation.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
