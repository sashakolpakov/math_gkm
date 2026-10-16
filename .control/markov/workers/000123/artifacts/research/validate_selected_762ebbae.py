"""Machine-authored axiom inventory and bounded replay of reconciled/new sources.
Every receipt is new; inherited evidence is read-only. Not root admission.
"""
from audit_762ebbae import *
from concurrent.futures import ThreadPoolExecutor,as_completed

def main():
 inv=inventory()
 old=json.loads((R/'evidence/markov-ae257c53/compiled-inventory.json').read_text())
 selected=list(sys.argv[1:]) or list(inv)
 if selected==['--all']:selected=list(inv)
 for m in selected:
  if m not in inv:
   d=old[m].copy()
   assert sha(R/d['source'])==d['sha256']
   obj=R/'evidence/markov-ae257c53'/f'{m}.olean'
   assert sha(obj)==d['olean_sha256']
   d['olean_path']=str(obj.relative_to(R));inv[m]=d
 stamp=str(time.time_ns());mod='MarkovAuditSelected'+stamp+'M762'
 s='\n'.join('import '+m for m in selected)+'\n'
 for m in selected:
  for n in inv[m]['declarations']:s+='#print axioms MathGKM.Markov.'+n+'\n'
 (R/'research'/f'{mod}.lean').write_text(s)
 result=run([mod],timeout=120)
 lines=[line for line in result.get('stdout','').splitlines() if 'depends on axioms:' in line]
 closures=[set(z.strip() for z in line.rsplit('[',1)[1].rstrip(']').split(',') if z.strip()) for line in lines]
 ok=result.get('returncode')==0 and len(lines)==sum(len(inv[m]['declarations']) for m in selected) and all(z<={'propext','Classical.choice','Quot.sound'} for z in closures)
 prev=json.loads((O/'validation.json').read_text()) if (O/'validation.json').exists() else dict(modules={})
 for m in selected:
  d=inv[m];d.update(axiom_audit_complete=ok,axiom_audit_module=mod,kernel_replay_passed=prev['modules'].get(m,{}).get('kernel_replay_passed',False));prev['modules'][m]=d
 prev.update(scope='Source-bound local compilation and replay over compiled imports; not whole-source rebuild or independent completion audit.',completion=None)
 (O/'validation.json').write_text(json.dumps(prev,indent=2)+'\n')
 print('AXIOMS',json.dumps(dict(ok=ok,modules=len(selected),closures=len(lines))),flush=True)
 assert ok
 chunks=[selected[i:i+10] for i in range(0,len(selected),10)]
 with ThreadPoolExecutor(max_workers=4) as pool:
  futures={pool.submit(run,ch,'replay',180):ch for ch in chunks}
  for f in as_completed(futures):
   ch=futures[f];d=f.result()
   for m in ch:
    if d.get('returncode')==0:prev['modules'][m]['kernel_replay_passed']=True
   (O/'validation.json').write_text(json.dumps(prev,indent=2)+'\n')
 print('VALIDATED',sum(d['kernel_replay_passed'] and d['axiom_audit_complete'] for d in prev['modules'].values()),flush=True)
if __name__=='__main__':main()
