"""Operations-only Gaussian goal owner; no mathematical advice or PID adoption.

A registered actually-owning wrapper supplies the first numeric exit event.
Later commands are this owner's direct children. New finite epochs preserve
learned work; only exact proof plus independent correspondence closes the goal.
"""
import argparse
import contextlib
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import signal
import stat
import subprocess
import sys
import time

ROOT = Path('/Users/sasha/math_gkm')
PYTHON = '/opt/homebrew/bin/python3'
SCHEMA = 'math-gkm.gaussian-goal-owner.v1'
BINDING_SCHEMA = 'math-gkm.gaussian-registered-owner.v1'
PARSER = ROOT/'.bootstrap/gaussian-native-operator-20261031/public_json_projection.py'
PARSER_SHA = '5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec'
STOPPING = False

class Hold(RuntimeError):
    pass

class Refuted(Hold):
    def __init__(self,verdict):
        self.verdict=verdict
        super().__init__('unchanged conjecture refuted; proof goal cannot be substituted')

def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as source:
        for block in iter(lambda:source.read(1024**2),b''): h.update(block)
    return h.hexdigest()

def digest(value):
    return hashlib.sha256(json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode()).hexdigest()

def write(path,value,*,exclusive=False):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    temporary=path if exclusive else path.with_name(path.name+'.next')
    with temporary.open('x' if exclusive else 'w') as out:
        out.write(json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False)+'\n')
        out.flush();os.fsync(out.fileno())
    if not exclusive: os.replace(temporary,path)
    fd=os.open(path.parent,os.O_RDONLY)
    try:os.fsync(fd)
    finally:os.close(fd)

def raw(path,cap=32*1024**2):
    path=Path(path);info=path.lstat()
    if not stat.S_ISREG(info.st_mode) or path.is_symlink() or info.st_size>cap:
        raise Hold('bounded regular artifact required')
    return path.read_bytes().strip()

def public_json(path):
    # Owner-created public metadata/configuration only, never research records.
    return json.loads(raw(path,1024**2))

def projection():
    if sha(PARSER)!=PARSER_SHA:raise Hold('public projection source changed')
    spec=importlib.util.spec_from_file_location('gaussian_owner_projection',PARSER)
    e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e);return e

def public_study(study):
    study=Path(study);e=projection();result={}
    for mode in ('baseline','exploration'):
        path=study/'arms'/mode/'state.json';envelope=e.fields(raw(path));body=envelope['state']
        if e.select(envelope,('sha256',))['sha256']!=hashlib.sha256(body).hexdigest():raise Hold('state integrity differs')
        fields=e.fields(body);row=e.select(fields,('round','phase','status','calls','meta_calls','failures'))
        if any(type(row.get(k)) is not int or row[k]<0 for k in ('round','calls','meta_calls','failures')):
            raise Hold('invalid public state counters')
        for key in ('active','active_intent','resolution'):row[key+'_is_null']=fields.get(key,b'null')==b'null'
        row['state_file_sha256']=sha(path)
        research=e.fields(fields['research'])
        for key in ('knowledge','components'):row[key+'_count']=len(e.fields(research.get(key,b'{}')))
        closed=True;jobs=study/'arms'/mode/'jobs'
        for job in jobs.iterdir() if jobs.exists() else ():
            if not job.is_dir() or job.is_symlink():raise Hold('invalid own job directory')
            receipt=job/'receipt.json'
            if not receipt.is_file() or receipt.is_symlink():closed=False;continue
            meta=e.select(e.fields(raw(receipt)),('returncode','request_id'))
            if type(meta.get('returncode')) is not int or meta.get('request_id')!=job.name:closed=False
        row['all_job_receipts_numeric']=closed;result[mode]=row
    return result

