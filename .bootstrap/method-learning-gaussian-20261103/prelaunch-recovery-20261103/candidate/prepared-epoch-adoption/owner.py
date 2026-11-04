"""INACTIVE adoption of one exact prepared epoch; no paid setup replay."""
import argparse
import hashlib
import importlib.util
import os
from pathlib import Path
import signal
import subprocess
import time

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
PREDECESSOR=HERE.parent/'curation-adoption/owner.py'
PREDECESSOR_SHA='8889020c9304c17883268ccbd381facd116d32bffa8f3a26daca6c843896869d'
SCHEMA='math-gkm.gaussian-prepared-epoch-owner.v1'
CURRENT_SCHEMA='math-gkm.gaussian-prepared-epoch-current.v1'
HANDOFF_SCHEMA='math-gkm.gaussian-prepared-epoch-handoff.v1'

def load(path,name,pin=None):
    path=Path(path)
    if pin is not None and hashlib.sha256(path.read_bytes()).hexdigest()!=pin:raise RuntimeError('pinned source changed')
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

P=load(PREDECESSOR,'prepared_epoch_paid_predecessor',PREDECESSOR_SHA)
Hold=P.Hold;Refuted=P.Refuted;need=P.need;sha=P.sha;digest=P.digest;raw=P.raw;write=P.write;public_json=P.public_json;projection=P.projection
successor_prompt=P.successor_prompt;PYTHON=P.PYTHON;DESTINATION_PREFIX=P.DESTINATION_PREFIX;BOUNDARY_STOP_SCHEMA=P.BOUNDARY_STOP_SCHEMA


def reference(row):
    need(isinstance(row,dict) and set(row)=={'path','sha256'},'typed prepared reference required')
    p=Path(row['path']);need(p.is_absolute() and p.resolve()==p and p.is_relative_to(ROOT) and sha(p)==row['sha256'],
        'prepared source/history reference changed or escaped');return p


def deployment_from_archive(path):
    e=projection();return e.select(e.fields(raw(path,8*1024**2)),('deployment_preflight',))['deployment_preflight']


def verify_handoff(c,*,initial=False,native_checks=True):
    h=public_json(reference(c['prepared_handoff']));parent=Path(c['parent_study']);dest=Path(h['destination'])
    need(h.get('schema')==HANDOFF_SCHEMA and h.get('study')==str(parent) and h.get('arm')=='exploration' and
         h.get('contract_sha256')==c['contract_sha256']==P.S.CONTRACT_SHA and h.get('implementation_sha256')==c['implementation_sha256'] and
         h.get('predecessor_owner')=={'path':str(PREDECESSOR),'sha256':PREDECESSOR_SHA} and
         h.get('predecessor_config')==c['prepared_predecessor_config'] and
         h.get('curation') and h.get('preflight_replay_authorized') is False and h.get('curation_replay_authorized') is False and
         dest==Path(c['successor_root'])/(DESTINATION_PREFIX+'0001'),'prepared handoff source/goal/destination differs')
    exited=h.get('owner_exit',{})
    need(exited.get('actual_numeric_exit_observed') is True and type(exited.get('returncode')) is int and exited['returncode']==2 and
         isinstance(exited.get('owned_tool_handle'),str) and bool(exited['owned_tool_handle']) and
         isinstance(exited.get('completion_reference'),str) and bool(exited['completion_reference']),'actual closed paid owner evidence missing')
    checkpoint=public_json(reference(h['checkpoint']))
    need(reference(h['checkpoint'])==Path(h['predecessor_output'])/'OWNER_CHECKPOINT.json' and checkpoint.get('epoch')==0 and
         checkpoint.get('phase')=='needs_reconciliation' and checkpoint.get('error_class')=='ResourceFailure' and
         checkpoint.get('root_proved') is False and checkpoint.get('current_study')==str(parent) and
         checkpoint.get('pending_successor')==str(dest) and checkpoint.get('pending_curation')==h['curation'],
         'closed owner checkpoint does not identify this prepared epoch')
    for key,name in (('seal','seal.json'),('protocol','protocol.json')):
        need(reference(h[key])==parent/name,'original closed-parent seal/protocol changed')
    for group,base in (('parent_states',parent),('prepared_states',dest)):
        need(set(h[group])=={'baseline','exploration'},'both before-state bindings required')
        for mode,row in h[group].items():
            need(row['current'].get('path')==str(base/'arms'/mode/'state.json') and row['current'].get('sha256')==row['archive'].get('sha256'),
                 'prepared before-state/archive identity differs')
            observed=P.S.state_observation(reference(row['archive']))
            need(all(observed.get(k+'_is_null') is True for k in ('active','active_intent','resolution')),'before-state has active work or resolution')
            if group=='prepared_states':
                need(observed.get('round')==0 and observed.get('calls')==0 and observed.get('meta_calls')==0 and observed.get('status')=='ready',
                     'prepared before-state is not zero-call pristine freeze')
            if initial:reference(row['current'])
    for key,name in (('prepared_seal','seal.json'),('prepared_protocol','protocol.json')):
        row=h[key];reference(row['archive'])
        need(row['current'].get('path')==str(dest/name) and row['current']['sha256']==row['archive']['sha256'],'prepared before-seal/protocol differs')
        if initial:reference(row['current'])
    result=reference(h['deployment_result']);receipt=reference(h['deployment_receipt']);e=projection()
    need(result==dest/'deployment-preflight/result.json' and receipt==dest/'deployment-preflight/receipt.json','successful prepared deployment moved')
    report=e.select(e.fields(raw(result)),('ready','neutral','hosted_model_calls','elapsed_seconds','budget_seconds'))
    checked=e.select(e.fields(raw(receipt)),('ready','result_sha256'))
    need(report.get('ready') is True and report.get('neutral') is True and report.get('hosted_model_calls')==0 and
         report.get('budget_seconds')==1800 and type(report.get('elapsed_seconds')) in (int,float) and 0<=report['elapsed_seconds']<=1800 and
         checked.get('ready') is True and checked.get('result_sha256')==sha(result),'prepared deployment lacks actual completed success')
    old=P.configuration(public_json(reference(c['prepared_predecessor_config'])),initial=False,native_checks=native_checks)
    transition=P.verify_adoption(old,initial=False,native_checks=native_checks)
    need(transition['curation']==h['curation'] and transition['next_destination']==str(dest),'paid curation or destination changed')
    if native_checks:
        from machinery.study_deployment import reuse_deployment
        reuse_deployment(deployment_from_archive(reference(h['prepared_seal']['archive'])))
    return {**transition,'next_destination':str(dest),'prepared_binding':{'prepared_source':c['prepared_source'],'handoff':c['prepared_handoff']}}


