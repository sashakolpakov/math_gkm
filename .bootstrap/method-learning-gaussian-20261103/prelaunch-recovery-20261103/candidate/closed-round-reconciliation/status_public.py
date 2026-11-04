"""INACTIVE read-only, source-qualified observations of the resumed goal owner."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import time
ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
REGISTRATION_SCHEMA='math-gkm.gaussian-closed-round-registration.v1'


def load(path,name):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m


def status(base=HERE):
    base=Path(base);registration=base/'REGISTRATION.json'
    if not registration.exists():return {'activation':'not_registered','file_observation_only':True,'observed_at':time.time()}
    reg=json.loads(registration.read_bytes());source=base/'coordinator.py'
    if (set(reg)!={'schema','approved','status_source_sha256','owner_source','config','output'} or
        reg.get('schema')!=REGISTRATION_SCHEMA or reg.get('approved') is not True or
        reg.get('status_source_sha256')!=hashlib.sha256(Path(__file__).read_bytes()).hexdigest() or
        reg.get('owner_source')!={'path':str(source),'sha256':hashlib.sha256(source.read_bytes()).hexdigest()}):
        raise RuntimeError('resumed coordinator or approved status source differs')
    o=load(source,'closed_round_source_qualified_status_owner')
    qualified=o.configuration(o.public_json(o.reference(reg['config'])),initial=False,native_checks=False)
    binding=qualified['binding'];c=qualified['component'];transition=qualified['transition']
    if binding['owner_source_sha256']!=reg['owner_source']['sha256']:raise RuntimeError('status coordinator identity differs')
    output=Path(reg['output'])
    if not output.is_absolute() or output.resolve()!=output or not output.is_relative_to(ROOT):raise RuntimeError('status output escaped')
    current=output/'CURRENT.json'
    if current.exists():
        pointer=o.public_json(current)
        expected={'schema':o.CURRENT_SCHEMA,'owner_source_sha256':binding['owner_source_sha256'],
            'component_source_sha256':o.COMPONENT_SHA,'contract_sha256':c['contract_sha256'],'profile_sha256':c['profile_sha256'],
            'revision_finished_sha256':c['revision_finished']['sha256'],'prepared_handoff_sha256':c['prepared_handoff']['sha256'],
            'reconciliation_finished_sha256':binding['reconciliation_finished']['sha256'],'parent_study':c['parent_study']}
        if any(pointer.get(k)!=v for k,v in expected.items()):raise RuntimeError('resumed current observation differs')
    else:pointer={'epoch':1,'phase':'waiting_owner_start','updated_at':None,'root_proved':False,'current_study':str(o.STUDY)}
    epoch=pointer.get('epoch');study=Path(pointer['current_study'])
    if (type(epoch) is not int or epoch<1 or not study.is_absolute() or study.resolve()!=study or
        study.parent!=ROOT/'.scratch/studies' or not re.fullmatch(o.DESTINATION_PREFIX+r'[0-9]{4,}',study.name) or
        int(study.name.rsplit('-',1)[-1])!=epoch):raise RuntimeError('resumed study or epoch escaped')
    e=o.projection();protocol=e.select(e.fields(o.raw(study/'protocol.json')),('validation_seconds','rounds'))
    return {'observed_at':time.time(),'study':str(study),'original_study':c['parent_study'],'file_observation_only':True,
        'goal_owner':{k:pointer.get(k) for k in ('epoch','phase','updated_at','root_proved')},
        'coordinator_source_sha256':binding['owner_source_sha256'],'component_source_sha256':o.COMPONENT_SHA,
        'validation_seconds':protocol['validation_seconds'],'future_epoch_validation_seconds':1800,
        'arms':o.C.public_study(study,c,transition),'baseline_is_placeholder':True,
        'scientific_status':'revised_source_history_no_causal_learning_claim','activation':'registered_file_observation',
        'reconciliation_finished_sha256':binding['reconciliation_finished']['sha256'],'prior_setup_replayed':False}

if __name__=='__main__':print(json.dumps(status(),sort_keys=True))
