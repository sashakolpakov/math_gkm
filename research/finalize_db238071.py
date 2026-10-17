"""Machine-authored db238071. Immutable validation summary and preservation checks."""
from pathlib import Path
import json,hashlib,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-db238071'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
receipts={str(p.relative_to(R)):json.loads(p.read_text()) for p in O.glob('build-*.json')}
success={}
for m in mods:
 matches=[(p,d) for p,d in receipts.items() if d.get('returncode')==0 and d.get('modules',{}).get(m)==sha(R/'research'/f'{m}.lean')]
 assert matches,('no matching successful build',m)
 success[m]=matches[-1][0]
ax=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text());ax.append((str(p.relative_to(R)),d))
covered={m for _,d in ax for m,h in d['sources'].items() if (R/'research'/f'{m}.lean').exists() and sha(R/'research'/f'{m}.lean')==h}
assert set(mods)<=covered,('missing axiom audit',set(mods)-covered)
closures={n:a for _,d in ax for n,a in d['declarations'].items()}
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in closures.values())
replays={str(p.relative_to(R)):json.loads(p.read_text()) for p in O.glob('replay-*.json')}
replayed={m for d in replays.values() if d.get('returncode')==0 for m,h in d['modules'].items() if m in mods and sha(R/'research'/f'{m}.lean')==h}
v={'request_id':'db238071732b4d94a95826082e34e37e','modules':mods,
 'source_sha256':{m:sha(R/'research'/f'{m}.lean') for m in mods},'successful_builds':success,
 'axiom_reports':[p for p,_ in ax],'theorem_closures':len(closures),
 'allowed_axioms_only':True,'replay_receipts':list(replays),'successfully_replayed':sorted(replayed),
 'not_replayed':sorted(set(mods)-replayed),
 'rejected_builds':[p for p,d in receipts.items() if d.get('returncode')!=0],
 'limits':'Inherited compiled imports reused. No fresh whole-source rebuild, full root proof, or independent hash-bound completion audit.',
 'completion':None}
(O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
before=json.loads((O/'before.json').read_text());changed=[p for p,h in before.items() if sha(R/p)!=h]
assert not changed,changed
prior=json.loads((R/'evidence/markov-c9f23b44/manifest.json').read_text())
bad=[p for p,h in prior.items() if sha(R/p)!=h];assert not bad,bad
operational=f'''# Operational record

Machine-authored db238071. Read and reconciled completed worker 165 and the
already-reconciled interrupted worker 156 raw final events. Six inherited bindings,
298 predecessor artifacts and the pinned hashes matched. No possibly completed
side effect was blindly repeated; all new artifacts have unique paths.

Selected modules: {len(mods)}. Audited theorem closures: {len(closures)}.
Successful replay coverage: {len(replayed)} selected modules. Every actual receipt,
including timeouts and the intentionally rejected false-equality test, is preserved
in evidence/markov-db238071. Validation.json identifies exact successful source
hashes; pending/candidate source files outside that selection are not results.

The dense whole-product attempts failed under bounded limits, including 180-second
and 300-second checks. Direct/reversed multiplication did certify additional
prefixes, but the complete products and aggregate remain unproved. The false 1=2
test of the direct reflexivity elaborator was rejected by the Lean kernel.

The shell here-document failed before execution because temporary files are
denied. Developer policy also denies .scratch; it was not accessed, and unique
durable research/evidence files were used. Process inspection with ps was denied.
Sage was not found; GAP and Singular executables were detected but not invoked.
No package update, shell networking, model/controller invocation, background
research process, publication, contact, Git access, or protected-record edit was
performed. Only bounded foreground subprocesses were used. All foreground
executions completed before final reporting. This report does not certify the
Python controller.

Hosted browsing checked the publisher's source. Finite sparse, source-coefficient,
residual and packed computations remain experiments. The packed proposal still
needs multivariate flattening and concrete kernel certificates. Inherited compiled
imports were reused; there was no fresh whole-source rebuild or independent
hash-bound completion audit. Full pinned Conjecture63 remains unresolved.
'''
(R/'research/markov-db238071-operational.md').write_text(operational)
manifest={}
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:manifest[str(p.relative_to(R))]=sha(p)
for p in (R/'research').iterdir():
 if p.is_file() and ('db238071' in p.name or 'MDB2' in p.name):manifest[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
last={'artifacts':len(manifest),'artifact_mismatches':[p for p,h in manifest.items() if sha(R/p)!=h],
 'unchanged_inputs':len(before),'unchanged_predecessor_artifacts':len(prior),
 'root_sha256':sha(R/'MathGKM/Markov.lean'),
 'contract_sha256':hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest(),
 'validation_sha256':sha(O/'validation.json'),'manifest_sha256':sha(O/'manifest.json'),
 'completion':None}
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps({'validation':v,'preservation':last},indent=2))
