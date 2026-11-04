"""INACTIVE source-versioned native runtime adapter; no mathematical guidance.

The qualified coordinator supplies whole-history/source admission. This adapter
pins relevant native source files cheaply, preserves native execution/acceptors,
and changes only admission waiting and exact in-memory cached request ordering.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import signal
import sys
import time

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
DIAGNOSTIC=HERE.parent/'closed-round-reconciliation/diagnose.py'
DIAGNOSTIC_SHA='033cbf0cb9ed284de770b15e22370223b4aeb7768945c79c6108c392231ad830'
NATIVE_SHA='6f3c44afff35f20d63be78d94aac857c9d3532c340c63514d3473de5f7617934'
SCHEMA='math-gkm.gaussian-efficient-runtime.v1'
STATUS_SCHEMA='math-gkm.efficient-runtime-status.v1'
WAIT_SECONDS=15
ADMISSION_CAUSES=frozenset(('admission_disk_headroom','admission_memory_headroom'))

class Refused(RuntimeError):pass
class Stopped(RuntimeError):pass

def need(value,message='runtime_binding_refused'):
    if not value:raise Refused(message)

def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda:stream.read(1024**2),b''):h.update(block)
    return h.hexdigest()

need(sha(DIAGNOSTIC)==DIAGNOSTIC_SHA)
spec=importlib.util.spec_from_file_location('efficient_runtime_frozen_order_restoration',DIAGNOSTIC)
D=importlib.util.module_from_spec(spec);spec.loader.exec_module(D)
sys.path.insert(0,str(ROOT))
from machinery import study as native,study_common as common,study_policy as policy,study_knowledge as knowledge
from machinery.resources import ResourceFailure,headroom,limits


def verify_sources(expected_source_sha256):
    """Small fixed source pins only; full native qualification remains native."""
    need(sha(__file__)==expected_source_sha256 and sha(DIAGNOSTIC)==DIAGNOSTIC_SHA)
    for name,pin in D.SOURCE_PINS.items():need(sha(ROOT/name)==pin)


def emit(phase,*,study,operation,source_sha256,cause=None,state=None):
    result={'schema':SCHEMA,'phase':phase,'study':str(study),'arm':'exploration','operation':operation,
        'runtime_source_sha256':source_sha256,'qualified_native_implementation_sha256':NATIVE_SHA,'root_proved':False}
    if cause is not None:result['admission_cause']=cause
    if state is not None:
        result.update({key:state.get(key) for key in ('status','round','phase','calls','meta_calls','seconds')})
        result['native_phase']=result.pop('phase');result['phase']=phase
        result['native_resolution_reported']=bool(state.get('resolution'))
    print(json.dumps(result,sort_keys=True),flush=True)
    return result


def wait_for_headroom(study,report=None):
    """Only exact admission shortages wait. Cleanup/observer failures propagate."""
    while True:
        if (Path(study)/'STOP.json').exists():raise Stopped('stop_requested')
        try:return headroom(limits())
        except ResourceFailure as exc:
            cause=str(exc)
            if cause not in ADMISSION_CAUSES:raise
            if report is not None:report(cause)
            time.sleep(WAIT_SECONDS)


def no_cleanup_problem(receipt):
    outcome=receipt.get('outcome','')
    termination=receipt.get('resources',{}).get('termination_cause')
    return (receipt.get('operationally_incomplete') is not True and isinstance(outcome,str) and
        'cleanup' not in outcome.lower() and (termination is None or 'cleanup' not in str(termination).lower()))


class RuntimeArm(native.Arm):
    """Fresh requests and all mathematical acceptance use the native methods."""
    def __init__(self,*args,report=None,**kwargs):
        super().__init__(*args,**kwargs);self.admission_report=report
    def cheap_admission(self):
        value=wait_for_headroom(self.study,self.admission_report)
        if self.admission_report is not None:self.admission_report(None)
        return value
    def closed_job(self,job,*,require_numeric,expected_role=None,workspace=None):
        job=Path(job)
        need(job.parent==self.root/'jobs' and job.resolve()==job and
             all((job/name).is_file() for name in ('request.json','receipt.json','spec.json')),
             'missing_closed_receipt_no_automatic_recovery')
        request=common.read(job/'request.json');receipt=common.read(job/'receipt.json');specification=common.read(job/'spec.json')
        role=specification.get('role');key=job.name;recorded=self.s.get('receipts',[]).count(str(job))
        need(request.get('request_id')==receipt.get('request_id')==specification.get('request_id')==key and
             request.get('role')==receipt.get('role')==role and
             (expected_role is None or role==expected_role) and
             specification.get('transport')==self.p.get('transport') and
             all(request.get(k)==receipt.get(k)==specification.get(k)==v for k,v in
                 (('model',self.p['model']),('reasoning_effort','high'))) and
             self.s.get('counted_jobs',[]).count(key)==1 and
             self.s.get('reservations',{}).get('call-'+key)==specification.get('seconds') and
             type(specification.get('seconds')) is int and specification['seconds']>0 and recorded in (0,1) and
             no_cleanup_problem(receipt),'closed_receipt_binding_refused')
        if workspace is not None:need(Path(specification.get('workspace','')).resolve()==Path(workspace).resolve())
        if recorded:
            need(self.s.get('receipt_hashes',{}).get(str(job))==common.digest(receipt))
        else:
            need(str(job) not in self.s.get('receipt_hashes',{}))
        if require_numeric:need(type(receipt.get('returncode')) is int,'unknown_effects_no_automatic_recovery')
        elif type(receipt.get('returncode')) is not int:
            # Source-qualified historical dispositions have already been admitted
            # by the coordinator. Their registered bytes remain unchanged here.
            need(recorded==1,'unknown_effects_no_automatic_recovery')
        return request,receipt
    def check_recoverable(self):
        """Never reach native's saved-PID branch or synthesize an uncertainty."""
        active=self.s.get('active')
        jobs=[]
        if active:
            job=Path(active);need(job.parent==self.root/'jobs');jobs.append(job)
        for job in sorted((self.root/'jobs').glob('*')):
            if job.is_dir() and str(job) not in self.s.get('receipts',[]) and job not in jobs:jobs.append(job)
        for job in jobs:self.closed_job(job,require_numeric=True)
        return len(jobs)
    def recover(self):
        self.cheap_admission();self.check_recoverable()
        return super().recover()
    def call(self,key,role,req,workspace=None,readonly=False,seconds=None):
        self.cheap_admission()
        job=self.root/'jobs'/key
        need(not (getattr(self,'restoring_closed_planner',False) and role=='proposer' and not (job/'receipt.json').is_file()),
             'closed_researcher_cannot_trigger_fresh_planner')
        if job.exists():
            # A missing receipt is never turned into a fresh call, a saved-PID
            # query, or a new uncertain receipt by this adapter.
            self.closed_job(job,require_numeric=False,expected_role=role,workspace=workspace or self.workspace)
        return super().call(key,role,req,workspace,readonly,seconds)
    def plan_with_repair(self,key,req,state,workspace,index,protocol):
        # Native planners can retain the accepted plan in either repair or
        # generation. A closed researcher must never trigger a fresh planner.
        main=key==f'plan-{index:04d}'
        job=self.root/'jobs'/f'round-{index:04d}'
        if not main or not (job/'receipt.json').exists():
            return super().plan_with_repair(key,req,state,workspace,index,protocol)
        original,_=self.closed_job(job,require_numeric=True,expected_role='researcher',workspace=workspace)
        accepted=[]
        for generation in range(2):
            base=key if generation==0 else key+'-generation-'+str(generation)
            for attempt in range(protocol['proposal_repairs']+1):
                logical=base if attempt==0 else base+'-repair-'+str(attempt)
                if (self.root/'jobs'/logical/'validated-plan.json').is_file():accepted.append(logical)
        need(bool(accepted),'closed_researcher_requires_retained_accepted_plan')
        previous=getattr(self,'restoring_closed_planner',False);self.restoring_closed_planner=True
        try:staged,commitment=super().plan_with_repair(key,req,state,workspace,index,protocol)
        finally:self.restoring_closed_planner=previous
        # Native authenticates the exact accepted generation and repair chain.
        # The frozen diagnostic then reconstructs the MAIN researcher request.
        before=common.digest(staged);commitment_before=common.digest(commitment)
        restored,report=D.restore_staged_order(staged,original,commitment,protocol,index,policy,knowledge.SCHEMAS)
        need(restored is not None and report.get('exact_restoration_found') is True and
             common.digest(restored)==before and common.digest(commitment)==commitment_before and
             D.rebuild(restored,commitment,protocol,index,policy,knowledge.SCHEMAS)==original and
             D.canonical(D.rebuild(restored,commitment,protocol,index,policy,knowledge.SCHEMAS))==D.canonical(original),
             'cached_research_request_not_exact')
        return restored,commitment
    def research_round(self):
        self.cheap_admission();return super().research_round()
    def review(self):
        self.cheap_admission();return super().review()


