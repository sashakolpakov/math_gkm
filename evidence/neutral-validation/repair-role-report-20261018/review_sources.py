"""Compare only this repair's input and pre-test snapshots; no Git/history reads."""
import ast
import difflib
import json
from pathlib import Path

base = Path('evidence/neutral-validation/repair-role-report-20261018')
old = json.loads((base / 'input/SOURCE_MANIFEST.json').read_text())['files_sha256']
new = json.loads((base / 'pretest/SOURCE_MANIFEST.json').read_text())['files_sha256']
changed = [p for p in old if p in new and old[p] != new[p]]
added = sorted(set(new) - set(old))
p = 'machinery/study_policy.py'
before = (base / 'input/sources' / p).read_text()
after = Path(p).read_text()
diff = ''.join(difflib.unified_diff(before.splitlines(True), after.splitlines(True),
                                  fromfile='input/' + p, tofile=p))
for name in added:
    if name.startswith('tests/'):
        diff += ''.join(difflib.unified_diff([], Path(name).read_text().splitlines(True),
                                          fromfile='/dev/null', tofile=name))
(base / 'SOURCE_CHANGES.diff').write_text(diff)

def outside_prompt(source):
    tree = ast.parse(source)
    tree.body = [node for node in tree.body if not
                 (isinstance(node, ast.FunctionDef) and node.name == 'prompt')]
    return ast.dump(tree, include_attributes=False)

record = {'changed_existing_sources': changed, 'added_checkpoint_files': added,
          'study_policy_ast_outside_prompt_unchanged': outside_prompt(before) == outside_prompt(after),
          'other_existing_checkpoint_files_unchanged': sorted(set(old) - set(changed)),
          'scope': 'No runtime code changes outside prompt; comparison against this repair input only.'}
(base / 'STATIC_REVIEW.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps({k: v for k, v in record.items() if k != 'other_existing_checkpoint_files_unchanged'}, indent=2))
