"""One bounded named-input identity/absence observation; no research execution."""
import hashlib
import json
import os
from datetime import datetime, timezone
from pathlib import Path
T = Path('/private/tmp/math_gkm_godel_20261013')
MP = T / 'markov_worker_000183_replay_method_evidence.json'
R = Path('/Users/sasha/math_gkm')
C = R / '.control/markov/workers/000183'
E = R / 'evidence/markov-55cf20d2'
def now():
    return datetime.now(timezone.utc).isoformat()
def sha(p):
    h = hashlib.sha256()
    with Path(p).open('rb') as f:
        for b in iter(lambda:f.read(1024*1024), b''):
            h.update(b)
    return h.hexdigest()
m = json.loads(MP.read_text())
assert 'final_static_observation' not in m, 'Do not replace an earlier closing window'
for p in (Path(__file__), T/'render_worker183_method.py'):
    m['static_input_sha256'][str(p)] = sha(p)
inputs = m['static_input_sha256']
assert not any(p.endswith(('/markov_worker_000183_validation_evidence.json',
    '/markov_worker_000183_validation_audit.md','/markov_worker_000183_monitoring_audit.md')) for p in inputs)
started = now()
changed, missing = {}, []
for p, expected in sorted(inputs.items()):
    try:
        actual = sha(p)
    except FileNotFoundError:
        missing.append(p)
        continue
    if actual != expected:
        changed[p] = dict(expected=expected, observed=actual)
finished = now()
assert not changed and not missing, (changed,missing)
paths = [C/'receipt.json',C/'report.json',C/'final.json',E/'validation.json',
    E/'mathematical-modules.json',E/'manifest.json',E/'final-check.json',
    E/'last-verification.json',E/'report.json',R/'research/finalize_55cf20d2.py']
absent_time = now()
absences = {str(p):not os.path.lexists(p) for p in paths}
assert len(absences) == 10 and all(absences.values()), absences
audit_map = {p:h for p,h in inputs.items() if Path(p).is_relative_to(T)}
m['final_admin_absence_observation'] = dict(observed_utc=absent_time,paths=absences,
    scope='Ten exact closed183 receipt/report/finalization paths; earlier eight-path observation retained separately')
m['final_absence_observation'] = dict(observed_utc=now(),applicable=False,paths={},
    reason='All ten current mathematical objects exist; zero-byte archived SecondGap is a mismatch, not current-object absence')
m['final_static_observation'] = dict(started_utc=started,finished_utc=finished,
    input_count=len(inputs),audit_only_input_count=len(audit_map),
    all_unchanged=True,changed=changed,missing=missing,absence_paths=absences,
    absence_observed_utc=absent_time,audit_only_input_sha256=audit_map,
    scope='Fresh stream hashes of this exact saved map only; inherited pair identity observation belongs separately to validator',
    mathematical_values_recomputed=False,project_programs_executed=False)
m['project_reads_closed_utc'] = now()
MP.write_text(json.dumps(m,indent=2,sort_keys=True)+'\n')
print(json.dumps(dict(window=m['final_static_observation'],project_reads_closed_utc=m['project_reads_closed_utc']),indent=2))
