"""Operations-only own-history continuation. Never supplies mathematical guidance.

No machinery, original study, original operator or research agenda is edited.
A new, independently identified finite allowance funds each successor epoch.
"""
import argparse
import copy
import fcntl
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT = Path('/Users/sasha/math_gkm')
OPS = Path(__file__).resolve().parent
ORIGINAL = ROOT/'.scratch/paired-v3-restart-20261019-study-0001'
ORIGINAL_OPS = OPS.parent
GOAL = ('resume the machine and continue monitoring until it gets some non-trivial '
        'log-concavity case done. mind the disc space, mind OOM, and report roughly each 30 minutes.')
PYTHON = '/opt/homebrew/bin/python3'
ADDITIONAL_ROUNDS = 4
OPERATOR_SECONDS = 72*3600
CLEANUP_SECONDS = 1900
LOG_LIMIT = 8*1024**2
MIGRATION_CAP = 768*1024**2
COPY_GUARD = None
EXPECTED_IMPL = '01a5f6e6644d8b5ebbb199efba27bef2f65cf0dfe4e0413d48742d4d4effac89'
EXPECTED_CONTRACT = 'd59260647e9e10663bc22b5955231f3b0f76bd00b670665854798415b824a28a'
EXPECTED_SUITE = '47e1e0574ad2709b670f68c54278f139680f879243b73f81be3ef20d6d27b4db'
INTERRUPTED = None
API = None


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


def registry(**updates):
    path=OPS/'STATUS.json'
    value=read(path) if path.exists() else {}
    value.update(schema='math-gkm.goal-continuation.ops.v1',user_goal=GOAL,
        parent_study=str(ORIGINAL),model='gpt-6.1-sol',reasoning_effort='high',
        additional_rounds=ADDITIONAL_ROUNDS,updated=time.time(),**updates)
    write(path,value)
    return value


def event(kind,**fields):
    path=OPS/'events.jsonl'
    if path.exists() and path.stat().st_size>1024**2:
        os.replace(path,path.with_suffix('.previous.jsonl'))
    with path.open('a') as out:
        out.write(canonical(dict(event=kind,time=time.time(),**fields))+'\n')
        out.flush();os.fsync(out.fileno())


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
    # Each snapshot has both a clearly inherited archive and a working named view.
    for snapshot in (old_arm/'snapshots').iterdir():
        if snapshot.is_dir() and not snapshot.name.endswith('.staging'):
            manifest=common.verify_snapshot(snapshot)
            total+=2*(sum((snapshot/'source'/n).stat().st_size for n in manifest['files'])+(snapshot/'manifest.json').stat().st_size)
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
    total+=sum((workspace/n).stat().st_size for n in common.inventory(workspace))+16*1024**2
    if total>MIGRATION_CAP: raise RuntimeError('cumulative migration retention cap')
    return total


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
            if relative.parts[0] not in ('objects','manifests','own-checks') and not (
                    len(relative.parts)==1 and relative.name.startswith('round-') and relative.suffix=='.json'):
                raise RuntimeError('unknown history provenance; preserve parent and stop')
            size=path.stat().st_size;total+=size;count+=1
            if size>32*1024**2 or total>256*1024**2 or count>10000:
                raise RuntimeError('inherited history bound')
            copy_file(path,destination/relative)



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
    """Fresh accounting epoch, inherited own mathematics and global round labels."""
    if parent['active'] is not None or parent.get('active_intent') is not None or parent['resolution']:
        raise RuntimeError('cannot migrate active or resolved parent')
    episode=parent['research'].get('episode')
    if parent['phase']!='research' or (episode is not None and not (
            episode.get('status')=='reviewed; delayed use remains observable' and
            episode.get('review_round',parent['round'])<parent['round'] and
            episode.get('review_round',-1)+1 in parent['reviewed_rounds'])):
        raise RuntimeError('parent episode not safely closed')
    result=copy.deepcopy(fresh)
    result.update(research=research,round=parent['round'],phase='research',
        reviewed_rounds=list(parent['reviewed_rounds']),seal_hash=new_seal_hash,
        status='ready; own-history continuation; new finite allowance')
    # All fresh operational fields remain fresh: reservations, counters, receipts,
    # protocol guard, watchdog identities, failures, roles and evaluation outcomes.
    return result


