"""Machine-authored evidence aggregation; checks receipts, never certifies root."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm');out=root/'evidence/markov-7252232b'
mods=['MarkovSupport725','MarkovIntervals725','MarkovResidualSupport725','MarkovFactorialObstruction725']
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
runs=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
accepted=[]
for m in mods:
 src=root/'research'/f'{m}.lean';digest=sha(src)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',src.read_text())
 matching=[(p,d) for p,d in runs if d['sha256']==digest and d.get('returncode')==0]
 builds=[str(p.relative_to(root)) for p,d in matching if '/leanchecker' not in d['command'][0]]
 kernels=[str(p.relative_to(root)) for p,d in matching if '/leanchecker' in d['command'][0]]
 assert builds and kernels,(m,builds,kernels)
 assert all('sorryAx' not in d.get('stdout','') for p,d in matching)
 envpath=matching[-1][1]['lean_path'].split(':')
 imports=[]
 for name in re.findall(r'^import\s+(\S+)',src.read_text(),re.M):
  ps=[pathlib.Path(q)/(name.replace('.','/')+'.olean') for q in envpath]
  found=next((p for p in ps if p.exists()),None)
  imports.append(dict(module=name,path=str(found) if found else None,sha256=sha(found) if found else None))
 accepted.append(dict(module=m,sha256=digest,builds=builds,kernels=kernels,direct_import_binaries=imports))
rootsha=sha(root/'MathGKM/Markov.lean')
assert rootsha=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
rec=dict(request_id='7252232b881c40b283530604624fc942',modules=accepted,root_sha256=rootsha,
 rejected_attempts=[str(p.relative_to(root)) for p,d in runs if d.get('returncode')!=0],
 scope='Fresh named source modules and kernel replay using inherited compiled imports; not independent full-source validation',completion=None)
name=f'validation-{time.time_ns()}.json';(out/name).write_text(json.dumps(rec,indent=2)+'\n')
prior=json.loads((root/'evidence/markov-f6506bc6/validation-1791949372800338000.json').read_text())
reconcile=dict(latest_worker='f6506bc615574382b93e600ac6a368f9',latest_status='completed',
 prior_timeout_reconciliation='evidence/markov-f6506bc6/reconciliation.json',
 module_source_checks=[dict(module=m['module'],matches_saved_hash=sha(root/'research'/(m['module']+'.lean'))==m['sha256']) for m in prior['modules']],
 conclusion='Latest completed source bytes match all four saved hashes. Earlier timeout was already reconciled by latest worker. No side effect replayed.')
(out/'reconciliation.json').write_text(json.dumps(reconcile,indent=2)+'\n')
operational=dict(capabilities='evidence/markov-7252232b/capabilities.json',
 rejected_attempts=rec['rejected_attempts'],
 transient_draft='An unfinished placeholder was immediately removed before compiler invocation. No theorem from that transient draft was admitted or used.',
 accepted_sources='No proof placeholders, custom axioms or native_decide; printed axiom closures are permitted.',
 validation_boundary=rec['scope'],
 all_foreground_sessions_completed=True,
 protected_root_unchanged=True)
(out/'operational-observations.json').write_text(json.dumps(operational,indent=2)+'\n')
report=dict(request_id='7252232b881c40b283530604624fc942',
 summary='Proved universal source and quotient support theorems, removing the no-internal-zero premise from upper-diagonal residual transfer. Full published Conjecture 6.3 remains unresolved.',
 actions=[
  'Read required documents and independent audits; reconciled latest source hashes: evidence/markov-7252232b/reconciliation.json.',
  'Proved source_filled725 and horizontal/vertical interval support: research/MarkovSupport725.lean and research/MarkovIntervals725.lean.',
  'Proved quotient_slice_interval725, exact slice support bounds, and upper_raw_lc_of_natural_adjacent725: research/MarkovResidualSupport725.lean.',
  'Proved an actual 21/22 factorial-weighting obstruction and its valid raw inequality: research/MarkovFactorialObstruction725.lean.',
  'Compiled and kernel-replayed four modules: evidence/markov-7252232b/'+name+'.',
  'Saved mathematics, experiments and correspondence scope: research/markov-7252232b-mathematics.md and research/markov-7252232b-correspondence.md.'
 ],
 observations=[
  'Every positive source coefficient propagates northeast up to total degree a+b-1. Horizontal and vertical rows have no internal positive-support gaps; this does not prove their LC inequalities.',
  'All source quotient slices have interval positive support. The upper-diagonal transfer now needs only adjacent residual LC; those inequalities and the remaining universal raw directions remain unproved.',
  'Source 21/22 has coefficients 190,13965,514845 at horizontal j=24 and i=0,1,2. Factorial weighting reverses LC; raw LC holds. This is not a root refutation.',
  'Finite probes checked 4095 arbitrary words and 627 source fractions for factorial-weighted LC; evidence/markov-7252232b/factorial-probe.json. Further invariant failures: coefficientwise-probe.json and fg-invariants.json in the same directory.',
  'Successful axiom closures use only permitted axioms; '+str(len(rec['rejected_attempts']))+' rejected compilation attempts are preserved. Validation used inherited compiled imports, with no independent full-source completion audit.',
  'The pinned root hash is unchanged. Capability failures and transient draft handling are recorded in evidence/markov-7252232b/operational-observations.json. All foreground sessions completed.'
 ],
 agenda=[
  'Investigate adjacent LC of exact source quotient slices; interval support is now proved, so it need not be assumed or reproved.',
  'Seek raw coefficient inequalities compatible with the positive two-state recurrence and exact source-word order; factorial weighting and simple synchronization are unavailable general strategies.',
  'Resolve all universal raw directions and obtain independent hash-bound source/English auditing before any completion claim.'
 ],completion=None)
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(validation=str(out/name),modules=mods,root_sha256=rootsha,rejected=len(rec['rejected_attempts']))))
