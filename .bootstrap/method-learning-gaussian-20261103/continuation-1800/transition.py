"""Prospective, operator-activated boundary fence; never observes PIDs or launches work.

Default inspection has no side effects. Activation is a distinct operator action.
After requesting STOP, controller and heavy leases remain held until the operator
supplies an authenticated observation of the original *owned tool handle* closing.
"""
import argparse
import contextlib
import fcntl
import hashlib
import importlib.util
import json
import math
import os
import signal
from pathlib import Path
import time

ROOT = Path('/Users/sasha/math_gkm')
SCHEMA = 'math-gkm.gaussian-boundary-transition-binding.v1'
FINISHED = 'math-gkm.gaussian-boundary-transition-finished.v1'
REGISTRATION = 'math-gkm.gaussian-owner-handle-registration.v1'
EXIT = 'math-gkm.gaussian-owner-handle-exit.v1'
ACTIVATION = 'math-gkm.gaussian-boundary-transition-activation.v1'
PARSER = ROOT/'.bootstrap/gaussian-native-operator-20261031/public_json_projection.py'
PARSER_SHA = '5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec'
MAX_FILES = 10000
MAX_BYTES = 1024**3

class Refused(ValueError):
    pass

class Busy(Refused):
    pass


def sha(path):
    value=hashlib.sha256()
    with Path(path).open('rb') as source:
        for block in iter(lambda:source.read(1024**2),b''):value.update(block)
    return value.hexdigest()


def digest(value):
    return hashlib.sha256(json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode()).hexdigest()


def raw(path,cap=32*1024**2):
    path=Path(path)
    if path.is_symlink() or not path.is_file() or path.stat().st_size>cap:
        raise Refused('bounded regular artifact required')
    return path.read_bytes().strip()


def read(path):
    # Only this gate's typed public metadata, sealed configuration, or protocol.
    return json.loads(raw(path))