def status_writer(path,study,operation,source_sha256):
    if path is None:return lambda phase,cause=None:None
    path=Path(path)
    need(path.is_absolute() and path.resolve()==path and path.is_relative_to(ROOT/'.bootstrap') and
         path.name=='RUNTIME_STATUS.json' and len(path.parent.name)==6 and path.parent.name.isdigit() and
         path.parent.parent.name=='commands' and path.parent.is_dir(),'runtime_status_scope_refused')
    def publish(phase,cause=None):
        need(phase in ('running','waiting_host_headroom','finished','refused','stopped') and
             (cause is None or cause in ADMISSION_CAUSES))
        value={'schema':STATUS_SCHEMA,'source_sha256':source_sha256,'study':str(study),
               'operation':operation,'phase':phase,'updated_at':time.time()}
        if cause is not None:value['resource_reason']=cause
        common.write(path,value)
    return publish


def execute(study,*,operation,arm='exploration',expected_source_sha256,report=None,status_path=None):
    verify_sources(expected_source_sha256);study=Path(study)
    need(study.is_absolute() and study.resolve()==study and study.parent==ROOT/'.scratch/studies' and
         operation in ('run','recover') and arm=='exploration','runtime_scope_refused')
    publish=status_writer(status_path,study,operation,expected_source_sha256)
    def notice(cause):
        publish('waiting_host_headroom' if cause is not None else 'running',cause)
        if report is not None:report(cause)
        elif cause is not None:emit('waiting_for_resources',study=study,operation=operation,source_sha256=expected_source_sha256,cause=cause)
    try:
        publish('running')
        wait_for_headroom(study,notice)  # Before lock/large qualification or any native action.
        with common.lock(study/'controller.lock') as fd:
            previous={}
            def stop_signal(signum,frame):common.write(study/'STOP.json',{'signal':signum,'time':time.time()})
            for signum in (signal.SIGTERM,signal.SIGINT):previous[signum]=signal.signal(signum,stop_signal)
            try:
                subject=RuntimeArm(study,arm,fd,report=notice)
                while True:
                    wait_for_headroom(study,notice);publish('running')
                    subject.s=common.load_state(subject.root/'state.json');subject.tick=time.monotonic()
                    subject.check_recoverable()
                    try:
                        native.verify(study)
                        wait_for_headroom(study,notice);publish('running')
                        if operation=='run':subject.run()
                        else:subject.recover()
                        publish('finished')
                        return emit('native_operation_finished',study=study,operation=operation,source_sha256=expected_source_sha256,state=subject.s)
                    except ResourceFailure as exc:
                        if str(exc) not in ADMISSION_CAUSES:raise
                        # Reload exact durable accounting; no replay/refund.
                        # Unknown jobs refuse before native can query a saved PID.
                        subject.s=common.load_state(subject.root/'state.json');subject.tick=time.monotonic()
                        subject.check_recoverable()
                        notice(str(exc));wait_for_headroom(study,notice)
            finally:
                for signum,handler in previous.items():signal.signal(signum,handler)
    except Stopped:publish('stopped');raise
    except BaseException:publish('refused');raise


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--study',type=Path,required=True);parser.add_argument('--arm',choices=('exploration',),required=True)
    parser.add_argument('--operation',choices=('run','recover'),required=True);parser.add_argument('--source-sha256',required=True)
    parser.add_argument('--status-path',type=Path,required=True)
    args=parser.parse_args()
    try:execute(args.study,operation=args.operation,arm=args.arm,expected_source_sha256=args.source_sha256,status_path=args.status_path)
    except Stopped:
        emit('stopped',study=args.study,operation=args.operation,source_sha256=args.source_sha256);return 0
    except Exception as exc:
        print(json.dumps({'schema':SCHEMA,'phase':'refused','error_class':type(exc).__name__,
            'runtime_source_sha256':args.source_sha256,'root_proved':False},sort_keys=True),flush=True);return 2
    return 0

if __name__=='__main__':raise SystemExit(main())
