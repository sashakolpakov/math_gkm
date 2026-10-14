"""Machine-authored local evidence manifest; not independent admission."""
import pathlib,json,hashlib,datetime,re
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-863a7482'
modules=['MarkovDistanceTwo863a','MarkovDistanceForward863a','MarkovDistanceFiber863a','MarkovThreeCharge863a','MarkovTailThree863a']
records=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
out=[]
for m in modules:
 p=r/'research'/f'{m}.lean';data=p.read_bytes();sha=hashlib.sha256(data).hexdigest()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',data.decode())
 selected={}
 for q,x in records:
  if x['source']==str(p.relative_to(r)) and x['sha256']==sha and x.get('returncode')==0:
   mode='replay' if 'leanchecker' in x['command'][0] else 'build'
   selected[mode]=(q,x)
 assert set(selected)=={'build','replay'},(m,selected.keys())
 lines=[line for line in selected['build'][1]['stdout'].splitlines() if 'depends on axioms:' in line]
 assert lines and all('sorryAx' not in line for line in lines)
 out.append(dict(module=m,source=str(p.relative_to(r)),sha256=sha,
  build=str(selected['build'][0].relative_to(r)),replay=str(selected['replay'][0].relative_to(r)),
  axiom_lines=lines,olean_sha256=hashlib.sha256((o/f'{m}.olean').read_bytes()).hexdigest()))
root=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest()
c=json.loads((r/'.control/markov/contract.json').read_text())
contract=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
manifest=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=out,
 root_sha256=root,contract_canonical_sha256=contract,imports='Inherited compiled imports reused; not fresh whole-source rebuild',independent_audit=False)
(o/'validation.json').write_text(json.dumps(manifest,indent=2)+'\n')
fail=[dict(record=str(p.relative_to(r)),returncode=x.get('returncode'),timeout=x.get('timeout',False),
 diagnostics=x.get('stdout','')) for p,x in records if x.get('returncode')!=0]
(o/'operational-observations.json').write_text(json.dumps(dict(rejected_elaborations=fail,
 finalizer_observation='First finalizer call ran before tail replay finished and correctly rejected the missing receipt; it wrote no validation or report. Rerun only after replay completion.',
 capability_failures=['.scratch denied by higher-priority policy; no access attempted','SymPy and NumPy unavailable','Sage not on PATH'],
 capabilities={'python':'/opt/homebrew/bin/python3','gap':'/opt/homebrew/bin/gap','hosted_source_retrieval':'succeeded'},
 source={'url':c['source'],'retrieved':'2026-10-14','use':'Target source only; no added mathematical axiom'},
 stop_file='Absent at check; no stop signal observed'),indent=2)+'\n')
report=dict(request_id='863a748264774e87895cba827a773f3c',
 summary='Proved distance-two summand comparisons and uniform three-charge aggregation; full published Markov Conjecture 6.3 remains unresolved.',
 actions=['Reconciled predecessor effects and pinned hashes: evidence/markov-863a7482/reconciliation.json.',
 'Executed exact symbolic and aggregate experiments: evidence/markov-863a7482/distance-two-symbolic.json and aggregate-probe.json.',
 'Compiled and kernel-replayed five modules: evidence/markov-863a7482/validation.json.',
 'Saved derivations and correspondence limits: research/markov-863a7482-mathematics.md and research/markov-863a7482-correspondence.md.'],
 observations=['The exact pinned root and contract remain unchanged; completion is null.',
 'Both distance-two midpoint orientations hold uniformly for the exact Pell summands, retaining zeros.',
 'Every three-consecutive-charge polynomial has a coefficientwise nonnegative horizontal gap. The full refined gap has nonnegative quadratic coefficient; every cutoff r has nonnegative coefficient 2r+2.',
 'The finite aggregate probe tested 1814428 three-charge gaps without failure; this is not a universal source proof.',
 'Successful printed axiom closures use only permitted axioms. Local checks reused inherited compiled imports.',
 f'{len(fail)} rejected elaborations and capability limits are preserved in operational-observations.json.'],
 agenda=['Seek aggregation across arbitrary charge intervals; the three-charge algebra avoids counting the middle-square contribution twice.',
 'Investigate symmetrized wider comparisons while retaining the obstruction to individual distance-three domination.',
 'Preserve all-rational source coverage, all three directions, zeros, endpoints and every correspondence obligation before root closure.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(validated_modules=len(out),rejected_elaborations=len(fail),report=str((o/'report.json').relative_to(r)))))