def registered_exit(binding,status):
    """Return None for a prior observation; no stale event becomes ownership."""
    if binding.get('schema')!=BINDING_SCHEMA:raise Hold('handoff registration schema differs')
    for value in (binding.get('registered_at'),status.get('observed_at')):
        if type(value) not in (int,float) or not math.isfinite(value) or value<=0:
            raise Hold('handoff requires finite observed clocks')
    source=binding.get('owner_source',{})
    if sha(source['path'])!=source.get('sha256'):raise Hold('registered actual owner source changed')
    if status.get('observed_at',0)<binding['registered_at']:return None
    if status.get('phase')!=binding['expected_closed_phase']:return None
    if (status.get('study')!=binding['study'] or status.get('actual_numeric_exit_observed') is not True or
            type(status.get('returncode')) is not int):raise Hold('registered owner did not observe a numeric exit')
    return status['returncode']

def verify_finished_resolution(workspace,contract,path,expected_contract,*,expected_result=None):
    """Shared exact native FINISHED gate for state or owned external receipts."""
    sys.path.insert(0,str(ROOT))
    from machinery import completion
    from machinery.study_common import read,digest as ndigest
    from machinery.validation_receipts import reuse
    if ndigest(contract)!=expected_contract:raise Hold('resolved contract changed')
    path=Path(path);result=read(path)
    if (expected_result is not None and result!=expected_result or
            result.get('resolved') is not True or result.get('lean_exact_root_checked') is not True or
            'finished' not in result or result.get('binding',{}).get('contract_hash')!=expected_contract):
        raise Hold('exact finished root receipt missing')
    claim=result['binding']['claim'];audit=result.get('audit')
    if claim.get('kind') not in ('proof','refutation'):raise Hold('unknown completion kind')
    checked=reuse(path.parent,{'contract':contract,'claim':claim,'audit':audit},claim,())
    if (checked!=result or not isinstance(audit,dict) or audit.get('accepted') is not True or
            not isinstance(audit.get('reviewer'),str) or not audit['reviewer'].strip() or
            audit.get('bundle_hash')!=result.get('bundle_hash') or
            any(not isinstance(audit.get('checks',{}).get(k),str) or not audit['checks'][k].strip()
                for k in contract['correspondence_obligations'])):
        raise Hold('independent full correspondence evidence missing')
    previous=completion.ROOT
    try:
        completion.ROOT=Path(workspace)
        if completion.prepare(contract,claim)['bundle_hash']!=result['bundle_hash']:raise Hold('proved source bundle changed')
    finally:completion.ROOT=previous
    return {'proved':claim['kind']=='proof','refuted':claim['kind']=='refutation',
            'bundle_hash':result['bundle_hash'],'receipt_sha256':sha(path)}

def verify_resolution(study,mode,expected_contract):
    """Genuine native state resolution, with the shared exact receipt gate."""
    sys.path.insert(0,str(ROOT))
    from machinery.study_common import load_state,read,inside
    study=Path(study);state=load_state(study/'arms'/mode/'state.json');result=state.get('resolution')
    if result is None:return {'proved':False,'refuted':False}
    path=inside(study,state.get('resolution_receipt',''))
    if not path.resolve().is_relative_to((study/'arms'/mode/'completion').resolve()):raise Hold('root receipt is not owned')
    return verify_finished_resolution(study/'arms'/mode/'workspace',read(study/'seed/contract.json'),
        path,expected_contract,expected_result=result)

def successor_prompt(original):
    """Qualify chronology only, without acquired methods or mathematical hints."""
    replacements = {
        'No research trial has run and you have no trial artifacts or answers.':
            'A prior own-history research epoch has closed. You receive only the unchanged clean goal and pinned background, with no acquired method, prior research artifacts, evaluation answers or prior role history.',
        'Your selection precedes both arms and must be retained even when unfavorable.':
            'This fresh panel is chosen after prior acquisition and before the next funded epoch and its application tests. Selection is blind to the acquired methods; this panel did not precede their development. Retain it even when unfavorable.'}
    for before,after in replacements.items():
        if original.count(before)!=1:raise Hold('native curator chronology wording changed')
        original=original.replace(before,after,1)
    return original


