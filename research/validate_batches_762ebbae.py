"""Machine-authored source-bound validation. Antichains avoid pre-imported target declarations.
Compiled import reuse is explicit; this is not root admission or independent review.
"""
from audit_762ebbae import *
from concurrent.futures import ThreadPoolExecutor,as_completed

def main():
 inv=inventory()
 prior=json.loads((O/'validation.json').read_text()) if (O/'validation.json').exists() else dict(modules={})
 chosen=sys.argv[1:] or [m for m in inv if not prior['modules'].get(m,{}).get('kernel_replay_passed')]
 assert all(m in inv for m in chosen)
 if not chosen:return
 stamp=str(time.time_ns());audit='MarkovAudit'+stamp+'M762'
 s='\n'.join('import '+m for m in chosen)+'\n'
 for m in chosen:
  for n in inv[m]['declarations']:s+='#print axioms MathGKM.Markov.'+n+'\n'
 (R/'research'/f'{audit}.lean').write_text(s)
 a=run([audit],timeout=150)
 lines=[line for line in a.get('stdout','').splitlines() if 'depends on axioms:' in line]
 closures=[set(z.strip() for z in line.rsplit('[',1)[1].rstrip(']').split(',') if z.strip()) for line in lines]
 ok=a.get('returncode')==0 and len(lines)==sum(len(inv[m]['declarations']) for m in chosen) and all(z<={'propext','Classical.choice','Quot.sound'} for z in closures)
 for m in chosen:
  inv[m].update(axiom_audit_complete=ok,axiom_audit_module=audit,kernel_replay_passed=False)
  prior['modules'][m]=inv[m]
 prior.update(scope='Source compilation and isolated kernel replay over reused compiled imports; no whole-source rebuild or independent completion audit.',completion=None)
 def save():(O/'validation.json').write_text(json.dumps(prior,indent=2)+'\n')
 save();print('AXIOMS',ok,len(chosen),len(lines),flush=True);assert ok
 depths={}
 def depth(m):
  if m in depths:return depths[m]
  p=R/'research'/f'{m}.lean'
  if not p.is_file():return 0
  imports=re.findall(r'^import (\w+)',p.read_text(),re.M)
  depths[m]=1+max([depth(n) for n in imports],default=0)
  return depths[m]
 groups={}
 for m in chosen:groups.setdefault(depth(m),[]).append(m)
 chunks=[]
 for d,ms in sorted(groups.items()):
  chunks.extend(ms[i:i+10] for i in range(0,len(ms),10))
 with ThreadPoolExecutor(max_workers=3) as pool:
  fs={pool.submit(run,ch,'replay',150):ch for ch in chunks}
  for f in as_completed(fs):
   ch=fs[f];d=f.result()
   for m in ch:
    prior['modules'][m]['kernel_replay_passed']=d.get('returncode')==0
   save()
 print('VALIDATED',sum(d['kernel_replay_passed'] and d['axiom_audit_complete'] for d in prior['modules'].values()),flush=True)
if __name__=='__main__':main()
