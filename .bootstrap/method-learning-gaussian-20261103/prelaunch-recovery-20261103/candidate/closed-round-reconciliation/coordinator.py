"""INACTIVE exact closed-round adoption followed by the existing goal loop.

Only ROOT launches this separately qualified owner. No old paid action or setup
is replayed, and reconciliation is operational evidence, never a root proof.
"""
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
COMPONENT=HERE.parent/'prepared-epoch-adoption/owner.py'
COMPONENT_SHA='cd254726ec500b27b277d27254faab09b76b2b94a58e4919a1542a5e377b4385'
COMPONENT_CONFIG=HERE.parents[1]/'PREPARED_EPOCH_OWNER_CONFIG.json'
COMPONENT_CONFIG_SHA='67c8bb76eac02cc0bd6709e3d36f525c4cfd3bf25fb7693e3bf95fd2c50b4468'
NATIVE_SHA='6f3c44afff35f20d63be78d94aac857c9d3532c340c63514d3473de5f7617934'
CONTRACT_SHA='a9802e5423169618ba4e9c4e2cac3003e86e6133a441b6f91abdc00f97745e49'
PROFILE_SHA='99be851317ba80e441590cdc766a4a67be7c3d309282b21ad5d2fb096091c43a'
SCHEMA='math-gkm.gaussian-closed-round-owner.v1'
CURRENT_SCHEMA='math-gkm.gaussian-closed-round-current.v1'
REGISTRATION_SCHEMA='math-gkm.gaussian-closed-round-registration.v1'
STUDY=ROOT/'.scratch/studies/method-learning-gaussian-20261103-revision-epoch-0001'


def load(path,name,pin):
    path=Path(path)
    if hashlib.sha256(path.read_bytes()).hexdigest()!=pin:raise RuntimeError('qualified source changed')
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

C=load(COMPONENT,'closed_round_unchanged_prepared_component',COMPONENT_SHA)
Hold=C.Hold;Refuted=C.Refuted;need=C.need;sha=C.sha;write=C.write;public_json=C.public_json
reference=C.reference;projection=C.projection;raw=C.raw
DESTINATION_PREFIX=C.DESTINATION_PREFIX

class WaitingStopped(Hold):pass

def resource_wait(operation,*,stopping,checkpoint):
    # Both recognized exceptions are raised by the unchanged admission guard
    # before any child is launched. Unknown observers and cleanup holds fail.
    from machinery.resources import ResourceFailure
    while True:
        if stopping():raise WaitingStopped('stopped before a new owned action')
        try:return operation()
        except ResourceFailure as exc:
            if str(exc) not in ('admission_disk_headroom','admission_memory_headroom'):raise
            checkpoint(str(exc));time.sleep(15)


def configuration(binding,*,initial=False,native_checks=True):
    keys={'schema','owner_source_sha256','component_source','component_config','reconciliation_source',
          'reconciliation_output','reconciliation_finished','study','migration_finished','migration_provenance'}
    need(isinstance(binding,dict) and set(binding)==keys and binding.get('schema')==SCHEMA and
         binding.get('owner_source_sha256')==sha(__file__),'coordinator configuration/source differs')
    need(binding['component_source']=={'path':str(COMPONENT),'sha256':COMPONENT_SHA} and
         binding['component_config']=={'path':str(COMPONENT_CONFIG),'sha256':COMPONENT_CONFIG_SHA},'component ancestry differs')
    for key in ('component_source','component_config','reconciliation_source','reconciliation_finished','migration_finished','migration_provenance'):
        reference(binding[key])
    need(Path(binding['study'])==STUDY and Path(binding['reconciliation_source']['path'])==HERE/'reconcile.py',
         'closed-round adoption is limited to the exact existing epoch1')
    output=Path(binding['reconciliation_output'])
    need(output.is_absolute() and output.resolve()==output and output.is_relative_to(ROOT) and
         Path(binding['reconciliation_finished']['path'])==output/'FINISHED.json' and
         Path(binding['migration_finished']['path'])==STUDY/'MIGRATION_FINISHED.json' and
         Path(binding['migration_provenance']['path'])==STUDY/'CONTINUATION_PROVENANCE.json','adoption provenance escaped')
    component=C.configuration(public_json(reference(binding['component_config'])),initial=False,native_checks=native_checks)
    need(component['owner_source_sha256']==COMPONENT_SHA and component['implementation_sha256']==NATIVE_SHA and
         component['contract_sha256']==CONTRACT_SHA and component['profile_sha256']==PROFILE_SHA,
         'native source, full contract, or funded profile differs')
    transition=C.verify_handoff(component,initial=False,native_checks=native_checks)
    need(transition['next_destination']==str(STUDY),'prepared ancestry identifies another successor')
    helper=load(reference(binding['reconciliation_source']),'qualified_closed_round_verifier',binding['reconciliation_source']['sha256'])
    # This helper is an opaque/E1 source-and-receipt verifier, never a compiler,
    # native Arm action, independent English audit or mathematical acceptance.
    result=helper.verify_finished(STUDY,output,expected_source_sha256=binding['reconciliation_source']['sha256'],require_current_state=initial,native_checks=native_checks)
    need(result.get('schema')=='math-gkm.closed-round-reconciliation.v1' and
         result.get('finished')==binding['reconciliation_finished'] and result.get('native_implementation_sha256')==NATIVE_SHA and
         result.get('round_before')==8 and result.get('round_after')==9 and result.get('phase_after') in ('research','review') and
         result.get('root_proved') is False and result.get('new_role_launches')==result.get('new_mathematical_admissions')==0,
         'genuine one-round closure is missing or has different effects')
    marker=public_json(reference(binding['migration_finished']))
    need(marker.get('schema')=='math-gkm.closed-own-epoch.v1' and marker.get('source_sha256')==component['prepared_source']['sha256'] and
         marker.get('seal_sha256')==sha(STUDY/'seal.json') and marker.get('provenance_sha256')==binding['migration_provenance']['sha256'],
         'existing prepared migration provenance changed')
    return {'binding':binding,'component':component,'transition':transition,'reconciliation':result}


