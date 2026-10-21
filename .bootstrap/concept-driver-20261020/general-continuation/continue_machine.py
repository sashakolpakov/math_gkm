"""Bounded operations-only continuation of exploration's own universal-root research.

This module adds no mathematics and never uses baseline knowledge. One explicitly
authorized maintenance branches repair role TMPDIR permission and expand only the
trusted dependency-edge capacity, preserving every historical implementation identity. An independently reviewed, single-consumption supervisor waits for
the official resumed parent, then funds at most eight fresh finite epochs.
"""
import argparse
import base64
import copy
import contextlib
import fcntl
import hashlib
import importlib
import json
import os
import re
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT=Path(__file__).resolve().parents[3]
OPS=Path(__file__).resolve().parent
RESUME=OPS.parent/'resume-general-0002'
ORIGINAL_RESUME=OPS.parent/'resume-general'
FINALIZATION=OPS.parent/'failed-round-finalization'
INITIAL_PARENT=ROOT/'.scratch/concept-driver-20261020-study-0001'
FROZEN_PAIR=INITIAL_PARENT
MODEL_SECONDS=1800
VALIDATION_SECONDS=900
ARM_ALLOWANCE_SECONDS=180000
ADDITIONAL_ROUNDS=4
MAX_EPOCHS=8
OPERATOR_SECONDS=120*3600
CLEANUP_SECONDS=1900
SETUP_SECONDS=1800
LOG_LIMIT=8*1024**2
MIGRATION_CAP=768*1024**2
PYTHON='/opt/homebrew/bin/python3'
EXPECTED_IMPL='66e3aa3f8dddeaafde8456e46b3636fb23f3737128ce53020e847319db3368ff'
NEW_IMPL='7772dfefd0e76d355edbdcd1a1414a4fcaccb7ec1aa0d298de99b8d7e1f84aa3'
OLD_WORKER='569f2531e6bf310a7260ea4c6b7574171fd72ea783bfec895c0ba7dfac99a80d'
NEW_WORKER='d605eb833614df50c3782862430dbeb8a550b3b8c248adde19fa211254e1cf76'
SOURCE_ARCHIVE=ROOT/'evidence/concept-driver-source-20261020/source'
MAINTENANCE_PARENT=ROOT/'.scratch/concept-driver-20261020-follow-000004'
MAINTENANCE_DESTINATION=ROOT/'.scratch/concept-driver-20261020-follow-000005'
CAPACITY_PARENT=ROOT/'.scratch/concept-driver-20261020-follow-000005'
CAPACITY_DESTINATION=ROOT/'.scratch/concept-driver-20261020-follow-000006'
CAPACITY_IMPL='bac1b8f622077e362fc2d078e87bab3bad4114882700d722b09498f3481878fa'
CAPACITY_CHANGES={'machinery/inspection_stream.py': ('cb0ff86634236920531ea15f5151ad94ad0782a908ead12ce88f83ee647c4ab3',
                                    '217715dbf3d302fc7097bca8442afd8323af643c406eb67f6bd3947e52b2ffd7',
                                    ((b'def program(module, declarations, required, catalog_modules, nonce):\n',
                                      b'def program(module, declarations, required, catalog_modules, nonce):\n   '
                                      b' from .proof_audit import EDGE_LIMIT\n'),
                                     (b'          if edges >= 200000 then fail "dependency_edge_limit"\n',
                                      b'          if edges >= {EDGE_LIMIT} then fail "dependency_edge_limit"\n'))),
 'machinery/proof_audit.py': ('1c836ec67bdd37ce05dc80d35a34d5d9cf4b526c552afc2f5e83d653323753ba',
                              '5a9f763b5058ec5b01e38d0a7892d072fada04039ba03c23b6cc4fb44e81cc18',
                              ((b'DECL_LIMIT = WORK_LIMIT = 200000\n',
                                b'DECL_LIMIT = WORK_LIMIT = 200000\nEDGE_LIMIT = 2000000\n'),
                               (b'            for n in (nodes,edges,duplicates): _nat(n,WORK_LIMIT)\n',
                                b'            _nat(nodes,WORK_LIMIT)\n            for n in (edges,duplicates): '
                                b'_nat(n,EDGE_LIMIT)\n'))),
 'machinery/own_feedback.py': ('1d5bda9d3ce3f4957b13e7f5efcf554ef3ae059d802500465042f50ff30a8d69',
                               'fa9c5d77b1a6d6093fac3f85f27467ea3fdd57f464a0cc60f1feb2baa8f4772a',
                               ((b'    from .proof_audit import InspectionFailure\n',
                                 b'    from .proof_audit import InspectionFailure, EDGE_LIMIT\n'),
                                (b"    if category=='dependency_edge_limit': measured['limit_edges']=200000\n",
                                 b"    if category=='dependency_edge_limit': measured['limit_edges']=EDGE_LIMIT"
                                 b'\n')))}
REQUEST_CONTEXT_STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000006'
REQUEST_CONTEXT_IMPL='590648a8eb6c9ee626c63077cbdbd7963aa53d946ceac9cfe3f73e4591b63b7d'
REQUEST_CONTEXT_FILES={'machinery/study.py': ('037caafc4def94e50b2749999e313ed3c45152551aa794ffa19de2b751181064', '21d229d19485d78152792f349f13a343ca7b3a6b11b12933ed59054b8c9b18ed'), 'machinery/study_context.py': (None, '3ceac2970a7c85e3bc8db8eec5613cb9e31f44e0a3d6093d993f6e2c51990d94'), 'machinery/study_policy.py': ('902eebdcbfc10de78ae6fc5d2df92e0e6b5f1e330975491149559655d578b38a', '35c832306d3b445304745a254c3973ea0b07dce663e76e3613731b13a3b56432'), 'machinery/study_worker.py': ('d605eb833614df50c3782862430dbeb8a550b3b8c248adde19fa211254e1cf76', '8535b04376c51634bcbafd449c7946346877f545423a68dee1a3095cc828bdbd')}

EXPECTED_CONTRACT='564b2659c941bcf76484bcf20de5dfc4808c9379306f773d1642748e2a02c91d'
EXPECTED_SUITE='88e05a48bac42ae11db2a12c2c748b03eac9904e8782fd5b5e52ebf8f3c641d1'
GOAL='Continue autonomous research toward the unchanged exact universal root, not a partial log-concavity family.'
COPY_GUARD=None
INTERRUPTED=None
API=None
REVIEW_PATH=None
DEADLINE=None

def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda:stream.read(1024**2),b''): h.update(block)
    return h.hexdigest()


def canonical(value):
    return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False)


def digest(value):
    return hashlib.sha256(canonical(value).encode()).hexdigest()


def read(path):
    path=Path(path)
    if path.stat().st_size>64*1024**2: raise RuntimeError('oversize operational input')
    return json.loads(path.read_text())


