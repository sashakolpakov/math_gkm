"""Machine-authored evidence inventory; no controller records modified."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm')
out=root/'evidence/markov-1998e47e'
result=dict(request_id='1998e47e852946dda2d4b1a02d4df1f3',completion=None,
            independent_audit=False,full_fresh_dependency_rebuild=False,
            successes=[],rejections=[],axioms={},files={},
            prior_replay='evidence/markov-4b57f2c3/run-1791933097650514000.json')
for p in sorted(out.glob('run-*.json')):
    for r in json.loads(p.read_text()):
        key='successes' if r.get('returncode',1)==0 else 'rejections'
        result[key].append(dict(receipt=str(p.relative_to(root)),source=r['source'],command=r['command'],sha256=r.get('sha256')))
        if key=='successes':
            for name,axs in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",r.get('stdout','')):
                result['axioms'][name]=[x.strip() for x in axs.split(',') if x.strip()]
for p in list((root/'research').glob('*1998*'))+list(out.glob('*.json')):
    if p.name.startswith('validation-'): continue
    result['files'][str(p.relative_to(root))]=hashlib.sha256(p.read_bytes()).hexdigest()
result['root_sha256']=hashlib.sha256((root/'MathGKM/Markov.lean').read_bytes()).hexdigest()
result['root_unchanged']=result['root_sha256']=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
result['stop_exists']=(root/'.control/markov/STOP.json').exists()
result['remaining']=['full Newton polygon bridge','universal interior raw inequalities in all three directions','independent hash-bound source/English completion audit']
name='validation-'+str(time.time_ns())+'.json'
(out/name).write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(path=str(out/name),successes=len(result['successes']),rejections=len(result['rejections']),axioms=result['axioms'],root_unchanged=result['root_unchanged']),indent=2))
