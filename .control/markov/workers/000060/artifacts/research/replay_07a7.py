"""Machine-authored sequential bounded foreground kernel replays."""
from pathlib import Path
import subprocess,sys,time,json,os
r=Path('/Users/sasha/math_gkm');o=r/'evidence/markov-07a7e5b7'
mods=['MarkovCutDegree07a7','MarkovDegreeTransfer07a7','MarkovDegreeBridge07a7','MarkovDegreeObstruction07a7','MarkovCutPrefix07a7']
start=time.monotonic();records=[]
for m in mods:
 remaining=410-(time.monotonic()-start)
 if remaining<15:break
 p=subprocess.run(['/opt/homebrew/bin/python3','research/validate_07a7.py',m,'replay',str(min(140,remaining))],cwd=r,capture_output=True,text=True,env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null'))
 records.append(dict(module=m,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr))
 (o/'replay-progress.json').write_text(json.dumps(records,indent=2)+'\n')
 print(json.dumps(dict(module=m,returncode=p.returncode,seconds=time.monotonic()-start)),flush=True)
print(json.dumps(dict(completed=len(records),seconds=time.monotonic()-start)),flush=True)
