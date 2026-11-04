"""INACTIVE cached-only failed-round closure; ROOT executes only after review.

Original requests/plans/receipts and native implementation remain unchanged.
This external adapter has its own explicit source identity and permits no new
role invocation. A FINISHED here is operational evidence, never a root proof.
"""
import argparse
import copy
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sys
import time

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
PARSER=ROOT/'.bootstrap/gaussian-native-operator-20261031/public_json_projection.py'
DIAGNOSTIC_SHA='033cbf0cb9ed284de770b15e22370223b4aeb7768945c79c6108c392231ad830'
if hashlib.sha256((HERE/'diagnose.py').read_bytes()).hexdigest()!=DIAGNOSTIC_SHA:raise RuntimeError('diagnostic source changed')
spec=importlib.util.spec_from_file_location('closed_round_frozen_diagnostic',HERE/'diagnose.py')
D=importlib.util.module_from_spec(spec);spec.loader.exec_module(D)
COMMON,POLICY,KNOWLEDGE,FEEDBACK=D.native()
from machinery.study import Arm,verify as native_verify
from machinery.resources import headroom,limits
SCHEMA='math-gkm.closed-round-reconciliation.v1'
ACCOUNTING=('calls','meta_calls','seconds','policy_trials','reservations','budget_pools','counted_jobs','receipts','receipt_hashes',
            'protocol_state','protocol_attempts','protocol_reserved_seconds','protocol_observed_seconds','failures')

class Refused(RuntimeError):pass

def need(value,message='closed_round_reconciliation_refused'):
    if not value:raise Refused(message)

def sha(path):return D.sha(path)
def digest(value):return D.digest(value)
def read(path):return COMMON.read(path)

def reference(row):
    need(isinstance(row,dict) and set(row)=={'path','sha256'})
    path=Path(row['path']);need(path.is_absolute() and path.resolve()==path and path.is_relative_to(ROOT) and sha(path)==row['sha256'])
    return path

def exclusive(path,value):
    path=Path(path)
    with path.open('x') as out:
        out.write(D.canonical(value)+'\n');out.flush();os.fsync(out.fileno())
    fd=os.open(path.parent,os.O_RDONLY)
    try:os.fsync(fd)
    finally:os.close(fd)

def opaque_copy(source,target):
    with Path(source).open('rb') as inp,Path(target).open('xb') as out:
        for block in iter(lambda:inp.read(1024**2),b''):out.write(block)
        out.flush();os.fsync(out.fileno())
    target.chmod(0o400)
    return {'path':str(target),'sha256':sha(target)}

def accounting(state):return digest({k:state.get(k) for k in ACCOUNTING})
def admissions(state):return digest({k:state['research'].get(k,{}) for k in ('knowledge','components')})

def closed_receipt(arm,key,role,expected_pin):
    job=arm.root/'jobs'/key
    for name,pin in expected_pin.items():need(sha(job/name)==pin)
    request=read(job/'request.json');receipt=read(job/'receipt.json');spec=read(job/'spec.json')
    need(request.get('request_id')==receipt.get('request_id')==spec.get('request_id')==key and
         request.get('role')==receipt.get('role')==spec.get('role')==role and
         type(receipt.get('returncode')) is int and
         arm.s.get('receipts',[]).count(str(job))==1 and arm.s.get('counted_jobs',[]).count(key)==1 and
         arm.s.get('receipt_hashes',{}).get(str(job))==digest(receipt) and
         arm.s.get('reservations',{}).get('call-'+key)==spec.get('seconds') and
         spec.get('workspace')==str(arm.workspace) and spec.get('transport')==arm.p.get('transport')=='live' and
         spec.get('model')==receipt.get('model')==arm.p.get('model') and
         spec.get('reasoning_effort')==receipt.get('reasoning_effort')=='high')
    if role=='proposer':
        Arm.closed_planner_receipt(arm,key,receipt,arm.workspace)
    else:
        need(role=='researcher' and spec.get('readonly') is False and receipt['returncode']!=0 and receipt.get('outcome')!='completed' and receipt.get('payload') is None)
    return request,receipt


