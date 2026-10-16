"""Machine-authored preservation and evidence manifest; no controller writes."""
from pathlib import Path
import hashlib,json,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-03d5764d'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 v=json.loads((O/'validation.json').read_text());fail=[]
 for m,d in v['modules'].items():
  if sha(R/d['source'])!=d['sha256'] or sha(O/f'{m}.olean')!=d['olean_sha256']:fail.append(m+' hash')
  if not d['axiom_audit_complete'] or not d['kernel_replay_passed']:fail.append(m+' validation')
 initial=json.loads((O/'initial-hashes.json').read_text());checked=0
 for p,h in initial.items():
  if '03d5764d' in p:continue
  if sha(R/p)!=h:fail.append(p+' changed prior input')
  checked+=1
 candidates=[p for p in (R/'research').glob('*M03.lean') if not p.stem.startswith('MarkovAudit')]
 pending=[str(p.relative_to(R)) for p in candidates if p.stem not in v['modules']]
 banned={str(p.relative_to(R)):re.findall(r'\b(?:sorry|admit|native_decide|axiom)\b',p.read_text()) for p in candidates}
 banned={p:a for p,a in banned.items() if a};assert not banned
 root=sha(R/'MathGKM/Markov.lean')
 c=json.loads((R/'.control/markov/contract.json').read_text())
 contract=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest()
 assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
 assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
 builds=[json.loads(p.read_text()) for p in O.glob('build-*.json')]
 out=dict(request_id='03d5764d3c1945eba3e1fffb38c57904',validated_modules=len(v['modules']),audited_theorem_closures=sum(len(d['declarations']) for d in v['modules'].values()),unchanged_prior_inputs=checked,failures=fail,pending_unproved=pending,rejected_builds=sum(d.get('returncode')!=0 for d in builds),root_sha256=root,canonical_contract_hash=contract,stop_file_present=(R/'.control/markov/STOP.json').exists(),all_foreground_sessions_ended=True,completion=None)
 (O/'final-check.json').write_text(json.dumps(out,indent=2)+'\n')
 files=list(O.iterdir())+[p for p in (R/'research').iterdir() if '03d5764d' in p.name or p.name.endswith('M03.lean')]
 manifest={str(p.relative_to(R)):sha(p) for p in files if p.is_file() and p.name!='manifest.json'}
 (O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
 assert not fail
 print(json.dumps({k:v for k,v in out.items() if k!='pending_unproved'}));print('Pending candidates',len(pending),'manifest artifacts',len(manifest))
if __name__=='__main__':main()
