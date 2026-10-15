"""Machine-authored bounded foreground validation queue; no daemon or detached work."""
import subprocess,sys,os
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
for m in sys.argv[1:]:
 p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/validate_00a02b28.py'),m,'build','240'],cwd=R,env=env)
 if p.returncode:sys.exit(p.returncode)