def lock_available(path):
    path=Path(path)
    with path.open('a') as stream:
        try: fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError: return False
        fcntl.flock(stream,fcntl.LOCK_UN)
    return True


def pid_exists(pid):
    if not pid: return False
    try: os.kill(int(pid),0)
    except ProcessLookupError: return False
    return True


def parent_ready(parent,first=False):
    common=api()['common'];parent=Path(parent)
    if not lock_available(parent/'controller.lock'): return False,'parent controller/watchdog lock held'
    modes=('exploration','baseline') if first else ('exploration',)
    for mode in modes:
        state=common.load_state(parent/'arms'/mode/'state.json')
        if state['active'] is not None: return False,'parent owns active invocation'
        if state['status'] not in ('finite_budget_finished; root_open','mathematically_resolved'):
            return False,'parent arm has not finished'
        if state['resolution']: return False,'parent root resolved; independent completion review required'
    if first:
        result=ORIGINAL_OPS/'SEQUENTIAL017V1_RESULT.json'
        if not result.exists() or read(result).get('status')!='both official arms finished sequentially':
            return False,'original sequential operator has not finished normally'
        # Fail closed on an existing recorded PID, including possible reuse. No
        # process is signalled or assumed to be the old operator from PID alone.
        for name in ('SEQUENTIAL017V1_BEGIN.json','sequential017v1-exploration-launch.json','sequential017v1-baseline-launch.json'):
            path=ORIGINAL_OPS/name
            if path.exists() and pid_exists(read(path).get('pid')):
                return False,'recorded original process PID still exists; identity review needed'
    return True,None