class Native(C.Native):
    def __init__(self,qualified,output):
        self.qualified=qualified;self.binding=qualified['binding']
        super().__init__(qualified['component'],output)
        self.prime(qualified['transition'])
    def prime(self,transition):
        # The inherited component still owns its source identity. All initial
        # setup has genuinely finished; future migrations use unchanged ccce.
        self.prepared_admitted=True;self.prepared_completed=True;self.prepared_transition=transition
        self.adoption_admitted=True;self.adoption_transition=transition
        self.resume_admitted=True;self.resume_transition=transition
        self.initial_revision_checked=True;self.grant_reference=transition['grant']
        self.transition_admitted=True;self.bootstrap_parent_pending=False
    def safe_inputs(self,operation):
        waited=False
        def waiting(reason):
            nonlocal waited
            waited=True;getattr(self,'waiting',lambda value:None)(reason)
        result=resource_wait(operation,stopping=getattr(self,'owner_stopping',lambda:False),checkpoint=waiting)
        if waited:getattr(self,'waiting_complete',lambda:None)()
        return result
    def check_inputs(self):
        def inspect():
            current=configuration(self.binding,initial=False)
            need(current==self.qualified,'coordinator source/history changed before an owned action')
            super(Native,self).check_inputs()
        return self.safe_inputs(inspect)
    def admit(self):
        current=self.safe_inputs(lambda:configuration(self.binding,initial=True))
        need(current==self.qualified,'current epoch1 is not the exact reconciled boundary')
        self.prime(current['transition'])
        return current['reconciliation']
    def headroom(self):
        from machinery.resources import headroom,limits,ResourceFailure
        try:headroom(limits())
        except ResourceFailure as exc:
            if str(exc) not in ('admission_disk_headroom','admission_memory_headroom'):raise
            return False
        return True
    def command(self,kind,argv,study):
        self.check_inputs()
        directory=self.output/'coordinator-command-bindings';directory.mkdir(parents=True,exist_ok=True)
        write(directory/f'{self.counter:06d}.json',{'schema':'math-gkm.composite-owner-command.v1','kind':kind,'study':str(study),
            'coordinator_source_sha256':self.binding['owner_source_sha256'],'component_source':self.binding['component_source'],
            'reconciliation_finished':self.binding['reconciliation_finished'],
            'owned_component_intent':str(self.output/'commands'/f'{self.counter:06d}'/'INTENT.json')},exclusive=True)
        return super().command(kind,argv,study)


