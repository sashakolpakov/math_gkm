"""Machine-authored foreground final local replay and axiom validation."""
from validate_80fb7777 import *
from finish_80fb7777 import validate
mods=json.loads((O/'planned-modules.json').read_text())
d=run(mods,'replay',180)
assert d.get('returncode')==0,d
cmd=[sys.executable,str(R/'research/audit_80fb7777.py'),*mods]
p=subprocess.run(cmd,cwd=R,env=env,text=True,capture_output=True,timeout=140)
(O/'audit-driver.json').write_text(json.dumps(dict(command=cmd,returncode=p.returncode,stdout=p.stdout,stderr=p.stderr),indent=2))
print(p.stdout,flush=True)
assert p.returncode==0,p.stderr
v=validate(mods)
print(json.dumps(dict(modules=len(mods),closures=v['theorem_closures'],validation='evidence/markov-80fb7777/validation.json')),flush=True)