class Native:
    """Live backend: native APIs and direct owned subprocess handles only."""
    def __init__(self,config,output):
        self.c=config;self.output=Path(output);self.counter=0;self.finalizations=[]
    def check_inputs(self):
        if (sha(__file__)!=self.c['owner_source_sha256'] or
                sha(self.c['profile_path'])!=self.c['profile_sha256'] or
                sha(self.c['epoch_source']['path'])!=self.c['epoch_source']['sha256'] or
                sha(self.c['finalization_source']['path'])!=self.c['finalization_source']['sha256']):
            raise Hold('owner, profile, epoch or finalizer source changed before a paid action')
        sys.path.insert(0,str(ROOT))
        from machinery.study_common import implementation,read,digest as ndigest,authorize_live
        contract=read(self.c['contract_path'])
        if digest(implementation())!=self.c['implementation_sha256'] or ndigest(contract)!=self.c['contract_sha256']:
            raise Hold('native source or original contract changed before a paid action')
        authorize_live(contract)
    def public(self,study):return public_study(study)
    def protocol(self,study):
        e=projection();return e.select(e.fields(raw(Path(study)/'protocol.json')),('rounds','model','call_seconds','arm_seconds'))
    def verify(self,study):
        import fcntl
        sys.path.insert(0,str(ROOT));from machinery.study import verify
        with (Path(study)/'controller.lock').open('a') as lock:
            fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB);verify(Path(study))
    def proof(self,study,modes):
        import fcntl
        with (Path(study)/'controller.lock').open('a') as lock:
            fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
            return self.proof_locked(study,modes)
    def proof_locked(self,study,modes):
        for mode in modes:
            result=verify_resolution(study,mode,self.c['contract_sha256'])
            if result['refuted']:raise Refuted(result)
            if result['proved']:return result
        for origin,output in self.finalizations:
            if Path(origin).resolve()!=Path(study).resolve():continue
            module=self.finalizer_module()
            result=module.verified_resolution(Path(study),output,
                expected_contract=self.c['contract_sha256'],expected_source=self.c['finalization_source']['sha256'])
            if not result.get('proved') and not result.get('refuted'):continue
            pointer=public_json(output/'OWNER_COMPLETION.json')
            if pointer.get('arm') not in modes or Path(pointer.get('study','')).resolve()!=Path(study).resolve():
                raise Hold('external root completion belongs to another own boundary')
            sys.path.insert(0,str(ROOT));from machinery.study_common import read
            checked=verify_finished_resolution(Path(study)/'arms'/pointer['arm']/'workspace',
                read(Path(study)/'seed/contract.json'),Path(pointer['validation_directory'])/'result.json',
                self.c['contract_sha256'])
            if checked!=result:raise Hold('external provenance and shared exact receipt verdict disagree')
            if checked['refuted']:raise Refuted(checked)
            if checked['proved']:return checked
        return None
    def finalizer_module(self):
        source=Path(self.c['finalization_source']['path'])
        if sha(source)!=self.c['finalization_source']['sha256']:raise Hold('finalizer source changed')
        spec=importlib.util.spec_from_file_location('gaussian_owner_finalizer',source)
        module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module
    def finalize(self,study,both):
        directory=self.output/'finalizations'/f'{len(self.finalizations):06d}'
        source=self.c['finalization_source']
        code=self.command('finalization',[PYTHON,source['path'],'--study',str(study),
            '--arms','both' if both else 'exploration','--output',str(directory),
            '--contract-sha256',self.c['contract_sha256'],
            '--implementation-sha256',self.c['implementation_sha256'],
            '--source-sha256',source['sha256']],study)
        if code==0:self.finalizations.append((str(study),directory))
        return code
    def finalization_pending(self,study):
        if not self.finalizations:raise Hold('no owned completed finalizer summary')
        origin,output=self.finalizations[-1]
        if Path(origin).resolve()!=Path(study).resolve():raise Hold('finalizer summary belongs to another study')
        summary=public_json(output/'summary.json')
        if (summary.get('source_sha256')!=self.c['finalization_source']['sha256'] or
                summary.get('implementation_sha256')!=self.c['implementation_sha256'] or
                type(summary.get('more_eligible')) is not bool):
            raise Hold('source-bound finite finalizer progress summary missing')
        return summary['more_eligible']
    def headroom(self):
        sys.path.insert(0,str(ROOT))
        from machinery.resources import headroom,limits,ResourceFailure
        try:headroom(limits())
        except ResourceFailure:return False
        return True
    def command(self,kind,argv,study):
        self.check_inputs()
        directory=self.output/'commands'/f'{self.counter:06d}';self.counter+=1
        if directory.exists():raise Hold('uncertain command intent cannot be replayed')
        directory.mkdir(parents=True)
        write(directory/'INTENT.json',{'kind':kind,'argv':argv,'study':str(study),'created':time.time()},exclusive=True)
        child=None
        try:
            with (directory/'private.log').open('xb') as log:
                child=subprocess.Popen(argv,cwd=ROOT,stdin=subprocess.DEVNULL,stdout=log,
                    stderr=subprocess.STDOUT,start_new_session=True)
                stopping=None;last=0
                started=time.monotonic()
                profile=public_json(self.c['profile_path']) if 'profile_path' in self.c else {}
                bound=(1900 if kind=='curation' else 3900 if kind=='finalization' else 3600 if kind=='recover' else
                       profile.get('arm_seconds',600000)+30*(4*profile.get('max_calls',160)+2)+2100)
                while child.poll() is None:
                    if time.monotonic()-started>bound:raise Hold('finite command wall bound')
                    if time.monotonic()-last>=15:
                        getattr(self,'heartbeat',lambda:None)();last=time.monotonic()
                    if STOPPING or (self.output/'STOP').exists() or getattr(self,'owner_stopping',lambda:False)():
                        target=Path(study)/'STOP.json'
                        if target.parent.exists() and not target.exists():
                            try:write(target,{'requested':time.time()},exclusive=True)
                            except FileExistsError:pass
                        if stopping is None:child.send_signal(signal.SIGINT);stopping=time.monotonic()
                    if (directory/'private.log').stat().st_size>16*1024**2:raise Hold('private command log bound')
                    if stopping is not None and time.monotonic()-stopping>2100:
                        child.terminate()
                        try:child.wait(timeout=10)
                        except subprocess.TimeoutExpired:child.kill();child.wait(timeout=10)
                    time.sleep(1)
                code=child.wait(timeout=0)
            write(directory/'EXIT.json',{'returncode':code,'actual_numeric_exit_observed':True,
                'owned_handle':True,'log_sha256':sha(directory/'private.log')},exclusive=True)
            return code
        finally:
            if child is not None and child.poll() is None:
                child.send_signal(signal.SIGINT)
                try:child.wait(timeout=2100)
                except subprocess.TimeoutExpired:
                    child.terminate()
                    try:child.wait(timeout=10)
                    except subprocess.TimeoutExpired:child.kill();child.wait(timeout=10)
    def run(self,study,both):
        return self.command('research',[PYTHON,'-m','machinery.study','run',
            '--study',str(study),'--arm','both' if both else 'exploration'],study)
    def recover(self,study):
        return self.command('recover',[PYTHON,'-m','machinery.study','recover','--study',str(study)],study)
    def curate(self,directory):
        code='''from pathlib import Path
from machinery.study_common import read,canonical,write,sha
from machinery import study_curate
import sys,hashlib,importlib.util
source=Path(sys.argv[3])
assert sha(source)==sys.argv[4]
spec=importlib.util.spec_from_file_location('qualified_goal_owner',source)
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
original=study_curate.PROMPT
effective=module.successor_prompt(original)
context={'schema':'math-gkm.successor-curation-context.v1',
 'chronology':'after prior acquisition, before next funded epoch and application tests',
 'acquired_method_inputs_supplied':False,'input_separation_only':True,
 'statistical_independence_claimed':False,'owner_source_sha256':sha(source),
 'original_prompt_sha256':hashlib.sha256(original.encode()).hexdigest(),
 'effective_prompt_sha256':hashlib.sha256(effective.encode()).hexdigest()}
write(Path(sys.argv[1]).with_name(Path(sys.argv[1]).name+'.context.json'),context)
study_curate.PROMPT=effective
print(canonical(study_curate.curate(Path(sys.argv[1]),'live',1800,read(Path(sys.argv[2])),
 model='gpt-6.1-sol',task_limits={'holdout':12,'regression':1},
 layout={'method':8,'assessment':2,'final':2})))'''
        result=self.command('curation',[PYTHON,'-c',code,str(directory),self.c['contract_path'],
            str(Path(__file__).resolve()),self.c['owner_source_sha256']],directory)
        if result!=0 or not (Path(directory)/'provenance.json').is_file():raise Hold('curator did not publish a valid new panel')
        return Path(directory)
    def migrate(self,parent,destination,curation):
        self.check_inputs()
        path=Path(self.c['epoch_source']['path'])
        if sha(path)!=self.c['epoch_source']['sha256']:raise Hold('migration source changed')
        spec=importlib.util.spec_from_file_location('gaussian_epoch',path)
        module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
        result=module.migrate(Path(parent),Path(destination),curation=Path(curation),
            profile=Path(self.c['profile_path']),contract_path=Path(self.c['contract_path']),arm='exploration')
        marker=public_json(Path(destination)/'MIGRATION_FINISHED.json')
        expected={'source_sha256':self.c['epoch_source']['sha256'],
            'seal_sha256':sha(Path(destination)/'seal.json'),
            'state_sha256':sha(Path(destination)/'arms/exploration/state.json'),
            'provenance_sha256':sha(Path(result['provenance_path'])),
            'parent_state_sha256':result['parent_state_sha256'],
            'epoch_start_binding':result['epoch_start_binding']}
        if (marker.get('schema')!='math-gkm.closed-own-epoch.v1' or
                any(marker.get(k)!=v for k,v in expected.items()) or
                sha(Path(parent)/'arms/exploration/state.json')!=marker['parent_state_sha256']):
            raise Hold('successor migration lacks its exact finished source/state/goal provenance')
        return result


