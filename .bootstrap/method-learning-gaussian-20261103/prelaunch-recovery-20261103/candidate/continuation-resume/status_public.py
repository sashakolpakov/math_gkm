"""INACTIVE read-only status for an explicitly resumed closed owner."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import time
ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
ORIGINAL=ROOT/'.scratch/studies/method-learning-gaussian-20261103'

def load(path,name):
    spec=importlib.util.spec_from_file_location(name,path);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module

def status(base=HERE):
    base=Path(base);registration=base/'REGISTRATION.json'
    if not registration.exists():
        return {'file_observation_only':True,'activation':'not_registered','observed_at':time.time()}
    reg=json.loads(registration.read_bytes());owner_path=base/'owner.py'
    if (reg.get('schema')!='math-gkm.gaussian-closed-resume-status-registration.v1' or reg.get('approved') is not True or
        reg.get('status_source_sha256')!=hashlib.sha256(Path(__file__).read_bytes()).hexdigest() or
        reg.get('owner_source')!={'path':str(owner_path),'sha256':hashlib.sha256(owner_path.read_bytes()).hexdigest()}):
        raise RuntimeError('closed-resume reader or owner source differs')
    o=load(owner_path,'gaussian_closed_resume_status_owner')
    outer=o.public_json(o.reference(reg['config']));c=o.configuration(outer,initial=False,native_checks=False)
    if outer.get('owner_source_sha256')!=reg['owner_source']['sha256']:raise RuntimeError('closed-resume configuration/source differs')
    transition=o.verify_handoff(c,initial=False,native_checks=False)
    output=Path(reg['output'])
    if not output.is_absolute() or not output.resolve().is_relative_to(ROOT):raise RuntimeError('owner output escaped')
    current=output/'CURRENT.json'
    if current.exists():
        pointer=o.public_json(current)
        if (pointer.get('schema')!=o.CURRENT_SCHEMA or pointer.get('owner_source_sha256')!=outer['owner_source_sha256'] or
            pointer.get('contract_sha256')!=c['contract_sha256'] or pointer.get('revision_finished_sha256')!=c['revision_finished']['sha256'] or
            pointer.get('resume_handoff_sha256')!=c['resume_handoff']['sha256'] or pointer.get('parent_study')!=str(ORIGINAL)):
            raise RuntimeError('closed-resume current observation differs')
    else:pointer={'epoch':0,'phase':'waiting_owner_start','updated_at':None,'root_proved':False,'current_study':str(ORIGINAL)}
    epoch=pointer.get('epoch');study=Path(pointer['current_study'])
    if (type(epoch) is not int or epoch<0 or not study.is_absolute() or study.resolve()!=study or study.parent!=ROOT/'.scratch/studies' or
        (epoch==0 and study!=ORIGINAL) or (epoch>0 and not re.fullmatch(o.DESTINATION_PREFIX+r'[0-9]{4,}',study.name)) or
        (epoch>0 and int(study.name.rsplit('-',1)[-1])!=epoch)):
        raise RuntimeError('closed-resume study/epoch escaped unchanged campaign')
    e=o.projection();protocol=e.select(e.fields(o.raw(study/'protocol.json')),('validation_seconds','rounds'))
    return {'observed_at':time.time(),'study':str(study),'original_study':str(ORIGINAL),'file_observation_only':True,
        'goal_owner':{k:pointer.get(k) for k in ('epoch','phase','updated_at','root_proved')},
        'validation_seconds':protocol['validation_seconds'],'future_epoch_validation_seconds':1800,
        'arms':o.public_study(study,c,transition),'baseline_is_placeholder':epoch>0,
        'scientific_status':'revised_source_history_no_causal_learning_claim',
        'resume_handoff_sha256':c['resume_handoff']['sha256'],'activation':'registered_file_observation'}

if __name__=='__main__':print(json.dumps(status(),sort_keys=True))
