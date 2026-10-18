"""Read-only source/evidence audit; never execute retained controller work."""
import ast
import hashlib
import json
from pathlib import Path

root = Path.cwd()
out = root/'evidence/neutral-validation/maintenance-path-sol-20261018'
old = root/'evidence/neutral-validation/maintenance-startup-sol-20261018'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
read = lambda p: json.loads(p.read_text())

# Verify every copied host diagnostic, including raw records/profiles, without
# following the historical absolute paths named inside them.
host = root/'.bootstrap/host-path-evidence-20261018'
pins = read(host/'SHA256.json')
assert all(sha(host/n) == h for n, h in pins.items())
records = {n: read(host/n) for n in pins if n.endswith('.json')}
summary = read(host/'SUMMARY.json')
assert summary['core_all_rc0'] and summary['package_all_rc0']
assert summary['outside_read_write_denied']

previous = read(old/'final/manifest.json')
unchanged = {}
for n, h in previous.items():
    if n.startswith('machinery/') and n != 'machinery/study_transfer.py':
        assert sha(root/n) == h, n
        unchanged[n] = h
before = (old/'final/sources/machinery/study_transfer.py').read_text()
after = (root/'machinery/study_transfer.py').read_text()
def stripped(text):
    tree = ast.parse(text)
    tree.body = [n for n in tree.body if not (isinstance(n, ast.FunctionDef) and n.name == 'sandbox_prefix')]
    return ast.dump(tree, include_attributes=False)
assert stripped(before) == stripped(after)
functions = {}
for node in ast.parse(after).body:
    if isinstance(node, ast.FunctionDef) and node.name != 'sandbox_prefix':
        functions[node.name] = hashlib.sha256(ast.get_source_segment(after, node).encode()).hexdigest()
        prior = next(n for n in ast.parse(before).body if isinstance(n, ast.FunctionDef) and n.name == node.name)
        assert ast.get_source_segment(before, prior) == ast.get_source_segment(after, node)

core = read(old/'CONNECTED_CORE_RESULT.json')
assert core['passed'] and core['assertion_calls'] == 12 and core['role_calls_replayed'] == 0
test = root/'tests/test_revision_static_checkpoint.py'
assert sha(test) == core['original_test_source_sha256'] == previous[str(test.relative_to(root))]
state = root/core['retained_base']/'connected/arms/exploration/state.json'
assert sha(state) == core['state_sha256_before_and_after']
protocol = read(state.parents[2]/'protocol.json')
assert protocol['transport'] == 'fixture'
assert "prefix = sandbox_prefix(directory, deps) if live else []" in after
assert "live=arm.p['transport'] == 'live'" in after
checks = read(old/'VALIDATION.json')
assert next(r for r in checks['runs'] if r['label'] == 'connected')['timeout'] is True
assert next(r for r in checks['runs'] if r['label'] == 'connected-core')['returncode'] == 0
helper = 'tools/host_mathlib_smoke.py'
assert sha(out/helper) == sha(old/helper) == '76e995cb87b59968337e1dd350bf84e94b4cfda3d52e091b3cddab0908a5d78f'
record = {
    'scope': 'static source identity and retained-result reuse; no connected rerun or terminal completion',
    'production_changed_functions': ['machinery.study_transfer.sandbox_prefix'],
    'unchanged_machinery_sha256': unchanged,
    'unchanged_transfer_functions_source_sha256': functions,
    'connected_test_sha256': sha(test), 'retained_state_sha256': sha(state),
    'protocol_sha256': sha(state.parents[2]/'protocol.json'), 'transport': protocol['transport'],
    'live_path': 'fixture implies live=False, sandbox_prefix not invoked',
    'round8_core_receipt_sha256': sha(old/'CONNECTED_CORE_RESULT.json'),
    'round8_validation_sha256': sha(old/'VALIDATION.json'),
    'reused_assertions': 12, 'whole_driver_passed': False,
    'terminal_duplicate_comparison': 'unfinished at outer 900s watchdog; unchanged code, no rerun claimed',
    'helper_reused_sha256': sha(out/helper),
    'approved_host_evidence_sha256': pins,
    'raw_diagnostic_records_read': sorted(records),
    'host_diagnostics_scope': summary['scope'],
    'final_source_deployment': 'PENDING supervisor-host actual positive/negative/replay/premise/completion/outside controls',
}
with (out/'UNCHANGED_EXERCISED_CODE.json').open('x') as f:
    json.dump(record, f, indent=2)
    f.write('\n')
print('Static identity verified; reuse 12 round8 assertions, preserve whole-driver timeout.')
