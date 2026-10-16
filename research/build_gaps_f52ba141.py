"""Machine-authored foreground batch; each build has a fixed timeout."""
from validate_f52ba141 import run,O
import json
mods=json.loads((O/'second-generated.json').read_text())['modules']
for m in mods:
 d=run([m],'build',100)
 if d.get('returncode')!=0:break
