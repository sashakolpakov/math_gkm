"""Machine-authored isolated kernel and axiom checks of source-bound artifacts."""
from validate_263d8c71 import *
mods=['MarkovTerminalGapDefsM263']+json.loads((O/'terminal-generated.json').read_text())['modules']+['MarkovTerminalGapM263','MarkovTerminalRowM263','MarkovTerminalWordFormulaM263','MarkovTerminalSmallM263','MarkovTerminalAllM263']
d=run(mods,'replay',180)
if d.get('returncode')!=0:sys.exit(1)
p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/audit_263d8c71.py'),*mods],env=env,cwd=R)
sys.exit(p.returncode)
