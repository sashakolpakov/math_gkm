"""Operations-only Gaussian goal owner; no mathematical advice or PID adoption.

A source-qualified transition receipt binds the actual old tool-handle exit.
Subsequent commands are this owner's direct children. New finite epochs preserve
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
SCHEMA = 'math-gkm.gaussian-validation1800-owner.v1'
CURRENT_SCHEMA = 'math-gkm.gaussian-goal-current-1800.v1'
BOUNDARY_STOP_SCHEMA = 'math-gkm.gaussian-owner-boundary-stop.v1'
DESTINATION_PREFIX = 'method-learning-gaussian-20261103-v1800-epoch-'
BINDING_SCHEMA = 'historical-registration-not-used-by-this-owner'
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

def load_pinned(source, label):
    if not isinstance(source,dict) or set(source)!={'path','sha256'}:
        raise Hold(label+' source binding differs')
    path=Path(source['path'])
    if (not path.is_absolute() or not path.resolve().is_relative_to(ROOT.resolve()) or
            path.is_symlink() or sha(path)!=source['sha256']):
        raise Hold(label+' source changed')
    spec=importlib.util.spec_from_file_location('prospective_'+label.replace('-','_'),path)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    return module


def verify_transition(config):
    module=load_pinned(config['transition_source'],'transition')
    for name in ('transition_binding','transition_receipt'):
        if sha(config[name]['path'])!=config[name]['sha256']:
            raise Hold('transition input changed')
    binding=public_json(config['transition_binding']['path'])
    legacy=config['legacy_owner']
    if (binding.get('legacy_config')!=legacy['config'] or binding.get('legacy_owner')!=legacy['source'] or
            binding.get('legacy_output')!=legacy['output'] or
            binding.get('new_profile')!={'path':config['profile_path'],'sha256':config['profile_sha256']} or
            binding.get('transition_source_sha256')!=config['transition_source']['sha256']):
        raise Hold('typed historical/new transition bindings differ')
    try:
        result=module.verify_receipt(Path(config['transition_binding']['path']),Path(config['transition_receipt']['path']),
            expected_new_profile_sha256=config['profile_sha256'],
            expected_contract_sha256=config['contract_sha256'],
            expected_implementation_sha256=config['implementation_sha256'])
    except (RuntimeError,OSError,ValueError) as exc:
        raise Hold('source-qualified transition refused: '+str(exc)) from exc
    if (result.get('actual_numeric_exit_observed') is not True or
            Path(result.get('parent_study','')).resolve()!=Path(config['parent_study']).resolve() or
            result.get('legacy_owner_source_sha256')!=config['legacy_owner']['source']['sha256'] or
            result.get('legacy_profile_sha256')!=config['legacy_owner']['profile']['sha256'] or
            result.get('transition_receipt_sha256')!=config['transition_receipt']['sha256']):
        raise Hold('actual closed handoff belongs to another owner or parent')
    return result


def qualify_funding(config):
    module=load_pinned(config['funding_source'],'funding')
    profile=public_json(config['profile_path'])
    if profile.get('validation_seconds')!=1800:
        raise Hold('successor validation ceiling must be exactly 1800')
    result=module.qualify_profile(profile,additional_rounds=profile['rounds'],
        assessment_count=2,final_count=2,start_round=0)
    if not isinstance(result,dict) or result.get('accepted') is not True:raise Hold('prospective full horizon is not funded')
    return result


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
        self.c=config;self.output=Path(output);self.counter=0;self.finalizations=[];self.transition_admitted=False;self.bootstrap_parent_pending=True
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
        for name in ('transition_source','transition_binding','transition_receipt','funding_source'):
            if sha(self.c[name]['path'])!=self.c[name]['sha256']:raise Hold('prospective binding changed')
        for name in ('source','config','profile'):
            item=self.c['legacy_owner'][name]
            if sha(item['path'])!=item['sha256']:raise Hold('historical owner binding changed')
        qualify_funding(self.c)
        if not self.transition_admitted:self.transition()
    def transition(self):
        value=verify_transition(self.c);self.transition_admitted=True;return value
    def public(self,study):return public_study(study)
    def protocol(self,study):
        e=projection();return e.select(e.fields(raw(Path(study)/'protocol.json')),('rounds','model','call_seconds','arm_seconds','validation_seconds'))
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
        if summary.get('status') not in ('no_eligible_current_exact_root','independent_rejection','cached_independent_rejection'):
            raise Hold('exact candidate finalization remains pending; no migration or speculative replay')
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
        if self.bootstrap_parent_pending:self.transition()
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
        if self.bootstrap_parent_pending:
            if Path(parent).resolve()!=Path(self.c['parent_study']).resolve():raise Hold('first migration changed the handoff parent')
            self.transition()
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
        self.bootstrap_parent_pending=False
        return result


class Owner:
    def __init__(self,config,output,backend=None):
        self.c=config;self.output=Path(output);self.backend=backend or Native(config,output)
        self.state={'schema':SCHEMA,'phase':'verifying_closed_transition','current_study':config['parent_study'],
            'parent_study':config['parent_study'],'original_comparison_study':
                (public_json(config['legacy_owner']['config']['path'])['initial_study'] if 'legacy_owner' in config else config['parent_study']),
            'epoch':0,'root_proved':False,
            'original_comparison_preserved':True,'migration_first':True,'bootstrap_pending':True}
        if isinstance(self.backend,Native):
            self.backend.heartbeat=lambda:self.checkpoint(self.state['phase'])
            self.backend.owner_stopping=self.stopping
    def checkpoint(self,phase,**values):
        self.state.update(phase=phase,updated_at=time.time(),**values)
        write(self.output/'OWNER_CHECKPOINT.json',self.state)
        fields=('phase','current_study','parent_study','original_comparison_study','epoch','root_proved','updated_at','migration_first')
        pointer={key:self.state.get(key) for key in fields}
        pointer.update(schema=CURRENT_SCHEMA,owner_source_sha256=self.c['owner_source_sha256'],
            contract_sha256=self.c['contract_sha256'],profile_sha256=self.c['profile_sha256'],
            transition_receipt_sha256=self.c['transition_receipt']['sha256'])
        write(self.output/'CURRENT.json',pointer)
    def stopping(self):
        # Legacy immediate/user STOP still applies to THIS owner. A historical
        # operator transition never becomes a pause of the new funded epoch.
        return (STOPPING or (self.output/'STOP').exists() or
            (not self.state['bootstrap_pending'] and (Path(self.state['current_study'])/'STOP.json').exists()))
    def boundary_requested(self):
        path=self.output/'STOP_AFTER_BOUNDARY.json'
        if not path.exists():return False
        value=public_json(path)
        if (value.get('schema')!=BOUNDARY_STOP_SCHEMA or
                value.get('owner_source_sha256')!=self.c['owner_source_sha256'] or
                not isinstance(value.get('reason'),str) or not value['reason'].strip()):
            raise Hold('boundary transition request lacks this owner source binding')
        return True
    def stop_at_boundary(self):
        if not self.boundary_requested():return False
        self.checkpoint('operator_transition_boundary',stop_kind='cooperative_finite_boundary',
            request_sha256=sha(self.output/'STOP_AFTER_BOUNDARY.json'))
        return True
    def ensure_headroom(self,at_boundary=False):
        while not self.backend.headroom():
            self.checkpoint('waiting_host_headroom')
            if self.stopping() or (at_boundary and self.boundary_requested()):return False
            time.sleep(15)
        return not self.stopping()
    def record_exact_proof(self,proof):
        if (not isinstance(proof,dict) or proof.get('proved') is not True or
                any(not isinstance(proof.get(k),str) or len(proof[k])!=64 or
                    any(c not in '0123456789abcdef' for c in proof[k])
                    for k in ('bundle_hash','receipt_sha256'))):
            raise Hold('proof backend returned unverified completion metadata')
        self.checkpoint('theorem_proved',root_proved=True,proof=proof)
    def drain_closed_parent(self,study,both):
        modes=('baseline','exploration') if both else ('exploration',)
        public=self.backend.public(study);end=self.backend.protocol(study)['rounds']
        if not all(public[m]['all_job_receipts_numeric'] and public[m]['active_is_null'] and
                public[m]['active_intent_is_null'] and public[m]['round']==end and
                public[m]['phase']=='research' and public[m]['status']=='finite_budget_finished; root_open'
                for m in modes):
            raise Hold('handoff parent is not closed and finite; never run or recover it')
        self.backend.verify(study)
        proof=self.backend.proof(study,modes)
        if proof is not None:self.record_exact_proof(proof);return True
        # The unchanged finalizer treats any native STOP as a stop. Until a
        # separately qualified operator-STOP path exists, preserve it and hold;
        # a stopped summary must never masquerade as no eligible root candidate.
        if (Path(study)/'STOP.json').exists():
            raise Hold('retained parent native STOP requires reviewed completion handling before migration')
        more=True
        while more and not self.stopping():
            if self.stop_at_boundary() or not self.ensure_headroom(at_boundary=True):return False
            self.checkpoint('finalizing_closed_handoff_parent')
            if self.backend.finalize(study,both)!=0:
                raise Hold('parent finalization uncertain; no new curation or paid replay')
            self.backend.verify(study)
            proof=self.backend.proof(study,modes)
            if proof is not None:self.record_exact_proof(proof);return True
            more=self.backend.finalization_pending(study)
        self.checkpoint('closed_handoff_parent_drained')
        return False
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
                self.record_exact_proof(proof);return True
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
        self.checkpoint('verifying_closed_transition')
        transition=self.backend.transition()
        if (transition.get('actual_numeric_exit_observed') is not True or
                Path(transition.get('parent_study','')).resolve()!=Path(self.c['parent_study']).resolve()):
            raise Hold('bootstrap lacks the actual closed legacy-owner transition')
        current=Path(self.c['parent_study'])
        self.backend.verify(current)
        self.checkpoint('closed_transition_verified',original_comparison_study=transition['original_comparison_study'])
        both=current.resolve()==Path(transition['original_comparison_study']).resolve()
        if self.drain_closed_parent(current,both):return 0
        # Bootstrap is migration-first. Never call native run/recover on the
        # already finished historical parent, or replay its paid calls.
        while not self.stopping():
            if self.stop_at_boundary():return 4
            if not self.ensure_headroom(at_boundary=True):
                if self.stop_at_boundary():return 4
                self.checkpoint('user_stopped');return 1
            if self.stop_at_boundary():return 4
            number=self.state['epoch']+1
            curation=self.output/'curation'/f'{number:06d}'
            self.checkpoint('curating_next_epoch',pending_curation=str(curation),next_epoch=number)
            self.backend.curate(curation)
            if self.stopping():self.checkpoint('user_stopped');return 1
            # Keep any completed paid curation; never silently redo it.
            if self.stop_at_boundary():return 4
            destination=Path(self.c['successor_root'])/(DESTINATION_PREFIX+f'{number:04d}')
            self.checkpoint('migrating_closed_epoch',pending_successor=str(destination))
            migrated=self.backend.migrate(current,destination,curation)
            if Path(migrated['study']).resolve()!=destination.resolve():raise Hold('migration returned another study')
            if self.stop_at_boundary():
                self.checkpoint('operator_transition_boundary',prepared_successor=str(destination),
                    prepared_migration_provenance=migrated['provenance_path'])
                return 4
            current=destination
            self.checkpoint('successor_ready',current_study=str(current),epoch=number,bootstrap_pending=False,
                migration_provenance=migrated['provenance_path'],pending_curation=None,pending_successor=None)
            if not self.continue_until_boundary(current,False,0):self.checkpoint('user_stopped');return 1
            if self.state['root_proved']:return 0
        self.checkpoint('user_stopped');return 1


def validate_config(value):
    required={'schema','parent_study','legacy_owner','transition_source','transition_binding','transition_receipt',
        'implementation_sha256','contract_path','contract_sha256','profile_path','profile_sha256',
        'owner_source_sha256','epoch_source','finalization_source','funding_source','successor_root'}
    if not isinstance(value,dict) or set(value)!=required or value.get('schema')!=SCHEMA:
        raise Hold('prospective owner configuration schema differs')
    for key in ('implementation_sha256','contract_sha256','profile_sha256','owner_source_sha256'):
        item=value[key]
        if not isinstance(item,str) or len(item)!=64 or any(c not in '0123456789abcdef' for c in item):raise Hold('invalid source hash')
    for key in ('parent_study','contract_path','profile_path','successor_root'):
        path=Path(value[key])
        if not path.is_absolute() or not path.resolve().is_relative_to(ROOT.resolve()):raise Hold('configuration path escaped repository')
    for key in ('epoch_source','finalization_source','funding_source','transition_source','transition_binding','transition_receipt'):
        item=value[key]
        if (not isinstance(item,dict) or set(item)!={'path','sha256'} or
                not Path(item['path']).is_absolute() or not Path(item['path']).resolve().is_relative_to(ROOT.resolve()) or
                sha(item['path'])!=item['sha256']):raise Hold('source-qualified input changed: '+key)
    if sha(__file__)!=value['owner_source_sha256'] or sha(value['profile_path'])!=value['profile_sha256']:
        raise Hold('prospective owner/profile changed')
    legacy=value['legacy_owner']
    if not isinstance(legacy,dict) or set(legacy)!={'source','config','profile','output'}:raise Hold('legacy owner binding differs')
    for key in ('source','config','profile'):
        item=legacy[key]
        if (not isinstance(item,dict) or set(item)!={'path','sha256'} or
                not Path(item['path']).is_absolute() or not Path(item['path']).resolve().is_relative_to(ROOT.resolve()) or
                sha(item['path'])!=item['sha256']):raise Hold('legacy identity changed')
    old=public_json(legacy['config']['path'])
    if (old.get('owner_source_sha256')!=legacy['source']['sha256'] or
            old.get('profile_path')!=legacy['profile']['path'] or old.get('profile_sha256')!=legacy['profile']['sha256'] or
            old.get('implementation_sha256')!=value['implementation_sha256'] or
            old.get('contract_sha256')!=value['contract_sha256'] or
            public_json(legacy['profile']['path']).get('validation_seconds')!=600):
        raise Hold('historical600 identity was confused with the new profile')
    if not Path(legacy['output']).is_absolute() or not Path(legacy['output']).resolve().is_relative_to(ROOT.resolve()):
        raise Hold('legacy output escaped repository')
    sys.path.insert(0,str(ROOT))
    from machinery.study_common import implementation,read,digest as ndigest,authorize_live
    contract=read(value['contract_path'])
    if digest(implementation())!=value['implementation_sha256'] or ndigest(contract)!=value['contract_sha256']:
        raise Hold('sealed implementation or original goal changed')
    authorize_live(contract)
    if value['epoch_source']!=old.get('epoch_source') or Path(value['epoch_source']['path']).resolve()!=ROOT/'.bootstrap/method-learning-gaussian-20261103/continuation/epoch.py':
        raise Hold('unchanged original epoch source is required')
    here=Path(__file__).resolve().parent
    for name,filename in (('transition_source','transition.py'),('funding_source','funding_profile.py'),('finalization_source','finalize.py')):
        if Path(value[name]['path']).resolve()!=here/filename:raise Hold('prospective source is not its qualified canonical file')
    qualify_funding(value)
    verify_transition(value)
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
