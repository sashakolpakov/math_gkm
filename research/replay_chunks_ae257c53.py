"""Machine-authored bounded replay chunks over compiled imports; not a fresh source rebuild."""
from audit_ae257c53 import *
from concurrent.futures import ThreadPoolExecutor,as_completed
def main():
 inv=inventory()
 prev=json.loads((O/'validation.json').read_text())
 mods=[m for m in inv if m in prev['modules'] and prev['modules'][m]['axiom_audit_complete'] and not prev['modules'][m]['kernel_replay_passed']]
 chunks=[mods[i:i+20] for i in range(0,len(mods),20)]
 with ThreadPoolExecutor(max_workers=2) as pool:
  fs={pool.submit(run,ch,'replay',120):ch for ch in chunks}
  for f in as_completed(fs):
   ch=fs[f];d=f.result();ok=d.get('returncode')==0
   for m in ch:
    if ok:
     prev['modules'][m]['kernel_replay_passed']=True
     prev['modules'][m]['kernel_replay_scope']='Replayed in <=20-module chunk over compiled imports; all selected new module bodies replayed separately. Not a whole-source rebuild.'
   (O/'validation.json').write_text(json.dumps(prev,indent=2)+'\n')
 print(json.dumps(dict(chunks=len(chunks),modules=len(mods),remaining=sum(not d['kernel_replay_passed'] for d in prev['modules'].values()))))
if __name__=='__main__':main()
