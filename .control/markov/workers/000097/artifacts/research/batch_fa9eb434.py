"""Foreground sequential validation; no background job or controller."""
import sys,subprocess,json
from pathlib import Path
mods=json.loads(Path(sys.argv[1]).read_text())
mode=sys.argv[2] if len(sys.argv)>2 else 'build'
for m in mods:
 if len(sys.argv)>3 and int(sys.argv[3])!=mods.index(m)%int(sys.argv[4]):continue
 p=subprocess.run(['/opt/homebrew/bin/python3','research/validate_fa9eb434.py',m,mode,'110'])
 if p.returncode:print('FAILED',m,flush=True)
