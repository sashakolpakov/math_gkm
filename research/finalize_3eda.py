"""Machine-authored evidence manifest, not an admission authority."""
import pathlib,json,hashlib,re,time
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-3edac4bf'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovMechanical3eda','MarkovSaturation3eda','MarkovDiagonalSupport3eda',
 'MarkovMechanicalGoal3eda','MarkovCrossGoal3eda','MarkovPalindromeObstruction3eda','MarkovDirectionObstruction3eda']
runs=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
records=[]
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p)
 matched=[(q,d) for q,d in runs if d['source']==str(p.relative_to(r)) and d['sha256']==h and d.get('returncode')==0]
 builds=[str(q.relative_to(r)) for q,d in matched if d['command'][0].endswith('/lean')]
 kernels=[str(q.relative_to(r)) for q,d in matched if d['command'][0].endswith('/leanchecker')]
 dirs=matched[-1][1]['lean_path'].split(':') if matched else []
 deps=[]
 for imp in re.findall(r'^import (\S+)',p.read_text(),re.M):
  found=next((pathlib.Path(d)/(imp.replace('.','/')+'.olean') for d in dirs
    if (pathlib.Path(d)/(imp.replace('.','/')+'.olean')).is_file()),None)
  deps.append(dict(module=imp,path=str(found),sha256=sha(found) if found else None))
 axioms=''.join(d['stdout'] for q,d in matched if d['command'][0].endswith('/lean'))
 records.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,
  status='compiled and kernel-replayed' if builds and kernels else 'incomplete',builds=builds,kernels=kernels,
  direct_import_binaries=deps,axiom_output=axioms,forbidden_source_tokens=re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',p.read_text())))
root=sha(r/'MathGKM/Markov.lean')
manifest=dict(request_id='3edac4bf4f1040d0b967711f6c52c66f',modules=records,
 root_sha256=root,root_unchanged=root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe',
 pinned_inputs={str(p.relative_to(r)):sha(p) for p in [r/'lean-toolchain',r/'lakefile.toml',r/'lake-manifest.json',r/'.control/markov/contract.json']},
 imports_status='Inherited compiled imports; not a fresh full-source dependency rebuild',
 completion=None)
(o/'validation.json').write_text(json.dumps(manifest,indent=2)+'\n')
failed=[dict(record=str(p.relative_to(r)),source=d['source'],timeout=d.get('timeout',False),returncode=d.get('returncode')) for p,d in runs if d.get('returncode')!=0]
ops=dict(request_id=manifest['request_id'],rejected_or_timed_out_runs=failed,
 capabilities=json.loads((o/'reconciliation.json').read_text())['capabilities'],
 failures=['Default zsh heredoc temporary creation was denied; no side effect occurred; switched to Python files and -c.',
  'A source-search glob matched no files and zsh rejected the command; reran with explicit existing paths.',
  'Two documentation patch attempts failed their context checks and made no changes; corrected patch then succeeded.',
  'Sage absent from PATH; GAP present but not needed for these experiments.'],
 restrictions=['.scratch reads denied by system; used research/markov-3edac4bf-tmp.',
 'No shell networking, package updates, controllers, model calls, background processes, Git access or control-record edits.'],
 source_access=[dict(url='https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',method='hosted web open',result='retrieved'),
 dict(url='https://arxiv.org/html/2604.18333v1',method='hosted web open',result='retrieved')],
 foreground_sessions_completed=True,
 stop_file_present=(r/'.control/markov/STOP.json').exists(),
 validation_limitations=manifest['imports_status'])
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id=manifest['request_id'],
 summary='Proved full source-polygon saturation and exact mechanical-word and CrossLC root reformulations. Full pinned Conjecture 6.3 remains unresolved.',
 actions=['Reconciled prior interrupted effects and current inherited evidence: evidence/markov-3edac4bf/reconciliation.json.',
 'Proved exact mechanical prefix counts and universal source saturation: research/MarkovMechanical3eda.lean and research/MarkovSaturation3eda.lean.',
 'Proved all raw diagonal interval support and exact root equivalences: research/MarkovDiagonalSupport3eda.lean, research/MarkovMechanicalGoal3eda.lean and research/MarkovCrossGoal3eda.lean.',
 'Proved balanced-palindrome and actual-source nonprincipal-direction strategy obstructions: research/MarkovPalindromeObstruction3eda.lean and research/MarkovDirectionObstruction3eda.lean.',
 'Compiled and kernel-replayed seven modules; actual hash-bound statuses: evidence/markov-3edac4bf/validation.json.',
 'Recorded derivations, correspondence scope, experiments and capability failures: research/markov-3edac4bf-mathematics.md, research/markov-3edac4bf-correspondence.md and evidence/markov-3edac4bf/operational-observations.json.'],
 observations=['Every actual source coefficient is positive exactly at the pinned polygon lattice points. This universal support theorem does not prove coefficient log-concavity.',
 'The mechanical-word target has explicit floor-defined letters and no unknown support or source-family premise. Both sides of the equivalence remain unproved.',
 'Balanced palindromic core ACAAAAACA has vertical coefficients 8,12,20 and is not the source at 3/8.',
 'Actual source 1/9 has coefficients 1,7,50 along direction (1,-3), with all three points inside its polygon. That direction is outside the pinned root.',
 'An exact finite scan checked 3,445,704 triples on 383 sources through b=35. Additional directions fail; the three pinned directions had no failure. This is not a universal proof: evidence/markov-3edac4bf/directions-probe.json.',
 f'New accepted axiom closures use only permitted axioms. {len(failed)} rejected elaborations are preserved. Validation reused inherited compiled imports.',
 'The pinned root is unchanged. Fresh full-source verification and separate independent hash-bound correspondence auditing remain outstanding for any future completion claim.'],
 agenda=['Investigate the exact raw inequalities for the explicit mechanical-word family, exploiting its floor order and retaining all three pinned directions.',
 'Use full saturation and all-slice CrossLC equivalence where useful; do not assume balance/palindrome alone or arbitrary-direction planar concavity.',
 'Resolve all remaining universal inequalities and obtain fresh full-source and independent hash-bound source/English auditing before root closure.'],completion=None)
if not all(x['status']=='compiled and kernel-replayed' for x in records):
 report['actions'][4]='Validation is incomplete; consult evidence/markov-3edac4bf/validation.json.'
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(modules=[(x['module'],x['status']) for x in records],root_unchanged=manifest['root_unchanged'],rejected=len(failed),report='evidence/markov-3edac4bf/report.json')))
