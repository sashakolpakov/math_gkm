"""Qualified public observations for the longer-validation Gaussian owner.

This reader never establishes process liveness or mathematical completion.
Research and evaluator payloads are lexically projected, never JSON decoded.
"""
import hashlib
import importlib.util
import json
import math
from pathlib import Path
import re
import time

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
OPS=ROOT/'.bootstrap/method-learning-gaussian-20261103'
ORIGINAL=ROOT/'.scratch/studies/method-learning-gaussian-20261103'
PARSER=ROOT/'.bootstrap/gaussian-native-operator-20261031/public_json_projection.py'
PARSER_SHA='5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec'
LEGACY_READER_SHA='686127a98fb4d285f677fe5793db7a006f5ade8cf7ca0dcaaebf584a2e5490b9'
CONTRACT_SHA='a9802e5423169618ba4e9c4e2cac3003e86e6133a441b6f91abdc00f97745e49'
IMPLEMENTATION_SHA='71adccc13e32484c2efcd1b002d6786f61d4570f65c8344dd26dc84171af19e5'
EPOCH_SHA='ccce0ae7147894b20b3b5afa6911a1fc334ef35bebab2bc286cd11911adf5e9d'
QUALIFIED_SCHEMA='math-gkm.gaussian-continuation1800-qualified.v1'
CONFIG_SCHEMA='math-gkm.gaussian-validation1800-owner.v1'
CURRENT_SCHEMA='math-gkm.gaussian-goal-current-1800.v1'


def raw(path,cap=1024**2):
    path=Path(path)
    if path.is_symlink() or not path.is_file() or path.stat().st_size>cap:
        raise RuntimeError('bounded regular public artifact required')
    return path.read_bytes()


def sha(path):return hashlib.sha256(raw(path,32*1024**2)).hexdigest()


def public(path):
    result=json.loads(raw(path))
    if not isinstance(result,dict):raise RuntimeError('public object required')
    return result


def reference(value):
    if not isinstance(value,dict) or set(value)!={'path','sha256'}:
        raise RuntimeError('typed public reference required')
    path=Path(value['path'])
    if not path.is_absolute() or not path.resolve().is_relative_to(ROOT.resolve()):
        raise RuntimeError('public reference escaped repository')
    if sha(path)!=value['sha256']:raise RuntimeError('public reference changed')
    return path


def local(base,name):
    relative=Path(name)
    if relative.is_absolute() or '..' in relative.parts or not relative.parts:
        raise RuntimeError('qualified source path escaped')
    path=base/relative
    if not path.resolve().is_relative_to(base.resolve()):raise RuntimeError('qualified source alias escaped')
    return path


def qualification(base):
    q=public(base/'QUALIFIED.json')
    hashes=q.get('source_hashes')
    if (q.get('schema')!=QUALIFIED_SCHEMA or q.get('approved') is not True or
        q.get('contract_sha256')!=CONTRACT_SHA or q.get('implementation_sha256')!=IMPLEMENTATION_SHA or
        not isinstance(hashes,dict) or not {'owner.py','transition.py','watch_transition.py','funding_profile.py','finalize.py','status_public.py','successor-profile.json'}<=set(hashes) or
        len(hashes)>100):raise RuntimeError('long-validation source qualification missing')
    for name,expected in hashes.items():
        if not isinstance(name,str) or sha(local(base,name))!=expected:
            raise RuntimeError('qualified source changed')
    if sha(__file__)!=hashes['status_public.py']:raise RuntimeError('reader source changed')
    if q.get('profile_sha256')!=hashes['successor-profile.json']:
        raise RuntimeError('qualified profile binding differs')
    for key,success in (('review','approved'),('tests','passed')):
        value=q.get(key)
        if not isinstance(value,dict) or set(value)!={'file','sha256'}:
            raise RuntimeError('qualified evidence reference missing')
        path=local(base,value['file'])
        if sha(path)!=value['sha256']:raise RuntimeError('qualified evidence changed')
        evidence=public(path)
        if evidence.get(success) is not True or evidence.get('source_hashes')!=hashes:
            raise RuntimeError('qualified evidence belongs to another source bundle')
    return q


def study_path(value,*,new=False):
    if not isinstance(value,str):raise RuntimeError('study path missing')
    path=Path(value);parent=ROOT/'.scratch/studies'
    expression=('method-learning-gaussian-20261103-v1800-epoch-[0-9]{4,}' if new else
                'method-learning-gaussian-20261103-epoch-[0-9]{4,}')
    if (not path.is_absolute() or path.is_symlink() or path.resolve().parent!=parent.resolve() or
        (path!=ORIGINAL and not re.fullmatch(expression,path.name))):
        raise RuntimeError('status pointer escaped Gaussian campaign')
    return path


