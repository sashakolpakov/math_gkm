"""Machine-authored final source/artifact preservation check; no mathematical admission claim."""
from pathlib import Path
import json,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-2532cf40'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
files=json.loads((O/'artifact-verification.json').read_text())['files']
assert all(sha(R/k)==v for k,v in files.items())
v=json.loads((O/'validation.json').read_text())
assert all(m['kernel_replay_passed'] and m['axiom_audit_complete'] for m in v['modules'])
assert all(sha(R/m['source'])==m['sha256'] for m in v['modules'])
assert all(set(a)<=set(['propext','Classical.choice','Quot.sound']) for a in v['axiom_audit'].values())
initial=json.loads((O/'initial-hashes.json').read_text())
assert all(sha(R/k)==h for k,h in initial.items())
root=sha(R/'MathGKM/Markov.lean')
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
out=dict(artifact_hashes_checked=len(files),source_bound_modules=len(v['modules']),all_replayed_and_audited=True,preserved_inputs=len(initial),root_sha256=root,completion=None)
(O/'last-verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