def write_exclusive(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    with path.open('x') as output:
        output.write(json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n')
        output.flush();os.fsync(output.fileno())
    fd=os.open(path.parent,os.O_RDONLY)
    try:os.fsync(fd)
    finally:os.close(fd)


def own(path):
    path=Path(path)
    if not path.is_absolute() or path.is_symlink() or not path.resolve().is_relative_to(ROOT.resolve()):
        raise Refused('transition path escaped owned workspace')
    return path


def pin(value):
    if not isinstance(value,dict) or set(value)!={'path','sha256'}:
        raise Refused('exact source pin required')
    path=own(value['path'])
    if sha(path)!=value['sha256']:raise Refused('pinned source changed')
    return path


def parser():
    if sha(PARSER)!=PARSER_SHA:raise Refused('approved selective parser changed')
    spec=importlib.util.spec_from_file_location('boundary_projection',PARSER)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    return module


@contextlib.contextmanager
def lock(path):
    # Only activation calls this. Never wait holding controller for a busy heavy lease.
    path=Path(path)
    if path.is_symlink() or not path.is_file():raise Refused('existing ordinary lock file required')
    with path.open('a') as stream:
        try:fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError:raise Busy('owned boundary or heavy admission is busy') from None
        try:yield
        finally:fcntl.flock(stream,fcntl.LOCK_UN)


@contextlib.contextmanager
def defer_termination():
    # Cooperative operator interruption is deferred only while a fenced STOP
    # awaits its genuine handle closure. A supervisor must retain this process;
    # machine failure/SIGKILL cannot be made transactional by a Python lock.
    saved={}
    for signum in (signal.SIGINT,signal.SIGTERM):
        saved[signum]=signal.getsignal(signum)
        signal.signal(signum,lambda *_:None)
    try:yield
    finally:
        for signum,handler in saved.items():signal.signal(signum,handler)


def inventory(directory,*,mutable=()):
    result={};total=0;directory=Path(directory)
    if not directory.exists():return result
    for path in sorted(directory.rglob('*')):
        if path.is_symlink():raise Refused('operational evidence alias refused')
        if not path.is_file():continue
        relative=path.relative_to(directory).as_posix()
        if relative in mutable:continue
        total+=path.stat().st_size
        if len(result)>=MAX_FILES or total>MAX_BYTES:raise Refused('operational evidence bound exceeded')
        result[str(path)]=sha(path)
    return result


class Native:
    """Read-only native verification and E1 public projections, never a paid action."""
    def implementation(self):
        from machinery.study_common import implementation
        return digest(implementation())
    def verify(self,path):
        from machinery.study import verify
        return verify(Path(path))
    def state(self,study,mode):
        e=parser();path=Path(study)/'arms'/mode/'state.json'
        envelope=e.fields(raw(path));body=envelope['state']
        if e.select(envelope,('sha256',))['sha256']!=hashlib.sha256(body).hexdigest():
            raise Refused('state envelope integrity changed')
        fields=e.fields(body)
        row=e.select(fields,('round','phase','status'))
        if any(fields.get(key,b'null')!=b'null' for key in ('active','active_intent','resolution')):
            raise Refused('parent active, unsettled, or mathematically resolved')
        receipts=e.select(fields,('receipts','receipt_hashes'))
        selected={};jobs=Path(study)/'arms'/mode/'jobs'
        for job in sorted(jobs.iterdir()) if jobs.exists() else ():
            if not job.is_dir() or job.is_symlink():raise Refused('invalid own job directory')
            path=job/'receipt.json';rf=e.fields(raw(path))
            meta=e.select(rf,('request_id','returncode'))
            if type(meta.get('returncode')) is not int or meta.get('request_id')!=job.name:
                raise Refused('own job has no actual numeric receipt')
            # Hash authenticated receipt bytes without decoding its protected payload.
            if str(job) not in receipts['receipts'] or hashlib.sha256(raw(path)).hexdigest()!=receipts['receipt_hashes'].get(str(job)):
                raise Refused('parent receipt is unreconciled or changed')
            selected[str(path)]=sha(path)
        if set(receipts['receipts'])!={str(Path(p).parent) for p in selected}:
            raise Refused('parent receipt registry differs from own jobs')
        return dict(row,state_sha256=sha(Path(study)/'arms'/mode/'state.json'),receipts=selected)
    def sleep(self):time.sleep(2)
    def now(self):return time.time()


def load_binding(path,backend):
    value=read(path)
    required={'schema','legacy_config','legacy_output','legacy_owner','qualification','new_profile',
        'registration','implementation_sha256','contract_sha256','transition_source_sha256'}
    if not isinstance(value,dict) or set(value)!=required or value['schema']!=SCHEMA:
        raise Refused('transition binding schema differs')
    if sha(__file__)!=value['transition_source_sha256']:raise Refused('transition source changed')
    old=read(pin(value['legacy_config']));pin(value['legacy_owner']);qualification=read(pin(value['qualification']))
    profile=read(pin(value['new_profile']));registration=read(pin(value['registration']))
    output=own(value['legacy_output']);original=own(old['initial_study'])
    for source in (old['epoch_source'],old['finalization_source']):pin(source)
    if (sha(value['legacy_owner']['path'])!=old['owner_source_sha256'] or
        old['implementation_sha256']!=value['implementation_sha256'] or
        old['contract_sha256']!=value['contract_sha256'] or backend.implementation()!=value['implementation_sha256'] or
        qualification.get('schema')!='math-gkm.gaussian-goal-qualified.v1' or
        qualification.get('configuration_sha256')!=value['legacy_config']['sha256'] or
        qualification.get('finalization_source_sha256')!=old['finalization_source']['sha256'] or
        qualification.get('owner_source_sha256')!=old['owner_source_sha256'] or
        qualification.get('epoch_source_sha256')!=old['epoch_source']['sha256'] or
        qualification.get('contract_sha256')!=value['contract_sha256']):
        raise Refused('old owner, qualification, source, or goal binding differs')
    old_profile=read(pin({'path':old['profile_path'],'sha256':old['profile_sha256']}))
    if old_profile.get('validation_seconds')!=600 or old_profile.get('rounds')!=8 or profile.get('validation_seconds')!=1800:
        raise Refused('old600 and fresh1800 allowances must be separate')
    initial_binding=read(pin({'path':old['initial_binding'],'sha256':old['initial_binding_sha256']}))
    if any(initial_binding.get(key)!=old[key] for key in ('implementation_sha256','profile_sha256','contract_sha256')):
        raise Refused('original comparison provenance differs')
    if initial_binding.get('study')!=str(original):raise Refused('original study binding differs')
    contract=read(own(old['contract_path']))
    if digest(contract)!=value['contract_sha256']:raise Refused('original mathematical contract changed')
    if (registration.get('schema')!=REGISTRATION or registration.get('legacy_output')!=str(output) or
        registration.get('legacy_owner_source_sha256')!=old['owner_source_sha256'] or
        not isinstance(registration.get('owned_tool_handle'),str) or not registration['owned_tool_handle'].strip() or
        type(registration.get('registered_at')) not in (int,float) or not math.isfinite(registration['registered_at']) or registration['registered_at']<=0):
        raise Refused('actual owned tool handle must be registered before request')
    own(registration['exit_marker_path'])
    return value,old,old_profile,profile,registration


def finished_commands(output):
    rows={};directory=Path(output)/'commands'
    for command in sorted(directory.iterdir()) if directory.exists() else ():
        if not command.is_dir() or command.is_symlink():raise Refused('invalid own command directory')
        intent=read(command/'INTENT.json');closed=read(command/'EXIT.json')
        if (type(closed.get('returncode')) is not int or closed.get('actual_numeric_exit_observed') is not True or
            closed.get('owned_handle') is not True or closed.get('log_sha256')!=sha(command/'private.log')):
            raise Refused('own operational command remains unsettled')
        rows[str(command)]={'kind':intent.get('kind'),'returncode':closed['returncode'],'argv':intent.get('argv')}
    return rows


def no_paid_finalizers(output,source,implementation_sha,commands):
    base=Path(output)/'finalizations'
    if not base.exists():return
    for entry in sorted(base.iterdir()):
        if entry.name=='finalization-ledger':
            if any(entry.iterdir()):raise Refused('prior finalization ledger cannot be dropped or replayed')
            continue
        if not entry.is_dir() or entry.is_symlink():raise Refused('unexpected finalizer evidence')
        summary=read(entry/'summary.json')
        authenticated=False
        for command in commands.values():
            argv=command.get('argv')
            if command['kind']=='finalization' and command['returncode']==0 and isinstance(argv,list):
                if ('--output' in argv and argv.index('--output')+1<len(argv) and
                    argv[argv.index('--output')+1]==str(entry) and len(argv)>1 and argv[1]==source['path']):
                    authenticated=True
        if not authenticated:raise Refused('empty finalizer summary lacks its own closed command')
        if (set(p.name for p in entry.iterdir())!={'summary.json'} or
            summary.get('source_sha256')!=source['sha256'] or summary.get('implementation_sha256')!=implementation_sha or summary.get('status')!='no_eligible_current_exact_root' or
            any(type(summary.get(k)) is not int or summary[k]!=0 for k in ('candidates','reviewed','rejected','new_attempts')) or
            summary.get('resolved') is not False or summary.get('more_eligible') is not False):
            raise Refused('only finished zero-attempt finalizer history can transfer')


def snapshot(binding_path,backend,*,after_request=False):
    if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():raise Refused('unresolved cleanup hold')
    value,old,old_profile,new_profile,registration=load_binding(binding_path,backend)
    output=Path(value['legacy_output']);current=read(output/'CURRENT.json');checkpoint=read(output/'OWNER_CHECKPOINT.json')
    if (current.get('schema')!='math-gkm.gaussian-goal-current.v1' or current.get('owner_source_sha256')!=old['owner_source_sha256'] or
        current.get('contract_sha256')!=value['contract_sha256'] or current.get('root_proved') is not False or
        type(current.get('epoch')) is not int or current['epoch']<0 or
        any(current.get(k)!=checkpoint.get(k) for k in ('current_study','epoch','phase','root_proved'))):
        raise Refused('source-qualified current owner pointer differs')
    if not after_request and (checkpoint.get('pending_curation') or checkpoint.get('pending_successor')):
        raise Refused('owner already has an unsettled epoch transition')
    original=Path(old['initial_study']);parent=own(current['current_study'])
    if current['epoch']==0:
        if parent!=original:raise Refused('epoch0 must be original comparison')
    else:
        expected=Path(old['successor_root'])/f'method-learning-gaussian-20261103-epoch-{current["epoch"]:04d}'
        if parent!=expected:raise Refused('current successor is not owned by the old owner')
    studies=[original]+([] if parent==original else [parent]);states={}
    for study in studies:
        backend.verify(study)
        protocol=read(study/'protocol.json')
        if any(protocol.get(k)!=v for k,v in old_profile.items() if k!='rounds'):
            raise Refused('parent old600 protocol differs from its frozen allowance')
        if protocol.get('rounds')!=8*(current['epoch']+1 if study==parent else 1):
            raise Refused('finite parent allowance/epoch differs')
        if digest(read(study/'seed/contract.json'))!=value['contract_sha256']:
            raise Refused('finite parent mathematical target differs')
        modes=('baseline','exploration') if study==original else ('exploration',)
        for mode in modes:
            row=backend.state(study,mode)
            if row['round']!=protocol['rounds'] or row['phase']!='research' or row['status']!='finite_budget_finished; root_open':
                raise Refused('original comparison and parent must actually finish finite epochs')
            states[str(study)+':'+mode]=row
        stop=study/'STOP.json'
        if stop.exists() and not after_request:raise Refused('existing study stop must not be overwritten')
    # Every inherited epoch must be an actual closed migration by this owner,
    # never a similarly named study or an unqualified prospective destination.
    for number in range(1,current['epoch']+1):
        study=Path(old['successor_root'])/f'method-learning-gaussian-20261103-epoch-{number:04d}'
        previous=original if number==1 else Path(old['successor_root'])/f'method-learning-gaussian-20261103-epoch-{number-1:04d}'
        backend.verify(study)
        marker=read(study/'MIGRATION_FINISHED.json');provenance=read(study/'CONTINUATION_PROVENANCE.json')
        seal=read(study/'seal.json')
        if (marker.get('schema')!='math-gkm.closed-own-epoch.v1' or
            marker.get('source_sha256')!=old['epoch_source']['sha256'] or
            marker.get('seal_sha256')!=sha(study/'seal.json') or
            marker.get('provenance_sha256')!=sha(study/'CONTINUATION_PROVENANCE.json') or
            seal.get('continuation_provenance_sha256')!=sha(study/'CONTINUATION_PROVENANCE.json') or
            provenance.get('parent_study')!=str(previous) or provenance.get('arm')!='exploration' or
            marker.get('parent_state_sha256')!=sha(previous/'arms/exploration/state.json') or
            provenance.get('parent_state_sha256')!=marker.get('parent_state_sha256') or
            provenance.get('parent_seal_sha256')!=sha(previous/'seal.json') or
            provenance.get('original_comparison')!='Immutable at original parent; successor is noncomparative own-history goal work.' or
            provenance.get('start_round')!=8*number or provenance.get('end_round')!=8*(number+1)):
            raise Refused('successor lacks genuine closed migration provenance')
    if (output/'STOP').exists() and not after_request:raise Refused('existing owner stop must not be overwritten')
    commands=finished_commands(output);no_paid_finalizers(output,old['finalization_source'],value['implementation_sha256'],commands)
    owner_projection={'current_sha256':sha(output/'CURRENT.json'),'checkpoint_sha256':sha(output/'OWNER_CHECKPOINT.json'),
        'phase':checkpoint['phase'],'pending_curation':checkpoint.get('pending_curation'),
        'pending_successor':checkpoint.get('pending_successor')}
    evidence=inventory(output,mutable=('CURRENT.json','OWNER_CHECKPOINT.json','owner.lock','STOP'))
    return dict(parent_study=str(parent),original_comparison_study=str(original),epoch=current['epoch'],
        states=states,commands=commands,preserved_files=evidence,owner_projection=owner_projection,legacy_profile_sha256=old['profile_sha256'],
        legacy_owner_source_sha256=old['owner_source_sha256'],new_profile_sha256=value['new_profile']['sha256'],
        implementation_sha256=value['implementation_sha256'],contract_sha256=value['contract_sha256'])


def same_parent(before,after):
    for key in ('parent_study','original_comparison_study','epoch','states','legacy_profile_sha256',
                'legacy_owner_source_sha256','new_profile_sha256','implementation_sha256','contract_sha256'):
        if before[key]!=after[key]:raise Refused('selected parent/source changed across held fence')
    if any(after['preserved_files'].get(k)!=v for k,v in before['preserved_files'].items()):
        raise Refused('prior operational evidence changed during handoff')


def valid_exit(marker,registration,registration_sha,request,request_sha):
    if not isinstance(marker,dict):raise Refused('actual closure witness must be a JSON object')
    if (type(request.get('requested_at')) not in (int,float) or not math.isfinite(request['requested_at']) or
        request['requested_at']<registration['registered_at'] or marker.get('schema')!=EXIT or marker.get('registration_sha256')!=registration_sha or
        marker.get('request_sha256')!=request_sha or marker.get('owned_tool_handle')!=registration['owned_tool_handle'] or
        marker.get('actual_tool_handle_exit_observed') is not True or type(marker.get('returncode')) is not int or
        type(marker.get('observed_at')) not in (int,float) or not math.isfinite(marker['observed_at']) or
        marker['observed_at']<request['requested_at'] or
        not isinstance(marker.get('tool_completion_reference'),str) or not marker['tool_completion_reference'].strip()):
        raise Refused('actual registered tool-handle closure witness is missing or premature')
    return marker['returncode']


class Gate:
    def __init__(self,binding_path,output,backend=None):
        self.binding_path=Path(binding_path);self.output=own(output);self.backend=backend or Native()
    def inspect(self):
        # A candidate observation, explicitly not a lock-qualified transition.
        return dict(eligible_candidate=True,lock_qualified=False,**snapshot(self.binding_path,self.backend))
    def activate(self,activation_path):
        activation=read(activation_path)
        if (activation.get('schema')!=ACTIVATION or activation.get('activate') is not True or
            activation.get('binding_sha256')!=sha(self.binding_path) or activation.get('transition_source_sha256')!=sha(__file__)):
            raise Refused('separate explicit source-bound activation required')
        if self.output.exists():raise Refused('fresh transition output required; uncertain request cannot replay')
        before=snapshot(self.binding_path,self.backend)
        value,old,old_profile,new_profile,registration=load_binding(self.binding_path,self.backend)
        if Path(registration['exit_marker_path']).exists():raise Refused('preexisting exit witness cannot authorize a later request')
        with lock(Path(before['parent_study'])/'controller.lock'):
            with lock(ROOT/'.scratch/resources/heavy.lock'):
                if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():raise Refused('unresolved cleanup hold')
                fenced=snapshot(self.binding_path,self.backend);same_parent(before,fenced)
                if activation.get('binding_sha256')!=sha(self.binding_path) or activation.get('transition_source_sha256')!=sha(__file__):
                    raise Refused('activation inputs changed before fenced request')
                self.output.mkdir(parents=True)
                request={'schema':'math-gkm.gaussian-boundary-transition-request.v1','binding_sha256':sha(self.binding_path),
                    'activation_sha256':sha(activation_path),'requested_at':self.backend.now(),
                    'parent_study':before['parent_study'],'epoch':before['epoch'],
                    'owned_tool_handle':registration['owned_tool_handle'],'registration_sha256':value['registration']['sha256']}
                write_exclusive(self.output/'REQUEST.json',request)
                # From this point the fence cannot be released before actual closure.
                # Operator must retain this gate's own live handle; do not kill it.
                stop=Path(value['legacy_output'])/'STOP'
                request_sha=sha(self.output/'REQUEST.json')
                publication_error=None
                with defer_termination():
                    # Fence BEFORE trying publication: open/write/flush/fsync can
                    # fail after STOP becomes visible to the owner. Even an
                    # uncertain publication must await actual handle closure.
                    try:
                        write_exclusive(stop,{'operator_transition':str(self.output/'REQUEST.json'),
                            'request_sha256':request_sha,'requested_at':request['requested_at']})
                    except Exception as exc:
                        publication_error=type(exc).__name__
                    while True:
                        try:
                            marker=read(registration['exit_marker_path'])
                            code=valid_exit(marker,registration,value['registration']['sha256'],request,request_sha)
                            break
                        except Exception:
                            # Any ordinary malformed-input or observation error
                            # after possible STOP publication is held, never an
                            # exception path that releases either fence early.
                            try:self.backend.sleep()
                            except Exception:time.sleep(.2)
                if publication_error is not None:
                    raise Refused('actual owner closed after uncertain STOP publication: '+publication_error)
                # Actual owner is closed. Refusal here may release locks safely, but
                # never emits a success receipt or rewrites old evidence/STOP.
                after=snapshot(self.binding_path,self.backend,after_request=True);same_parent(before,after)
                stops={str(stop):sha(stop)}
                for study in {before['parent_study'],before['original_comparison_study']}:
                    path=Path(study)/'STOP.json'
                    if path.exists():stops[str(path)]=sha(path)
                receipt=dict(schema=FINISHED,binding_sha256=sha(self.binding_path),
                    request_path=str(self.output/'REQUEST.json'),request_sha256=sha(self.output/'REQUEST.json'),
                    exit_marker_path=registration['exit_marker_path'],exit_marker_sha256=sha(registration['exit_marker_path']),
                    activation_path=str(activation_path),activation_sha256=sha(activation_path),
                    actual_numeric_exit_observed=True,returncode=code,old_stop_markers=stops,
                    before=fenced,after=after,finished_at=self.backend.now(),
                    scope='Closed original600 experiment; separately funded1800 successor only; unpaid setup artifacts retained, never replayed.')
                write_exclusive(self.output/'TRANSITION_FINISHED.json',receipt)
                return receipt


def verify_receipt(binding_path,receipt_path,*,expected_new_profile_sha256,expected_contract_sha256,expected_implementation_sha256):
    backend=Native();value,old,op,np,registration=load_binding(binding_path,backend);receipt=read(receipt_path)
    if (receipt.get('schema')!=FINISHED or receipt.get('binding_sha256')!=sha(binding_path) or
        value['new_profile']['sha256']!=expected_new_profile_sha256 or value['contract_sha256']!=expected_contract_sha256 or
        value['implementation_sha256']!=expected_implementation_sha256 or receipt.get('actual_numeric_exit_observed') is not True):
        raise Refused('finished transition does not bind this fresh owner and allowance')
    for path_key,hash_key in [('request_path','request_sha256'),('exit_marker_path','exit_marker_sha256'),('activation_path','activation_sha256')]:
        if sha(own(receipt[path_key]))!=receipt[hash_key]:raise Refused('transition closure artifact changed')
    request=read(receipt['request_path']);marker=read(receipt['exit_marker_path'])
    if Path(receipt['request_path']).parent!=Path(receipt_path).parent or Path(receipt['request_path']).name!='REQUEST.json':
        raise Refused('request and finished receipt must share their fresh gate directory')
    if receipt['exit_marker_path']!=registration['exit_marker_path']:
        raise Refused('tool witness is not at its registered destination')
    stop=Path(value['legacy_output'])/'STOP'
    if str(stop) not in receipt['old_stop_markers']:
        raise Refused('operator stop provenance missing')
    stop_value=read(stop)
    if stop_value.get('operator_transition')!=receipt['request_path'] or stop_value.get('request_sha256')!=receipt['request_sha256']:
        raise Refused('operator transition stop does not identify this exact request')
    if request.get('binding_sha256')!=sha(binding_path) or request.get('registration_sha256')!=value['registration']['sha256']:
        raise Refused('request provenance differs')
    if valid_exit(marker,registration,value['registration']['sha256'],request,receipt['request_sha256'])!=receipt['returncode']:
        raise Refused('actual tool-handle closure differs')
    same_parent(receipt['before'],receipt['after'])
    current=snapshot(binding_path,backend,after_request=True);same_parent(receipt['after'],current)
    for path,expected in receipt['old_stop_markers'].items():
        if sha(own(path))!=expected:raise Refused('operator transition stop provenance changed')
    return dict(parent_study=current['parent_study'],original_comparison_study=current['original_comparison_study'],
        legacy_owner_source_sha256=current['legacy_owner_source_sha256'],legacy_profile_sha256=current['legacy_profile_sha256'],
        new_profile_sha256=expected_new_profile_sha256,contract_sha256=expected_contract_sha256,
        implementation_sha256=expected_implementation_sha256,actual_numeric_exit_observed=True,
        transition_receipt_sha256=sha(receipt_path),old_stop_markers=receipt['old_stop_markers'])


def main():
    parser_cli=argparse.ArgumentParser(description=__doc__)
    parser_cli.add_argument('--binding',type=Path,required=True);parser_cli.add_argument('--output',type=Path,required=True)
    parser_cli.add_argument('--activate',type=Path)
    args=parser_cli.parse_args();gate=Gate(args.binding,args.output)
    result=gate.activate(args.activate) if args.activate else gate.inspect()
    if args.activate:
        public={'schema':FINISHED,'parent_study':result['after']['parent_study'],
            'actual_numeric_exit_observed':result['actual_numeric_exit_observed'],'returncode':result['returncode'],
            'receipt_path':str(args.output/'TRANSITION_FINISHED.json'),'receipt_sha256':sha(args.output/'TRANSITION_FINISHED.json')}
    else:
        public={k:result[k] for k in ('eligible_candidate','lock_qualified','parent_study','original_comparison_study','epoch')}
    print(json.dumps(public,sort_keys=True))

if __name__=='__main__':main()
