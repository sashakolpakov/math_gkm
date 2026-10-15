"""Machine-authored foreground replay of all successfully compiled new modules."""
from pathlib import Path
import json,subprocess,sys,os
mods=json.loads(Path('evidence/markov-6604cff8/audit-inventory.json').read_text())['modules']+['MarkovAuditN6604']
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null')
r=subprocess.run(['/opt/homebrew/bin/python3','research/replay_union_6604cff8.py',*mods],env=env)
sys.exit(r.returncode)