def write(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    temp=path.with_name(path.name+'.next')
    with temp.open('w') as out:
        out.write(canonical(value)+'\n');out.flush();os.fsync(out.fileno())
    os.replace(temp,path)
    fd=os.open(path.parent,os.O_RDONLY)
    try: os.fsync(fd)
    finally: os.close(fd)


def api():
    global API
    if API is None:
        sys.path.insert(0,str(ROOT))
        from machinery import study,study_common,study_observer,study_knowledge,validation_receipts,resources,study_discoveries
        API=dict(study=study,common=study_common,observer=study_observer,
                 knowledge=study_knowledge,receipts=validation_receipts,resources=resources,discoveries=study_discoveries)
    return API


def safe_relative(name):
    p=Path(name)
    if p.is_absolute() or not p.parts or '..' in p.parts:
        raise RuntimeError('unsafe inherited relative path')
    return p


class CopyGuard:
    """Bounded supervisor copy, no child and no compiled artifacts."""
    def __init__(self,planned_bytes,resources):
        if planned_bytes>MIGRATION_CAP: raise RuntimeError('cumulative migration retention cap')
        self.planned=planned_bytes;self.copied=0;self.next_check=0;self.resources=resources
        self.check(0)
    def check(self,added):
        controls()
        self.copied+=added
        if self.copied>MIGRATION_CAP: raise RuntimeError('cumulative migration byte cap')
        if self.copied>=self.next_check:
            self.resources.headroom(self.resources.limits())
            import shutil
            if shutil.disk_usage(ROOT).free < self.resources.limits()['admit_free']+max(0,self.planned-self.copied):
                raise RuntimeError('migration reserved disk headroom')
            self.next_check=self.copied+8*1024**2


def tree_files(directory):
    directory=Path(directory);result=[]
    for folder,dirs,files in os.walk(directory,followlinks=False):
        for name in dirs:
            if (Path(folder)/name).is_symlink(): raise RuntimeError('migration directory alias')
        for name in files:
            p=Path(folder)/name
            if p.is_symlink(): raise RuntimeError('migration file alias')
            result.append(p)
            if len(result)>20000: raise RuntimeError('migration inventory file cap')
    return result


def planned_copy_bytes(old_arm,old):
    common=api()['common'];workspace=old_arm/'workspace'
    total=sum((workspace/n).stat().st_size for n in common.inventory(workspace))
    total+=sum(p.stat().st_size for p in tree_files(workspace/'history'))
    # Retain one exact historical snapshot view; round names remain usable by reviews.
    for snapshot in (old_arm/'snapshots').iterdir():
        if snapshot.is_dir() and not snapshot.name.endswith('.staging'):
            manifest=common.verify_snapshot(snapshot)
            total+=sum((snapshot/'source'/n).stat().st_size for n in manifest['files'])+(snapshot/'manifest.json').stat().st_size
    for group in ('knowledge','components'):
        for record in old['research'][group].values():
            base=Path(record['validation_bundle']['directory']);finished=read(base/'FINISHED.json')
            total+=(base/'FINISHED.json').stat().st_size+sum((base/safe_relative(n)).stat().st_size for n in finished['files'])
    for entry in old['research'].get('pending_discoveries',{}).values():
        job=old_arm/'jobs'/entry['core']['origin']['job_key']
        total+=sum((job/n).stat().st_size for n in ('spec.json','receipt.json'))
        total+=sum((workspace/n).stat().st_size for n in entry['source_paths'].values())
        total+=(workspace/entry['manifest']).stat().st_size
        if entry['core']['kind']!='completion':
            base=Path(entry['core']['record']['validation_bundle']['directory']);finished=read(base/'FINISHED.json')
            total+=(base/'FINISHED.json').stat().st_size+sum((base/safe_relative(n)).stat().st_size for n in finished['files'])
    # Extra allowance covers successor initial snapshot and seed placeholders.
    total+=sum((workspace/n).stat().st_size for n in common.inventory(workspace))+(old_arm/'state.json').stat().st_size+16*1024**2
    if total>MIGRATION_CAP: raise RuntimeError('cumulative migration retention cap')
    return total


def copy_snapshots(old_arm,arm):
    """Preserve every frozen view once, without duplicating round archives."""
    common=api()['common'];inherited={}
    for source in sorted((old_arm/'snapshots').iterdir()):
        if source.is_dir() and not source.name.endswith('.staging'):
            manifest=common.verify_snapshot(source)
            container=arm/'snapshots' if source.name.startswith('round-') else arm/'inherited/snapshots'
            destination=container/source.name
            for name,expected in manifest['files'].items():
                copy_file(source/'source'/safe_relative(name),destination/'source'/safe_relative(name),expected)
            copy_file(source/'manifest.json',destination/'manifest.json')
            common.verify_snapshot(destination);inherited[source.name]=manifest['binding']
    return inherited


def copy_file(source,destination,expected=None,replace=False):
    source,destination=Path(source),Path(destination)
    if source.is_symlink() or not source.is_file(): raise RuntimeError('nonregular inherited source')
    actual=sha(source)
    if expected is not None and actual!=expected: raise RuntimeError('inherited source changed')
    if destination.exists() or destination.is_symlink():
        if destination.is_symlink(): raise RuntimeError('destination alias forbidden')
        if sha(destination)==actual: return
        if not replace: raise RuntimeError('inherited destination collision')
    destination.parent.mkdir(parents=True,exist_ok=True)
    temp=destination.with_name(destination.name+'.copying')
    with source.open('rb') as inp,temp.open('xb') as out:
        for block in iter(lambda:inp.read(1024**2),b''):
            if COPY_GUARD: COPY_GUARD.check(len(block))
            out.write(block)
        out.flush();os.fsync(out.fileno())
    if sha(temp)!=actual: raise RuntimeError('inherited copy mismatch')
    os.replace(temp,destination)


def copy_closed_bundle(source,destination,record,reuse):
    source,destination=Path(source),Path(destination)
    marker=source/'FINISHED.json'
    if sha(marker)!=record['validation_bundle']['finished_sha256']:
        raise RuntimeError('validator marker changed')
    # Verifier checks the actual original before any copy; no compiler is run.
    result=reuse(source,record['task'],record['solution'],record['task'].get('required_constants',[]))
    if digest(result)!=record['receipt_hash']: raise RuntimeError('validator result changed')
    finished=read(marker)
    if len(finished['files'])>10000: raise RuntimeError('validator file bound')
    total=0
    for name,expected in finished['files'].items():
        relative=safe_relative(name)
        if 'build' in relative.parts: raise RuntimeError('unexpected bound build artifact')
        total+=(source/relative).stat().st_size
        if total>256*1024**2: raise RuntimeError('validator size bound')
        copy_file(source/relative,destination/relative,expected)
    copy_file(marker,destination/'FINISHED.json',record['validation_bundle']['finished_sha256'])
    migrated=copy.deepcopy(record)
    migrated['validation_bundle']['directory']=str(destination.resolve())
    fresh=reuse(destination,record['task'],record['solution'],record['task'].get('required_constants',[]))
    if digest(fresh)!=record['receipt_hash']: raise RuntimeError('relocated validator result changed')
    return migrated


def copy_history(source,destination):
    """Only closed main-source history, not role/evaluator trees or caches."""
    source,destination=Path(source),Path(destination)
    total=count=0
    for directory,dirs,files in os.walk(source,followlinks=False):
        for name in dirs:
            if (Path(directory)/name).is_symlink(): raise RuntimeError('history alias forbidden')
        for name in files:
            path=Path(directory)/name
            if path.is_symlink(): raise RuntimeError('history alias forbidden')
            relative=path.relative_to(source)
            context=relative.parts[0]=='context'
            if context:
                if (len(relative.parts)!=2 or not re.fullmatch(r'[0-9a-f]{64}\.json',relative.name) or
                    path.stat().st_size>8*1024**2 or sha(path)!=relative.stem or
                    read(path).get('role') not in ('proposer','researcher')):
                    raise RuntimeError('invalid own context history')
            if relative.parts[0] not in ('objects','manifests','own-checks','context') and not (
                    len(relative.parts)==1 and relative.name.startswith('round-') and relative.suffix=='.json'):
                raise RuntimeError('unknown history provenance; preserve parent and stop')
            size=path.stat().st_size;total+=size;count+=1
            if size>32*1024**2 or total>256*1024**2 or count>10000:
                raise RuntimeError('inherited history bound')
            copy_file(path,destination/relative)
            if context:(destination/relative).chmod(0o444)



def copy_pending(a,old_arm,old_ws,arm,workspace,research,key):
    """Preserve quarantine without admitting or changing its immutable identity."""
    from types import SimpleNamespace
    entry=research['pending_discoveries'][key]
    origin=entry['core']['origin'];job_key=origin['job_key']
    if len(Path(job_key).parts)!=1 or safe_relative(job_key)!=Path(job_key):
        raise RuntimeError('unsafe pending origin job key')
    oldjob=old_arm/'jobs'/job_key;newjob=arm/'jobs'/job_key
    spec=a['common'].read(oldjob/'spec.json');receipt=a['common'].read(oldjob/'receipt.json')
    if spec.get('role')!='researcher' or receipt.get('role')!='researcher' or receipt.get('outcome')!='completed':
        raise RuntimeError('nonresearch or unfinished pending origin')
    a['discoveries'].verify(SimpleNamespace(root=old_arm,mode='exploration'),research,old_ws,key)
    for name in ('spec.json','receipt.json'):copy_file(oldjob/name,newjob/name)
    for name,relative in entry['source_paths'].items():
        copy_file(old_ws/relative,workspace/relative,entry['core']['source_files'][name])
    copy_file(old_ws/entry['manifest'],workspace/entry['manifest'])
    dependency=None
    if entry['core']['kind']!='completion':
        record=entry['core']['record'];source=Path(record['validation_bundle']['directory'])
        destination=arm/'inherited/pending-validators'/key
        copy_closed_bundle(source,destination,record,a['receipts'].reuse)
        # core is immutable and names its exact retained origin. Original parent
        # bundles MUST remain present until paid main rechecking removes the need.
        dependency=dict(binding=key,origin_bundle=str(source),preserved_clone=str(destination),
            finished_sha256=record['validation_bundle']['finished_sha256'])
    return dict(path=str(newjob),key=job_key,receipt_hash=digest(receipt),
                inherited_elapsed_seconds=receipt.get('elapsed_seconds',0)),dependency


def dedupe_inherited_jobs(jobs):
    result={}
    for job in jobs:
        path=job['path']
        if path in result and result[path]!=job:
            raise RuntimeError('conflicting inherited origin receipt metadata')
        result[path]=job
    return list(result.values())


def mark_inherited_consumed(state,jobs):
    jobs=dedupe_inherited_jobs(jobs)
    state['receipts']=[j['path'] for j in jobs]
    state['receipt_hashes']={j['path']:j['receipt_hash'] for j in jobs}
    state['counted_jobs']=[j['key'] for j in jobs]
    return state

def epoch_state(fresh,parent,research,new_seal_hash):
    """Preserve the exact stopped mathematical phase; reset only epoch accounting."""
    if parent['active'] is not None or parent.get('active_intent') is not None or parent['resolution']:
        raise RuntimeError('cannot migrate active or resolved parent')
    if parent['phase'] not in ('research','review'):
        raise RuntimeError('unknown parent mathematical phase')
    result=copy.deepcopy(fresh)
    result.update(research=research,round=parent['round'],phase=parent['phase'],
        reviewed_rounds=list(parent['reviewed_rounds']),seal_hash=new_seal_hash,
        status='ready; own-history universal-root continuation; new finite allowance')
    return result


def lock_available(path):
    path=Path(path)
    if not path.is_file(): return False
    with path.open('r') as stream:
        try: fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError: return False
        fcntl.flock(stream,fcntl.LOCK_UN)
    return True


def pid_exists(pid):
    if not pid: return False
    try: os.kill(int(pid),0)
    except ProcessLookupError: return False
    return True


def protected_horizon(protocol,start_round,start_phase):
    """Prepay the resumed review and next four rounds, without spending trial money."""
    p=protocol;horizon=ADDITIONAL_ROUNDS;episode=p['episode_rounds']
    if start_phase not in ('research','review') or start_round%episode or horizon%episode:
        raise RuntimeError('continuation horizon must start at a complete episode boundary')
    evaluation=2*p['adaptation_seconds']+2*(2+1)*p['validation_seconds']
    review=2*p['call_seconds'];pools={}
    if start_phase=='review':
        pools['paired-evaluation-episode-'+str(start_round)]=(evaluation,2,0)
        pools['review-'+str(start_round)]=(review,2,2)
    for first in range(start_round,start_round+horizon,episode):
        end=first+episode
        research=episode*((2+p['proposal_repairs'])*p['call_seconds']+(p['knowledge_checks_per_round']+1)*p['validation_seconds'])
        pools['episode-research-'+str(first)]=(research,(2+p['proposal_repairs'])*episode,(1+p['proposal_repairs'])*episode)
        pools['paired-evaluation-episode-'+str(end)]=(evaluation,2,0)
        pools['review-'+str(end)]=(review,2,2)
    # Existing request programs may ask for earlier reassessment. Reserving
    # these optional slots does not force an extra review or change its agenda.
    for end in range(start_round+1,start_round+horizon+1):
        pools.setdefault('paired-evaluation-episode-'+str(end),(evaluation,2,0))
        pools.setdefault('review-'+str(end),(review,2,2))
    pools['paired-evaluation-final-'+str(start_round+horizon)]=(evaluation,2,0)
    return pools


def capacity_plan(protocol,start_round,start_phase):
    p=protocol;pools=protected_horizon(p,start_round,start_phase)
    main_seconds=sum(v[0] for v in pools.values());main_calls=sum(v[1] for v in pools.values());main_meta=sum(v[2] for v in pools.values())
    side=p['policy_trial_rounds']*((2+p['proposal_repairs'])*p['call_seconds']+p['knowledge_checks_per_round']*p['validation_seconds'])
    downstream=2*p['adaptation_seconds']+2*(2+1)*p['validation_seconds']+2*p['call_seconds']
    trial_seconds=2*side+downstream
    trial_calls=2*(2+p['proposal_repairs'])*p['policy_trial_rounds']+4
    trial_meta=2*(1+p['proposal_repairs'])*p['policy_trial_rounds']+2
    required_seconds=main_seconds+p['policy_trials']*trial_seconds
    required_calls=main_calls+p['policy_trials']*trial_calls
    required_meta=main_meta+p['policy_trials']*trial_meta
    if required_seconds>p['arm_seconds'] or required_calls>p['max_calls'] or required_meta>p['meta_calls']:
        raise RuntimeError('new allowance cannot fund protected horizon and optional policy trials')
    normal={k:v for k,v in pools.items() if not ((k.startswith('paired-evaluation-episode-') or k.startswith('review-')) and int(k.rsplit('-',1)[1])%p['episode_rounds'])}
    return dict(normal_main_seconds=sum(v[0] for v in normal.values()),normal_main_calls=sum(v[1] for v in normal.values()),normal_main_meta_calls=sum(v[2] for v in normal.values()),
        optional_early_review_slots='Reserved only; unchanged request programs decide whether used.',protected_pools=pools,protected_seconds=main_seconds,protected_calls=main_calls,protected_meta_calls=main_meta,
        optional_trial_seconds_each=trial_seconds,required_seconds=required_seconds,required_calls=required_calls,
        required_meta_calls=required_meta,accounting='Reserved ceilings, not measured elapsed time; conservative trial downstream includes shared review.')



def preserve_initial_state(common,state_path,destination):
    """Immutable operator checkpoint; no live intent or conversational payload."""
    state=common.load_state(state_path)
    if state['active'] is not None or state.get('active_intent') is not None:
        raise RuntimeError('initial state archive cannot contain active invocation intent')
    expected=sha(state_path)
    copy_file(state_path,destination,expected)
    Path(destination).chmod(0o444)
    return dict(path=str(destination),sha256=expected)


def migrate(parent,number,*,destination=None,caller_binding=None,ongoing=False):
    global COPY_GUARD
    a=api();common=a['common'];parent=Path(parent)
    if ongoing:
        if destination is None or not isinstance(caller_binding,dict):
            raise RuntimeError('ongoing migration requires explicit destination and caller binding')
        if (caller_binding.get('follow_sha256')!=sha(OPS/'follow.py') or
            caller_binding.get('checkpoint_sha256')!=sha(OPS/'FOLLOW.json')):
            raise RuntimeError('ongoing caller source/checkpoint binding changed')
    elif destination is not None or caller_binding is not None:
        raise RuntimeError('explicit migration context requires ongoing authorization')
    old,p,contract,suite,curation=inspect_plan(parent,number,include_private_evaluator_inputs=True,ongoing=ongoing)
    parent_protocol=common.read(parent/'protocol.json')
    ready,reason=parent_ready(parent,first=(parent==INITIAL_PARENT))
    if not ready: raise RuntimeError(reason)
    new=ongoing_destination(destination,number) if ongoing else successor_path(number)
    if new.exists(): raise RuntimeError('successor already exists; no overwrite or uncertain replay')
    old_arm=parent/'arms/exploration';old_ws=old_arm/'workspace'
    planned=planned_copy_bytes(old_arm,old)
    COPY_GUARD=CopyGuard(planned,a['resources'])
    with parent_ownership(parent):
        a['study'].verify(parent)
        parent_seal=common.read(parent/'seal.json')
        if parent!=INITIAL_PARENT and sha(parent/'CONTINUATION_PROVENANCE.json')!=parent_seal.get('continuation_provenance_sha256'):
            raise RuntimeError('parent continuation provenance changed')
        common.verify_snapshot(old_arm/'snapshots'/f'round-{old["round"]-1:04d}')
        transition=apply_source_maintenance(parent,new,parent_seal) if ongoing else None
        # freeze performs real neutral deployment checks only after launch review;
        # ordinary official research still starts later, in one separate child.
        controls()
        a['study'].freeze(new,p,suite,contract,curation)
        if common.read(new/'seal.json')['seed'] != common.read(INITIAL_PARENT/'seal.json')['seed']:
            raise RuntimeError('successor seed differs from exact original clean seed')
        arm=new/'arms/exploration';workspace=arm/'workspace'
        files=common.inventory(old_ws)
        for name,expected in files.items():
            copy_file(old_ws/name,workspace/name,expected,replace=True)
        copy_history(old_ws/'history',workspace/'history')
        research=copy.deepcopy(old['research'])
        remaps=[]
        for group in ('knowledge','components'):
            for key,record in old['research'][group].items():
                source=Path(record['validation_bundle']['directory'])
                if not source.resolve().is_relative_to(old_arm.resolve()):
                    raise RuntimeError('accepted validator not from own parent arm')
                destination=arm/'inherited/validators'/key
                migrated=copy_closed_bundle(source,destination,record,a['receipts'].reuse)
                a['knowledge'].verify_record(migrated,workspace)
                research[group][key]=migrated
                remaps.append(dict(id=key,source=str(source),destination=str(destination),
                    finished_sha256=record['validation_bundle']['finished_sha256']))
        inherited_jobs=[];pending_dependencies=[]
        from types import SimpleNamespace
        for key,entry in old['research'].get('pending_discoveries',{}).items():
            copied,dependency=copy_pending(a,old_arm,old_ws,arm,workspace,old['research'],key)
            inherited_jobs.append(copied)
            if dependency: pending_dependencies.append(dependency)
        inherited_jobs=dedupe_inherited_jobs(inherited_jobs)
        # Keep all original bindings and global round labels, with one copy per view.
        inherited_snapshots=copy_snapshots(old_arm,arm)
        provenance=dict(schema='math-gkm.own-continuation-provenance.v1',parent_study=str(parent),
            parent_state_sha256=sha(old_arm/'state.json'),parent_seal_sha256=sha(parent/'seal.json'),
            parent_round=old['round'],parent_phase=old['phase'],additional_rounds=ADDITIONAL_ROUNDS,
            parent_verification_implementation_sha256=digest(parent_seal['implementation']),
            source_transition=transition,successor_implementation_sha256=digest(common.implementation()),
            protocol_changes={k:dict(before=parent_protocol[k],after=p[k]) for k in p if parent_protocol[k]!=p[k]},
            new_capacity_plan=capacity_plan(p,old['round'],old['phase']),
            initial_resume_launch_sha256=sha(RESUME/'LAUNCH_CONSUMED.json'),
            review_resume='Preserve pending review and mathematics; run new isolated roles with new allowance; no prior partial evaluation outputs copied.',
            parent_research_sha256=digest(old['research']),parent_workspace_inventory=files,
            preserved_mathematical_state='identical except explicit validator directory relocation',
            old_accounting={k:v for k,v in old.items() if k!='research'},
            validator_remaps=remaps,inherited_snapshots=inherited_snapshots,
            snapshot_retention='one exact copy per historical snapshot; round views at snapshots/, other views at inherited/snapshots/',
            inherited_origin_jobs=inherited_jobs,pending_original_dependencies=pending_dependencies,
            inherited_receipt_paths=[j['path'] for j in inherited_jobs],
            inherited_worker_elapsed=sum(j['inherited_elapsed_seconds'] for j in inherited_jobs),
            observer_elapsed_scope='raw receipt sum includes inherited origin jobs; use deltas/new job IDs for new elapsed',
            original_paired_comparison='retained immutable at original path; this successor is not a fresh comparison',
            reused_evaluation_panel_sha256=EXPECTED_SUITE,
            evaluation_scope='same original frozen panel, reused; no new independent performance claim',
            excluded='old role trees, adapter jobs, evaluation outputs, active jobs, caches and compiled build files',
            user_goal=GOAL,goal_channel='operator-only; no proof ideas or additional proposer instructions',
            created=time.time())
        write(new/'CONTINUATION_PROVENANCE.json',provenance)
        seal=common.read(new/'seal.json')
        seal['continuation_provenance_sha256']=sha(new/'CONTINUATION_PROVENANCE.json')
        seal['baseline_adjustments']=['noncomparative own-history continuation; baseline placeholder is dormant',
            'exploration resumes only its own mathematical state and sources',
            'fresh finite accounting allowance; previous costs retained in continuation provenance',
            'same frozen evaluator panel reused, no new independent performance claim']
        plan=common.read(new/'audit/plan.json')
        plan['checkpoints']=['initial']+[f'round-{r:04d}' for r in range(old['round'],p['rounds'])]+['terminal']
        plan['initial_scope']='resumed own source and admitted knowledge; not a pristine comparison seed'
        plan['continuation_provenance_sha256']=seal['continuation_provenance_sha256']
        common.write(new/'audit/plan.json',plan)
        seal['observer_plan']=plan;seal['audit_plan_sha256']=sha(new/'audit/plan.json')
        common.write(new/'seal.json',seal)
        seal_hash=common.digest(seal)
        for mode in ('baseline','exploration'):
            path=new/'arms'/mode/'state.json';fresh=common.load_state(path)
            state=epoch_state(fresh,old,research,seal_hash) if mode=='exploration' else {**fresh,'seal_hash':seal_hash}
            if mode=='exploration':
                mark_inherited_consumed(state,inherited_jobs)
            common.save_state(path,state)
        # Protect the complete requested horizon before any optional strategy trial.
        a['study'].Arm(new,'exploration',-1).fund_many(protected_horizon(p,old['round'],old['phase']))
        for key in research.get('pending_discoveries',{}):
            a['discoveries'].verify(SimpleNamespace(root=arm,mode='exploration'),research,workspace,key)
        # Replace only newly created seed checkpoint artifacts, recording the prior
        # placeholders. No previously published/research checkpoint is overwritten.
        placeholders={}
        initial=arm/'snapshots/initial'
        placeholders['seed_snapshot_binding']=common.verify_snapshot(initial)['binding']
        import shutil
        placeholder=arm/'inherited/freeze-placeholders/initial'
        placeholder_manifest=common.verify_snapshot(initial)
        for name,expected in placeholder_manifest['files'].items():
            copy_file(initial/'source'/name,placeholder/'source'/name,expected)
        copy_file(initial/'manifest.json',placeholder/'manifest.json')
        shutil.rmtree(initial)
        for path in (arm/'observer-outbox/initial.json',new/'audit/inputs/exploration/initial.json'):
            if path.exists():
                placeholders[str(path.relative_to(new))]=sha(path)
                copy_file(path,new/'freeze-placeholder-records'/path.relative_to(new))
                path.unlink()
        state=common.load_state(arm/'state.json')
        common.snapshot(workspace,initial,research['policy'],a['study'].Arm(new,'exploration',-1).admitted(research))
        a['observer'].checkpoint(new,'exploration','initial',state,initial)
        write(new/'CONTINUATION_PLACEHOLDERS.json',placeholders)
        a['study'].verify(new)
        if common.inventory(old_ws)!=files or sha(old_arm/'state.json')!=provenance['parent_state_sha256']:
            raise RuntimeError('parent changed during migration')
        initial_state=preserve_initial_state(common,arm/'state.json',new/'MIGRATION_INITIAL_STATE.json')
        write(new/'MIGRATION_FINISHED.json',dict(initial_state_path=initial_state['path'],initial_state_sha256=initial_state['sha256'],
            provenance_sha256=sha(new/'CONTINUATION_PROVENANCE.json'),
            seal_sha256=sha(new/'seal.json'),state_sha256=sha(arm/'state.json'),finished=time.time(),
            source_sha256=sha(__file__),
            **({'ongoing_caller':copy.deepcopy(caller_binding)} if ongoing else {'review_sha256':sha(REVIEW_PATH)})))
        COPY_GUARD=None
        return new

def ongoing_destination(destination,number):
    import re
    path=Path(destination)
    if type(number) is not int or number<1 or not re.fullmatch(r'concept-driver-20261020-follow-[0-9]{6,}',path.name):
        raise RuntimeError('explicit fresh ongoing destination required')
    if path.name!=f'concept-driver-20261020-follow-{number:06d}' or path.is_symlink() or path.parent.resolve()!=(ROOT/'.scratch').resolve():
        raise RuntimeError('ongoing destination must be the exact fresh scratch successor')
    return path.resolve()


def successor_path(number):
    if type(number) is not int or not 1<=number<=MAX_EPOCHS:
        raise RuntimeError('finite successor count exceeded')
    return ROOT/'.scratch'/f'concept-driver-20261020-general-{number:04d}'


def registry(**updates):
    path=OPS/'STATUS.json';value=read(path) if path.exists() else {}
    value.update(schema='math-gkm.general-continuation-status.v1',updated=time.time(),
        goal=GOAL,comparison='incomplete original comparison; own-history noncomparative continuation',**updates)
    write(path,value);return value


def event(kind,**fields):
    path=OPS/'events.jsonl'
    if path.exists() and path.stat().st_size>1024**2:
        os.replace(path,path.with_suffix('.previous.jsonl'))
    with path.open('a') as out:
        out.write(canonical(dict(event=kind,time=time.time(),**fields))+'\n');out.flush();os.fsync(out.fileno())


def controls():
    if DEADLINE is not None and time.monotonic()>=DEADLINE-CLEANUP_SECONDS:
        raise RuntimeError('global wall ceiling reached; reserve cleanup and preserve goal open')
    if INTERRUPTED: raise RuntimeError(INTERRUPTED)
    if (OPS/'STOP.json').exists(): raise RuntimeError('operator stop requested')
    if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():
        raise RuntimeError('unresolved resource cleanup hold; independent reconciliation required')


@contextlib.contextmanager
def parent_ownership(parent):
    with (Path(parent)/'controller.lock').open('rb') as lease:
        fcntl.flock(lease,fcntl.LOCK_EX|fcntl.LOCK_NB)
        yield


def checked_implementation(common):
    original=read(INITIAL_PARENT/'seal.json')['implementation']
    if digest(original)!=EXPECTED_IMPL:raise RuntimeError('original implementation archive binding changed')
    for name,expected in original.items():
        source=SOURCE_ARCHIVE/safe_relative(name)
        if source.is_symlink() or not source.resolve().is_relative_to(SOURCE_ARCHIVE.resolve()) or sha(source)!=expected:
            raise RuntimeError('pinned old implementation source archive changed')
    new=dict(original);new['machinery/study_worker.py']=NEW_WORKER
    if original.get('machinery/study_worker.py')!=OLD_WORKER or digest(new)!=NEW_IMPL:
        raise RuntimeError('exact reviewed one-file implementation delta changed')
    allowed=[original,new]
    if CAPACITY_CHANGES:
        capacity=dict(new)
        for name,(old_hash,new_hash,hunks) in CAPACITY_CHANGES.items():
            if new.get(name)!=old_hash:raise RuntimeError('capacity old implementation binding changed')
            capacity[name]=new_hash
        if digest(capacity)!=CAPACITY_IMPL:raise RuntimeError('exact reviewed capacity implementation delta changed')
        allowed.append(capacity)
        if REQUEST_CONTEXT_FILES:
            revised=dict(capacity)
            for name,(before,after) in REQUEST_CONTEXT_FILES.items():
                if revised.get(name)!=before:raise RuntimeError('request context old source binding changed')
                revised[name]=after
            if digest(revised)!=REQUEST_CONTEXT_IMPL:raise RuntimeError('reviewed request context source map changed')
            allowed.append(revised)
    actual=common.implementation()
    if actual not in allowed:raise RuntimeError('implementation has an unreviewed source delta')
    return digest(actual)


def atomic_protected(path,data,mode):
    path=Path(path)
    allowed=(ROOT/'machinery/study_worker.py',ROOT/'.bootstrap/study-authorization.json',
        *(ROOT/name for name in CAPACITY_CHANGES),
        REQUEST_CONTEXT_STUDY/'seal.json',REQUEST_CONTEXT_STUDY/'arms/baseline/state.json',
        REQUEST_CONTEXT_STUDY/'arms/exploration/state.json',OPS/'REQUEST_CONTEXT_REVISION.json')
    if (path not in allowed or path.is_symlink() or path.parent.is_symlink() or
        path.parent.resolve()!=ROOT.resolve()/path.relative_to(ROOT).parent):
        raise RuntimeError('maintenance target escaped workspace')
    temporary=path.with_name(path.name+'.maintenance.next')
    with temporary.open('xb') as output:
        output.write(data);output.flush();os.fsync(output.fileno())
    temporary.chmod(mode);os.replace(temporary,path)
    descriptor=os.open(path.parent,os.O_RDONLY)
    try:os.fsync(descriptor)
    finally:os.close(descriptor)


def reload_capacity_modules():
    """Reload shared module objects, before freeze uses the changed inspector."""
    importlib.invalidate_caches()
    names=('machinery.proof_audit','machinery.inspection_stream','machinery.own_feedback')
    for name in names:
        module=importlib.import_module(name)
        if Path(module.__file__).resolve()!=ROOT/(name.replace('.', '/')+'.py'):
            raise RuntimeError('capacity module import escaped pinned source')
        importlib.reload(module)
    proof=importlib.import_module('machinery.proof_audit')
    if proof.EDGE_LIMIT!=2000000 or proof.WORK_LIMIT!=200000:
        raise RuntimeError('loaded capacity bounds differ from reviewed source')
    return list(names)


def apply_source_maintenance(parent,destination,parent_seal):
    """Genuine old verification has just run; never verify that old study as new."""
    a=api();common=a['common'];actual=checked_implementation(common)
    record=authorize_ongoing();checkpoint=read(OPS/'FOLLOW.json')
    capacity=(actual==NEW_IMPL and bool(CAPACITY_CHANGES) and 'inspection_capacity_maintenance' in record)
    if capacity and (not isinstance(record['inspection_capacity_maintenance'],dict) or
        record['inspection_capacity_maintenance'].get('status')=='applied'):
        raise RuntimeError('capacity maintenance grant is malformed or already applied; reconcile explicitly')
    if actual in (NEW_IMPL,CAPACITY_IMPL,REQUEST_CONTEXT_IMPL) and not capacity:
        if digest(parent_seal['implementation'])!=actual:
            raise RuntimeError('historical old parent cannot be reverified as the new implementation')
        field=('request_context_revision' if actual==REQUEST_CONTEXT_IMPL else
            'inspection_capacity_transition' if actual==CAPACITY_IMPL else 'source_transition')
        completed=checkpoint.get(field,{})
        if completed.get('status')!='applied':raise RuntimeError('source transition is incomplete; no replay')
        return None
    old_id,new_id=(NEW_IMPL,CAPACITY_IMPL) if capacity else (EXPECTED_IMPL,NEW_IMPL)
    parent_expected,destination_expected=(CAPACITY_PARENT,CAPACITY_DESTINATION) if capacity else (MAINTENANCE_PARENT,MAINTENANCE_DESTINATION)
    key,field=('inspection_capacity_maintenance','inspection_capacity_transition') if capacity else ('source_maintenance','source_transition')
    spec=record.get(key)
    expected={'parent_study':str(parent_expected),'destination':str(destination_expected),
        'old_implementation_sha256':old_id,'new_implementation_sha256':new_id}
    if capacity:
        prior=checkpoint.get('source_transition',{})
        if prior.get('status')!='applied' or prior.get('actual_implementation_sha256')!=NEW_IMPL:
            raise RuntimeError('prior worker source transition missing or incomplete')
        expected['source_files']={name:{'before':row[0],'after':row[1]} for name,row in CAPACITY_CHANGES.items()}
    else:
        expected.update(old_worker_sha256=OLD_WORKER,new_worker_sha256=NEW_WORKER,source_archive=str(SOURCE_ARCHIVE.resolve()))
    if (not isinstance(spec,dict) or spec.get('authorized') is not True or not spec.get('reviewer') or
        any(spec.get(k)!=v for k,v in expected.items()) or Path(parent)!=parent_expected or Path(destination)!=destination_expected):
        raise RuntimeError('exact one-time source maintenance authority required')
    state_path=Path(parent)/'arms/exploration/state.json'
    if (sha(state_path)!=spec.get('parent_state_sha256') or sha(Path(parent)/'seal.json')!=spec.get('parent_seal_sha256') or
        digest(parent_seal['implementation'])!=old_id or record.get('implementation_sha256')!=old_id):
        raise RuntimeError('authorized historical parent checkpoint changed')
    state=common.load_state(state_path)
    if (state.get('active') is not None or state.get('active_intent') is not None or
        state['status']!='finite_budget_finished; root_open' or
        (capacity and (state.get('resolution') is not None or state['round']!=28 or read(Path(parent)/'protocol.json')['rounds']!=28 or
            (Path(parent)/'STOP.json').exists()))):
        raise RuntimeError('maintenance parent is not quiescent')
    for name in ('FOLLOW.lock','operator.lock'):
        if not (OPS/name).is_file() or lock_available(OPS/name):
            raise RuntimeError('maintenance requires both owned supervisor singleton locks')
    identity=a['resources'].current_process(os.getpid())
    if checkpoint.get('operator_pid')!=os.getpid() or not identity or checkpoint.get('operator_birth')!=identity['identity']:
        raise RuntimeError('maintenance supervisor native ownership binding changed')
    if checkpoint.get(field) or checkpoint.get('phase')!='migration_intent' or checkpoint.get('parent_study')!=str(parent) or checkpoint.get('destination')!=str(destination):
        raise RuntimeError('maintenance intent is uncertain or already consumed; no replay')
    if Path(destination).exists() or Path(destination).is_symlink():raise RuntimeError('maintenance successor already exists')
    replacements={};authority=ROOT/'.bootstrap/study-authorization.json'
    if capacity:
        for name,(old_hash,new_hash,hunks) in CAPACITY_CHANGES.items():
            target=ROOT/name;revised=target.read_bytes()
            if sha(target)!=old_hash:raise RuntimeError('exact capacity maintenance source changed')
            for before,after in hunks:
                if revised.count(before)!=1:raise RuntimeError('exact capacity maintenance hunk changed')
                revised=revised.replace(before,after)
            if hashlib.sha256(revised).hexdigest()!=new_hash:raise RuntimeError('reviewed capacity replacement bytes differ')
            replacements[target]=revised
    else:
        worker=ROOT/'machinery/study_worker.py';original=worker.read_bytes();needle=b"    fs = profile['filesystem']\n"
        if sha(worker)!=OLD_WORKER or original.count(needle)!=1:raise RuntimeError('exact worker maintenance hunk changed')
        revised=original.replace(needle,needle+b"    fs[':tmpdir'] = 'write'  # TMPDIR is this role's workspace/.scratch.\n")
        if hashlib.sha256(revised).hexdigest()!=NEW_WORKER:raise RuntimeError('reviewed replacement worker bytes differ')
        replacements[worker]=revised
    intent={'status':'intent',**expected,'parent_state_sha256':sha(state_path),'parent_seal_sha256':sha(Path(parent)/'seal.json'),
        'historical_verification':'official study.verify completed against the actual old implementation before this intent',
        'authorized_reviewer':spec['reviewer'],'created':time.time()}
    with (ROOT/'.scratch/resources/heavy.lock').open('rb') as heavy:
        fcntl.flock(heavy,fcntl.LOCK_EX|fcntl.LOCK_NB);controls()
        a['resources'].headroom(a['resources'].limits())
        if checked_implementation(common)!=old_id or sha(state_path)!=intent['parent_state_sha256'] or read(authority)!=record:
            raise RuntimeError('quiescent maintenance bindings changed')
        checkpoint[field]=intent;write(OPS/'FOLLOW.json',checkpoint)
        for target,revised in replacements.items():atomic_protected(target,revised,target.stat().st_mode & 0o777)
        if checked_implementation(common)!=new_id:raise RuntimeError('actual source transition differs from reviewed map')
        loaded=reload_capacity_modules() if capacity else None
        updated=copy.deepcopy(record);updated['implementation_sha256']=new_id
        updated[key]={**spec,'status':'applied'}
        atomic_protected(authority,(canonical(updated)+'\n').encode(),0o444)
        common.authorize_live(read(Path(parent)/'seed/contract.json'))
        completed={**intent,'status':'applied','intent_sha256':digest(intent),
            'authorization_sha256':sha(authority),'actual_implementation_sha256':checked_implementation(common),'finished':time.time()}
        if capacity:completed['reloaded_modules']=loaded
        checkpoint[field]=completed;write(OPS/'FOLLOW.json',checkpoint)
    return completed


def request_context_api():
    from machinery import study_context,study_deployment
    return {'projection':study_context.recovery_projection,'verify_deployment':study_deployment.reuse_deployment}


@contextlib.contextmanager
def request_context_locks():
    # No child launch. A failed/partial transaction remains explicit and is never replayed.
    with contextlib.ExitStack() as stack:
        for path in (OPS/'FOLLOW.lock',OPS/'operator.lock',REQUEST_CONTEXT_STUDY/'controller.lock',ROOT/'.scratch/resources/heavy.lock'):
            stream=stack.enter_context(path.open('rb'));fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        controls();yield


def revision_bytes(value):
    return (canonical(value)+'\n').encode()


def rebind_request_context(deployment):
    """Explicit source-version revision at closed round30; preserves every cost/path."""
    with request_context_locks():
        a=api();common=a['common'];context=request_context_api();study=REQUEST_CONTEXT_STUDY
        authorization=authorize_ongoing();spec=authorization.get('request_context_maintenance',{})
        if (spec.get('authorized') is not True or not spec.get('reviewer') or
            spec.get('study')!=str(study) or spec.get('old_implementation_sha256')!=CAPACITY_IMPL or
            spec.get('implementation_sha256')!=REQUEST_CONTEXT_IMPL or checked_implementation(common)!=REQUEST_CONTEXT_IMPL):
            raise RuntimeError('exact reviewed request context revision authority required')
        record_path=OPS/'REQUEST_CONTEXT_REVISION.json';checkpoint=read(OPS/'FOLLOW.json')
        if record_path.exists() or checkpoint.get('request_context_revision'):
            raise RuntimeError('request context revision already started; explicit finish only, never replay')
        original_authority=Path(spec['old_authorization_path']).read_bytes()
        if (hashlib.sha256(original_authority).hexdigest()!=spec['old_authorization_sha256'] or
            json.loads(original_authority).get('implementation_sha256')!=CAPACITY_IMPL):
            raise RuntimeError('original pre-maintenance authorization archive changed')
        witness=read(Path(spec['old_verification_path']));supplement=read(Path(spec['baseline_observation_path']))
        if (sha(spec['old_verification_path'])!=spec['old_verification_sha256'] or
            sha(spec['baseline_observation_path'])!=spec['baseline_observation_sha256'] or
            witness.get('schema')!='math-gkm.request-context-reconciliation-start.v1' or
            witness.get('genuine_old_study_verify_passed') is not True or witness.get('verified_old_implementation')!=CAPACITY_IMPL or
            witness.get('study')!=str(study) or supplement.get('baseline_seal_binding_matches') is not True):
            raise RuntimeError('genuine old verification and supplemental baseline witness required')
        paths={'seal.json':study/'seal.json',**{f'arms/{mode}/state.json':study/'arms'/mode/'state.json' for mode in ('baseline','exploration')}}
        old={name:path.read_bytes() for name,path in paths.items()};seal=json.loads(old['seal.json'])
        states={mode:common.load_state(paths[f'arms/{mode}/state.json']) for mode in ('baseline','exploration')}
        old_hashes={name:hashlib.sha256(raw).hexdigest() for name,raw in old.items()}
        if (old_hashes['seal.json']!=witness['old_seal_sha256'] or digest(seal['implementation'])!=CAPACITY_IMPL or
            old_hashes['arms/exploration/state.json']!=witness['old_state_sha256'] or
            old_hashes['arms/baseline/state.json']!=supplement['baseline_state_sha256'] or
            supplement.get('old_seal_sha256')!=old_hashes['seal.json'] or
            supplement.get('old_verification_witness_sha256')!=spec['old_verification_sha256'] or
            sha(study/'protocol.json')!=witness['old_protocol_sha256']):
            raise RuntimeError('old stopped source/version bindings changed')
        if any(v.get('seal_hash')!=digest(seal) for v in states.values()):raise RuntimeError('old arm seal bindings changed')
        common.authorize_live(read(study/'seed/contract.json'))
        state=states['exploration'];job=study/'arms/exploration/jobs/plan-0030';receipt=read(job/'receipt.json')
        if (state.get('round')!=30 or state.get('phase')!='research' or state.get('active') is not None or
            state.get('active_intent') is not None or state.get('resolution') is not None or
            any(s.get('active') is not None or s.get('active_intent') is not None for s in states.values()) or
            str(job) not in state['receipts'] or state['receipt_hashes'].get(str(job))!=digest(receipt) or
            state['reservations'].get('call-plan-0030')!=read(job/'spec.json')['seconds'] or
            'plan-0030' not in state['counted_jobs'] or receipt.get('returncode')!=1 or receipt.get('payload') is not None or
            receipt.get('before')!=receipt.get('after') or not receipt.get('outcome','').startswith('invalid_report:') or
            (job/'final.json').exists() or (job.parent/'plan-0030-repair-1').exists() or
            any(str(p) not in state['receipts'] for p in job.parent.iterdir() if p.is_dir())):
            raise RuntimeError('only exact closed consumed input rejection may be rebound')
        stderr=(job/'stderr.log').read_text();match=re.search(r'data: (\{.*\})\s*$',stderr)
        diagnostic=json.loads(match[1]) if match else {}
        events=[json.loads(line) for line in (job/'events.jsonl').read_text().splitlines() if line]
        prompt_chars=len((job/'prompt.txt').read_text())
        if ((study/'STOP.json').exists() or diagnostic.get('input_error_code')!='input_too_large' or
            diagnostic.get('max_chars')!=1048576 or diagnostic.get('actual_chars')!=prompt_chars or prompt_chars<=1048576 or
            not events or any(v.get('type')!='thread.started' for v in events)):
            raise RuntimeError('no exact provider rejection before model start')
        if spec.get('native_cleanup_verified') is not True:raise RuntimeError('independent native cleanup witness required')
        for pid,birth in spec.get('native_owners',{}).items():
            info=a['resources'].process_status(int(pid))
            if info and info['identity']==birth:raise RuntimeError('historical native owner remains')
        for pid in receipt.get('resources',{}).get('owned_identities',{}):
            if a['resources'].process_status(int(pid)):raise RuntimeError('failed proposer identity still present')
        a['resources'].headroom(a['resources'].limits());context['verify_deployment'](deployment)
        if not deployment.get('ready'):raise RuntimeError('fresh new implementation deployment not ready')
        origin={name:sha(study/name) for name in ('CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json')}
        core={'schema':'math-gkm.request-context-revision.v1','study':str(study),'old_implementation_sha256':CAPACITY_IMPL,
            'implementation_sha256':REQUEST_CONTEXT_IMPL,'old_files':old_hashes,'old_verification_sha256':spec['old_verification_sha256'],
            'original_authorization_sha256':spec['old_authorization_sha256'],
            'baseline_observation_sha256':spec['baseline_observation_sha256'],'baseline_hash_observed_after_genuine_verify':True,
            'protocol_sha256':sha(study/'protocol.json'),'unchanged_origins':origin,'deployment':deployment,
            'old_deployment':seal.get('deployment_preflight'),
            'recovery_projection_sha256':digest(context['projection'](state)),'created':time.time()}
        binding=digest(core);new_seal={**seal,'implementation':common.implementation(),'deployment_preflight':deployment,
            'frozen_at':time.time(),'source_revision':{'record':str(record_path),'binding':binding,'old_seal_sha256':old_hashes['seal.json']}}
        revised={'seal.json':revision_bytes(new_seal)}
        for mode in ('baseline','exploration'):
            updated={**states[mode],'seal_hash':digest(new_seal)}
            revised[f'arms/{mode}/state.json']=revision_bytes({'state':updated,'sha256':digest(updated)})
        files={name:{'old_sha256':old_hashes[name],'old_bytes_base64':base64.b64encode(old[name]).decode(),
            'new_sha256':hashlib.sha256(revised[name]).hexdigest(),'new_bytes_base64':base64.b64encode(revised[name]).decode()} for name in paths}
        record={'schema':'math-gkm.closed-proposer-recovery.v1','study':str(study),'arm':'exploration',
            'failed_request_id':'plan-0030','next_request_id':'plan-0030-repair-1','request_binding':digest(read(job/'request.json')),
            'receipt_binding':digest(receipt),'receipt_file_sha256':sha(job/'receipt.json'),'spec_sha256':sha(job/'spec.json'),
            'events_sha256':sha(job/'events.jsonl'),'stderr_sha256':sha(job/'stderr.log'),'old_implementation_sha256':CAPACITY_IMPL,
            'implementation_sha256':REQUEST_CONTEXT_IMPL,'old_seal_sha256':old_hashes['seal.json'],
            'stopped_state_sha256':old_hashes['arms/exploration/state.json'],'recovery_projection_sha256':core['recovery_projection_sha256'],
            'no_model_started':True,'native_cleanup_verified':True,'classification':'closed_input_too_large_no_model',
            'revision_binding':binding,'revision_core':core,'archived_files':files,
            'archived_original_authorization':base64.b64encode(original_authority).decode(),
            'archived_witnesses':{key:base64.b64encode(Path(spec[key]).read_bytes()).decode()
                for key in ('old_verification_path','baseline_observation_path')},
            'archived_origins':{name:base64.b64encode((study/name).read_bytes()).decode() for name in origin},
            'archived_old_deployment_receipt':base64.b64encode(Path(seal['deployment_preflight']['receipt']).read_bytes()).decode()}
        # Archive first, then persist the complete three-file intent before changing any seal/state.
        atomic_protected(record_path,revision_bytes(record),0o444)
        after={**authorization,'operational_recovery':{'path':str(record_path),'sha256':sha(record_path)}}
        checkpoint['request_context_revision']={'status':'install_intent','record':str(record_path),'record_sha256':sha(record_path),
            'authorization_before_sha256':sha(ROOT/'.bootstrap/study-authorization.json'),
            'authorization_after_sha256':hashlib.sha256(revision_bytes(after)).hexdigest(),'actual_implementation_sha256':REQUEST_CONTEXT_IMPL}
        write(OPS/'FOLLOW.json',checkpoint)
        return _finish_request_context_rebind()


def finish_request_context_rebind():
    """Explicit completion of known three-file writes; no deployment, model or job replay."""
    with request_context_locks():return _finish_request_context_rebind()


def _finish_request_context_rebind():
    a=api();common=a['common'];context=request_context_api();study=REQUEST_CONTEXT_STUDY
    checkpoint=read(OPS/'FOLLOW.json');intent=checkpoint.get('request_context_revision',{});path=OPS/'REQUEST_CONTEXT_REVISION.json'
    if intent.get('status')!='install_intent' or intent.get('record')!=str(path) or sha(path)!=intent.get('record_sha256'):
        raise RuntimeError('no exact incomplete request context revision; never replay')
    record=read(path);core=record['revision_core'];authorization=authorize_ongoing()
    if (checked_implementation(common)!=REQUEST_CONTEXT_IMPL or record['implementation_sha256']!=REQUEST_CONTEXT_IMPL or
        record['revision_binding']!=digest(core) or record['study']!=str(study)):
        raise RuntimeError('request context revision source or archive binding changed')
    raw_authority=base64.b64decode(record['archived_original_authorization'],validate=True)
    if (hashlib.sha256(raw_authority).hexdigest()!=core['original_authorization_sha256'] or
        json.loads(raw_authority).get('implementation_sha256')!=CAPACITY_IMPL):
        raise RuntimeError('permanent original authorization archive changed')
    for name,key in [('old_verification_path','old_verification_sha256'),('baseline_observation_path','baseline_observation_sha256')]:
        raw=base64.b64decode(record['archived_witnesses'][name],validate=True)
        if hashlib.sha256(raw).hexdigest()!=core[key]:raise RuntimeError('permanent old verification archive changed')
    for name,raw in record['archived_origins'].items():
        if name not in core['unchanged_origins'] or hashlib.sha256(base64.b64decode(raw,validate=True)).hexdigest()!=core['unchanged_origins'][name]:
            raise RuntimeError('permanent old origin archive changed')
    if hashlib.sha256(base64.b64decode(record['archived_old_deployment_receipt'],validate=True)).hexdigest()!=core['old_deployment']['receipt_sha256']:
        raise RuntimeError('permanent old deployment archive changed')
    current_authority=sha(ROOT/'.bootstrap/study-authorization.json')
    if current_authority not in (intent['authorization_before_sha256'],intent['authorization_after_sha256']):
        raise RuntimeError('request context revision authority changed')
    expected={'seal.json','arms/baseline/state.json','arms/exploration/state.json'}
    if set(record['archived_files'])!=expected:raise RuntimeError('unexpected revision install target')
    decoded={}
    for name,entry in record['archived_files'].items():
        before=base64.b64decode(entry['old_bytes_base64'],validate=True);after=base64.b64decode(entry['new_bytes_base64'],validate=True)
        if hashlib.sha256(before).hexdigest()!=entry['old_sha256'] or hashlib.sha256(after).hexdigest()!=entry['new_sha256']:
            raise RuntimeError('revision byte archive changed')
        target=study/name
        if sha(target) not in (entry['old_sha256'],entry['new_sha256']):raise RuntimeError('uncertain seal/state bytes; no automatic repair')
        decoded[name]=(before,after)
    seal=json.loads(decoded['seal.json'][1])
    if digest(seal['implementation'])!=REQUEST_CONTEXT_IMPL:raise RuntimeError('revision seal source changed')
    if sha(study/'protocol.json')!=core['protocol_sha256'] or any(sha(study/name)!=value for name,value in core['unchanged_origins'].items()):
        raise RuntimeError('historical protocol or origin provenance changed')
    if seal.get('source_revision')!={'record':str(path),'binding':record['revision_binding'],'old_seal_sha256':record['old_seal_sha256']}:
        raise RuntimeError('revision seal does not bind archive')
    for mode in ('baseline','exploration'):
        old_envelope,new_envelope=(json.loads(v) for v in decoded[f'arms/{mode}/state.json'])
        before,after=old_envelope['state'],new_envelope['state']
        if old_envelope['sha256']!=digest(before) or new_envelope['sha256']!=digest(after):raise RuntimeError('revision state envelope changed')
        if {k:v for k,v in before.items() if k!='seal_hash'}!={k:v for k,v in after.items() if k!='seal_hash'} or after['seal_hash']!=digest(seal):
            raise RuntimeError('revision changed mathematical state or accounting')
    for name,(_,raw) in decoded.items():
        if sha(study/name)!=record['archived_files'][name]['new_sha256']:atomic_protected(study/name,raw,(study/name).stat().st_mode & 0o777)
    context['verify_deployment'](core['deployment']);a['study'].verify(study)
    updated={**authorization,'operational_recovery':{'path':str(path),'sha256':sha(path)}}
    if hashlib.sha256(revision_bytes(updated)).hexdigest()!=intent['authorization_after_sha256']:
        raise RuntimeError('revision authorization replacement differs')
    atomic_protected(ROOT/'.bootstrap/study-authorization.json',revision_bytes(updated),0o444)
    checkpoint['request_context_revision']={**intent,'status':'applied','actual_implementation_sha256':REQUEST_CONTEXT_IMPL,
        'new_seal_sha256':sha(study/'seal.json'),'finished':time.time()}
    write(OPS/'FOLLOW.json',checkpoint)
    return checkpoint['request_context_revision']


def immutable_bindings(*,ongoing=False):
    a=api();common=a['common']
    actual_implementation=checked_implementation(common)
    if not ongoing and actual_implementation!=EXPECTED_IMPL:
        raise RuntimeError('bounded legacy operator cannot use a changed implementation')
    seal=read(INITIAL_PARENT/'seal.json');p=read(INITIAL_PARENT/'protocol.json')
    contract=read(INITIAL_PARENT/'seed/contract.json')
    if digest(seal['implementation'])!=EXPECTED_IMPL or digest(p)!=seal['protocol']:
        raise RuntimeError('original seal/protocol mismatch')
    if digest(contract)!=EXPECTED_CONTRACT or seal['suite']!=EXPECTED_SUITE:
        raise RuntimeError('original exact contract or panel changed')
    if sha(ROOT/contract['root_file'])!=contract['root_sha256']:
        raise RuntimeError('original exact root source changed')
    if common.dependency_identity()!=seal['dependencies']:
        raise RuntimeError('original dependency identity changed')
    for name,expected in seal['seed'].items():
        if sha(INITIAL_PARENT/'seed'/safe_relative(name))!=expected:
            raise RuntimeError('original clean seed changed')
    common.authorize_live(contract)
    if actual_implementation in (NEW_IMPL,CAPACITY_IMPL,REQUEST_CONTEXT_IMPL):
        checkpoint=read(OPS/'FOLLOW.json');applied=checkpoint.get('source_transition',{})
        if applied.get('status')!='applied' or applied.get('actual_implementation_sha256')!=NEW_IMPL:
            raise RuntimeError('reviewed source transition has not completed')
        if actual_implementation in (CAPACITY_IMPL,REQUEST_CONTEXT_IMPL):
            applied=checkpoint.get('inspection_capacity_transition',{})
            if applied.get('status')!='applied' or applied.get('actual_implementation_sha256')!=CAPACITY_IMPL:
                raise RuntimeError('reviewed capacity source transition has not completed')
        if actual_implementation==REQUEST_CONTEXT_IMPL:
            applied=checkpoint.get('request_context_revision',{})
            if applied.get('status')!='applied' or applied.get('actual_implementation_sha256')!=REQUEST_CONTEXT_IMPL:
                raise RuntimeError('reviewed request context revision has not completed')
    authorization=read(ROOT/'.bootstrap/study-authorization.json')
    if ongoing:
        authorize_ongoing(authorization)
    else:
        scope=str(authorization.get('authorized_continuation',''))
        if 'successor' not in scope.lower() or '8' not in scope:
            raise RuntimeError('explicit current sustained-successor authorization required')
    finalization=read(FINALIZATION/'FINISHED.json')
    if finalization.get('round')!=2 or finalization.get('phase')!='review' or finalization.get('role_calls')!=0 or finalization.get('proof_checks')!=0:
        raise RuntimeError('reviewed exact failed-tail finalization missing')
    consumed=read(RESUME/'LAUNCH_CONSUMED.json')
    launch=read(RESUME/'LAUNCH.json')
    if (consumed.get('plan_sha256')!=sha(RESUME/'PLAN.json') or
        consumed.get('review_sha256')!=sha(RESUME/'REVIEW.json') or
        launch.get('plan_sha256')!=consumed['plan_sha256'] or
        launch.get('review_sha256')!=consumed['review_sha256'] or
        launch.get('finalization_sha256')!=sha(FINALIZATION/'FINISHED.json')):
        raise RuntimeError('initial official resume launch binding changed')
    tests=read(OPS/'TEST_RESULT.json') if (OPS/'TEST_RESULT.json').exists() else None
    return dict(implementation_sha256=actual_implementation,original_implementation_sha256=EXPECTED_IMPL,original_study=str(INITIAL_PARENT),
        original_seal_sha256=sha(INITIAL_PARENT/'seal.json'),original_protocol_sha256=sha(INITIAL_PARENT/'protocol.json'),
        original_contract_sha256=digest(contract),original_suite_sha256=EXPECTED_SUITE,suite_tasks=2,
        original_seed=seal['seed'],dependencies_sha256=digest(seal['dependencies']),
        authorization_sha256=sha(ROOT/'.bootstrap/study-authorization.json'),
        initial_resume_launch_sha256=sha(RESUME/'LAUNCH.json'),
        initial_resume_consumption_sha256=sha(RESUME/'LAUNCH_CONSUMED.json'),
        initial_resume_plan_sha256=sha(RESUME/'PLAN.json'),
        original_failed_resume_launch_sha256=sha(ORIGINAL_RESUME/'LAUNCH_CONSUMED.json'),
        failed_tail_finalization_sha256=sha(FINALIZATION/'FINISHED.json'),
        initial_resume_review_sha256=consumed['review_sha256'],
        source_sha256=sha(__file__),tests_source_sha256=sha(OPS/'test_continue_machine.py'))


def authorize_ongoing(record=None):
    record=record or read(ROOT/'.bootstrap/study-authorization.json')
    expected={'ongoing_follow_sha256':sha(OPS/'follow.py'),
        'ongoing_migration_sha256':sha(__file__),
        'ongoing_tests_sha256':sha(OPS/'test_continue_machine.py')}
    if (record.get('ongoing_goal_authorized') is not True or
        not isinstance(record.get('ongoing_source_reviewer'),str) or not record['ongoing_source_reviewer'].strip() or
        any(record.get(k)!=v for k,v in expected.items())):
        raise RuntimeError('exact independently audited ongoing-goal authority required')
    return record


def planned_protocol(parent_round,phase='research'):
    p=copy.deepcopy(read(INITIAL_PARENT/'protocol.json'))
    p.update(rounds=parent_round+ADDITIONAL_ROUNDS,call_seconds=MODEL_SECONDS,adaptation_seconds=MODEL_SECONDS,
        validation_seconds=VALIDATION_SECONDS,arm_seconds=ARM_ALLOWANCE_SECONDS,max_calls=64,meta_calls=32)
    p['concept_driver']=dict(p.get('concept_driver') or {},min_horizon_rounds=2,max_horizon_rounds=4)
    if p['model']!='gpt-6.1-sol' or p['transport']!='live' or not (p.get('concept_driver') or {}).get('enabled'):
        raise RuntimeError('unchanged independent concept researcher configuration required')
    a=api();a['study'].validate_protocol(p);a['study'].validate_commitment(p,2)
    capacity_plan(p,parent_round,phase)
    return p


def epoch_wall_reservation(protocol):
    # Wall containment includes each role's protocol-check ceiling, setup, and
    # controller cleanup in addition to the arm allowance. Not expected elapsed.
    return protocol['arm_seconds']+(4*protocol['max_calls']+2)*30+SETUP_SECONDS+CLEANUP_SECONDS


def admit_epoch(deadline,protocol,now=None):
    now=time.monotonic() if now is None else now
    required=epoch_wall_reservation(protocol)
    if deadline-now<required:
        raise RuntimeError('global wall ceiling cannot reserve a complete finite epoch and cleanup')
    return required


def plan_value():
    binding=immutable_bindings()
    p=planned_protocol(read(INITIAL_PARENT/'protocol.json')['rounds'])
    value=dict(schema='math-gkm.general-continuation-plan.v1',bindings=binding,
        initial_parent_may_be_running=True,mutable_parent_gate='after official controller and resume operator close normally',
        max_epochs=MAX_EPOCHS,operator_seconds=OPERATOR_SECONDS,cleanup_seconds=CLEANUP_SECONDS,
        rounds_per_epoch=ADDITIONAL_ROUNDS,arm_seconds=ARM_ALLOWANCE_SECONDS,max_calls=64,meta_calls=32,
        model='gpt-6.1-sol',reasoning_effort='high',call_seconds=MODEL_SECONDS,validation_seconds=VALIDATION_SECONDS,
        capacity=capacity_plan(p,read(INITIAL_PARENT/'protocol.json')['rounds'],'research'),
        concept_horizon={'min_rounds':2,'max_rounds':4,'selection':'own proposer chooses within finite epoch'},
        epoch_wall_reservation=epoch_wall_reservation(p),migration_cap_bytes=MIGRATION_CAP,
        completion='only finished exact universal-root receipt and independent source/English correspondence audit',
        exhausted='goal remains open; no partial milestone is completion',automatic_retry=False,
        mathematics='no changes or extra strategy guidance; preserve own research state including concepts and feedback',
        comparison='original paired comparison remains incomplete; all successors noncomparative',
        hosted_calls_by_plan=0,proof_checks_by_plan=0)

    # Persist and compare the same JSON-native representation; runtime budget
    # pools may retain tuple values without making an unchanged plan differ.
    return json.loads(canonical(value))


def prepare_plan():
    if (OPS/'LAUNCH_CONSUMED.json').exists() or any(successor_path(i).exists() for i in range(1,MAX_EPOCHS+1)):
        raise RuntimeError('continuation already consumed or successor exists; never overwrite')
    value=plan_value();write(OPS/'PLAN.json',value)
    return dict(status='prepared_not_launched',plan_sha256=sha(OPS/'PLAN.json'))


def reviewed(path):
    plan=read(OPS/'PLAN.json')
    if plan!=plan_value(): raise RuntimeError('reviewed immutable plan/source/authority changed')
    result=read(OPS/'TEST_RESULT.json');review=read(path)
    expected=dict(plan_sha256=sha(OPS/'PLAN.json'),source_sha256=sha(__file__),
        tests_source_sha256=sha(OPS/'test_continue_machine.py'),test_result_sha256=sha(OPS/'TEST_RESULT.json'),
        implementation_sha256=EXPECTED_IMPL)
    if result.get('passed') is not True or any(result.get(k)!=expected[k] for k in ('source_sha256','tests_source_sha256','implementation_sha256')):
        raise RuntimeError('exact passing pure operational tests required')
    if review.get('accepted') is not True or not review.get('reviewer') or any(review.get(k)!=v for k,v in expected.items()):
        raise RuntimeError('exact independent operational review required')
    return plan


def initial_operator_closed():
    if not lock_available(RESUME/'operator.lock'):return False,'initial official resume operator still owns lock'
    status=read(RESUME/'STATUS.json')
    if status.get('operator_pid') or status.get('controller_pid') or status.get('research_launched'):
        return False,'initial official resume operator has not closed'
    if status.get('controller_returncode')!=0 or not status.get('status','').startswith('closed'):
        raise RuntimeError('initial official resume failed or uncertain; no successor replay')
    return True,None


def parent_ready(parent,first=False):
    parent=Path(parent)
    if not lock_available(parent/'controller.lock'):return False,'parent controller/watchdog lock held or missing'
    if first:
        ready,reason=initial_operator_closed()
        if not ready:return ready,reason
    state=api()['common'].load_state(parent/'arms/exploration/state.json')
    if state.get('active') is not None or state.get('active_intent') is not None:
        return False,'parent active or uncertain invocation must be reconciled'
    if state.get('resolution'):return False,'root resolution requires exact finished evidence check'
    if state.get('status')!='finite_budget_finished; root_open':
        raise RuntimeError('parent did not close normally at finite budget; no automatic retry')
    if state['round']!=read(parent/'protocol.json')['rounds']:
        raise RuntimeError('normal parent round limit mismatch')
    if (parent/'STOP.json').exists():raise RuntimeError('parent was explicitly stopped; no successor')
    return True,None


def inspect_plan(parent,number,*,include_private_evaluator_inputs=False,ongoing=False):
    a=api();parent=Path(parent);immutable_bindings(ongoing=ongoing)
    state=a['common'].load_state(parent/'arms/exploration/state.json')
    p=planned_protocol(state['round'],state['phase'])
    expected_parent=read(INITIAL_PARENT/'protocol.json') if parent==INITIAL_PARENT else planned_protocol(state['round']-ADDITIONAL_ROUNDS,state['phase'])
    if {k:v for k,v in read(parent/'protocol.json').items() if k!='rounds'} != {k:v for k,v in expected_parent.items() if k!='rounds'}:
        raise RuntimeError('own continuation protocol differs beyond reviewed finite horizon settings')
    contract=read(parent/'seed/contract.json')
    if digest(contract)!=EXPECTED_CONTRACT:raise RuntimeError('parent exact contract changed')
    suite=curation=None
    if include_private_evaluator_inputs:
        # Private evaluation input for official freeze only, never a role prompt,
        # public plan, status, history, or source copy. No outputs are migrated.
        suite=a['common'].read(FROZEN_PAIR/'evaluation/suite.json')
        if digest(suite)!=EXPECTED_SUITE or len(suite['tasks'])!=2:raise RuntimeError('frozen evaluation input changed')
        curation=read(FROZEN_PAIR/'seal.json')['curation']
    return state,p,contract,suite,curation


def verified_resolution(study):
    a=api();common=a['common'];study=Path(study)
    state=common.load_state(study/'arms/exploration/state.json')
    result=state.get('resolution')
    if result is None:return False
    relative=safe_relative(state.get('resolution_receipt',''))
    path=study/relative
    if not path.resolve().is_relative_to((study/'arms/exploration/completion').resolve()):
        raise RuntimeError('root resolution is not own exact completion receipt')
    if read(path)!=result or result.get('resolved') is not True or result.get('lean_exact_root_checked') is not True:
        raise RuntimeError('exact checked root resolution evidence missing')
    contract=read(study/'seed/contract.json')
    if digest(contract)!=EXPECTED_CONTRACT or result.get('binding',{}).get('contract_hash')!=EXPECTED_CONTRACT:
        raise RuntimeError('resolution is not unchanged universal contract')
    claim=result['binding']['claim'];audit=result.get('audit')
    reused=a['receipts'].reuse(path.parent,{'contract':contract,'claim':claim,'audit':audit},claim,())
    if reused!=result or not isinstance(audit,dict) or audit.get('accepted') is not True or not audit.get('reviewer'):
        raise RuntimeError('exact finished root and correspondence receipt changed')
    if audit.get('bundle_hash')!=result.get('bundle_hash') or any(not audit.get('checks',{}).get(k) for k in contract['correspondence_obligations']):
        raise RuntimeError('independent English/source correspondence obligation missing')
    from machinery import completion
    previous=completion.ROOT
    try:
        completion.ROOT=study/'arms/exploration/workspace'
        if completion.prepare(contract,claim)['bundle_hash']!=result['bundle_hash']:
            raise RuntimeError('resolved source bundle changed')
    finally:completion.ROOT=previous
    return True


def start_keep_awake():
    if not Path('/usr/bin/caffeinate').is_file():return None
    return subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],cwd=ROOT,
        stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,start_new_session=True)


