"""Machine-authored bounded foreground joint replay and closure audit."""
from validate_ca9709f2 import *
mods=["MarkovTopBetaMeanMCA9","MarkovTopRadialCompareMCA9","MarkovTopBetaComparisonMCA9","MarkovTopBetaGroupingMCA9","MarkovTopBetaTransportMCA9","MarkovTopLinearSourceMCA9","MarkovTopLinearResidualMCA9","MarkovTopWeightedBetaMeanMCA9","MarkovTopLowerGroupsMCA9","MarkovTopEndGroupsMCA9","MarkovTopCentralGroupsMCA9","MarkovTopPTiltObstructionMCA9"]
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
successful={}
for p in O.glob('build-*.json'):
 b=json.loads(p.read_text())
 if b.get('returncode')==0:
  for m,h in b['modules'].items():
   if m in mods and h==sha(R/'research'/f'{m}.lean'):successful[m]=str(p.relative_to(R))
assert set(successful)==set(mods),(set(mods)-set(successful))
for m in mods:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',s),m
replay=run(mods,'replay',240)
assert replay.get('returncode')==0,replay
p=subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/audit_ca9709f2.py'),*mods],cwd=R,env=env,capture_output=True,text=True,timeout=120)
print(p.stdout,flush=True)
assert p.returncode==0,(p.stdout,p.stderr)
audits=sorted(O.glob('axioms-*.json'));audit=json.loads(audits[-1].read_text())
out=dict(status='local source compilation, isolated joint kernel replay, permitted axiom closure audit passed',modules={m:sha(R/'research'/f'{m}.lean') for m in mods},successful_builds=successful,theorem_closures=len(audit['declarations']),axiom_receipt=str(audits[-1].relative_to(R)),replay_returncode=replay['returncode'],replay_stdout=replay['stdout'],fresh_whole_source_rebuild=False,independent_completion_audit=False,completion=None)
(O/'validation.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(modules=len(mods),theorem_closures=out['theorem_closures'],replay='passed',axioms='permitted only')),flush=True)
