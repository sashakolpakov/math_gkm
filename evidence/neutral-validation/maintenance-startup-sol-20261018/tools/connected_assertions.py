"""Execute the unchanged test's connected postconditions on this invocation's run.

The full 900-second method timed out in its additional final evaluation. This
bounded audit does not resume it, replay roles, claim a full-method pass, or edit
its state. Only the report destination is redirected to new evidence storage.
"""
from pathlib import Path
import ast
import hashlib
import inspect
import json
import sys
import textwrap
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parents[4]))
from tests import test_revision_static_checkpoint as original
from machinery.study_common import ROOT, load_state, sha

out = ROOT/'evidence/neutral-validation/maintenance-startup-sol-20261018'
base = ROOT/'.scratch/revision-lean-p68agssb'
directory = base/'connected'
state_path = directory/'arms/exploration/state.json'
before = sha(state_path)
state = load_state(state_path)
assert state['round'] == 4 and state['phase'] == 'research' and state['failures'] == 0
assert state['status'] == 'finite_budget_finished; root_open'
method = original.RealLeanMechanisms.test_connected_cycle_delayed_use_policy_install_and_next_actual_request
source = textwrap.dedent(inspect.getsource(method))
tree = ast.parse(source).body[0]
start = next(i for i,n in enumerate(tree.body) if isinstance(n, ast.Assign) and
             any(isinstance(t, ast.Name) and t.id == 'state' for t in n.targets))
body = tree.body[start:]
namespace = dict(vars(original))
namespace.update(self=original.RealLeanMechanisms(method.__name__), directory=directory,
    study_burden=SimpleNamespace(report=lambda study, ignored: original.study_burden.report(
        study, out/'connected-core-observer')))
exec(compile(ast.Module(body=body, type_ignores=[]), inspect.getsourcefile(method), 'exec'), namespace)
assert sha(state_path) == before, 'postcondition audit changed retained controller state'
record = {'scope': 'completed connected-cycle postconditions; full method remains timed out in extra final evaluation',
    'passed': True, 'original_test_source_sha256': sha(Path(inspect.getsourcefile(method))),
    'original_method_sha256': hashlib.sha256(source.encode()).hexdigest(),
    'assertion_calls': sum(isinstance(n, ast.Call) and isinstance(n.func, ast.Attribute)
                           and n.func.attr.startswith('assert') for stmt in body for n in ast.walk(stmt)),
    'state_sha256_before_and_after': before, 'retained_base': str(base.relative_to(ROOT)),
    'role_calls_replayed': 0, 'validation_mode': 'unwrapped_fixture', 'deployment': 'PENDING'}
with (out/'CONNECTED_CORE_RESULT.json').open('x') as f:
    json.dump(record, f, indent=2)
    f.write('\n')
print(json.dumps(record))
