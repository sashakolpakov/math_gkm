"""Machine-authored source preservation and precise partial-validation manifest."""
from audit_ae257c53 import inventory,R,O,sha
import json,hashlib,re
def main():
 inv=inventory();v=json.loads((O/'validation.json').read_text());fail=[]
 # A later timeout does not invalidate an earlier successful replay of unchanged sources.
 for p in sorted(O.glob('replay-*.json')):
  d=json.loads(p.read_text())
  if d.get('returncode')!=0:continue
  for m,h in d['modules'].items():
   if m in v['modules'] and v['modules'][m]['sha256']==h and sha(R/v['modules'][m]['source'])==h:
    v['modules'][m]['kernel_replay_passed']=True
    v['modules'][m]['successful_replay_receipt']=str(p.relative_to(R))
 (O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
 for m,d in v['modules'].items():
  if sha(R/d['source'])!=d['sha256'] or sha(O/f'{m}.olean')!=d['olean_sha256']:fail.append(m+' hash mismatch')
 initial={p:h for p,h in json.loads((O/'initial-hashes.json').read_text()).items() if 'ae257c53' not in p}
 for p,h in initial.items():
  if sha(R/p)!=h:fail.append(p+' prior input changed')
 root=sha(R/'MathGKM/Markov.lean')
 c=json.loads((R/'.control/markov/contract.json').read_text())
 contract=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
 assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
 assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
 candidates=[p for p in (R/'research').glob('*MAE2*.lean') if not p.stem.startswith('MarkovAudit')]
 banned={str(p.relative_to(R)):re.findall(r'\b(?:sorry|admit|native_decide|axiom)\b',p.read_text()) for p in candidates}
 assert not any(banned.values()),banned
 accepted={m:d for m,d in v['modules'].items() if d['kernel_replay_passed'] and d['axiom_audit_complete']}
 builds=[json.loads(p.read_text()) for p in O.glob('build-*.json')]
 replays=[json.loads(p.read_text()) for p in O.glob('replay-*.json')]
 pending_validation=sorted(set(inv)-set(accepted))
 pending_unbuilt=[str(p.relative_to(R)) for p in candidates if p.stem not in inv]
 out=dict(request_id='ae257c53f22a4da2970651c23916380a',compiled_modules=len(inv),validated_modules=len(accepted),validated_theorem_closures=sum(len(d['declarations']) for d in accepted.values()),axiom_audited_modules=sum(d['axiom_audit_complete'] for d in v['modules'].values()),unchanged_prior_inputs=len(initial),failures=fail,compiled_pending_separate_validation=pending_validation,pending_unbuilt=pending_unbuilt,nonzero_build_receipts=sum(d.get('returncode')!=0 for d in builds),replay_timeouts=sum(d.get('timeout',False) for d in replays),root_sha256=root,canonical_contract_hash=contract,stop_file_present=(R/'.control/markov/STOP.json').exists(),scope='Local ordinary Lean builds; listed source modules replayed over compiled imports. Dependency-wide replay was not completed. No whole-source rebuild or independent completion audit.',completion=None)
 (O/'final-check.json').write_text(json.dumps(out,indent=2)+'\n')
 (O/'compiled-inventory.json').write_text(json.dumps(inv,indent=2)+'\n')
 files=list(O.iterdir())+[p for p in (R/'research').iterdir() if 'ae257c53' in p.name or ('MAE2' in p.name and p.suffix=='.lean')]
 manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ('manifest.json','last-verification.json')}
 (O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
 errors=[p for p,h in manifest.items() if sha(R/p)!=h]
 (O/'last-verification.json').write_text(json.dumps(dict(verified_artifacts=len(manifest),failures=errors,root_sha256=root,canonical_contract_hash=contract,completion=None),indent=2)+'\n')
 assert not fail and not errors
 print(json.dumps({k:d for k,d in out.items() if k not in ('compiled_pending_separate_validation','pending_unbuilt')}))
 print('Verified artifacts',len(manifest))
if __name__=='__main__':main()
