"""Machine-authored evidence manifest; no admission or controller mutation."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm')
out=root/'evidence/markov-de6ce8a9'
receipts=[]
axioms={}
for p in sorted(out.glob('run-*.json')):
    r=json.loads(p.read_text())
    receipts.append(dict(path=str(p.relative_to(root)),**r))
    if r.get('returncode')==0:
        for name,ax in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",r.get('stdout','')):
            axioms[name]=[v.strip() for v in ax.split(',') if v.strip()]
files=list(root.glob('research/*De6.lean'))+list(root.glob('research/*de6*'))+list(out.glob('*.json'))
hashes={str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files if p.is_file()}
rh=hashlib.sha256((root/'MathGKM/Markov.lean').read_bytes()).hexdigest()
manifest=dict(request_id='de6ce8a9416947d1b06f5290592fd125',completion=None,
    status='local partial research; inherited compiled project imports, no independent closure audit',
    receipts=receipts,axioms=axioms,permitted_axioms_only=all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in axioms.values()),
    files=hashes,root_sha256=rh,root_unchanged=rh=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe',
    stop_exists=(root/'.control/markov/STOP.json').exists(),
    remaining=['universal raw log-concavity in all three directions','full polygon bridge',
               'explicit DiagonalSeq slice adapter','residual positivity and CrossLC',
               'fresh independent root rebuild and hash-bound source/English audit'])
p=out/f'validation-{time.time_ns()}.json'
p.write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(dict(path=str(p.relative_to(root)),successes=sum(r.get('returncode')==0 for r in receipts),
    rejections=sum(r.get('returncode',1)!=0 for r in receipts),axioms=axioms,root_unchanged=manifest['root_unchanged'])),flush=True)