class Owner(C.Owner):
    def __init__(self,qualified,output,backend=None):
        self.qualified=qualified;self.binding=qualified['binding']
        super().__init__(qualified['component'],output,backend or Native(qualified,output))
        self.state.update(schema=SCHEMA,current_study=str(STUDY),epoch=1,migration_first=False,bootstrap_pending=False,
            pending_curation=None,pending_successor=None,
            coordinator_source_sha256=self.binding['owner_source_sha256'],component_source=self.binding['component_source'],
            reconciliation_finished=self.binding['reconciliation_finished'],
            migration_provenance=self.binding['migration_provenance']['path'])
        self.backend.heartbeat=lambda:self.checkpoint(self.state['phase'])
        self.backend.owner_stopping=self.stopping
        self.waiting_phase=None;self.backend.waiting=self.waiting;self.backend.waiting_complete=self.waiting_complete
    def waiting(self,reason):
        if self.waiting_phase is None:self.waiting_phase=self.state['phase']
        self.checkpoint('waiting_host_headroom',wait_stage='pure_pre_child_inputs',resource_reason=reason)
    def waiting_complete(self):
        if self.waiting_phase is not None:
            phase=self.waiting_phase;self.waiting_phase=None
            self.checkpoint(phase,wait_stage=None,resource_reason=None)
    def checkpoint(self,phase,**values):
        self.state.update(phase=phase,updated_at=time.time(),**values);write(self.output/'OWNER_CHECKPOINT.json',self.state)
        keys=('phase','current_study','parent_study','original_comparison_study','epoch','root_proved','updated_at','migration_first','scientific_status')
        pointer={k:self.state.get(k) for k in keys}
        pointer.update(schema=CURRENT_SCHEMA,owner_source_sha256=self.binding['owner_source_sha256'],
            component_source_sha256=COMPONENT_SHA,contract_sha256=self.c['contract_sha256'],profile_sha256=self.c['profile_sha256'],
            revision_finished_sha256=self.c['revision_finished']['sha256'],prepared_handoff_sha256=self.c['prepared_handoff']['sha256'],
            reconciliation_finished_sha256=self.binding['reconciliation_finished']['sha256'])
        write(self.output/'CURRENT.json',pointer)
    def boundary_requested(self):
        path=self.output/'STOP_AFTER_BOUNDARY.json'
        if not path.exists():return False
        value=public_json(path)
        need(value.get('schema')==C.BOUNDARY_STOP_SCHEMA and value.get('owner_source_sha256')==self.binding['owner_source_sha256'] and
             isinstance(value.get('reason'),str) and bool(value['reason'].strip()),'boundary STOP must bind the actual coordinator')
        return True
    def run(self):
        self.output.mkdir(parents=True,exist_ok=True)
        need(not (self.output/'OWNER_CHECKPOINT.json').exists(),'existing coordinator requires explicit reconciliation')
        self.checkpoint('verifying_closed_round_adoption');result=self.backend.admit()
        write(self.output/'CONTINUATION_ADOPTION.json',{'schema':'math-gkm.closed-round-goal-adoption.v1',
            'coordinator_source_sha256':self.binding['owner_source_sha256'],'component_source':self.binding['component_source'],
            'component_config':self.binding['component_config'],'reconciliation_finished':result['finished'],
            'study':str(STUDY),'epoch':1,'migration_finished':self.binding['migration_finished'],
            'migration_provenance':self.binding['migration_provenance'],'setup_replayed':False,
            'scientific_status':'revised_source_history_no_causal_learning_claim'},exclusive=True)
        current=STUDY;self.backend.verify(current)
        need(self.backend.protocol(current)['validation_seconds']==1800,'retained epoch1 validation differs')
        self.checkpoint('resuming_reconciled_epoch')
        if not self.continue_until_boundary(current,False,0):self.checkpoint('user_stopped');return 1
        if self.state['root_proved']:return 0
        while not self.stopping():
            if self.stop_at_boundary():return 4
            if not self.ensure_headroom(at_boundary=True):
                if self.stop_at_boundary():return 4
                self.checkpoint('user_stopped');return 1
            if self.stop_at_boundary():return 4
            number=self.state['epoch']+1;curation=self.output/'curation'/f'{number:06d}'
            self.checkpoint('curating_next_epoch',pending_curation=str(curation),next_epoch=number)
            self.backend.curate(curation)
            if self.stopping():self.checkpoint('user_stopped');return 1
            if self.stop_at_boundary():return 4
            destination=Path(self.c['successor_root'])/(DESTINATION_PREFIX+f'{number:04d}')
            self.checkpoint('migrating_closed_epoch',pending_successor=str(destination))
            migrated=self.backend.migrate(current,destination,curation)
            need(Path(migrated['study']).resolve()==destination.resolve(),'migration returned another study')
            if self.stop_at_boundary():
                self.checkpoint('operator_transition_boundary',prepared_successor=str(destination),
                    prepared_migration_provenance=migrated['provenance_path']);return 4
            current=destination
            self.checkpoint('successor_ready',current_study=str(current),epoch=number,bootstrap_pending=False,
                migration_provenance=migrated['provenance_path'],pending_curation=None,pending_successor=None)
            need(self.backend.protocol(current)['validation_seconds']==1800,'future successor validation differs')
            if not self.continue_until_boundary(current,False,0):self.checkpoint('user_stopped');return 1
            if self.state['root_proved']:return 0
        self.checkpoint('user_stopped');return 1


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
    a=p.parse_args();qualified=configuration(public_json(a.config),initial=False,native_checks=False)
    need(a.output.is_absolute() and a.output.resolve()==a.output and a.output.is_relative_to(ROOT) and not a.output.exists(),'fresh canonical output required')
    a.output.mkdir(parents=True)
    import fcntl
    with (a.output/'owner.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        keeper=subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        owner=Owner(qualified,a.output)
        try:return owner.run()
        except WaitingStopped:owner.checkpoint('user_stopped');return 1
        except Refuted as exc:owner.checkpoint('conjecture_refuted',root_proved=False,verified_refutation=exc.verdict);return 3
        except (RuntimeError,OSError,ValueError,KeyError,TypeError) as exc:owner.checkpoint('needs_reconciliation',error_class=type(exc).__name__);return 2
        finally:
            if keeper.poll() is None:keeper.terminate()
            try:keeper.wait(timeout=5)
            except subprocess.TimeoutExpired:keeper.kill();keeper.wait(timeout=5)

if __name__=='__main__':
    def stop(*_):C.P.S.O.B.STOPPING=True
    signal.signal(signal.SIGINT,stop);signal.signal(signal.SIGTERM,stop)
    raise SystemExit(main())