class Owner:
    def __init__(self,config,output,backend=None):
        self.c=config;self.output=Path(output);self.backend=backend or Native(config,output)
        self.state={'schema':SCHEMA,'phase':'waiting_initial_closure','current_study':config['initial_study'],
            'epoch':0,'root_proved':False,'original_comparison_preserved':True}
        if isinstance(self.backend,Native):
            self.backend.heartbeat=lambda:self.checkpoint(self.state['phase'])
            self.backend.owner_stopping=self.stopping
    def checkpoint(self,phase,**values):
        self.state.update(phase=phase,updated_at=time.time(),**values)
        write(self.output/'OWNER_CHECKPOINT.json',self.state)
        write(self.output/'CURRENT.json',{'schema':'math-gkm.gaussian-goal-current.v1',
            'phase':phase,'current_study':self.state['current_study'],'epoch':self.state['epoch'],
            'root_proved':self.state['root_proved'],'updated_at':self.state['updated_at'],
            'owner_source_sha256':self.c['owner_source_sha256'],'contract_sha256':self.c['contract_sha256']})
    def stopping(self):
        return STOPPING or (self.output/'STOP').exists() or (Path(self.state['current_study'])/'STOP.json').exists()
    def ensure_headroom(self):
        while not self.backend.headroom():
            self.checkpoint('waiting_host_headroom')
            if self.stopping():return False
            time.sleep(15)
        return not self.stopping()
    def await_registered_owner_closed(self):
        binding=public_json(self.c['initial_binding'])
        if (sha(self.c['initial_binding'])!=self.c['initial_binding_sha256'] or
                binding.get('study')!=self.c['initial_study'] or
                binding.get('implementation_sha256')!=self.c['implementation_sha256'] or
                binding.get('profile_sha256')!=self.c['profile_sha256'] or
                binding.get('contract_sha256')!=self.c['contract_sha256']):
            raise Hold('registered handoff identity differs')
        last_heartbeat=0
        while not self.stopping():
            now=time.monotonic()
            if now-last_heartbeat>=15:
                self.checkpoint('waiting_initial_closure');last_heartbeat=now
            if sha(self.c['initial_binding'])!=self.c['initial_binding_sha256']:raise Hold('handoff registration changed')
            path=Path(binding['status_path'])
            if path.exists():
                code=registered_exit(binding,public_json(path))
                if code is not None:
                    public=self.backend.public(self.c['initial_study'])
                    if not all(x['all_job_receipts_numeric'] for x in public.values()):
                        raise Hold('actual wrapper closed before all job receipts; no adoption')
                    write(self.output/'INITIAL_CLOSED.json',{'schema':SCHEMA,
                        'study':self.c['initial_study'],'returncode':code,'actual_numeric_exit_observed':True,
                        'registration_sha256':sha(self.c['initial_binding']),
                        'status_sha256':sha(path),'observed_at':time.time(),
                        'state_sha256':{m:x['state_file_sha256'] for m,x in public.items()}},exclusive=True)
                    return code
            time.sleep(5)
        return None
    def continue_until_boundary(self,study,both,code):
        recovered=set();attempts=set();modes=('baseline','exploration') if both else ('exploration',)
        while not self.stopping():
            public=self.backend.public(study)
            if not all(public[m]['all_job_receipts_numeric'] for m in modes):raise Hold('unclosed job; no replay or PID adoption')
            if not self.ensure_headroom():return False
            if any(not public[m]['active_is_null'] or not public[m]['active_intent_is_null'] for m in modes):
                binding=tuple(public[m]['state_file_sha256'] for m in modes)
                if binding in recovered:raise Hold('closed receipts failed reconciliation')
                recovered.add(binding);self.checkpoint('recovering_closed_receipts')
                if self.backend.recover(study)!=0:raise Hold('native recovery refused')
                public=self.backend.public(study)
                if any(not public[m]['active_is_null'] or not public[m]['active_intent_is_null'] for m in modes):
                    raise Hold('native recovery left an active intent')
            self.backend.verify(study)
            proof=self.backend.proof(study,modes)
            end=self.backend.protocol(study)['rounds']
            finite_boundary=all(public[m]['round']==end and public[m]['phase']=='research' and
                public[m]['status']=='finite_budget_finished; root_open' for m in modes)
            if proof is None and finite_boundary:
                more=True
                while more and not self.stopping():
                    self.checkpoint('finalizing_closed_candidate')
                    if self.backend.finalize(study,both)!=0:raise Hold('independent finalizer incomplete; no speculative replay')
                    self.backend.verify(study)
                    proof=self.backend.proof(study,modes)
                    if proof is not None:break
                    more=self.backend.finalization_pending(study)
                if self.stopping():return False
            if proof is not None:
                if (not isinstance(proof,dict) or proof.get('proved') is not True or
                        any(not isinstance(proof.get(k),str) or len(proof[k])!=64 or
                            any(c not in '0123456789abcdef' for c in proof[k])
                            for k in ('bundle_hash','receipt_sha256'))):
                    raise Hold('proof backend returned unverified completion metadata')
                self.checkpoint('theorem_proved',root_proved=True,proof=proof);return True
            if finite_boundary:
                self.checkpoint('epoch_closed_root_open');return True
            if any(public[m]['status']=='operationally_blocked' for m in modes):raise Hold('native operational block requires reconciliation')
            progress=tuple((public[m]['round'],public[m]['phase'],public[m]['calls']) for m in modes)
            if progress in attempts:raise Hold('native run closed without forward operational movement')
            attempts.add(progress);self.checkpoint('research_running')
            code=self.backend.run(study,both)
        return False
    def run(self):
        self.output.mkdir(parents=True,exist_ok=True)
        if (self.output/'OWNER_CHECKPOINT.json').exists():raise Hold('existing owner checkpoint needs explicit reconciliation')
        self.checkpoint('waiting_initial_closure')
        code=self.await_registered_owner_closed()
        if code is None:self.checkpoint('user_stopped');return 1
        current=Path(self.c['initial_study']);both=True
        while not self.stopping():
            if not self.continue_until_boundary(current,both,code):self.checkpoint('user_stopped');return 1
            if self.state['root_proved']:return 0
            number=self.state['epoch']+1
            self.checkpoint('curating_next_epoch',pending_curation=str(self.output/'curation'/f'{number:06d}'),next_epoch=number)
            self.backend.curate(self.output/'curation'/f'{number:06d}')
            if self.stopping():self.checkpoint('user_stopped');return 1
            destination=Path(self.c['successor_root'])/('method-learning-gaussian-20261103-epoch-'+f'{number:04d}')
            self.checkpoint('migrating_closed_epoch',pending_successor=str(destination))
            migrated=self.backend.migrate(current,destination,self.output/'curation'/f'{number:06d}')
            if Path(migrated['study']).resolve()!=destination.resolve():raise Hold('migration returned another study')
            current=destination;both=False;code=0
            self.checkpoint('successor_ready',current_study=str(current),epoch=number,
                migration_provenance=migrated['provenance_path'],pending_curation=None,pending_successor=None)
        self.checkpoint('user_stopped');return 1


