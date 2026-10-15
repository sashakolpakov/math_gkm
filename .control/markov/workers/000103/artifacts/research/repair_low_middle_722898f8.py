"""Machine-authored foreground repair queue for rejected notation, with joined subprocesses."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess,json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-722898f8'
def run(m):
 p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/validate_722898f8.py'),m,'build','120'],cwd=R,text=True,capture_output=True)
 d=dict(module=m,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr);print(json.dumps(d),flush=True);return d
res=[]
with ThreadPoolExecutor(max_workers=3) as pool:
 res+=list(pool.map(run,[f'MarkovMiddleGap1_{b}M722' for b in [1,2,3]]))
 if all(d['returncode']==0 for d in res):res+=list(pool.map(run,[f'MarkovMiddleColumn1_{b}M722' for b in [0,1,2,3]]))
(O/f'low-repair-{time.time_ns()}.json').write_text(json.dumps(res,indent=2)+'\n')
print('Repair foreground queue joined',flush=True)