class CachedRoundArm(Arm):
    """Actual external source adapter; no native/global monkeypatching."""
    def __init__(self,study,mode,fd,*,index,job_pins):
        super().__init__(study,mode,fd);self.closed_index=index;self.job_pins=job_pins;self.cached_returns=[];self.restoration_checked=False
    def plan_with_repair(self,key,req,state,workspace,index,protocol):
        need(index==self.closed_index and key==f'plan-{index:04d}' and (self.root/'jobs'/key/'validated-plan.json').is_file())
        closed_receipt(self,key,'proposer',self.job_pins['proposer'])
        staged,commitment=super().plan_with_repair(key,req,state,workspace,index,protocol)
        original,receipt=closed_receipt(self,f'round-{index:04d}','researcher',self.job_pins['researcher'])
        before=digest(staged)
        restored,report=D.restore_staged_order(staged,original,commitment,protocol,index,POLICY,KNOWLEDGE.SCHEMAS)
        need(restored is not None and report['exact_restoration_found'] and digest(restored)==before and
             D.rebuild(restored,commitment,protocol,index,POLICY,KNOWLEDGE.SCHEMAS)==original and
             D.canonical(D.rebuild(restored,commitment,protocol,index,POLICY,KNOWLEDGE.SCHEMAS))==D.canonical(original))
        self.restoration_checked=True;return restored,commitment
    def call(self,key,role,req,workspace=None,readonly=False,seconds=None):
        expected={f'plan-{self.closed_index:04d}':'proposer',f'round-{self.closed_index:04d}':'researcher'}
        need(key in expected and role==expected[key],'new_role_launch_forbidden')
        original,receipt=closed_receipt(self,key,role,self.job_pins[role])
        generated={**req,'model':self.p['model'],'reasoning_effort':'high','request_id':key}
        need(generated==original and D.canonical(generated)==D.canonical(original),'cached_request_not_exact')
        need(role!='researcher' or self.restoration_checked)
        result=super().call(key,role,req,workspace,readonly,seconds)
        need(result==receipt and digest(result)==digest(receipt));self.cached_returns.append(role);return result


def safe_diagnosis(value):
    clean=value.get('cleanup_metadata',{})
    return (value.get('diagnostic_passed') is True and value.get('actual_state_unchanged') is True and
        value.get('all_input_files_unchanged') is True and value.get('current_research_equals_round_start') is True and
        value.get('history_exists') is False and value.get('snapshot_exists') is False and value.get('snapshot_staging_exists') is False and
        value.get('protocol_pending_is_null') is True and value.get('protocol_inflight_is_false') is True and
        value.get('original_receipt_registered_once') is True and value.get('original_full_reservation_preserved') is True and
        value.get('recorded_retained_sources_preserved') is True and value.get('original_request_canonical_bytes_equal') is True and
        value.get('order_restoration',{}).get('exact_restoration_found') is True and
        set(value.get('fixed_key_differences',{}))<= {'portfolio','program_execution'} and
        clean.get('resource_termination_is_disk_headroom') is True and clean.get('global_cleanup_hold_present') is False and
        clean.get('outcome_reports_cleanup_problem') is False and clean.get('receipt_operationally_incomplete') is not True)


def diagnosis_result(value):
    need(value.get('schema')=='math-gkm.actual-closed-round-pure-diagnosis.v1' and
         value.get('source_sha256')==DIAGNOSTIC_SHA and value.get('read_only') is True and isinstance(value.get('result'),dict))
    result=value['result'];need(safe_diagnosis(result));return result


def job_bindings(diagnosis):
    pins=diagnosis['input_file_sha256']
    return {'proposer':{name+'.json':pins['plan_'+name] for name in ('request','receipt','spec')},
            'researcher':{name+'.json':pins['research_'+name] for name in ('request','receipt','spec')}}