def validate_config(value):
    required={'schema','initial_study','initial_binding','initial_binding_sha256',
        'implementation_sha256','contract_path','contract_sha256','profile_path','profile_sha256',
        'owner_source_sha256','epoch_source','finalization_source','successor_root'}
    if not isinstance(value,dict) or set(value)!=required or value.get('schema')!=SCHEMA:raise Hold('owner configuration schema differs')
    for key in ('initial_binding_sha256','implementation_sha256','contract_sha256','profile_sha256','owner_source_sha256'):
        item=value[key]
        if not isinstance(item,str) or len(item)!=64 or any(c not in '0123456789abcdef' for c in item):raise Hold('invalid source hash')
    for key in ('initial_study','initial_binding','contract_path','profile_path','successor_root'):
        path=Path(value[key])
        if not path.is_absolute() or not path.resolve().is_relative_to(ROOT.resolve()):raise Hold('configuration path escaped workspace')
    source=value['epoch_source']
    if (not isinstance(source,dict) or set(source)!={'path','sha256'} or
            not Path(source['path']).resolve().is_relative_to(ROOT.resolve()) or
            sha(source['path'])!=source['sha256'] or sha(__file__)!=value['owner_source_sha256'] or
            sha(value['profile_path'])!=value['profile_sha256'] or
            sha(value['initial_binding'])!=value['initial_binding_sha256']):raise Hold('owner inputs changed')
    source=value['finalization_source']
    if (not isinstance(source,dict) or set(source)!={'path','sha256'} or
            not Path(source['path']).resolve().is_relative_to(ROOT.resolve()) or
            sha(source['path'])!=source['sha256']):raise Hold('fixed funded finalizer source changed')
    sys.path.insert(0,str(ROOT))
    from machinery.study_common import implementation,read,digest as ndigest,authorize_live
    contract=read(value['contract_path'])
    if digest(implementation())!=value['implementation_sha256'] or ndigest(contract)!=value['contract_sha256']:
        raise Hold('sealed implementation or original goal changed')
    authorize_live(contract)
    binding=public_json(value['initial_binding'])
    command=[PYTHON,'-m','machinery.study','run','--resume','--study',value['initial_study'],'--arm','both']
    if binding.get('native_command')!=command:raise Hold('handoff does not describe the actual original native command')
    return value


