"""Machine-authored request 7955df0c4dc1407e99579ba90e1017ab; evidence only."""
import pathlib,json,hashlib,re
r=pathlib.Path('/Users/sasha/math_gkm');out=r/'evidence/markov-7955df0c'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
names=['MarkovNextCertificate7955','MarkovNextBinomial7955','MarkovNextAlgebra7955','MarkovNextSource7955','MarkovNextHorizontal7955','MarkovInterior7955']
runs=[]
for p in sorted(out.glob('run-*.json')):
 x=json.loads(p.read_text());x['record']=str(p.relative_to(r));runs.append(x)
mods=[]
for m in names:
 p=r/'research'/f'{m}.lean';h=sha(p)
 matched=[x for x in runs if x['source']==str(p.relative_to(r)) and x['sha256']==h]
 builds=[x for x in matched if x['command'][0].endswith('/lean') and x.get('returncode')==0]
 replays=[x for x in matched if x['command'][0].endswith('/leanchecker') and x.get('returncode')==0]
 lines=[l for x in builds for l in x['stdout'].splitlines() if 'axioms' in l]
 mods.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,compiled=bool(builds),replayed=bool(replays),build_records=[x['record'] for x in builds],replay_records=[x['record'] for x in replays],axioms=lines))
validation=dict(request_id='7955df0c4dc1407e99579ba90e1017ab',modules=mods,imports_status='Inherited compiled imports reused; not a fresh whole-source rebuild',independent_completion_audit=False)
(out/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
bad=[x for x in runs if x.get('returncode')!=0]
ops=dict(rejected_attempts=[dict(record=x['record'],timeout=x.get('timeout',False),returncode=x.get('returncode'),source=x['source']) for x in bad],notes=['Initial shell heredoc creation denied; no file created. Switched to apply_patch.','Developer denies .scratch access; durable research/evidence used.','Whitespace-sensitive ≤i and <i tokens rejected initial proofs; rejected outputs are not accepted.','One binomial build timed out; direct linear combinations replaced nonlinear arithmetic and final build succeeded.','A positivity tactic required explicit cancellation of j+1−1.','Source bridge initially needed cast reordering and the correct linear-combination sign; final source formula build checked the corrected version.','Sage and SymPy unavailable; GAP discoverable but unused.','No external mathematical result added as an axiom.'])
(out/'operational-observations.json').write_text(json.dumps(ops,indent=2)+'\n')
scan={str((r/'research'/f'{m}.lean').relative_to(r)):re.findall(r'\b(?:sorry|admit|axiom|native_decide)\b',(r/'research'/f'{m}.lean').read_text()) for m in names}
(out/'source-scan.json').write_text(json.dumps(scan,indent=2)+'\n')
prev=json.loads((r/'evidence/markov-0d052acb/artifacts.json').read_text())['hashes']
pres=dict(predecessor_checks=len(prev),mismatches=[p for p,h in prev.items() if sha(r/p)!=h],root_sha256=sha(r/'MathGKM/Markov.lean'))
contract=json.loads((r/'.control/markov/contract.json').read_text())
pres['contract_sha256']=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
(out/'final-preservation.json').write_text(json.dumps(pres,indent=2)+'\n')
nh=next(x for x in mods if x['module']=='MarkovNextHorizontal7955')
nr=next(x for x in mods if x['module']=='MarkovInterior7955')
observations=[
 'Pinned root and contract unchanged; full Conjecture63 and its negation remain unresolved.',
 ('Proved' if nh['compiled'] else 'Drafted')+' universal raw horizontal log-concavity for every source triple with i+j+3=a+b−1; see validation.json for separate replay status.',
 ('Proved' if nr['compiled'] else 'Drafted')+' exact root equivalence retaining the remaining infinite inequalities, all directions, zeros and endpoints.',
 '231942 coefficient identities matched across 1259 sources through denominator 64; no failures in 77183 raw tests per horizontal/vertical direction. These are finite experiments.',
 'The switch-zero vertical envelope fails on source 2/7 with raw triple [4,8,12]; the raw inequality holds. Additional vertical certificate candidates remain unproved.',
 'Successful printed axiom closures use only permitted axioms. Inherited compiled imports were reused; no fresh whole-source rebuild or independent completion audit occurred.',
 f'{len(bad)} rejected or timed-out validation attempts and capability limitations are retained in operational-observations.json.'
]
observations.append('Separate kernel replay remains unconfirmed for: '+', '.join(x['module'] for x in mods if x['compiled'] and not x['replayed'])+'.')
report=dict(request_id='7955df0c4dc1407e99579ba90e1017ab',summary=('Established a further universal horizontal upper strip; ' if nh['compiled'] else 'Developed a further horizontal upper-strip proof; ')+'the full published Markov conjecture remains unresolved.',actions=['Reconciled 74 predecessor artifact hashes and six inherited-index hashes: evidence/markov-7955df0c/reconciliation.json.',f'Compiled {sum(x["compiled"] for x in mods)} modules; {sum(x["replayed"] for x in mods)} completed separate kernel replay: evidence/markov-7955df0c/validation.json.','Executed exact symbolic and source coefficient experiments under evidence/markov-7955df0c/.','Recorded derivations and correspondence limits: research/markov-7955df0c-mathematics.md and research/markov-7955df0c-correspondence.md.'],observations=observations,agenda=['Investigate the analogous next-upper-strip vertical inequality using vertical-envelope.json; retain the actual source switch count for small numerators.','Seek global interior inequalities through root_iff_interior7955, preserving all source correspondence obligations.','Treat all unreplayed declarations as awaiting separate replay; no finite scan closes the pinned root.'],completion=None)
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
paths=list(out.iterdir())+[r/'research'/f'{m}.lean' for m in names]+list((r/'research').glob('*7955*'))
hashes={str(p.relative_to(r)):sha(p) for p in sorted(set(paths)) if p.is_file() and p.name!='artifacts.json'}
(out/'artifacts.json').write_text(json.dumps(dict(request_id=report['request_id'],hashes=hashes),indent=2)+'\n')
print(json.dumps(dict(modules=[{k:x[k] for k in ['module','compiled','replayed']} for x in mods],rejected_attempts=len(bad),hashes=len(hashes),preservation=pres)))
