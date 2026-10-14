"""Machine-authored reconciliation and capability record, request 88f3b553."""
import hashlib,json,pathlib,datetime,shutil
r=pathlib.Path('/Users/sasha/math_gkm'); out=r/'evidence/markov-88f3b553';out.mkdir(exist_ok=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inh=json.loads((r/'.control/markov/inherited.json').read_text())
recon={'request_id':'88f3b55352d94aa995ace708cad23b17','time':datetime.datetime.now(datetime.timezone.utc).isoformat(),
 'inherited':{k:{'embedded_hash_matches':hashlib.sha256(v['content'].encode()).hexdigest()==v['sha256'],'current_hash':sha(r/k),'indexed_hash':v['sha256']} for k,v in inh.items()},
 'previous_event_log':'.control/markov/workers/000038/events.jsonl','previous_event_log_sha256':sha(r/'.control/markov/workers/000038/events.jsonl'),
 'interruption':'Last worker saved a report and validation before timeout. Raw events show monotone module compilation completed; kernel replay started without completion event. Final manifest records replay=null. No replay or finalizer is blindly repeated.',
 'accepted_predecessor_modules':['MarkovLayerPositive6a40','MarkovLayerIdentity6a40','MarkovBinomialRatios6a40'],
 'unconfirmed_predecessor_module':'MarkovLayerMonotone6a40 kernel replay',
 'root_sha256':sha(r/'MathGKM/Markov.lean'),'contract_sha256':sha(r/'.control/markov/contract.json'),
 'capabilities':{'python':shutil.which('python3'),'sage':shutil.which('sage'),'gap':shutil.which('gap'),'shell_heredoc':'failed: cannot create temporary file, operation not permitted','scratch':'Developer denies .scratch reads; using uniquely named retained research and evidence artifacts instead.'}}
(out/'reconciliation.json').write_text(json.dumps(recon,indent=2)+'\n')
print(json.dumps(recon,indent=2))