def configuration(outer,*,initial=False,native_checks=True):
    needed={'schema','predecessor_config','handoff','owner_source_sha256','prepared_source','bridge_source'}
    need(isinstance(outer,dict) and set(outer)==needed and outer.get('schema')==SCHEMA and
         sha(__file__)==outer.get('owner_source_sha256'),'prepared owner configuration/source differs')
    for name in ('prepared_source','bridge_source'):reference(outer[name])
    old=P.configuration(public_json(reference(outer['predecessor_config'])),initial=False,native_checks=native_checks)
    c={**old,'owner_source_sha256':outer['owner_source_sha256'],'prepared_predecessor_config':outer['predecessor_config'],
        'prepared_handoff':outer['handoff'],'prepared_source':outer['prepared_source'],'bridge_source':outer['bridge_source']}
    verify_handoff(c,initial=initial,native_checks=native_checks);return c


def public_study(study,c,transition):
    rows=P.S.O.B.public_study(study);bridge=load(reference(c['bridge_source']),'qualified_prepared_epoch_bridge')
    for mode,row in rows.items():row.update(bridge.settlement(Path(study),mode,transition['grant'],transition['prepared_binding'],transition['extra_nonlaunch'],c))
    return rows


class Native(P.Native):
    def __init__(self,c,output):
        super().__init__(c,output);self.prepared_admitted=False;self.prepared_completed=False;self.prepared_transition=None
    def transition(self):
        result=verify_handoff(self.c,initial=not self.prepared_admitted)
        self.prepared_admitted=True;self.prepared_transition=result;self.adoption_admitted=True;self.adoption_transition=result
        self.resume_admitted=True;self.resume_transition=result;self.initial_revision_checked=True;self.grant_reference=result['grant'];self.transition_admitted=True
        return result
    def check_inputs(self):
        outer={'schema':SCHEMA,'predecessor_config':self.c['prepared_predecessor_config'],'handoff':self.c['prepared_handoff'],
            'owner_source_sha256':self.c['owner_source_sha256'],'prepared_source':self.c['prepared_source'],'bridge_source':self.c['bridge_source']}
        need(configuration(outer,initial=not self.prepared_admitted)==self.c,'derived prepared settings changed')
        if not self.prepared_admitted:self.transition()
    def public(self,study):
        if self.prepared_transition is None:self.transition()
        return public_study(study,self.c,self.prepared_transition)
    def migrate(self,parent,destination,curation):
        if not self.prepared_completed:
            self.check_inputs();transition=self.transition()
            need(str(parent)==self.c['parent_study'] and str(destination)==transition['next_destination'] and str(curation)==transition['curation'],
                 'first prepared inheritance changed its exact inputs')
            source=reference(self.c['prepared_source']);module=load(source,'qualified_finish_prepared')
            result=module.finish_prepared(Path(parent),Path(destination),curation=Path(curation),profile=Path(self.c['profile_path']),
                contract_path=Path(self.c['contract_path']),handoff=self.c['prepared_handoff'],expected_source_sha256=self.c['prepared_source']['sha256'])
            marker=public_json(Path(destination)/'MIGRATION_FINISHED.json')
            expected={'source_sha256':self.c['prepared_source']['sha256'],'seal_sha256':sha(Path(destination)/'seal.json'),
                'state_sha256':sha(Path(destination)/'arms/exploration/state.json'),'provenance_sha256':sha(Path(result['provenance_path'])),
                'parent_state_sha256':result['parent_state_sha256'],'epoch_start_binding':result['epoch_start_binding']}
            need(marker.get('schema')=='math-gkm.closed-own-epoch.v1' and all(marker.get(k)==v for k,v in expected.items()) and
                 sha(Path(parent)/'arms/exploration/state.json')==marker['parent_state_sha256'],'prepared inheritance lacks genuine finished source/state provenance')
            bridge=load(reference(self.c['bridge_source']),'prepared_finished_bridge')
            bridge.prepared_marker(Path(destination),marker,transition['prepared_binding'],projection())
            self.prepared_completed=True;self.bootstrap_parent_pending=False
            return result
        # Future fresh epochs retain the original ccce source and native freeze.
        return P.S.O.B.Native.migrate(self,parent,destination,curation)
    def command(self,kind,argv,study):
        if kind=='curation':
            need(argv[-2]==str(P.S.PREDECESSOR) and argv[-1]==self.c['owner_source_sha256'],'inherited curator source interface changed')
            argv=[*argv[:-2],str(Path(__file__).resolve()),argv[-1]]
        return P.S.O.B.Native.command(self,kind,argv,study)


