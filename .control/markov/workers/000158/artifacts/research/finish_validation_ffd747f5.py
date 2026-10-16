"""Machine-authored sequential union replay and axiom audit; no root closure claim."""
from validate_ffd747f5 import *
mods=json.loads((O/'mathematical-modules.json').read_text())
builds=[]
for m in mods:
 hs=sha(R/'research'/f'{m}.lean')
 bs=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
 bs=[(p,d) for p,d in bs if d.get('returncode')==0 and d['modules'].get(m)==hs]
 assert bs,m
 p,d=max(bs,key=lambda pd:pd[0].name);builds.append(str(p.relative_to(R)))
rep=run(mods,'replay',220)
assert rep.get('returncode')==0,rep
p=subprocess.run(['/opt/homebrew/bin/python3','-B',str(R/'research/audit_ffd747f5.py'),*mods],
 cwd=R,env=env,text=True,capture_output=True,timeout=150)
print(p.stdout,flush=True)
assert p.returncode==0,(p.returncode,p.stdout,p.stderr)
axp=max(O.glob('axioms-*.json'),key=lambda p:p.name); ax=json.loads(axp.read_text())
repp=max(O.glob('replay-*.json'),key=lambda p:p.name)
d={'request_id':'ffd747f5c7a147069d5bfcaffb3e60e8','modules':mods,
 'sources':{m:sha(R/'research'/f'{m}.lean') for m in mods},'build_receipts':builds,
 'replay_receipt':str(repp.relative_to(R)),'axioms_receipt':str(axp.relative_to(R)),
 'closures':len(ax['declarations']),'permitted_axioms_only':True,
 'limits':'Inherited compiled imports reused; no whole-source rebuild or independent English/source completion audit.',
 'completion':None}
(O/'validation.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps({'validated_modules':len(mods),'closures':d['closures'],'completion':None}),flush=True)
