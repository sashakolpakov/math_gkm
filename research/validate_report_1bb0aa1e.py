"""Machine-authored receipt aggregation; operational evidence, not a theorem."""
from pathlib import Path
import json,hashlib,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1bb0aa1e'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
new=['MarkovFirstForceM1BB','MarkovTailCorrectionM1BB','MarkovTailSourceM1BB','MarkovTailBinomialM1BB','MarkovCrossCertificateM1BB','MarkovCrossingLCM1BB','MarkovResidualM1BB','MarkovFirstRowM1BB']
old=['MarkovLowDifferenceME9C','MarkovLowForceME9C','MarkovLowSolutionsME9C','MarkovLowSourceME9C','MarkovLowLCME9C','MarkovLowResidualME9C','MarkovLowLimitME9C','MarkovLowKernelLimitME9C','MarkovLowerUniformME9C','MarkovLowerShapeME9C','MarkovLowerReductionME9C','MarkovLowerDomainME9C']
def rel(p):return str(p.relative_to(R))
def receipt(p):return {'path':rel(p),'sha256':sha(p)}
sources={m:sha(R/'research'/f'{m}.lean') for m in new+old}
allr=[(p,json.loads(p.read_text())) for p in sorted(O.glob('build-*.json'))]
builds={}
for m in new:
 matches=[p for p,v in allr if v.get('returncode')==0 and v.get('modules')=={m:sources[m]}]
 assert matches,m
 builds[m]=receipt(matches[-1])
replays=[]
for mods in [old,new]:
 matches=[]
 for p in O.glob('replay-*.json'):
  v=json.loads(p.read_text())
  if v.get('returncode')==0 and v['modules']=={m:sources[m] for m in mods}:
   assert 'replay union passed' in v['stdout']
   assert v['checker_sha256']==sha(R/'research/ReplayIsolatedM1BB.lean')
   matches.append(p)
 assert matches,mods
 replays.append(receipt(matches[-1]))
found={};audits=[]
for p in O.glob('axioms-*.json'):
 v=json.loads(p.read_text())
 if not all(m in sources and sources[m]==h for m,h in v['sources'].items()):continue
 for n,ax in v['declarations'].items():
  assert set(ax)<={'propext','Classical.choice','Quot.sound'}
  found[n]=ax
 audits.append(receipt(p))
decls={m:re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M) for m in new+old}
assert all(n in found for ns in decls.values() for n in ns)
for m in new:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide|unsafe)\b',s),m
compiled={}
for m in new+old:
 d=O if m in new else R/'evidence/markov-e9cdd527'
 files=list(d.glob(m+'.olean*'));assert files,m
 compiled[m]={rel(p):sha(p) for p in files}
out={'request_id':'1bb0aa1ee066482294f620401d001bf2','new_modules':new,'reconciled_inherited_modules':old,
 'source_sha256':sources,'successful_new_builds':builds,'joint_replays':replays,'axiom_audits':audits,
 'new_theorems':sum(len(decls[m]) for m in new),'inherited_theorems':sum(len(decls[m]) for m in old),
 'compiled_hashes':compiled,'permitted_axioms_only':True,'completion':None,
 'limits':'Inherited compiled imports reused. Old sources were previously compiled and are now jointly replayed and audited; new sources freshly compiled. Not a fresh whole-source rebuild or independent source/English completion audit.'}
(O/'validation.json').write_text(json.dumps(out,indent=2)+'\n')
(O/'mathematical-modules.json').write_text(json.dumps(new,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['new_theorems','inherited_theorems','permitted_axioms_only','completion','limits']}))
