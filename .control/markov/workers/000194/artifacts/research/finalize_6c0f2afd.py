"""Machine-authored staged local validation; no controller or protected edits."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6c0f2afd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
A=['MarkovDenseCertificateM6C0','MarkovMiddleExpressionM6C0','MarkovMiddleDenseC6M6C0','MarkovMiddleFixedDepthM6C0','MarkovMiddleThirdBatch6M6C0','MarkovMiddleCachedC7M6C0','MarkovMiddleSixResidualM6C0']
B=['MarkovMiddleThirdPartialM6C0','MarkovMiddleRemainingM6C0']
def run():
 mods=A+B;hashes={m:sha(R/'research'/f'{m}.lean') for m in mods}
 builds={}
 for m in mods:
  good=[]
  for p in O.glob('build-*.json'):
   d=json.loads(p.read_text())
   if d.get('returncode')==0 and d.get('modules',{}).get(m)==hashes[m]:good.append(p)
  assert good,('no matching build',m)
  builds[m]=str(max(good).relative_to(R))
 replays=[]
 for group in [A,B]:
  good=[]
  for p in O.glob('replay-*.json'):
   d=json.loads(p.read_text())
   if d.get('returncode')==0 and d.get('modules')=={m:hashes[m] for m in group}:good.append(p)
  assert good,('no matching replay',group)
  replays.append(str(max(good).relative_to(R)))
 good=[]
 for p in O.glob('axioms-*.json'):
  d=json.loads(p.read_text())
  if d.get('sources')==hashes:good.append((p,d))
 assert good,'no matching whole-selection axiom audit'
 audit,ad=max(good,key=lambda z:z[0].name)
 for m in mods:
  assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',(R/'research'/f'{m}.lean').read_text()),m
 data=dict(modules=hashes,compilation=builds,replays=replays,replay_stages=[dict(modules=A,boundary='Inherited compiled imports only'),dict(modules=B,boundary='Inherited imports and locally checked stage A',stage_A_hashes={m:hashes[m] for m in A})],axioms=str(audit.relative_to(R)),theorem_closures=len(ad['declarations']),scope='Nine local source compilations; two staged kernel replays with selected names absent from each replay import environment; all stage-A source hashes bound when stage B imports them. Pinned inherited compiled dependencies reused. No fresh whole-source rebuild or independent completion audit.')
 (O/'validation.json').write_text(json.dumps(data,indent=2))
 (O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2))
 failed=[]
 for p in sorted(O.glob('build-*.json')):
  d=json.loads(p.read_text())
  if d.get('returncode')!=0:failed.append(dict(receipt=str(p.relative_to(R)),modules=d.get('modules'),timeout=d.get('timeout',False),returncode=d.get('returncode'),seconds=d['seconds']))
 (O/'failed-build-index.json').write_text(json.dumps(failed,indent=2))
 drafts={p.stem:sha(p) for p in (R/'research').glob('*M6C0.lean') if p.stem not in mods and not p.stem.startswith(('Replay','MarkovAudit'))}
 (O/'unaccepted-drafts.json').write_text(json.dumps(dict(sources=drafts,reason='Not in the complete matching compilation/replay/axiom selection. Includes timeouts and generated but unbuilt larger-column or third-row candidates.'),indent=2))
 print(json.dumps(dict(modules=len(mods),theorem_closures=len(ad['declarations']),failed_builds=len(failed),unaccepted=len(drafts))))
if __name__=='__main__':run()
