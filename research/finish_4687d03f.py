"""Machine-authored local validation summary, not an independent root admission."""
from pathlib import Path
import json,re,hashlib,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-4687d03f'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovRowCoeffM468','MarkovRowParameterM468','MarkovRowSeriesM468',
 'MarkovRowResolventM468','MarkovResolventSourceM468','MarkovFivePolynomialM468',
 'MarkovFiveForceM468','MarkovFiveSourceM468','MarkovFiveShapeM468',
 'MarkovFiveDirectionsM468','MarkovResidualM468','MarkovRowDifferenceM468']
(O/'mathematical-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
if len(sys.argv)>1 and sys.argv[1]=='prepare':
 print(json.dumps(mods));sys.exit(0)
builds=[]
for m in mods:
 candidates=[]
 for p in O.glob('build-*.json'):
  d=json.loads(p.read_text())
  if d.get('returncode')==0 and d.get('modules')=={m:sha(R/'research'/f'{m}.lean')}:candidates.append(p)
 assert candidates,m
 builds.append(str(sorted(candidates)[-1].relative_to(R)))
replays=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and d.get('modules')=={m:sha(R/'research'/f'{m}.lean') for m in mods}:replays.append(p)
assert replays
audits=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text())
 if d.get('sources')=={m:sha(R/'research'/f'{m}.lean') for m in mods}:audits.append(p)
assert audits
audit=sorted(audits)[-1];ad=json.loads(audit.read_text())
out={'request_id':'4687d03ffe8948abad1b235a519bed69','modules':mods,
 'sources':{m:sha(R/'research'/f'{m}.lean') for m in mods},'build_receipts':builds,
 'replay_receipt':str(sorted(replays)[-1].relative_to(R)),'axioms_receipt':str(audit.relative_to(R)),
 'closures':len(ad['declarations']),'permitted_axioms_only':True,
 'limits':'Inherited compiled imports reused. No fresh whole-source rebuild or independent English/source completion audit.',
 'completion':None}
(O/'validation.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
