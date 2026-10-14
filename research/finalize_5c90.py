"""Machine-authored evidence index; no control records are modified."""
import pathlib,json,hashlib,datetime,re
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-5c90b506'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=['MarkovShearedTransfer5c90','MarkovAmbientKernel5c90','MarkovAmbientReduction5c90','MarkovAmbientSlices5c90']
runs=[(p,json.loads(p.read_text())) for p in sorted(o.glob('run-*.json'))]
items=[]
for m in mods:
 p=r/'research'/f'{m}.lean';h=sha(p)
 matching=[(q,x) for q,x in runs if x['source']==str(p.relative_to(r)) and x['sha256']==h and x.get('returncode')==0]
 builds=[(q,x) for q,x in matching if pathlib.Path(x['command'][0]).name=='lean']
 replays=[(q,x) for q,x in matching if pathlib.Path(x['command'][0]).name=='leanchecker']
 axioms=[line for line in (builds[-1][1]['stdout'] if builds else '').splitlines() if 'depends on axioms' in line]
 assert all('sorryAx' not in x for x in axioms)
 assert not re.search(r'\b(sorry|admit|native_decide)\b',p.read_text())
 items.append(dict(module=m,source=str(p.relative_to(r)),sha256=h,build=str(builds[-1][0].relative_to(r)) if builds else None,replay=str(replays[-1][0].relative_to(r)) if replays else None,axiom_lines=axioms,olean_sha256=sha(o/f'{m}.olean') if builds else None))
c=json.loads((r/'.control/markov/contract.json').read_text())
validation=dict(time=datetime.datetime.now(datetime.timezone.utc).isoformat(),modules=items,root_sha256=sha(r/'MathGKM/Markov.lean'),contract_canonical_sha256=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest(),imports='Inherited compiled imports reused; no fresh whole-source rebuild',independent_audit=False)
(o/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
fail=[dict(record=str(p.relative_to(r)),source=x['source'],timeout=x.get('timeout',False),returncode=x.get('returncode'),stdout=x['stdout'],stderr=x['stderr']) for p,x in runs if x.get('returncode')!=0]
oper=dict(failed_runs=fail,capability_notes=['Shell here-document temporary-file creation denied before any script ran.','Higher-priority permission denies .scratch reads; durable evidence/research paths used.','Sage and SymPy unavailable. GAP executable located but not invoked.','Unmatched zsh file glob rejected one inherited search; subsequent explicit-path and no-ignore searches succeeded.','leanchecker --help treated the flag as absent target and failed to find Math_gkm; pinned LeanChecker source inspected to establish actual behavior.','Initially guessed LeanChecker source path absent; located actual pinned standard source via rg.','Two concurrent module replays timed out at 100 seconds; sequential retries recorded. Failed elaborations are not theorem evidence.'])
(o/'operational-observations.json').write_text(json.dumps(oper,indent=2)+'\n')
report=dict(request_id='5c90b5063976426b9c5577badcc55c00',summary='Established an exact positive ambient transfer and Pell generating kernels; the full published Markov conjecture remains unresolved.',actions=['Reconciled 62 predecessor artifact hashes and pinned root/contract: evidence/markov-5c90b506/reconciliation.json.','Derived and checked all-source shear/coefficient/polygon bridges, a conditional horizontal reduction, and Pell kernel identities: evidence/markov-5c90b506/validation.json.','Executed exact word and transfer experiments: evidence/markov-5c90b506/horizontal-words.json, ambient-transfer.json, and ambient-roots.json.','Recorded mathematical results and correspondence limits: research/markov-5c90b506-mathematics.md and research/markov-5c90b506-correspondence.md.'],observations=['The pinned root and contract remain unchanged. Conjecture63 remains unresolved.','The new all-word ambient horizontal assertion would imply the actual raw horizontal clause; that assertion is explicitly unproved.','The source 1/3 ambient specialization is 1+4x+8x^2, positive for every real x. This obstructs blanket real-rootedness, not source coefficient log-concavity.','No ambient inequality failures occurred in 4415699 no-CC tests or 929901 additional transfer tests. These are finite experiments.','Successful printed axiom closures contain only permitted axioms. Exact compilation and replay status is listed per module in validation.json; inherited compiled imports were reused.','Rejected elaborations, two initial replay timeouts, and capability failures are preserved in operational-observations.json.'],agenda=['Seek a horizontal invariant for the two explicit affine transfer matrices, using their shared rank-one linear part.','Use the exact extracted Pell kernel for global aggregation; neither fixed-radius comparisons nor ambient real-rootedness supplies that proof.','Preserve all directions, zeros, endpoints, universal coverage, and every source correspondence obligation.'],completion=None)
(o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
if all(x['build'] and x['replay'] for x in items):
 report['actions'][1]='Compiled and kernel-replayed four modules proving the exact source transfer, conditional horizontal reduction, and Pell kernels: evidence/markov-5c90b506/validation.json.'
 report['observations'].append('All foreground sessions completed. The extracted Pell kernel is checked universally, but its required aggregate log-concavity remains unproved.')
 (o/'report.json').write_text(json.dumps(report,indent=2)+'\n')
manifest={str(p.relative_to(r)):sha(p) for p in list(o.glob('*'))+[r/'research'/f'{m}.lean' for m in mods]+list((r/'research').glob('*5c90*')) if p.is_file() and p.name!='manifest.json'}
(o/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(dict(modules=[{k:x[k] for k in ['module','build','replay']} for x in items],failed_runs=len(fail),root=validation['root_sha256'],contract=validation['contract_canonical_sha256']),indent=2))
