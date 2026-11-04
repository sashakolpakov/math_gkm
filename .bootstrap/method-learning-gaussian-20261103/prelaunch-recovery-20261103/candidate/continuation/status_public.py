"""INACTIVE read-only revision-aware Gaussian status; file observations only."""
import importlib.util
import json
from pathlib import Path
import re
import time
HERE=Path(__file__).resolve().parent
ROOT=Path('/Users/sasha/math_gkm')
ORIGINAL=ROOT/'.scratch/studies/method-learning-gaussian-20261103'
CONTRACT='a9802e5423169618ba4e9c4e2cac3003e86e6133a441b6f91abdc00f97745e49'
LEGACY=ROOT/'.bootstrap/method-learning-gaussian-20261103/status_public.py'
LEGACY_SHA='686127a98fb4d285f677fe5793db7a006f5ade8cf7ca0dcaaebf584a2e5490b9'

def load(path,name):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

def study_path(value):
    p=Path(value)
    if (not p.is_absolute() or p.resolve()!=p or p.parent!=ROOT/'.scratch/studies' or
        (p!=ORIGINAL and not re.fullmatch(r'method-learning-gaussian-20261103-revision-epoch-[0-9]{4,}',p.name))):
        raise RuntimeError('status escaped Gaussian goal campaign')
    return p

def status(base=HERE):
    base=Path(base);binding=base/'REGISTRATION.json'
    if not binding.exists():
        import hashlib
        if hashlib.sha256(LEGACY.read_bytes()).hexdigest()!=LEGACY_SHA:raise RuntimeError('historical reader changed')
        import contextlib,io
        m=load(LEGACY,'historical_gaussian_status');out=io.StringIO()
        with contextlib.redirect_stdout(out):m.main()
        result=json.loads(out.getvalue())
        result['revision_continuation_activation']='not_activated';return result
    # Registration/configuration are explicitly public operator metadata.
    from hashlib import sha256
    reg=json.loads(binding.read_bytes())
    if (reg.get('schema')!='math-gkm.gaussian-revision-status-registration.v1' or reg.get('approved') is not True or
        reg.get('status_source_sha256')!=sha256(Path(__file__).read_bytes()).hexdigest()):
        raise RuntimeError('reader source qualification differs')
    reference=reg.get('owner_source',{});path=Path(reference.get('path',''))
    if path!=base/'owner.py' or sha256(path.read_bytes()).hexdigest()!=reference.get('sha256'):raise RuntimeError('owner source changed')
    o=load(path,'revision_status_owner');c=o.public_json(o.reference(reg['config']))
    if c.get('owner_source_sha256')!=reference['sha256'] or c.get('contract_sha256')!=CONTRACT:raise RuntimeError('goal/source configuration changed')
    o.reference(c['history_source']);transition=o.verify_revision(c,initial=False,native_checks=False)
    output=Path(reg['output'])
    if not output.is_absolute() or not output.resolve().is_relative_to(ROOT):raise RuntimeError('owner output escaped')
    current=output/'CURRENT.json'
    pointer=o.public_json(current) if current.exists() else dict(epoch=0,phase='waiting_owner_start',root_proved=False,
        updated_at=None,current_study=c['parent_study'],parent_study=c['parent_study'])
    if current.exists() and (pointer.get('schema')!=o.CURRENT_SCHEMA or
        pointer.get('owner_source_sha256')!=reference['sha256'] or pointer.get('contract_sha256')!=CONTRACT or
        pointer.get('revision_finished_sha256')!=c['revision_finished']['sha256'] or
        pointer.get('parent_study')!=c['parent_study']):raise RuntimeError('current owner observation differs')
    epoch=pointer.get('epoch')
    if type(epoch) is not int or epoch<0:raise RuntimeError('invalid epoch observation')
    study=study_path(pointer['current_study'])
    if (epoch==0 and study!=ORIGINAL) or (epoch>0 and int(study.name.rsplit('-',1)[-1])!=epoch):raise RuntimeError('epoch path differs')
    e=o.projection();profile=e.select(e.fields(o.raw(study/'protocol.json')),('validation_seconds','rounds','model','call_seconds'))
    return {'observed_at':time.time(),'study':str(study),'original_study':str(ORIGINAL),'file_observation_only':True,
        'goal_owner':{k:pointer.get(k) for k in ('epoch','phase','updated_at','root_proved')},
        'validation_seconds':profile['validation_seconds'],'future_epoch_validation_seconds':1800,
        'arms':o.public_study(study,transition['grant']),'baseline_is_placeholder':study!=ORIGINAL,
        'scientific_status':'revised_source_history_no_causal_learning_claim',
        'revision_continuation_activation':'registered_file_observation'}

if __name__=='__main__':print(json.dumps(status(),sort_keys=True))
