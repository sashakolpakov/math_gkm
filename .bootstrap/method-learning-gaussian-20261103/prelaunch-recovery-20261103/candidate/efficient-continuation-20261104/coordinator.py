"""INACTIVE efficient continuation; ROOT alone qualifies and launches it."""
import argparse
import hashlib
import importlib.util
import os
from pathlib import Path
import signal
import subprocess
import time

ROOT=Path('/Users/sasha/math_gkm');HERE=Path(__file__).resolve().parent
ADMISSION_SHA='f177376aff988170928b5b063607d3f607b50c521943f89c75acf939f086a67f'
if hashlib.sha256((HERE/'admission.py').read_bytes()).hexdigest()!=ADMISSION_SHA:raise RuntimeError('admission source changed')
spec=importlib.util.spec_from_file_location('qualified_efficient_admission',HERE/'admission.py')
A=importlib.util.module_from_spec(spec);spec.loader.exec_module(A)
O=A.O;need=O.need;sha=O.sha;write=O.write;public_json=O.public_json;reference=O.reference
Hold=O.Hold;Refuted=O.Refuted;WaitingStopped=O.WaitingStopped
SCHEMA=A.SCHEMA;CURRENT_SCHEMA='math-gkm.gaussian-efficient-current.v1'
REGISTRATION_SCHEMA='math-gkm.gaussian-efficient-registration.v1'
DESTINATION_PREFIX=O.DESTINATION_PREFIX


def configuration(binding,*,initial=False,native_checks=True):
    need(binding.get('owner_source')=={'path':str(Path(__file__).resolve()),'sha256':sha(__file__)},'actual coordinator source differs')
    return A.qualify(binding,initial=initial,native_checks=native_checks)


class Native(O.Native):
    def __init__(self,qualified,output):
        super().__init__(qualified['predecessor'],output)
        self.qualified=qualified;self.binding=qualified['binding']
    def safe_inputs(self,operation):
        result=super().safe_inputs(operation)
        if getattr(self,'owner_stopping',lambda:False)():raise WaitingStopped('stopped during pure qualification; no new child')
        return result
    def check_inputs(self):
        def inspect():
            need(configuration(self.binding,initial=False)==self.qualified,'efficient source/history changed before action')
        return self.safe_inputs(inspect)
    def admit(self):
        current=self.safe_inputs(lambda:configuration(self.binding,initial=True))
        need(current==self.qualified,'current closed state differs from actual predecessor handoff')
        self.prime(current['predecessor']['transition'])
        return current['handoff']
    def transition(self):
        # Inherited curation asks for ancestry, not a second deployment admission.
        current=configuration(self.binding,initial=False,native_checks=False)
        need(current==self.qualified,'transition history changed')
        self.prime(current['predecessor']['transition'])
        return current['predecessor']['transition']
    def command(self,kind,argv,study):
        # Only source-binding metadata precedes admission. The unchanged funded
        # command invokes THIS check_inputs exactly once before INTENT/Popen.
        directory=self.output/'coordinator-command-bindings';directory.mkdir(parents=True,exist_ok=True)
        write(directory/f'{self.counter:06d}.json',{'schema':'math-gkm.efficient-owner-command.v1',
            'phase':'binding_only_pre_admission','kind':kind,'study':str(study),'coordinator_source':self.binding['owner_source'],
            'admission_source':self.binding['admission_source'],'research_runtime_source':self.binding['runtime_source'],
            'predecessor_source':self.binding['predecessor_source'],'component_source':self.qualified['predecessor']['binding']['component_source'],
            'handoff':self.binding['handoff'],'owned_component_intent':str(self.output/'commands'/f'{self.counter:06d}'/'INTENT.json')},exclusive=True)
        if kind in ('research','recover'):
            getattr(self,'status_observation',lambda path:None)(str(self.output/'commands'/f'{self.counter:06d}'/'RUNTIME_STATUS.json'))
        return O.C.Native.command(self,kind,argv,study)
    def runtime_command(self,study,operation):
        source=self.binding['runtime_source']
        return self.command('research' if operation=='run' else 'recover',[O.C.PYTHON,source['path'],
            '--study',str(study),'--arm','exploration','--operation',operation,'--source-sha256',source['sha256'],
            '--status-path',str(self.output/'commands'/f'{self.counter:06d}'/'RUNTIME_STATUS.json')],study)
    def run(self,study,both):
        need(both is False,'only exploration may continue');return self.runtime_command(study,'run')
    def recover(self,study):return self.runtime_command(study,'recover')


