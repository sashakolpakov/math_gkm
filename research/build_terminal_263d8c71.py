"""Machine-authored sequential foreground build with dependency checks."""
from validate_263d8c71 import *
mods=json.loads((O/'terminal-generated.json').read_text())['modules']+['MarkovTerminalGapM263','MarkovTerminalRowM263']
for m in mods:
 d=run([m],'build',120)
 if d.get('returncode')!=0:sys.exit(1)