def selection(base,q):
    config=base/'CONFIG.json'
    if not config.exists():
        path=OPS/'status_public.py'
        if sha(path)!=LEGACY_READER_SHA:raise RuntimeError('historical reader changed')
        spec=importlib.util.spec_from_file_location('qualified_gaussian_legacy_status',path)
        module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
        study,owner=module.selected_study()
        return study_path(str(study)),owner,'not_activated'
    c=public(config)
    if (c.get('schema')!=CONFIG_SCHEMA or c.get('owner_source_sha256')!=q['source_hashes']['owner.py'] or
        c.get('contract_sha256')!=CONTRACT_SHA or c.get('implementation_sha256')!=IMPLEMENTATION_SHA or
        c.get('profile_sha256')!=q['profile_sha256'] or
        Path(c.get('profile_path','')).resolve()!=(base/'successor-profile.json').resolve()):
        raise RuntimeError('new owner configuration differs from qualification')
    if sha(base/'successor-profile.json')!=c['profile_sha256']:
        raise RuntimeError('successor profile changed')
    profile=public(base/'successor-profile.json')
    if profile.get('validation_seconds')!=1800:raise RuntimeError('unexpected validation budget')
    for key in ('epoch_source','finalization_source','transition_source','funding_source','transition_binding','transition_receipt'):
        reference(c.get(key))
    for key,name in (('transition_source','transition.py'),('funding_source','funding_profile.py'),('finalization_source','finalize.py')):
        if (reference(c[key]).resolve()!=(base/name).resolve() or
            c[key]['sha256']!=q['source_hashes'][name]):
            raise RuntimeError('owner source differs from qualification')
    if (reference(c['epoch_source']).resolve()!=(OPS/'continuation/epoch.py').resolve() or
        c['epoch_source']['sha256']!=EPOCH_SHA):
        raise RuntimeError('original epoch migration source differs')
    parent=study_path(c.get('parent_study'))
    pointer=base/'runtime/CURRENT.json'
    if not pointer.exists():
        return parent,{'epoch':0,'phase':'waiting_new_owner_start','updated_at':None,'root_proved':False},'qualified_transition_without_owner_observation'
    current=public(pointer)
    epoch=current.get('epoch');updated=current.get('updated_at')
    if (current.get('schema')!=CURRENT_SCHEMA or type(epoch) is not int or epoch<0 or
        type(current.get('root_proved')) is not bool or type(updated) not in (int,float) or
        not math.isfinite(updated) or updated<=0 or
        not isinstance(current.get('phase'),str) or not 0<len(current['phase'])<=120 or
        current.get('owner_source_sha256')!=c['owner_source_sha256'] or
        current.get('profile_sha256')!=c['profile_sha256'] or
        current.get('contract_sha256')!=CONTRACT_SHA or
        current.get('transition_receipt_sha256')!=c['transition_receipt']['sha256'] or
        current.get('parent_study')!=str(parent) or current.get('original_comparison_study')!=str(ORIGINAL) or
        current.get('migration_first') is not True):raise RuntimeError('new current pointer qualification differs')
    study=study_path(current.get('current_study'),new=epoch>0)
    if epoch==0 and study!=parent:raise RuntimeError('bootstrap pointer changed parent')
    if epoch>0 and (study==ORIGINAL or int(study.name.rsplit('-',1)[1])!=epoch):
        raise RuntimeError('successor epoch pointer differs')
    owner={key:current[key] for key in ('epoch','phase','updated_at','root_proved')}
    owner['validation_seconds']=1800
    return study,owner,'new_owner_observation'


def projection():
    if sha(PARSER)!=PARSER_SHA:raise RuntimeError('lexical projection changed')
    spec=importlib.util.spec_from_file_location('qualified_gaussian_public_projection',PARSER)
    e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);return e


def arms(study,e):
    result={}
    for mode in ('baseline','exploration'):
        path=study/'arms'/mode/'state.json'
        if not path.exists():result[mode]={'status':'not_frozen'};continue
        envelope=e.fields(raw(path,32*1024**2).strip());body=envelope['state']
        if e.select(envelope,('sha256',))['sha256']!=hashlib.sha256(body).hexdigest():
            raise RuntimeError('study state integrity differs')
        fields=e.fields(body)
        row=e.select(fields,('round','phase','status','calls','meta_calls','seconds','failures','policy_trials'))
        for key in ('active','active_intent','resolution'):row[key+'_is_null']=fields.get(key,b'null')==b'null'
        research=e.fields(fields['research'])
        row['knowledge_count']=len(e.fields(research.get('knowledge',b'{}')))
        row['component_count']=len(e.fields(research.get('components',b'{}')))
        row['source_state_sha256']=hashlib.sha256(body).hexdigest()
        row['state_file_modified_at']=path.stat().st_mtime
        result[mode]=row
    return result


def status(base=HERE):
    base=Path(base);q=qualification(base);study,owner,activation=selection(base,q);e=projection()
    return {'observed_at':time.time(),'study':str(study),'original_study':str(ORIGINAL),
        'goal_owner':owner,'activation':activation,'file_observation_only':True,
        'baseline_is_placeholder':study!=ORIGINAL,'arms':arms(study,e),
        'historical_comparison':({'study':str(ORIGINAL),'arms':arms(ORIGINAL,e)} if study!=ORIGINAL else None)}


if __name__=='__main__':print(json.dumps(status(),sort_keys=True))
