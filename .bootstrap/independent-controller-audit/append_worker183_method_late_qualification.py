"""Append an audit-files-only qualification without changing the closed input map/window."""
import hashlib
import json
from datetime import datetime, timezone
from pathlib import Path
T=Path('/private/tmp/math_gkm_godel_20261013')
MP=T/'markov_worker_000183_replay_method_evidence.json'
NP=T/'markov_worker_000183_replay_method.md'
def h(b): return hashlib.sha256(b).hexdigest()
def pin(p):
    b=Path(p).read_bytes()
    return dict(path=str(p),bytes=len(b),sha256=h(b))
old_m=MP.read_bytes(); old_n=NP.read_bytes()
assert h(old_m)=='81d042048cc9a4b8e62f96945f5c2ba3156a344401506db654c72036274fbdd9'
assert h(old_n)=='be2adfad9dc126396a8ad3760ddbab6a8b5347fe90175c8832f6fb975a7b0639'
m=json.loads(old_m)
names={
 'late_observed_bundle':'6e3f7ec0040261d8896494705fa5635d9a118dd9c1d6165e55b24e077bdd9318',
 'late_observed_observation':'18a20ad1ef9fd2d426fd62fe39159aee7669afae9eaa27ca593c6c2a32fda22d',
 'closing_inventory_diagnostic':'5b7194499179dcaacbb02818360135f96d857a976825e86ef3e15a243dcbd26a',
 'late_additions_metadata':'9808567f6e568d21e1f8f7d1d6640503918d95d7996535bd4c682fe78e40ece5'}
records={}; pins=[]
for stem, expected in names.items():
    p=T/f'markov_worker_000183_{stem}.json'
    q=pin(p); assert q['sha256']==expected
    pins.append(q); records[stem]=json.loads(p.read_text())
b=records['late_observed_bundle']; o=records['late_observed_observation']; d=records['closing_inventory_diagnostic']; md=records['late_additions_metadata']
assert b['count']==o['count']==len(b['files'])==len(o['files'])==2
assert b['total_bytes']==o['total_bytes']==sum(x['bytes']for x in b['files'])==13469
assert d['archive_count']==24 and d['current_count']==80 and d['initial_current_count']==78
assert not d['archive_additions'] and not d['archive_missing'] and not d['current_missing']
assert set(d['current_additions'])=={x['relative_path']for x in b['files']}
for x,y,z in zip(b['files'],o['files'],md['files']):
    assert x['relative_path']==y['relative_path']==z['relative_path']
    assert x['sha256']==y['sha256']==z['sha256']
    assert x['bytes']==y['bytes']==z['bytes']
    assert x['path']==y['copy'] and x['source']==y['source']==z['path']
    assert y['bytes_and_stable_metadata_match'] and y['source_unchanged_except_atime']
    for k in ('bytes','mode','uid','gid','mtime_ns'):
        assert y['source_before'][k]==y['source_after'][k]==y['copy_metadata'][k]==z[k]
stamp=datetime.now(timezone.utc).isoformat()
appendix='''
## Later audit-files-only qualification

The earlier method window and its 78-path initial inventory remain historical observations. A later validator inventory diagnostic at 08:48:01.285305 UTC found 80 current exact-request files, with the original 24-file archive unchanged. The two additions are `research/MarkovAudit1792226823913821000M55C.lean` (5,715 bytes, SHA256 `a6a116434758fc4a57d27b068843845b5746da4434135705d440568eaada3c7a`) and `research/__pycache__/source_experiment_55cf20d2.cpython-314.pyc` (7,754 bytes, SHA256 `65d43226330ce04622d96fc7602f4c355336286080a0dc5a73ac77ce9a780eb1`). Their metadata was observed at 08:48:20.039376 UTC; recorded mtimes are respectively 08:47:03.914037 and 08:44:04.875274. Discovery, mtime and creation or producer attribution are distinct.

Both were preserved opaquely during 08:49:33.662454–08:49:33.663178 UTC under `markov_worker_000183_late_observed_bundle/`, with separate bundle and observation JSON. The validator records matching bytes, mode, uid, gid and mtime. This method update reads only the four audit JSON records; it does not read the new Lean body or decode the cache, and makes no producer, execution, replay, printing or recovery claim. The earlier statements that no Audit source or cache was retained refer to the earlier inventory and reviewed cutoff, not an assertion of continued absence after that observation. The ten mathematical modules remain compiled-only and the host status remains uncertain_effects with no receipt or report.

This appendix and its separate evidence record were appended after the method project window closed. Every earlier method evidence field, the 127-input map, its 72 temporary pins, all timestamps and the ten absence observations are unchanged. The pre-append note SHA256 is `be2adfad9dc126396a8ad3760ddbab6a8b5347fe90175c8832f6fb975a7b0639`; the pre-append evidence SHA256 is `81d042048cc9a4b8e62f96945f5c2ba3156a344401506db654c72036274fbdd9`. Removing only this appendix and the newly named evidence field reconstructs those original bytes. The evolving validator files remain outside the method's closed input map.
'''
field='post_observation_audit_only_late_qualification'
assert field not in m
m[field]=dict(updated_utc=stamp,scope='Audit JSON only, after closed M window; no late source/body/bytecode reads',
    previous_note=pin(NP),previous_evidence=pin(MP),added_evidence_field=field,
    note_appendix_utf8=appendix,note_appendix_sha256=h(appendix.encode()),helper=pin(Path(__file__)),
    companion_pins=pins,records=records,original_input_map_unchanged=True,original_window_unchanged=True,
    all_previous_evidence_fields_unchanged=True,validation_credit=False,producer_attribution=False,
    mathematical_values_recomputed=False,late_body_interpreted=False)
restored=dict(m); restored.pop(field)
assert (json.dumps(restored,indent=2,sort_keys=True)+'\n').encode()==old_m
assert m['static_input_sha256']==json.loads(old_m)['static_input_sha256']
MP.write_text(json.dumps(m,indent=2,sort_keys=True)+'\n')
NP.write_bytes(old_n+appendix.encode())
assert NP.read_bytes()[:-len(appendix.encode())]==old_n
print(json.dumps(dict(updated_utc=stamp,note=pin(NP),evidence=pin(MP),helper=pin(Path(__file__))),indent=2))
