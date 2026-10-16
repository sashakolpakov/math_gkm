"""Machine-authored bounded kernel/axiom validation; not independent admission."""
from validate_10d15751 import *
import re
def inventory():
 out={}
 for p in sorted(O.glob('build-*.json')):
  d=json.loads(p.read_text())
  if d.get('returncode')!=0:continue
  for m,h in d['modules'].items():
   src=R/'research'/f'{m}.lean';obj=O/f'{m}.olean'
   if not src.exists() or sha(src)!=h or not obj.exists() or m.startswith('MarkovAudit'):continue
   out[m]=dict(source=str(src.relative_to(R)),sha256=h,olean_sha256=sha(obj),build=str(p.relative_to(R)),declarations=re.findall(r'^theorem\s+(\w+)',src.read_text(),re.M))
 return out
def main():
 inv=inventory();chosen=sys.argv[1:] or list(inv)
 stamp=str(time.time_ns());audit='MarkovAudit'+stamp+'M10D'
 s='\n'.join('import '+m for m in chosen)+'\n'
 for m in chosen:
  for n in inv[m]['declarations']:s+='#print axioms MathGKM.Markov.'+n+'\n'
 (R/'research'/f'{audit}.lean').write_text(s)
 a=run([audit],timeout=120)
 allowed={'propext','Classical.choice','Quot.sound'}
 lines=[line for line in a.get('stdout','').splitlines() if 'depends on axioms:' in line or 'does not depend on any axioms' in line]
 closures=[set() if 'does not depend on any axioms' in line else set(z.strip() for z in line.rsplit('[',1)[1].rstrip(']').split(',') if z.strip()) for line in lines]
 ok=a.get('returncode')==0 and len(lines)==sum(len(inv[m]['declarations']) for m in chosen) and all(z<=allowed for z in closures)
 replay=run(chosen,'replay',120)
 prior=json.loads((O/'validation.json').read_text()) if (O/'validation.json').exists() else dict(modules={})
 for m in chosen:
  inv[m].update(axiom_audit_complete=ok,axiom_audit_module=audit,kernel_replay_passed=replay.get('returncode')==0)
  prior['modules'][m]=inv[m]
 prior.update(scope='New modules over reused inherited compiled imports; not a whole-source rebuild or independent English/source completion audit.',completion=None)
 (O/'validation.json').write_text(json.dumps(prior,indent=2)+'\n')
 print(json.dumps(dict(audit_ok=ok,kernel_ok=replay.get('returncode')==0,modules=chosen)),flush=True)
if __name__=='__main__':main()