def controls():
    if INTERRUPTED: raise RuntimeError(INTERRUPTED)
    for path in (OPS/'STOP.json',ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json'):
        if path.exists(): raise RuntimeError('operator stop or unresolved cleanup hold')


def review_ok():
    review=read(OPS/'REVIEW.json')
    tests=OPS/'OPERATIONAL_TEST_RESULT.json'
    if (review.get('accepted') is not True or not review.get('reviewer') or
        review.get('source_sha256')!=sha(__file__) or
        review.get('tests_sha256')!=sha(OPS/'test_continue_machine.py') or
        review.get('test_result_sha256')!=sha(tests) or read(tests).get('passed') is not True):
        raise RuntimeError('exact independent operational source/test review required')


def milestone_accepted():
    path=OPS/'MILESTONE_ACCEPTED.json'
    if not path.exists(): return False
    marker=read(path)
    if marker.get('accepted') is not True or marker.get('user_goal_sha256')!=digest(GOAL) or not marker.get('reviewer'):
        raise RuntimeError('invalid operator-only milestone review')
    report=Path(marker['audit_report'])
    if not report.resolve().is_relative_to(OPS.resolve()) or sha(report)!=marker.get('audit_report_sha256'):
        raise RuntimeError('milestone audit binding changed')
    return True


def inspect_plan(parent,number,*,include_private_evaluator_inputs=False):
    a=api();parent=Path(parent)
    state=a['common'].load_state(parent/'arms/exploration/state.json')
    protocol=copy.deepcopy(a['common'].read(parent/'protocol.json'))
    protocol['rounds']=state['round']+ADDITIONAL_ROUNDS
    a['study'].validate_protocol(protocol)
    a['study'].validate_commitment(protocol,2)
    if protocol['model']!='gpt-6.1-sol' or protocol['transport']!='live':
        raise RuntimeError('independent configured researcher changed')
    if digest(a['common'].implementation())!=EXPECTED_IMPL:
        raise RuntimeError('frozen machinery identity changed')
    contract=a['common'].read(parent/'seed/contract.json')
    if digest(contract)!=EXPECTED_CONTRACT: raise RuntimeError('original exact root contract changed')
    # Dry planning reads only the existing seal digest, never the private panel.
    original_seal=a['common'].read(ORIGINAL/'seal.json')
    if original_seal['suite']!=EXPECTED_SUITE: raise RuntimeError('original panel seal changed')
    suite=curation=None
    if include_private_evaluator_inputs:
        # Runtime evaluator input only: never emitted or put in research history.
        suite=a['common'].read(ORIGINAL/'evaluation/suite.json')
        if digest(suite)!=EXPECTED_SUITE or len(suite['tasks'])!=2: raise RuntimeError('original frozen panel changed')
        curation=original_seal['curation']
    a['common'].authorize_live(contract)
    return state,protocol,contract,suite,curation


def migrate(parent,number):
    global COPY_GUARD
    a=api();common=a['common'];parent=Path(parent)
    old,p,contract,suite,curation=inspect_plan(parent,number,include_private_evaluator_inputs=True)
    ready,reason=parent_ready(parent,first=(parent==ORIGINAL))
    if not ready: raise RuntimeError(reason)
    new=ROOT/'.scratch'/f'paired-v3-restart-20261019-goal-continuation-{number:04d}'
    if new.exists(): raise RuntimeError('successor already exists; no overwrite or uncertain replay')
    old_arm=parent/'arms/exploration';old_ws=old_arm/'workspace'
    planned=planned_copy_bytes(old_arm,old)
    COPY_GUARD=CopyGuard(planned,a['resources'])
    a['study'].verify(parent)
    if parent!=ORIGINAL:
        parent_seal=common.read(parent/'seal.json')
        if sha(parent/'CONTINUATION_PROVENANCE.json')!=parent_seal.get('continuation_provenance_sha256'):
            raise RuntimeError('parent continuation provenance changed')
    common.verify_snapshot(old_arm/'snapshots'/f'round-{old["round"]-1:04d}')
    # freeze performs real neutral deployment checks only after launch review;
    # ordinary official research still starts later, in one separate child.
    a['study'].freeze(new,p,suite,contract,curation)
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
    # Old snapshots remain clearly inherited; rounds preserve their global labels.
    # The successor's initial checkpoint is the resumed source/state, not a claim
    # of a pristine paired seed. Parent originals are never changed.
    inherited_snapshots={}
    for path in sorted((old_arm/'snapshots').iterdir()):
        if path.is_dir() and not path.name.endswith('.staging'):
            manifest=common.verify_snapshot(path)
            dest=arm/'inherited/snapshots'/path.name
            for name,expected in manifest['files'].items():
                copy_file(path/'source'/safe_relative(name),dest/'source'/safe_relative(name),expected)
            copy_file(path/'manifest.json',dest/'manifest.json')
            common.verify_snapshot(dest);inherited_snapshots[path.name]=manifest['binding']
            if path.name.startswith('round-'):
                # Future ordinary episode review names these exact snapshots.
                live=arm/'snapshots'/path.name
                for name,expected in manifest['files'].items():
                    copy_file(dest/'source'/name,live/'source'/name,expected)
                copy_file(dest/'manifest.json',live/'manifest.json')
    provenance=dict(schema='math-gkm.own-continuation-provenance.v1',parent_study=str(parent),
        parent_state_sha256=sha(old_arm/'state.json'),parent_seal_sha256=sha(parent/'seal.json'),
        parent_round=old['round'],additional_rounds=ADDITIONAL_ROUNDS,
        parent_research_sha256=digest(old['research']),parent_workspace_inventory=files,
        preserved_mathematical_state='identical except explicit validator directory relocation',
        old_accounting={k:v for k,v in old.items() if k!='research'},
        validator_remaps=remaps,inherited_snapshots=inherited_snapshots,
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
    write(new/'MIGRATION_FINISHED.json',dict(provenance_sha256=sha(new/'CONTINUATION_PROVENANCE.json'),
        seal_sha256=sha(new/'seal.json'),state_sha256=sha(arm/'state.json'),finished=time.time(),
        source_sha256=sha(__file__),review_sha256=sha(OPS/'REVIEW.json')))
    COPY_GUARD=None
    return new


def stop_child(child,study,deadline,reason):
    event('stop_requested',reason=reason,child_pid=child.pid)
    api()['common'].write(study/'STOP.json',dict(origin='continuation operator',reason=reason,time=time.time()))
    end=min(deadline,time.monotonic()+CLEANUP_SECONDS)
    # First allow the official STOP channel to finish normal cleanup. Only a
    # last bounded fallback signals this own unreaped controller, never a PID.
    while child.poll() is None and time.monotonic()<end-30: time.sleep(1)
    if child.poll() is None: child.terminate()
    while child.poll() is None and time.monotonic()<end: time.sleep(1)
    if child.poll() is None:
        write(OPS/'UNRESOLVED.json',dict(child_pid=child.pid,study=str(study),reason=reason))
        return False
    return True


def run_operator(wait_seconds):
    controls();review_ok()
    a=api();started=time.monotonic();deadline=started+OPERATOR_SECONDS
    with (OPS/'operator.lock').open('a') as operator_lock:
        fcntl.flock(operator_lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        state=read(OPS/'STATUS.json')
        if state.get('research_launched') or state.get('status') in ('migration_in_progress','needs_reconciliation'):
            raise RuntimeError('previous owned invocation needs explicit reconciliation; no automatic replay')
        completed=state.get('completed_epochs',[])
        parent=Path(completed[-1]['study']) if completed else ORIGINAL
        number=len(completed)+1
        registry(status='waiting_for_parent',operator_pid=os.getpid(),research_launched=False,
            intended_successor=str(ROOT/'.scratch'/f'paired-v3-restart-20261019-goal-continuation-{number:04d}'))
        wait_end=min(deadline-CLEANUP_SECONDS,time.monotonic()+wait_seconds)
        while True:
            controls()
            if milestone_accepted():
                registry(status='operator_milestone_review_accepted',operator_pid=None,research_launched=False,
                    completion_scope='independently reviewed partial LC milestone; full root may remain open')
                return
            ready,reason=parent_ready(parent,first=(parent==ORIGINAL))
            if ready: break
            if reason and 'root resolved' in reason:
                registry(status='awaiting_independent_root_review',operator_pid=None,
                    research_launched=False,reason=reason)
                return
            if time.monotonic()>=wait_end:
                registry(status='waiting_for_parent; operator_not_running',operator_pid=None,
                    reason=reason,next_argv=[PYTHON,str(Path(__file__).resolve()),'run','--wait-parent-seconds','86400'])
                return
            time.sleep(min(2,max(0,wait_end-time.monotonic())))
        while time.monotonic()<deadline-CLEANUP_SECONDS:
            controls()
            if milestone_accepted():
                registry(status='operator_milestone_review_accepted',operator_pid=None,research_launched=False,
                    completion_scope='independently reviewed partial LC milestone; full root may remain open')
                return
            a['resources'].headroom(a['resources'].limits())
            registry(status='migration_in_progress',current_parent=str(parent),next_epoch=number,research_launched=False)
            try:
                study=migrate(parent,number)
                controls();review_ok()
            except BaseException as exc:
                registry(status='needs_reconciliation',reason=str(exc),operator_pid=None,
                    research_launched=False,goal_open=True)
                raise
            argv=[PYTHON,'-m','machinery.study','run','--study',str(study),'--arm','exploration']
            logfile=OPS/f'epoch-{number:04d}.log'
            child=None
            try:
                with logfile.open('xb') as out:
                    child=subprocess.Popen(argv,cwd=ROOT,stdout=out,stderr=out,stdin=subprocess.DEVNULL,
                        start_new_session=True,env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'})
                    write(OPS/f'epoch-{number:04d}-launch.json',dict(pid=child.pid,argv=argv,study=str(study),
                        started=time.time(),migration_sha256=sha(study/'MIGRATION_FINISHED.json')))
                    registry(status='research_running',current_study=str(study),child_pid=child.pid,
                        operator_pid=os.getpid(),research_launched=True,epoch=number)
                    while child.poll() is None:
                        controls()
                        if time.monotonic()>=deadline-CLEANUP_SECONDS: raise RuntimeError('operator bound; preserve goal open')
                        if logfile.stat().st_size>LOG_LIMIT: raise RuntimeError('controller log bound')
                        time.sleep(2)
            except BaseException as exc:
                clean=stop_child(child,study,deadline,str(exc)) if child is not None else True
                registry(status='needs_reconciliation',reason=str(exc),current_study=str(study),
                    operator_pid=None,child_pid=child.pid if child is not None and not clean else None,
                    research_launched=not clean,goal_open=True)
                raise
            final=a['common'].load_state(study/'arms/exploration/state.json')
            ready,reason=parent_ready(study)
            if child.returncode!=0 or not ready:
                registry(status='needs_reconciliation',reason=reason or 'official controller nonzero',
                    current_study=str(study),operator_pid=None,child_pid=None,research_launched=False,goal_open=True)
                return
            completed.append(dict(study=str(study),epoch=number,status=final['status'],round=final['round'],
                state_sha256=sha(study/'arms/exploration/state.json'),finished=time.time()))
            registry(status='epoch_finished; goal_unverified',completed_epochs=completed,
                last_completed_study=str(study),current_study=str(study),child_pid=None,
                research_launched=False,goal_open=True)
            event('epoch_finished',epoch=number,study=str(study),round=final['round'])
            parent=study;number+=1
        registry(status='needs_next_operator_epoch; goal_open',operator_pid=None,research_launched=False,
            next_argv=[PYTHON,str(Path(__file__).resolve()),'run','--wait-parent-seconds','86400'])


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command',choices=('plan','run','status','stop'))
    parser.add_argument('--wait-parent-seconds',type=int,default=24*3600)
    args=parser.parse_args()
    if not 0<=args.wait_parent_seconds<=OPERATOR_SECONDS-CLEANUP_SECONDS: parser.error('wait bound exceeds finite operator allowance')
    if args.command=='status': print(canonical(read(OPS/'STATUS.json')));return
    if args.command=='stop': write(OPS/'STOP.json',dict(requested=time.time()));return
    if args.command=='plan':
        state,p,contract,suite,curation=inspect_plan(ORIGINAL,1)
        ready,reason=parent_ready(ORIGINAL,True)
        print(canonical(dict(parent_ready=ready,reason=reason,parent_round=state['round'],
            next_round_limit=p['rounds'],new_allowance_seconds=p['arm_seconds'],model=p['model'],
            inherited_knowledge=len(state['research']['knowledge']),suite_sha256=EXPECTED_SUITE,
            suite_tasks=2,source_sha256=sha(__file__),launches_models=False,
            launches_proofs=False,requires_exact_independent_review=True)))
        return
    def signal_stop(number,frame):
        global INTERRUPTED
        INTERRUPTED='operator signal '+str(number)
    for number in (signal.SIGTERM,signal.SIGINT): signal.signal(number,signal_stop)
    run_operator(args.wait_parent_seconds)


if __name__=='__main__':
    try: main()
    except BaseException as exc:
        if isinstance(exc,KeyboardInterrupt): raise
        print(canonical(dict(operational_error=type(exc).__name__,reason=str(exc),goal_achieved=False)),file=sys.stderr)
        raise SystemExit(2)
