"""Machine-authored bounded foreground build sequence; stops on first failed build."""
import subprocess,sys
for m in sys.argv[1:]:
 p=subprocess.run(['/opt/homebrew/bin/python3','research/validate_062809ba.py',m,'build','300'])
 if p.returncode:sys.exit(p.returncode)
