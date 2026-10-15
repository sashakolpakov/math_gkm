"""Machine-authored evidence binding, not independent admission or root closure."""
from pathlib import Path
import json,hashlib,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f2da221d'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv=json.loads((O/'audit-inventory.json').read_text())
runs=[dict(json.loads(p.read_text()),receipt=str(p.relative_to(R))) for p in sorted(O.glob('run-*.json'))]
groups=[dict(json.loads(p.read_text()),receipt=str(p.relative_to(R))) for p in sorted(O.glob('kernel-union-*.json'))]
accepted=[]
for m in inv['modules']+['MarkovAuditF2']:
 p=R/'research'/f'{m}.lean';h=sha(p)
 bs=[d for d in runs if d.get('source')==str(p.relative_to(R)) and d.get('sha256')==h and d.get('mode')=='build' and d.get('returncode')==0]
 assert bs,m
 rs=[d['receipt'] for d in groups if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 assert rs,m
 accepted.append(dict(module=m,source=str(p.relative_to(R)),sha256=h,build=bs[-1]['receipt'],replays=rs))
audit=json.loads((R/accepted[-1]['build']).read_text())
axs={n:sorted(x.strip() for x in a.split(',') if x.strip()) for n,a in re.findall(r"'MathGKM.Markov.(\w+)' depends on axioms: \[([^]]*)\]",audit['stdout'])}
axs.update({n:[] for n in re.findall(r"'MathGKM.Markov.(\w+)' does not depend on any axioms",audit['stdout'])})
assert set(axs)=={n for _,n in inv['theorems']},(len(axs),len(inv['theorems']))
assert all(set(a)<={'propext','Classical.choice','Quot.sound'} for a in axs.values())
bad=[m for m in inv['modules'] if re.search(r'\b(sorry|admit|native_decide)\b|^axiom\s',(R/'research'/f'{m}.lean').read_text())]
assert not bad,bad
limits='Inherited compiled imports reused. No fresh whole-source rebuild or independent hash-bound English/source completion audit. Local validation is not controller admission.'
(O/'validation.json').write_text(json.dumps(dict(request_id='f2da221d241a479bb83492e861a09fd7',modules=accepted,axioms=axs,excluded=inv['excluded'],forbidden_tokens=bad,completion=None,limits=limits),indent=2)+'\n')
pres=[dict(path=p,expected=h,actual=sha(R/p)) for p,h in json.loads((O/'initial-hashes.json').read_text()).items()]
assert all(z['expected']==z['actual'] for z in pres)
contract=json.loads((R/'.control/markov/contract.json').read_text())
assert sha(R/contract['root_file'])==contract['root_sha256']
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
(O/'preservation.json').write_text(json.dumps(dict(checks=pres,all_unchanged=True,root_matches_contract=True,canonical_contract_hash=ch,stop_file_present=(R/'.control/markov/STOP.json').exists()),indent=2)+'\n')
fail=[d for d in runs if d.get('returncode')!=0]
(O/'operational-observations.json').write_text(json.dumps(dict(failed_build_receipts=[dict(receipt=d['receipt'],returncode=d.get('returncode'),timeout=d.get('timeout',False)) for d in fail],capabilities='capabilities.json',notes=['Prior worker timeout reconciled from raw event log and all recorded artifact hashes.','The full first-shift expansion timed out; split certificates replace it if included in validation.','Finite experiments are not proofs.','All foreground executions completed; no controller changes or external action requests.'],limits=limits),indent=2)+'\n')
(O/'source-review.json').write_text(json.dumps(dict(source=contract['source'],access='Hosted live source retrieval succeeded',reviewed_sections=['Equations (5), (7), (8)','Newton polygon convention','Definitions 6.1–6.2 and Conjecture 6.3'],independent_audits_read=contract['inherited'][3:],scope='Raw coefficients, zeros, all directions, endpoints and universal target preserved. No external result added as axiom.',correspondence='research/markov-f2da221d-correspondence.md'),indent=2)+'\n')
files=[p for p in O.iterdir() if p.is_file() and p.name not in ['artifacts.json','artifact-verification.json']]
files += list((R/'research').glob('Markov*F2.lean'))
files += [p for p in (R/'research').glob('*f2da221d*') if p.is_file()]
hashes={str(p.relative_to(R)):sha(p) for p in files}
(O/'artifacts.json').write_text(json.dumps(dict(hashes=hashes),indent=2)+'\n')
assert all(sha(R/p)==h for p,h in hashes.items())
(O/'artifact-verification.json').write_text(json.dumps(dict(verified=len(hashes),failures=[]),indent=2)+'\n')
print(json.dumps(dict(modules=len(accepted)-1,theorems=len(axs),artifacts=len(hashes),preserved=len(pres),rejected_builds=len(fail),excluded=inv['excluded'],completion=None)))