class Owner(P.Owner):
    def __init__(self,c,output,backend=None):
        super().__init__(c,output,backend or Native(c,output));self.state['schema']=SCHEMA
    def checkpoint(self,phase,**values):
        self.state.update(phase=phase,updated_at=time.time(),**values);write(self.output/'OWNER_CHECKPOINT.json',self.state)
        keys=('phase','current_study','parent_study','original_comparison_study','epoch','root_proved','updated_at','migration_first','scientific_status')
        pointer={k:self.state.get(k) for k in keys};pointer.update(schema=CURRENT_SCHEMA,owner_source_sha256=self.c['owner_source_sha256'],
            contract_sha256=self.c['contract_sha256'],profile_sha256=self.c['profile_sha256'],revision_finished_sha256=self.c['revision_finished']['sha256'],
            prepared_handoff_sha256=self.c['prepared_handoff']['sha256'])
        write(self.output/'CURRENT.json',pointer)


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
    a=p.parse_args();c=configuration(public_json(a.config),initial=True);need(a.output.resolve().is_relative_to(ROOT),'prepared output escaped')
    import fcntl
    a.output.mkdir(parents=True,exist_ok=True)
    with (a.output/'owner.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        if (a.output/'OWNER_CHECKPOINT.json').exists():return 2
        keeper=subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        owner=Owner(c,a.output)
        try:return owner.run()
        except Refuted as exc:owner.checkpoint('conjecture_refuted',root_proved=False,verified_refutation=exc.verdict);return 3
        except (RuntimeError,OSError,ValueError,KeyError,TypeError) as exc:owner.checkpoint('needs_reconciliation',error_class=type(exc).__name__);return 2
        finally:
            if keeper.poll() is None:keeper.terminate()
            try:keeper.wait(timeout=5)
            except subprocess.TimeoutExpired:keeper.kill();keeper.wait(timeout=5)

if __name__=='__main__':
    def stop(*_):P.S.O.B.STOPPING=True
    signal.signal(signal.SIGINT,stop);signal.signal(signal.SIGTERM,stop)
    raise SystemExit(main())