def close_keep_awake(child):
    if child is None:return
    if child.poll() is None:child.terminate()
    try:child.wait(timeout=5)
    except subprocess.TimeoutExpired:child.kill();child.wait(timeout=5)


def own_birth(child,expected=None):
    if child.poll() is not None:return None
    info=api()['resources'].current_process(child.pid)
    if info is None:
        if child.poll() is not None:return None
        raise RuntimeError('owned controller birth unavailable')
    birth=info['identity']
    if expected is not None and birth!=expected:raise RuntimeError('owned controller birth changed')
    return birth


def stop_child(child,study,deadline,birth):
    write(study/'STOP.json',dict(source='general continuation operator',requested=time.time()))
    end=min(deadline,time.monotonic()+CLEANUP_SECONDS)
    while child.poll() is None and time.monotonic()<end-30:
        own_birth(child,birth);time.sleep(1)
    if child.poll() is None:own_birth(child,birth);child.terminate()
    while child.poll() is None and time.monotonic()<end:
        own_birth(child,birth);time.sleep(1)
    return child.poll() is not None


def request_stop():
    marker=dict(requested=time.time(),source='general continuation operator')
    write(OPS/'STOP.json',marker)
    status=read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else {}
    current=status.get('current_study')
    # Do not stop another operator's parent while merely waiting.
    if status.get('research_launched') and current:write(Path(current)/'STOP.json',marker)
    return dict(status='stop_requested',automatic_retry=False)


