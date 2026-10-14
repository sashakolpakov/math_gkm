"""Machine-authored evidence manifest. Does not change controller records."""
import hashlib,json,pathlib,time
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-f93ee68f'
names=['MarkovRootCertificateF93e','MarkovSectorWitnessF93e','MarkovSectorSourceF93e','MarkovQuadraticObstructionF93e']
runs=[]
for p in sorted(o.glob('run-*.json')):
 d=json.loads(p.read_text());runs.append((p,d))
modules={};rejected=[]
for p,d in runs:
 if d.get('returncode')!=0:rejected.append(str(p.relative_to(r)))
for m in names:
 p=r/'research'/f'{m}.lean';digest=hashlib.sha256(p.read_bytes()).hexdigest()
 matches=[(q,d) for q,d in runs if d['source']==str(p.relative_to(r)) and d['sha256']==digest and d.get('returncode')==0]
 build=[str(q.relative_to(r)) for q,d in matches if d['command'][0].endswith('/lean')]
 replay=[str(q.relative_to(r)) for q,d in matches if d['command'][0].endswith('/leanchecker')]
 modules[m]=dict(source=str(p.relative_to(r)),sha256=digest,build=build[-1] if build else None,kernel_replay=replay[-1] if replay else None)
validation=dict(modules=modules,rejected=rejected,root_sha256=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest(),imports='Inherited compiled imports; not a fresh whole-source rebuild',completion=None)
(o/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
ops=dict(capability_observations=[
 'No AGENTS.md found by initial rg; chained read did not run and was repeated explicitly.',
 'zsh heredoc failed: cannot create temporary file. Active developer policy denies .scratch; persistent research/evidence files used.',
 'Initial guessed inherited filename absent; actual names located with rg.',
 'sympy, numpy, scipy, mpmath and Sage unavailable in selected Python/PATH; GAP executable found but not used.',
 'Stop file absent at check; no stop request observed.',
 'A multi-file apply_patch failed verification; inspected both files and confirmed no partial edits before corrected patch.',
 'Numerical root residual failures are saved as unreliable cases, not mathematical counterexamples.',
 'Rejected Lean elaborations are preserved; accepted modules must have successful build and replay records.'
 ],rejected_runs=rejected)
(o/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
report=dict(request_id='f93ee68f6b414a928b23bb07728597c4',summary='Established an exact source-row obstruction to a root-sector strategy; full pinned Conjecture63 remains unresolved.',actions=[
 'Reconciled the predecessor raw events and source hashes: evidence/markov-f93ee68f/reconciliation.json.',
 'Executed numerical sector probes and constructed an exact rational root certificate: evidence/markov-f93ee68f/sector-certificate.json.',
 'Proved a complex root outside the 120-degree negative-real sector in the literal 23/24 source horizontal row j=26, and proved all raw horizontal inequalities on that row.',
 'Recorded module builds, kernel replays, hashes and rejected elaborations: evidence/markov-f93ee68f/validation.json.',
 'Recorded source correspondence and mathematical limits: research/markov-f93ee68f-correspondence.md and research/markov-f93ee68f-mathematics.md.'
 ],observations=[
 'The root outside the sector is certified by exact rational Horner evaluation and complex polynomial factorization, not by floating-point root finding.',
 'This is a strategy obstruction, not a counterexample to raw coefficient log-concavity. The actual row satisfies the raw inequalities, with zeros retained.',
 'Fixed-charge matching comparisons remain unproved. Numerical scans do not establish universal claims.',
 'Root unchanged; successful theorem closures use only permitted axioms. Imports were inherited, not freshly rebuilt.',
 'Capability failures and unreliable numerical cases are preserved in evidence/markov-f93ee68f/operational-observations.json.'
 ],agenda=[
 'Return to fixed-charge aggregate matching comparisons for HorizontalFiberGoal9a72; the root-sector shortcut is obstructed even on a Pell source.',
 'Seek a direct uniform coefficient-gap or mechanical-word invariant covering all directions and all source rationals.',
 'Require fresh whole-source rebuilding and independent hash-bound correspondence auditing before any root closure.'
 ],completion=None)
if modules[names[-1]]['build'] and modules[names[-1]]['kernel_replay']:
 report['observations'].append('Also proved that the source row admits no product factorization into nonzero real quadratics/linears satisfying ac<=b^2.')
if all(d['build'] and d['kernel_replay'] for d in modules.values()):
 report['observations'].append('All four modules compiled and kernel-replayed successfully; all foreground sessions completed.')
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(validation),flush=True)
