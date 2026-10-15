"""Machine-authored bounded sequential foreground builds; stops on rejection."""
import subprocess,sys,os
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null')
for m in sys.argv[1:]:
 r=subprocess.run(['/opt/homebrew/bin/python3','research/validate_6604cff8.py',m,'build','180'],env=env)
 if r.returncode:sys.exit(r.returncode)
