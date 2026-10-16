"""Machine-authored bounded foreground experiment, with durable outcome."""
from pathlib import Path
import subprocess,json,time
p=Path('research/experiment_high24_81f80b2d.py')
s=Path('research/experiment_high_81f80b2d.py').read_text().replace('generate(48)','generate(24)').replace("'bound':48","'bound':24")
p.write_text(s)
start=time.monotonic()
try:
 r=subprocess.run(['/opt/homebrew/bin/python3',str(p)],capture_output=True,text=True,timeout=75)
 out=dict(returncode=r.returncode,stdout=r.stdout,stderr=r.stderr)
except subprocess.TimeoutExpired as e:out=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
out['seconds']=time.monotonic()-start
Path('evidence/markov-81f80b2d/experiment-receipt.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
