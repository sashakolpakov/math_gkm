"""Read-only endpoint assertions over a fresh neutral fixture, bounded 135 seconds."""
import hashlib,json,time
from pathlib import Path
root=Path.cwd()
arm=root/'.scratch/revision-lean-fphi3c0q/connected/arms/exploration'
out=root/'evidence/neutral-validation'
start=time.monotonic()
try:
    while not (arm/'jobs/round-0002/receipt.json').exists():
        if time.monotonic()-start>135:
            raise TimeoutError('next actual fixture request not reached within endpoint audit bound')
        time.sleep(0.5)
    def read(p): return json.loads(p.read_text())
    decision=read(arm/'decisions/review-2.json')
    req=read(arm/'jobs/round-0002/request.json')
    receipt=read(arm/'jobs/round-0002/receipt.json')
    assert decision['accepted_experimental_change'] is True
    assert decision['certified_switch'] is False
    assert decision['comparison']['eligible'] is True
    assert decision['comparison']['rounds_each']==2
    assert receipt['outcome']=='completed'
    assert 'reverse_agenda' in req['program_execution']['executed']
    assert 'fixture-family' in req['components']
    assert 'fixture-family-reuse' in req['knowledge']
    assert req['remaining_obligations']['fixture-residual']['status']=='checked'
    assert (arm/'workspace/MathGKM/RetainedFailedDraft.lean').exists()
    manifest=read(arm/'snapshots/round-0001/manifest.json')
    assert 'MathGKM/RetainedFailedDraft.lean' not in manifest['admitted_modules']
    paths=[arm/'decisions/review-2.json',arm/'jobs/round-0002/request.json',arm/'jobs/round-0002/receipt.json',arm/'snapshots/round-0001/manifest.json']
    result={'status':'passed','assertions':11,'scope':'connected neutral endpoint; not completion of the longer four-round regression',
      'source_manifest':'pre-005/SOURCE_MANIFEST.json','files_sha256':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}
except Exception as exc:
    result={'status':'incomplete_or_failed','error':repr(exc),'scope':'no endpoint pass asserted'}
result['elapsed_seconds']=time.monotonic()-start
(out/'connected-endpoint.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result),flush=True)
raise SystemExit(0 if result['status']=='passed' else 1)