def run_operator(review_path):
    global REVIEW_PATH,DEADLINE
    controls();reviewed(review_path);REVIEW_PATH=Path(review_path).resolve()
    a=api();a['resources'].headroom(a['resources'].limits())
    with (OPS/'operator.lock').open('a') as lockfile:
        fcntl.flock(lockfile,fcntl.LOCK_EX|fcntl.LOCK_NB)
        controls()
        if (OPS/'LAUNCH_CONSUMED.json').exists():raise RuntimeError('single operator launch already consumed; reconcile explicitly, never replay')
        write(OPS/'LAUNCH_CONSUMED.json',dict(plan_sha256=sha(OPS/'PLAN.json'),review_sha256=sha(review_path),
            source_sha256=sha(__file__),time=time.time(),automatic_retry=False))
        started=time.monotonic();deadline=started+OPERATOR_SECONDS;DEADLINE=deadline;parent=INITIAL_PARENT
        awake=child=None;birth=None;current=None;completed=[]
        try:
            awake=start_keep_awake()
            registry(status='waiting_for_official_parent',operator_pid=os.getpid(),current_study=str(parent),
                controller_pid=None,research_launched=False,goal_open=True,completed_epochs=[],
                caffeinate_pid=awake.pid if awake else None,deadline_wall=time.time()+OPERATOR_SECONDS,
                maximum_epochs=MAX_EPOCHS,initial_resume_operator=str(RESUME))
            while True:
                controls()
                if time.monotonic()>=deadline-CLEANUP_SECONDS:
                    registry(status='global_wall_exhausted; goal_open',goal_open=True);return
                if lock_available(parent/'controller.lock') and verified_resolution(parent):
                    if parent==INITIAL_PARENT and not initial_operator_closed()[0]:time.sleep(2);continue
                    registry(status='exact_universal_root_verified',goal_open=False,goal_achieved=True,
                        resolution_study=str(parent),resolution_state_sha256=sha(parent/'arms/exploration/state.json'));return
                ready,reason=parent_ready(parent,first=(parent==INITIAL_PARENT))
                if ready:break
                registry(status='waiting_for_official_parent',wait_reason=reason);time.sleep(2)
            for number in range(1,MAX_EPOCHS+1):
                controls();reviewed(review_path)
                old=read(parent/'protocol.json');p=planned_protocol(old['rounds'])
                try:reservation=admit_epoch(deadline,p)
                except RuntimeError:
                    registry(status='insufficient_global_wall_for_next_epoch; goal_open',goal_open=True,
                        completed_epochs=completed);return
                a['resources'].headroom(a['resources'].limits())
                registry(status='migration_in_progress',current_parent=str(parent),next_epoch=number,
                    epoch_wall_reservation=reservation,research_launched=False)
                epoch_started=time.monotonic()
                current=migrate(parent,number)
                controls();reviewed(review_path)
                argv=[PYTHON,'-m','machinery.study','run','--study',str(current),'--arm','exploration']
                logfile=OPS/f'epoch-{number:04d}.log'
                epoch_deadline=min(deadline,epoch_started+reservation)
                with logfile.open('xb') as out:
                    controls()
                    write(OPS/f'epoch-{number:04d}-launch-intent.json',dict(argv=argv,study=str(current),
                        migration_sha256=sha(current/'MIGRATION_FINISHED.json'),time=time.time(),automatic_retry=False))
                    child=subprocess.Popen(argv,cwd=ROOT,stdin=subprocess.DEVNULL,stdout=out,stderr=out,
                        start_new_session=True,env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'})
                    birth=own_birth(child)
                    write(OPS/f'epoch-{number:04d}-launch.json',dict(controller_pid=child.pid,controller_birth=birth,
                        argv=argv,study=str(current),time=time.time()))
                    registry(status='research_running',current_study=str(current),controller_pid=child.pid,
                        controller_birth=birth,research_launched=True,epoch=number)
                    while child.poll() is None:
                        controls();own_birth(child,birth)
                        if time.monotonic()>=epoch_deadline-CLEANUP_SECONDS:raise RuntimeError('finite epoch controller wall containment reached')
                        if logfile.stat().st_size>LOG_LIMIT:raise RuntimeError('bounded controller log exceeded')
                        time.sleep(2)
                if child.returncode!=0:raise RuntimeError('official controller failed; preserve receipts, no automatic retry')
                if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():raise RuntimeError('cleanup hold after controller closure')
                if verified_resolution(current):
                    registry(status='exact_universal_root_verified',goal_open=False,goal_achieved=True,
                        resolution_study=str(current),resolution_state_sha256=sha(current/'arms/exploration/state.json'));return
                ready,reason=parent_ready(current)
                if not ready:raise RuntimeError(reason)
                final=a['common'].load_state(current/'arms/exploration/state.json')
                completed.append(dict(epoch=number,study=str(current),round=final['round'],
                    state_sha256=sha(current/'arms/exploration/state.json'),finished=time.time()))
                registry(status='epoch_finished; universal_goal_open',current_study=str(current),
                    controller_pid=None,controller_birth=None,research_launched=False,completed_epochs=completed,goal_open=True)
                child=None;birth=None;parent=current
            registry(status='maximum_epochs_finished; universal_goal_open',goal_open=True)
        except BaseException as exc:
            cleaned=True
            if child is not None and child.poll() is None:
                try:cleaned=stop_child(child,current,deadline,birth)
                except BaseException:cleaned=False
            registry(status='needs_reconciliation',reason=type(exc).__name__+': '+str(exc),
                controller_pid=child.pid if child is not None and not cleaned else None,
                research_launched=not cleaned,goal_open=True,automatic_retry=False)
            raise
        finally:
            close_keep_awake(awake)
            registry(operator_pid=None,caffeinate_pid=None,
                controller_pid=child.pid if child is not None and child.poll() is None else None,
                research_launched=bool(child is not None and child.poll() is None))


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command',choices=('plan','status','run','stop'))
    parser.add_argument('--review',type=Path)
    args=parser.parse_args()
    if args.command=='plan':value=prepare_plan()
    elif args.command=='status':value=read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else dict(status='not_launched')
    elif args.command=='stop':value=request_stop()
    else:
        if args.review is None:parser.error('run requires exact independent --review')
        def interrupted(number,frame):
            global INTERRUPTED
            INTERRUPTED='operator signal '+str(number)
        for number in (signal.SIGTERM,signal.SIGINT):signal.signal(number,interrupted)
        run_operator(args.review);value=read(OPS/'STATUS.json')
    print(canonical(value))


if __name__=='__main__':
    try:main()
    except (RuntimeError,OSError,ValueError,KeyError,TypeError) as exc:
        print(canonical(dict(operational_error=type(exc).__name__,reason=str(exc),goal_achieved=False)),file=sys.stderr)
        raise SystemExit(2)
