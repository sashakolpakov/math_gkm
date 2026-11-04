"""INACTIVE source-qualified metadata observations; no liveness claim."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import time
ROOT=Path('/Users/sasha/math_gkm');HERE=Path(__file__).resolve().parent
SCHEMA='math-gkm.gaussian-efficient-registration.v1'


def status(base=HERE):
    base=Path(base);path=base/'REGISTRATION.json'
    if not path.exists():return {'activation':'not_registered','file_observation_only':True,'observed_at':time.time()}
    reg=json.loads(path.read_bytes());source=base/'coordinator.py'
    if (set(reg)!={'schema','approved','status_source_sha256','owner_source','config','output'} or reg.get('schema')!=SCHEMA or
        reg.get('approved') is not True or reg.get('status_source_sha256')!=hashlib.sha256(Path(__file__).read_bytes()).hexdigest() or
        reg.get('owner_source')!={'path':str(source),'sha256':hashlib.sha256(source.read_bytes()).hexdigest()}):
        raise RuntimeError('efficient status registration/source differs')
    spec=importlib.util.spec_from_file_location('qualified_efficient_status_owner',source);o=importlib.util.module_from_spec(spec);spec.loader.exec_module(o)
    q=o.configuration(o.public_json(o.reference(reg['config'])),initial=False,native_checks=False)
    binding=q['binding'];old=q['predecessor'];c=old['component'];output=Path(reg['output'])
    if binding['owner_source']!=reg['owner_source'] or not output.is_absolute() or output.resolve()!=output or not output.is_relative_to(ROOT):
        raise RuntimeError('efficient status identity/output escaped')
    current=output/'CURRENT.json'
    if current.exists():
        pointer=o.public_json(current)
        expected={'schema':o.CURRENT_SCHEMA,'owner_source_sha256':binding['owner_source']['sha256'],
            'predecessor_source_sha256':binding['predecessor_source']['sha256'],'component_source_sha256':o.O.COMPONENT_SHA,
            'runtime_source_sha256':binding['runtime_source']['sha256'],'admission_source_sha256':binding['admission_source']['sha256'],
            'contract_sha256':c['contract_sha256'],'profile_sha256':c['profile_sha256'],'handoff_sha256':binding['handoff']['sha256'],
            'revision_finished_sha256':c['revision_finished']['sha256'],'prepared_handoff_sha256':c['prepared_handoff']['sha256'],
            'parent_study':c['parent_study']}
        if any(pointer.get(k)!=v for k,v in expected.items()):raise RuntimeError('efficient current identity differs')
    else:pointer={'epoch':q['handoff']['epoch'],'phase':'waiting_owner_start','updated_at':None,'root_proved':False,'current_study':q['handoff']['study']}
    epoch=pointer.get('epoch');study=Path(pointer['current_study'])
    if (type(epoch) is not int or epoch<1 or not study.is_absolute() or study.resolve()!=study or study.parent!=ROOT/'.scratch/studies' or
        not re.fullmatch(o.DESTINATION_PREFIX+r'[0-9]{4,}',study.name) or int(study.name.rsplit('-',1)[-1])!=epoch):
        raise RuntimeError('efficient study/epoch escaped')
    e=o.O.projection();protocol=e.select(e.fields(o.O.raw(study/'protocol.json')),('validation_seconds','rounds'))
    runtime=None;runtime_path=pointer.get('runtime_status_path')
    if runtime_path is not None:
        rp=Path(runtime_path)
        if (not rp.is_absolute() or rp.resolve()!=rp or rp.name!='RUNTIME_STATUS.json' or
            rp.parent.parent!=output/'commands' or re.fullmatch(r'[0-9]{6}',rp.parent.name) is None):
            raise RuntimeError('runtime observation path escaped owned command')
        if rp.exists():
            row=o.public_json(rp)
            if (row.get('schema')!='math-gkm.efficient-runtime-status.v1' or row.get('source_sha256')!=binding['runtime_source']['sha256'] or
                row.get('study')!=str(study) or row.get('operation') not in ('run','recover') or
                row.get('phase') not in ('running','waiting_host_headroom','finished','refused','stopped') or
                row.get('resource_reason') not in (None,'admission_disk_headroom','admission_memory_headroom') or
                (row.get('returncode') is not None and type(row['returncode']) is not int)):
                raise RuntimeError('runtime observation source/scope differs')
            runtime={k:row.get(k) for k in ('phase','operation','updated_at','resource_reason','returncode')}
    return {'observed_at':time.time(),'file_observation_only':True,'activation':'registered_file_observation',
        'study':str(study),'original_study':c['parent_study'],'baseline_is_placeholder':True,
        'goal_owner':{k:pointer.get(k) for k in ('epoch','phase','updated_at','root_proved')},
        'validation_seconds':protocol['validation_seconds'],'future_epoch_validation_seconds':1800,
        'runtime_file_observation':runtime,'coordinator_source_sha256':binding['owner_source']['sha256'],'research_runtime_source_sha256':binding['runtime_source']['sha256'],
        'admission_source_sha256':binding['admission_source']['sha256'],
        'arms':o.O.C.public_study(study,c,old['transition']),
        'scientific_status':'revised_source_history_no_causal_learning_claim','prior_setup_replayed':False}

if __name__=='__main__':print(json.dumps(status(),sort_keys=True))