def finish_closed_round(study,*,mode='exploration',round_index,expected_state_sha256,diagnosis,expected_source_sha256,output):
    need(sha(__file__)==expected_source_sha256 and D.sha(HERE/'diagnose.py')==DIAGNOSTIC_SHA)
    COMMON2,*_=D.native();need(COMMON2 is COMMON)
    study=Path(study).resolve();output=Path(output)
    need(study.is_relative_to(ROOT) and study!=ROOT and mode=='exploration' and type(round_index) is int and round_index>=0 and output.is_absolute() and output.resolve()==output and
         output.is_relative_to(ROOT/'.bootstrap') and not output.exists())
    saved=diagnosis_result(read(reference(diagnosis)))
    with COMMON.lock(study/'controller.lock') as fd:
        need(sha(study/'arms'/mode/'state.json')==expected_state_sha256)
        fresh=D.diagnose(study,mode,round_index,expected_state_sha256);need(fresh==saved and safe_diagnosis(fresh))
        headroom(limits());native_verify(study)
        arm=CachedRoundArm(study,mode,fd,index=round_index,job_pins=job_bindings(fresh))
        before=copy.deepcopy(arm.s);need(digest(before['research'])==fresh['round_start_research_sha256'])
        source_before=COMMON.inventory(arm.workspace);receipt=read(arm.root/'jobs'/f'round-{round_index:04d}'/'receipt.json')
        need(source_before==receipt.get('after') and not (study/'STOP.json').exists())
        input_paths={'protocol':study/'protocol.json','seal':study/'seal.json','contract':study/'seed/contract.json',
            'round_start':arm.root/'rounds'/f'{round_index:04d}'/'start.json','validated_plan':arm.root/'jobs'/f'plan-{round_index:04d}'/'validated-plan.json'}
        for side,prefix in (('proposer','plan'),('researcher','research')):
            job=arm.root/'jobs'/(f'plan-{round_index:04d}' if side=='proposer' else f'round-{round_index:04d}')
            for name in ('request','receipt','spec'):input_paths[prefix+'_'+name]=job/(name+'.json')
        need(all(sha(path)==fresh['input_file_sha256'][key] for key,path in input_paths.items()))
        output.mkdir(parents=True)
        before_archive=opaque_copy(arm.root/'state.json',output/'BEFORE_STATE.raw')
        intent={'schema':SCHEMA,'phase':'intent_only','source_sha256':expected_source_sha256,'diagnostic_source_sha256':DIAGNOSTIC_SHA,
            'native_implementation_sha256':D.NATIVE_SHA,'diagnosis':diagnosis,'study':str(study),'mode':mode,'round_before':round_index,
            'before_state':before_archive,'input_file_sha256':fresh['input_file_sha256'],'accounting_binding':accounting(before),
            'admission_binding':admissions(before),'workspace_binding':digest(source_before),'created_at':time.time(),
            'scope':'external exact-request restoration; unchanged native failed-round bookkeeping; no new role or mathematical admission'}
        exclusive(output/'INTENT.json',intent)
        try:
            # One unchanged native round, not Arm.run: the next role cannot start.
            Arm.research_round(arm)
            native_verify(study);after=COMMON.load_state(arm.root/'state.json')
            need(arm.restoration_checked and arm.cached_returns==['researcher'] and after.get('round')==round_index+1 and
                 after.get('active') is None and after.get('active_intent') is None and after.get('resolution') is None and
                 accounting(after)==accounting(before) and admissions(after)==admissions(before) and
                 COMMON.inventory(arm.workspace)==source_before)
            need(all(sha(path)==fresh['input_file_sha256'][key] for key,path in input_paths.items()))
            snapshot=arm.root/'snapshots'/f'round-{round_index:04d}';snapshot_binding=COMMON.verify_snapshot(snapshot)['binding']
            history=arm.workspace/'history'/f'round-{round_index:04d}.json'
            need(read(history)==receipt and digest(read(history))==digest(receipt))
            after_archive=opaque_copy(arm.root/'state.json',output/'AFTER_STATE.raw')
            finished={**intent,'phase':'finished','after_state':after_archive,'after_state_sha256':sha(arm.root/'state.json'),
                'round_after':after['round'],'phase_after':after['phase'],'accounting_unchanged':True,'admissions_unchanged':True,
                'source_workspace_unchanged':True,'new_role_launches':0,'new_mathematical_admissions':0,
                'cached_research_request_exactly_equal':True,'canonical_staged_digest_unchanged':True,
                'snapshot_binding':snapshot_binding,'snapshot_manifest_sha256':sha(snapshot/'manifest.json'),
                'snapshot_routing_seal_sha256':sha(snapshot/'routing-seal.json') if (snapshot/'routing-seal.json').exists() else None,
                'history_receipt_sha256':sha(history),
                'cleanup_basis':'exact worker cleanup-before-receipt source; no unresolved hold; no invented cleanup-completion flag',
                'finished_at':time.time()}
            exclusive(output/'FINISHED.json',finished)
        except BaseException as exc:
            if not (output/'FAILED.json').exists():exclusive(output/'FAILED.json',{'schema':SCHEMA,'error_class':type(exc).__name__,'phase':'needs_reconciliation','source_sha256':expected_source_sha256})
            raise
    return verify_finished(study,output,expected_source_sha256=expected_source_sha256)


def archive_projection(path):
    parser=PARSER
    need(sha(parser)=='5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec')
    spec=importlib.util.spec_from_file_location('closed_round_receipt_projection',parser)
    e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
    with Path(path).open('rb') as stream:raw=stream.read(32*1024**2+1).strip()
    need(len(raw)<=32*1024**2)
    envelope=e.fields(raw);body=envelope['state']
    need(e.select(envelope,('sha256',)).get('sha256')==hashlib.sha256(body).hexdigest())
    fields=e.fields(body);research=e.fields(fields['research'])
    def token_digest(mapping,names,default):
        data=b'{'+b','.join(D.canonical(key).encode()+b':'+mapping.get(key,default) for key in sorted(names))+b'}'
        return hashlib.sha256(data).hexdigest()
    return {'accounting':token_digest(fields,ACCOUNTING,b'null'),
        'admissions':token_digest(research,('knowledge','components'),b'{}'),
        **e.select(fields,('round','phase'))}


