"""Machine-authored complete axiom-closure inventory, distinct from kernel replay status."""
from audit_ae257c53 import *
def main():
 inv=inventory();stamp=str(time.time_ns());mod='MarkovAuditAll'+stamp+'MAE2'
 s='\n'.join('import '+m for m in inv)+'\n'
 for m,d in inv.items():
  for n in d['declarations']:s+='#print axioms MathGKM.Markov.'+n+'\n'
 (R/'research'/f'{mod}.lean').write_text(s)
 result=run([mod],timeout=90)
 lines=[line for line in result.get('stdout','').splitlines() if 'depends on axioms:' in line]
 closures=[set(z.strip() for z in line.rsplit('[',1)[1].rstrip(']').split(',') if z.strip()) for line in lines]
 ok=result.get('returncode')==0 and len(lines)==sum(len(d['declarations']) for d in inv.values()) and all(z<={'propext','Classical.choice','Quot.sound'} for z in closures)
 prev=json.loads((O/'validation.json').read_text())
 if ok:
  for m,d in inv.items():
   old=prev['modules'].get(m,{})
   d.update(axiom_audit_complete=True,axiom_audit_module=mod,kernel_replay_passed=old.get('kernel_replay_passed',False))
   prev['modules'][m]=d
  (O/'validation.json').write_text(json.dumps(prev,indent=2)+'\n')
 print(json.dumps(dict(axiom_audit_passed=ok,modules=len(inv),closures=len(lines))))
if __name__=='__main__':main()
