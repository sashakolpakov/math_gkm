"""INACTIVE source-qualified read-only paid-curation-adoption observations."""
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
    if not registration.exists():return {'activation':'not_registered','file_observation_only':True,'observed_at':time.time()}
    reg=json.loads(registration.read_bytes());source=base/'owner.py'
    if (reg.get('schema')!='math-gkm.gaussian-paid-curation-status-registration.v1' or reg.get('approved') is not True or
        reg.get('status_source_sha256')!=hashlib.sha256(Path(__file__).read_bytes()).hexdigest() or
        reg.get('owner_source')!={'path':str(source),'sha256':hashlib.sha256(source.read_bytes()).hexdigest()}):
        raise RuntimeError('paid-curation reader or owner source changed')
    o=load(source,'gaussian_paid_curation_status_owner');outer=o.public_json(o.reference(reg['config']))
    c=o.configuration(outer,initial=False,native_checks=False);transition=o.verify_adoption(c,initial=False,native_checks=False)
    if c['owner_source_sha256']!=reg['owner_source']['sha256']:raise RuntimeError('paid-adoption configuration/source differs')
    output=Path(reg['output'])
    if not output.is_absolute() or not output.resolve().is_relative_to(ROOT):raise RuntimeError('paid-adoption output escaped')
    current=output/'CURRENT.json'
    if current.exists():
        pointer=o.public_json(current)
        if (pointer.get('schema')!=o.CURRENT_SCHEMA or pointer.get('owner_source_sha256')!=c['owner_source_sha256'] or
            pointer.get('contract_sha256')!=c['contract_sha256'] or pointer.get('revision_finished_sha256')!=c['revision_finished']['sha256'] or
            pointer.get('adoption_handoff_sha256')!=c['adoption_handoff']['sha256'] or pointer.get('parent_study')!=str(ORIGINAL)):
            raise RuntimeError('paid-adoption current observation differs')
    else:pointer={'epoch':0,'phase':'waiting_owner_start','updated_at':None,'root_proved':False,'current_study':str(ORIGINAL)}
    epoch=pointer.get('epoch');study=Path(pointer['current_study'])
    if (type(epoch) is not int or epoch<0 or not study.is_absolute() or study.resolve()!=study or study.parent!=ROOT/'.scratch/studies' or
        (epoch==0 and study!=ORIGINAL) or (epoch>0 and not re.fullmatch(o.DESTINATION_PREFIX+r'[0-9]{4,}',study.name)) or
        (epoch>0 and int(study.name.rsplit('-',1)[-1])!=epoch)):
        raise RuntimeError('paid-adoption study or epoch escaped')
    e=o.projection();protocol=e.select(e.fields(o.raw(study/'protocol.json')),('validation_seconds','rounds'))
    return {'observed_at':time.time(),'study':str(study),'original_study':str(ORIGINAL),'file_observation_only':True,
        'goal_owner':{k:pointer.get(k) for k in ('epoch','phase','updated_at','root_proved')},
        'validation_seconds':protocol['validation_seconds'],'future_epoch_validation_seconds':1800,
        'arms':o.S.public_study(study,c,transition),'baseline_is_placeholder':epoch>0,
        'scientific_status':'revised_source_history_no_causal_learning_claim','activation':'registered_file_observation',
        'adoption_handoff_sha256':c['adoption_handoff']['sha256'],'paid_curation_reused':True}

if __name__=='__main__':print(json.dumps(status(),sort_keys=True))
