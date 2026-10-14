"""Machine-authored evidence manifest; no controller changes."""
import pathlib,json,hashlib,datetime
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-6a40862b'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
records=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
modules=[]
for m in ['MarkovLayerPositive6a40','MarkovLayerIdentity6a40','MarkovLayerMonotone6a40','MarkovBinomialRatios6a40']:
 p=r/'research'/f'{m}.lean';h=sha(p)
 matching=[(f,d) for f,d in records if d['sha256']==h and pathlib.Path(d['source']).stem==m and d.get('returncode')==0]
 builds=[(f,d) for f,d in matching if d['command'][0].endswith('/lean')]
 replays=[(f,d) for f,d in matching if d['command'][0].endswith('/leanchecker')]
 modules.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,
  build=str(builds[-1][0].relative_to(r)) if builds else None,
  replay=str(replays[-1][0].relative_to(r)) if replays else None,
  axiom_lines=[l for l in builds[-1][1]['stdout'].splitlines() if 'depends on axioms:' in l] if builds else [],
  olean_sha256=sha(o/f'{m}.olean') if (o/f'{m}.olean').exists() else None))
v=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=modules,
 imports='Inherited compiled imports, not fresh whole-source rebuilding',independent_audit=False,
 root_sha256=sha(r/'MathGKM/Markov.lean'))
(o/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
failed=[dict(record=str(f.relative_to(r)),source=d['source'],timeout=d.get('timeout',False),returncode=d.get('returncode')) for f,d in records if d.get('returncode')!=0]
ops=dict(rejected_runs=failed,capability_observations=[
 'Developer forbids .scratch reads; all working files retained in research/evidence.',
 'sage was not found; GAP executable was found but not needed. No package changes.',
 'Process inspection using ps was denied by the sandbox.',
 'An early validator invocation preceded completion of certificate generation and found no source file; no proof effect.',
 'research/setup_0c12.py was absent; the actual predecessor setup was then inspected.',
 'Initial combined document output was truncated; required documents were reread in smaller batches.',
 'STOP.json was absent at check time.',
 'Monolithic certificate elaboration timed out; split certificate identities were used instead.' ])
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
accepted=[m['module'] for m in modules if m['build'] and m['replay']]
report=dict(request_id='6a40862beebd4a1a8207ff0222f0451d',completion=None,
 summary='Developed an exact centered-layer monotonicity certificate; the full published Markov goal remains open.',
 actions=['Read the mission, design, pinned contract, inherited evidence and independent Markov audits.',
 'Reconciled predecessor completion without replaying effects: evidence/markov-6a40862b/reconciliation.json.',
 'Executed exact fiber and symbolic experiments: evidence/markov-6a40862b/fiber-shape.json, layer-symbolic.json and reduced-certificate.json.',
 'Recorded current compilation, kernel replay and axiom checks: evidence/markov-6a40862b/validation.json.',
 'Saved derivation and correspondence limits: research/markov-6a40862b-mathematics.md and research/markov-6a40862b-correspondence.md.'],
 observations=['The pinned root hash is unchanged and Conjecture63 remains unresolved.',
 'The rational comparison has an exact factorization into three nonnegative linear factors and a polynomial with 1140 positive rational coefficients.',
 'Accepted build-and-replay modules: '+', '.join(accepted)+'.',
 'The full rational-to-binomial-layer bridge and aggregate positivity remain unproved; no new raw source log-concavity theorem is claimed.',
 'Validation reuses inherited compiled imports and is not an independent audit. Failures are retained in evidence/markov-6a40862b/operational-observations.json.'],
 agenda=['Complete the rational-to-binomial centered-layer bridge, including support boundaries and the central half-weight.',
 'Use the single-crossing structure to focus on TOTAL horizontal fiber positivity; monotonicity alone does not prove it.',
 'Retain all-rational scope and all three directions; require fresh rebuilding and independent hash-bound correspondence auditing before closure.'])
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(accepted=accepted,failed=len(failed),root_sha256=v['root_sha256'])))