def verify_finished(study,output,*,expected_source_sha256,require_current_state=True,native_checks=True):
    """Read-only receipt verification; False keeps reader to hashes/E1 metadata."""
    need(sha(__file__)==expected_source_sha256);D.native();study=Path(study).resolve();output=Path(output).resolve()
    result=read(output/'FINISHED.json');intent=read(output/'INTENT.json')
    need(intent.get('schema')==SCHEMA and intent.get('phase')=='intent_only' and result.get('schema')==SCHEMA and result.get('phase')=='finished' and result.get('source_sha256')==expected_source_sha256 and
         result.get('native_implementation_sha256')==D.NATIVE_SHA and result.get('diagnostic_source_sha256')==DIAGNOSTIC_SHA and
         result.get('study')==str(study) and result.get('round_after')==result.get('round_before',-2)+1 and
         result.get('new_role_launches')==result.get('new_mathematical_admissions')==0 and not (output/'FAILED.json').exists())
    need({k:v for k,v in result.items() if k in intent and k!='phase'}=={k:v for k,v in intent.items() if k!='phase'})
    before_path=reference(result['before_state']);after_path=reference(result['after_state'])
    need(before_path==output/'BEFORE_STATE.raw' and after_path==output/'AFTER_STATE.raw' and
         result['before_state']['sha256']==result['input_file_sha256']['state'] and
         result['after_state_sha256']==result['after_state']['sha256'])
    saved=diagnosis_result(read(reference(result['diagnosis'])))
    need(saved['input_file_sha256']==result['input_file_sha256'] and saved['round']==result['round_before'])
    before=archive_projection(before_path);after=archive_projection(after_path)
    need(before['accounting']==after['accounting']==result['accounting_binding'] and
         before['admissions']==after['admissions']==result['admission_binding'] and
         before['round']==result['round_before'] and after['round']==result['round_after'] and after['phase']==result['phase_after'])
    arm=study/'arms'/result['mode'];p=result['input_file_sha256'];index=result['round_before']
    paths={'protocol':study/'protocol.json','seal':study/'seal.json','contract':study/'seed/contract.json',
        'round_start':arm/'rounds'/f'{index:04d}'/'start.json','validated_plan':arm/'jobs'/f'plan-{index:04d}'/'validated-plan.json'}
    for prefix,key in (('plan',f'plan-{index:04d}'),('research',f'round-{index:04d}')):
        for name in ('request','receipt','spec'):paths[prefix+'_'+name]=arm/'jobs'/key/(name+'.json')
    need(all(sha(path)==p[key] for key,path in paths.items()))
    snapshot=arm/'snapshots'/f'round-{index:04d}'
    need(sha(arm/'workspace/history'/f'round-{index:04d}.json')==result['history_receipt_sha256'] and
         sha(snapshot/'manifest.json')==result['snapshot_manifest_sha256'])
    if result.get('snapshot_routing_seal_sha256') is not None:need(sha(snapshot/'routing-seal.json')==result['snapshot_routing_seal_sha256'])
    if require_current_state:need(sha(arm/'state.json')==result['after_state_sha256'])
    if native_checks:
        native_verify(study);need(COMMON.verify_snapshot(snapshot)['binding']==result['snapshot_binding'])
    return {'schema':SCHEMA,'finished':{'path':str(output/'FINISHED.json'),'sha256':sha(output/'FINISHED.json')},
        'source_sha256':expected_source_sha256,'native_implementation_sha256':D.NATIVE_SHA,'round_before':result['round_before'],
        'round_after':result['round_after'],'phase_after':result['phase_after'],'after_state_sha256':result['after_state_sha256'],
        'root_proved':False,'new_role_launches':0,'new_mathematical_admissions':0}


def main():
    a=argparse.ArgumentParser(description=__doc__);a.add_argument('--study',type=Path,required=True);a.add_argument('--round',type=int,required=True)
    a.add_argument('--state-sha256',required=True);a.add_argument('--diagnosis',type=Path,required=True);a.add_argument('--diagnosis-sha256',required=True)
    a.add_argument('--source-sha256',required=True);a.add_argument('--output',type=Path,required=True);args=a.parse_args()
    try:result=finish_closed_round(args.study,round_index=args.round,expected_state_sha256=args.state_sha256,
        diagnosis={'path':str(args.diagnosis),'sha256':args.diagnosis_sha256},expected_source_sha256=args.source_sha256,output=args.output)
    except Exception as exc:print(json.dumps({'finished':False,'error_class':type(exc).__name__,'root_proved':False},sort_keys=True));return 2
    print(json.dumps(result,sort_keys=True));return 0

if __name__=='__main__':raise SystemExit(main())
