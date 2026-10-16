"""Machine-authored sequential foreground builds; stop at first rejected build."""
from validate_ffd747f5 import run
import sys
for module in sys.argv[1:]:
 d=run([module],'build',180)
 if d.get('returncode')!=0:sys.exit(1)
