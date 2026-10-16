"""Machine-authored final preservation/validation manifest. Never edits prior evidence."""
from audit_ea4238fc import *
def main():
 inv=inventory();v=json.loads((O/'validation.json').read_text()) if (O/'validation.json').exists() else {'modules':{}}
 for p in O.glob('replay-*.json'):
  d=json.loads(p.read_text())
  if d.get('returncode')!=0 or 'checker_sha256' not in d:continue
  for m,h in d['modules'].items():
   if m in v['modules'] and v['modules'][m]['sha256']==h:
    v['modules'][m]['kernel_replay_passed']=True
    v['modules'][m]['source_bound_isolated_replay']=str(p.relative_to(R))
 (O/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
 errors=[]
 for m,d in v['modules'].items():
  obj=R/d.get('olean_path',str((O/f'{m}.olean').relative_to(R)))
  if sha(R/d['source'])!=d['sha256'] or sha(obj)!=d['olean_sha256']:errors.append(m+' validation hash mismatch')
 initial=json.loads((O/'initial-hashes.json').read_text())
 for p,h in initial.items():
  if 'ea4238fc' not in p and sha(R/p)!=h:errors.append(p+' prior input changed')
 prior=json.loads((R/'evidence/markov-f8ca2c8b/manifest.json').read_text())
 for p,h in prior.items():
  if sha(R/p)!=h:errors.append(p+' inherited artifact changed')
 root=sha(R/'MathGKM/Markov.lean')
 contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
 assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
 assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
 math=list((R/'research').glob('Markov*MEA423*.lean'))
 banned={str(p.relative_to(R)):re.findall(r'\b(?:sorry|admit|native_decide|axiom)\b',p.read_text()) for p in math}
 assert not any(banned.values()),banned
 accepted={m:d for m,d in v['modules'].items() if d['axiom_audit_complete'] and d['kernel_replay_passed']}
 builds=[json.loads(p.read_text()) for p in O.glob('build-*.json')]
 replays=[d for p in O.glob('replay-*.json') if (d:=json.loads(p.read_text())).get('mode')=='replay']
 out=dict(request_id='ea4238fc86ab42dca04c21467d7fa66c',new_compiled_modules=len(inv),validated_modules=len(accepted),validated_theorem_closures=sum(len(d['declarations']) for d in accepted.values()),unchanged_prior_inputs=sum("ea4238fc" not in p for p in initial),unchanged_inherited_artifacts=len(prior),failures=errors,compiled_pending_validation=sorted(set(inv)-set(accepted)),pending_unbuilt=[str(p.relative_to(R)) for p in math if p.stem not in inv and not p.stem.startswith('MarkovAudit')],nonzero_build_receipts=sum(d.get('returncode')!=0 for d in builds),replay_failures=sum(d.get('returncode')!=0 for d in replays),root_sha256=root,canonical_contract_hash=contract,stop_file_present=(R/'.control/markov/STOP.json').exists(),scope='Local builds and isolated selected-declaration replay over compiled imports. No whole-source rebuild or independent completion audit.',completion=None)
 (O/'compiled-inventory.json').write_text(json.dumps(inv,indent=2)+'\n')
 (O/'final-check.json').write_text(json.dumps(out,indent=2)+'\n')
 files=list(O.iterdir())+[p for p in (R/'research').iterdir() if 'ea4238fc' in p.name or ('MEA423' in p.name and p.suffix=='.lean')]
 manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name not in ('manifest.json','last-verification.json')}
 (O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
 failures=[p for p,h in manifest.items() if sha(R/p)!=h]
 (O/'last-verification.json').write_text(json.dumps(dict(verified_artifacts=len(manifest),failures=failures,root_sha256=root,canonical_contract_hash=contract,completion=None),indent=2)+'\n')
 assert not errors and not failures
 print(json.dumps({k:d for k,d in out.items() if k not in ('pending_unbuilt','compiled_pending_validation')}))
 print('Verified artifacts',len(manifest))
if __name__=='__main__':main()