class Owner(O.Owner):
    def __init__(self,qualified,output,backend=None):
        self.efficient=qualified
        super().__init__(qualified['predecessor'],output,backend or Native(qualified,output))
        self.binding=qualified['binding'];self.qualified=qualified
        h=qualified['handoff']
        self.state.update(schema=SCHEMA,current_study=h['study'],epoch=h['epoch'],migration_first=False,bootstrap_pending=False,
            coordinator_source_sha256=self.binding['owner_source']['sha256'],predecessor_source=self.binding['predecessor_source'],
            research_runtime_source=self.binding['runtime_source'],handoff=self.binding['handoff'],pending_curation=None,pending_successor=None,
            migration_provenance=str(Path(h['study'])/'CONTINUATION_PROVENANCE.json'),runtime_status_path=None)
        self.backend.status_observation=lambda path:self.checkpoint(self.state['phase'],runtime_status_path=path)
    def checkpoint(self,phase,**values):
        if 'current_study' in values and values['current_study']!=self.state.get('current_study'):self.state['runtime_status_path']=None
        self.state.update(phase=phase,updated_at=time.time(),**values);write(self.output/'OWNER_CHECKPOINT.json',self.state)
        keys=('phase','current_study','parent_study','original_comparison_study','epoch','root_proved','updated_at','migration_first','scientific_status','runtime_status_path')
        pointer={k:self.state.get(k) for k in keys}
        pointer.update(schema=CURRENT_SCHEMA,owner_source_sha256=self.binding['owner_source']['sha256'],
            predecessor_source_sha256=self.binding['predecessor_source']['sha256'],component_source_sha256=O.COMPONENT_SHA,
            runtime_source_sha256=self.binding['runtime_source']['sha256'],admission_source_sha256=self.binding['admission_source']['sha256'],
            contract_sha256=self.c['contract_sha256'],profile_sha256=self.c['profile_sha256'],handoff_sha256=self.binding['handoff']['sha256'],
            revision_finished_sha256=self.c['revision_finished']['sha256'],prepared_handoff_sha256=self.c['prepared_handoff']['sha256'])
        write(self.output/'CURRENT.json',pointer)
    def boundary_requested(self):
        path=self.output/'STOP_AFTER_BOUNDARY.json'
        if not path.exists():return False
        value=public_json(path)
        need(value.get('schema')==O.C.BOUNDARY_STOP_SCHEMA and value.get('owner_source_sha256')==self.binding['owner_source']['sha256'] and
             isinstance(value.get('reason'),str) and bool(value['reason'].strip()),'boundary STOP must bind this actual coordinator')
        return True
    def run(self):
        self.output.mkdir(parents=True,exist_ok=True)
        need(not (self.output/'OWNER_CHECKPOINT.json').exists(),'existing coordinator output requires reconciliation')
        self.checkpoint('verifying_exact_closed_handoff');h=self.backend.admit()
        write(self.output/'CONTINUATION_ADOPTION.json',{'schema':'math-gkm.efficient-goal-adoption.v1',
            'coordinator_source':self.binding['owner_source'],'admission_source':self.binding['admission_source'],
            'research_runtime_source':self.binding['runtime_source'],'predecessor_source':self.binding['predecessor_source'],
            'predecessor_config':self.binding['predecessor_config'],'handoff':self.binding['handoff'],
            'study':h['study'],'epoch':h['epoch'],'setup_replayed':False,'counters_reset':False,
            'scientific_status':'revised_source_history_no_causal_learning_claim'},exclusive=True)
        current=Path(h['study']);self.backend.verify(current)
        need(self.backend.protocol(current)['validation_seconds']==1800,'retained successor profile differs')
        self.checkpoint('resuming_exact_closed_state')
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
            need(self.backend.protocol(current)['validation_seconds']==1800,'future successor profile differs')
            if not self.continue_until_boundary(current,False,0):self.checkpoint('user_stopped');return 1
            if self.state['root_proved']:return 0
        self.checkpoint('user_stopped');return 1


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
    a=p.parse_args();q=configuration(public_json(a.config),initial=False,native_checks=False)
    need(a.output.is_absolute() and a.output.resolve()==a.output and a.output.is_relative_to(ROOT) and not a.output.exists(),'fresh canonical output required')
    a.output.mkdir(parents=True)
    import fcntl
    with (a.output/'owner.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        keeper=subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        owner=Owner(q,a.output)
        try:return owner.run()
        except WaitingStopped:owner.checkpoint('user_stopped');return 1
        except Refuted as exc:owner.checkpoint('conjecture_refuted',root_proved=False,verified_refutation=exc.verdict);return 3
        except (RuntimeError,OSError,ValueError,KeyError,TypeError) as exc:owner.checkpoint('needs_reconciliation',error_class=type(exc).__name__);return 2
        finally:
            if keeper.poll() is None:keeper.terminate()
            try:keeper.wait(timeout=5)
            except subprocess.TimeoutExpired:keeper.kill();keeper.wait(timeout=5)

if __name__=='__main__':
    def stop(*_):O.C.P.S.O.B.STOPPING=True
    signal.signal(signal.SIGINT,stop);signal.signal(signal.SIGTERM,stop)
    raise SystemExit(main())
