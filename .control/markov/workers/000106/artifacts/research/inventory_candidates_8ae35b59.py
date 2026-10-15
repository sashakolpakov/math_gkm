"""Machine-authored explicit accepted/unfinished inventory, no mathematical inference."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8ae35b59'
v=json.loads((O/'validation.json').read_text())
checked={x['module'] for x in v['modules'] if x['kernel_replay_passed'] and x['axiom_audit_complete']}
built={x['module'] for x in v['modules']}
split=json.loads((O/'split-gaps.json').read_text())
generated=json.loads((O/'candidate-inventory.json').read_text())
d=dict(status='Inventory only; no root completion',validated_modules=sorted(checked),compiled_but_not_fully_validated=sorted(built-checked),coefficient_gaps_remaining=[m for m in split if m not in checked],general_columns_remaining=[m for m in generated['columns'] if m not in checked],general_chart_candidates=['MarkovMiddleChart0M8AE','MarkovMiddleChart2M8AE','MarkovMiddleLCM8AE','MarkovMiddleSourceM8AE','MarkovFourthAllM8AE','MarkovResidualM8AE'],authoritative_subfamily_modules=['MarkovFourthTopCompleteM8AE','MarkovFourthTwoCompleteM8AE'],uncompiled_duplicate_drafts=['MarkovMiddleHighDirectM8AE','MarkovMiddleTopM8AE','MarkovFourthTopM8AE','MarkovResidualTopM8AE','MarkovMiddleTwoDirectM8AE','MarkovMiddleTwoSourceM8AE','MarkovFourthTwoM8AE','MarkovResidualTwoM8AE'],completion=None)
(O/'pending-candidates.json').write_text(json.dumps(d,indent=2)+'\n')
print('Validated',len(checked),'remaining coefficient gaps',len(d['coefficient_gaps_remaining']))