def main():
    args=argparse.ArgumentParser(description=__doc__)
    args.add_argument('--config',type=Path,required=True);args.add_argument('--output',type=Path,required=True)
    supplied=args.parse_args();config=validate_config(public_json(supplied.config))
    if not supplied.output.resolve().is_relative_to(ROOT.resolve()):raise Hold('output escaped workspace')
    import fcntl
    from machinery.resources import ResourceFailure
    supplied.output.mkdir(parents=True,exist_ok=True)
    with (supplied.output/'owner.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        if (supplied.output/'OWNER_CHECKPOINT.json').exists():
            print('Existing goal-owner checkpoint requires explicit reconciliation.',file=sys.stderr)
            return 2
        keeper=subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],
            stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        owner=Owner(config,supplied.output)
        try:return owner.run()
        except Refuted as exc:
            owner.checkpoint('conjecture_refuted',root_proved=False,verified_refutation=exc.verdict);return 3
        except (Hold,OSError,ValueError,KeyError,TypeError,ResourceFailure) as exc:
            owner.checkpoint('needs_reconciliation',error_class=type(exc).__name__);return 2
        finally:
            if keeper.poll() is None:keeper.terminate()
            try:keeper.wait(timeout=5)
            except subprocess.TimeoutExpired:keeper.kill();keeper.wait(timeout=5)


if __name__=='__main__':
    def stop(*_):
        global STOPPING
        STOPPING=True
    signal.signal(signal.SIGINT,stop);signal.signal(signal.SIGTERM,stop)
    raise SystemExit(main())
