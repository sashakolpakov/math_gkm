"""Machine-authored bounded foreground batch. Existing source-bound successes reused."""
from validate_03d5764d import *
def done(m):
 s=sha(R/'research'/f'{m}.lean')
 return (O/f'{m}.olean').exists() and any(d.get('returncode')==0 and d.get('mode')=='build' and d.get('modules',{}).get(m)==s for p in O.glob('build-*.json') for d in [json.loads(p.read_text())])
if __name__=='__main__':
 for m in sys.argv[1:]:
  if (R/'.control/markov/STOP.json').exists(): print('STOP present',flush=True); break
  if done(m): print('reusing checked build',m,flush=True);continue
  d=run([m],timeout=100)
  if d.get('returncode')!=0:break
