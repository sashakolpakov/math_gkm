"""INACTIVE revision-aware Gaussian continuation, operations only.

The pinned predecessor supplies unchanged proof, compiler/resource, finalizer and
owned-process machinery. This layer resumes only the interrupted exploration
arm, preserves its historical 600-second contract, then funds 1800-second own-
history successors. It supplies no mathematical proposals or strategic advice.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
BASE_PATH=ROOT/'.bootstrap/method-learning-gaussian-20261103/continuation-1800/owner.py'
BASE_SHA='a2f6d754d1dce6e64b29b8199e93dc2a7d4b2b1b59f67298cbfe3fdeb9f11687'
def load(path,name,pin=None):
    path=Path(path)
    if pin is not None and hashlib.sha256(path.read_bytes()).hexdigest()!=pin:raise RuntimeError('pinned operational source changed')
    spec=importlib.util.spec_from_file_location(name,path);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module
B=load(BASE_PATH,'gaussian_revision_predecessor_owner',BASE_SHA)
H=load(HERE/'history.py','gaussian_revision_history')
Hold=B.Hold;Refuted=B.Refuted
sha=B.sha;digest=B.digest;write=B.write;raw=B.raw;public_json=B.public_json
projection=B.projection;successor_prompt=B.successor_prompt
SCHEMA='math-gkm.gaussian-revision-owner.v1'
CURRENT_SCHEMA='math-gkm.gaussian-revision-current.v1'
BOUNDARY_STOP_SCHEMA=B.BOUNDARY_STOP_SCHEMA
DESTINATION_PREFIX='method-learning-gaussian-20261103-revision-epoch-'
PYTHON=B.PYTHON


def need(value,message):
    if not value:raise Hold(message)

def reference(value):
    need(isinstance(value,dict) and set(value)=={'path','sha256'},'typed public reference required')
    path=Path(value['path'])
    need(path.is_absolute() and path.resolve().is_relative_to(ROOT) and not path.is_symlink() and sha(path)==value['sha256'],
         'public source/evidence reference changed')
    return path


def verify_revision(c,*,initial=False,native_checks=True):
    """Authenticate immutable revision history; mutable state equality only once."""
    revision=load(reference(c['revision_source']),'gaussian_source_revision')
    config_path=reference(c['revision_config']);finished_path=reference(c['revision_finished'])
    rc=revision.load_config(config_path,c['revision_config']['sha256'])
    finished=public_json(finished_path)
    need(finished.get('schema')==revision.SCHEMA and finished.get('phase')=='finalized_not_launched' and
         finished.get('config_sha256')==c['revision_config']['sha256'] and
         finished.get('implementation_sha256')==c['implementation_sha256']==digest(rc['implementation']) and
         finished.get('scientific_status')=='revised_source_history_no_causal_learning_claim' and
         all(finished.get(x)==0 for x in ('research_launches','compiler_launches','model_launches')) and
         rc['study']==c['parent_study'] and rc['arm']=='exploration','closed revised-source transaction differs')
    g=H.grant(finished['grant']);core=g['revision_core']
    need(core.get('implementation')==rc['implementation'] and core.get('old_implementation')==rc['old_implementation'] and
         core.get('new_deployment') and core.get('scientific_status')==finished['scientific_status'] and
         core.get('old_verification')==finished.get('proof_reuse_verification') and
         core.get('old_verification',{}).get('contract_sha256')==c['contract_sha256'],
         'closed revision core or old proof reuse changed')
    original=Path(c['parent_study']);e=projection();seal_fields=e.fields(raw(original/'seal.json'))
    selected=e.select(seal_fields,('implementation','source_revision','deployment_preflight'))
    need(selected.get('implementation')==rc['implementation'] and
         selected.get('source_revision')=={'record':finished['grant']['path'],'binding':g['revision_binding'],'old_seal_sha256':g['old_seal_sha256']} and
         selected.get('deployment_preflight')==core['new_deployment'],'current original seal loses explicit source history')
    # These are historical source/authority/state pins, not a permanent demand
    # that admitted theory and accounting remain frozen after normal research.
    for name,expected in finished.get('after_files',{}).items():
        path=Path(name)
        if path.is_relative_to(ROOT/'machinery') or initial:
            need(sha(path)==expected,'qualified revision input changed before first paid continuation')
    if native_checks:
        sys.path.insert(0,str(ROOT))
        from machinery.study_common import implementation,read,authorize_live
        from machinery.study_context import validate_prelaunch_evidence
        from machinery.study_deployment import reuse_deployment
        need(digest(implementation())==c['implementation_sha256'],'native source changed after explicit revision')
        observation=public_json(reference(g['prelaunch_observation']))
        expected_evidence={'observation_sha256':g['prelaunch_observation']['sha256'],
            'old_study_source_sha256':observation['old_study_source']['sha256'],
            'trace_sha256':observation['trace']['sha256']}
        need(validate_prelaunch_evidence(g)==expected_evidence,'source-bound before-launch evidence invalid')
        reuse_deployment(core['new_deployment'])
        authorize_live(read(c['contract_path']))
    return {'parent_study':str(original),'original_comparison_study':str(original),
            'actual_numeric_exit_observed':True,'revision_finished_sha256':c['revision_finished']['sha256'],
            'grant':finished['grant'],'scientific_status':finished['scientific_status']}


def public_study(study,grant_reference):
    result=B.public_study(study);e=projection()
    for mode,row in result.items():row.update(H.settlement(Path(study),mode,grant_reference,e))
    return result


class Native(B.Native):
    def __init__(self,config,output):
        super().__init__(config,output);self.initial_revision_checked=False;self.grant_reference=None
    def transition(self):
        value=verify_revision(self.c,initial=not self.initial_revision_checked)
        self.initial_revision_checked=True;self.grant_reference=value['grant'];self.transition_admitted=True
        return value
    def check_inputs(self):
        need(sha(__file__)==self.c['owner_source_sha256'],'revised owner source changed')
        for name in ('history_source','base_owner','epoch_source','finalization_source','funding_source','revision_source','revision_config','revision_finished'):
            reference(self.c[name])
        need(self.c['base_owner']=={'path':str(BASE_PATH),'sha256':BASE_SHA},'predecessor operational implementation changed')
        need(sha(self.c['profile_path'])==self.c['profile_sha256'],'successor profile changed')
        B.qualify_funding(self.c)
        if not self.initial_revision_checked:self.transition()
        else:verify_revision(self.c,initial=False)
    def public(self,study):
        if self.grant_reference is None:self.transition()
        return public_study(study,self.grant_reference)
    def curate(self,directory):
        # The chronology adapter is unchanged; bind it to THIS explicit owner
        # rather than presenting a predecessor hash as the executing source.
        code='''from pathlib import Path
from machinery.study_common import read,canonical,write,sha
from machinery import study_curate
import sys,hashlib,importlib.util
source=Path(sys.argv[3]);assert sha(source)==sys.argv[4]
spec=importlib.util.spec_from_file_location('qualified_revision_owner',source)
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
original=study_curate.PROMPT;effective=module.successor_prompt(original)
write(Path(sys.argv[1]).with_name(Path(sys.argv[1]).name+'.context.json'),
 {'schema':'math-gkm.successor-curation-context.v1',
 'chronology':'after prior acquisition, before next funded epoch and application tests',
 'acquired_method_inputs_supplied':False,'input_separation_only':True,
 'statistical_independence_claimed':False,'owner_source_sha256':sha(source),
 'original_prompt_sha256':hashlib.sha256(original.encode()).hexdigest(),
 'effective_prompt_sha256':hashlib.sha256(effective.encode()).hexdigest()})
study_curate.PROMPT=effective
print(canonical(study_curate.curate(Path(sys.argv[1]),'live',1800,read(Path(sys.argv[2])),
 model='gpt-6.1-sol',task_limits={'holdout':12,'regression':1},
 layout={'method':8,'assessment':2,'final':2})))'''
        self.transition()
        code=self.command('curation',[PYTHON,'-c',code,str(directory),self.c['contract_path'],
            str(Path(__file__).resolve()),self.c['owner_source_sha256']],directory)
        need(code==0 and (Path(directory)/'provenance.json').is_file(),'curator did not publish a valid new panel')
        return Path(directory)


class Owner(B.Owner):
    def __init__(self,config,output,backend=None):
        self.c=config;self.output=Path(output);self.backend=backend or Native(config,output)
        self.state={'schema':SCHEMA,'phase':'verifying_source_revision','current_study':config['parent_study'],
            'parent_study':config['parent_study'],'original_comparison_study':config['parent_study'],
            'epoch':0,'root_proved':False,'original_comparison_preserved':True,
            'migration_first':False,'bootstrap_pending':False,
            'scientific_status':'revised_source_history_no_causal_learning_claim'}
        if isinstance(self.backend,Native):
            self.backend.heartbeat=lambda:self.checkpoint(self.state['phase'])
            self.backend.owner_stopping=self.stopping
    def checkpoint(self,phase,**values):
        self.state.update(phase=phase,updated_at=time.time(),**values)
        write(self.output/'OWNER_CHECKPOINT.json',self.state)
        keys=('phase','current_study','parent_study','original_comparison_study','epoch','root_proved','updated_at','migration_first','scientific_status')
        pointer={k:self.state.get(k) for k in keys}
        pointer.update(schema=CURRENT_SCHEMA,owner_source_sha256=self.c['owner_source_sha256'],
            contract_sha256=self.c['contract_sha256'],profile_sha256=self.c['profile_sha256'],
            revision_finished_sha256=self.c['revision_finished']['sha256'])
        write(self.output/'CURRENT.json',pointer)
    def ensure_baseline_closed(self,study):
        row=self.backend.public(study)['baseline'];end=self.backend.protocol(study)['rounds']
        need(row['all_jobs_settled'] and row['active_is_null'] and row['active_intent_is_null'] and
             row['round']==end and row['phase']=='research' and row['status']=='finite_budget_finished; root_open',
             'historical baseline is not closed; never rerun it')
    def continue_until_boundary(self,study,both=False,code=0,*,audit_both=False):
        need(both is False,'only exploration may receive continued research')
        recovered=set();attempts=set();modes=('exploration',)
        while not self.stopping():
            public=self.backend.public(study)
            need(all(public[m]['all_jobs_settled'] for m in modes),'unknown job uncertainty; no replay or PID adoption')
            if not self.ensure_headroom():return False
            if any(not public[m]['active_is_null'] or not public[m]['active_intent_is_null'] for m in modes):
                binding=tuple(public[m]['state_file_sha256'] for m in modes)
                need(binding not in recovered,'closed receipts failed native reconciliation');recovered.add(binding)
                self.checkpoint('recovering_closed_receipts')
                need(self.backend.recover(study)==0,'native receipt recovery refused')
                public=self.backend.public(study)
                need(all(public[m]['active_is_null'] and public[m]['active_intent_is_null'] for m in modes),
                     'native receipt recovery left active intent')
            self.backend.verify(study)
            proof_modes=('baseline','exploration') if audit_both else modes
            proof=self.backend.proof(study,proof_modes);end=self.backend.protocol(study)['rounds']
            finite=all(public[m]['round']==end and public[m]['phase']=='research' and
                public[m]['status']=='finite_budget_finished; root_open' for m in modes)
            if proof is None and finite:
                if audit_both:self.ensure_baseline_closed(study)
                more=True
                while more and not self.stopping():
                    self.checkpoint('finalizing_closed_candidate')
                    need(self.backend.finalize(study,audit_both)==0,'independent finalizer incomplete; no speculative replay')
                    self.backend.verify(study);proof=self.backend.proof(study,proof_modes)
                    if proof is not None:break
                    more=self.backend.finalization_pending(study)
            if proof is not None:self.record_exact_proof(proof);return True
            if self.stopping():return False
            if finite:self.checkpoint('epoch_closed_root_open');return True
            need(all(public[m]['status']!='operationally_blocked' for m in modes),'native operational block requires reconciliation')
            progress=tuple((public[m]['round'],public[m]['phase'],public[m]['calls']) for m in modes)
            need(progress not in attempts,'native command closed without forward movement');attempts.add(progress)
            self.checkpoint('research_running');code=self.backend.run(study,False)
        return False
    def run(self):
        self.output.mkdir(parents=True,exist_ok=True)
        need(not (self.output/'OWNER_CHECKPOINT.json').exists(),'existing owner checkpoint needs explicit reconciliation')
        self.checkpoint('verifying_source_revision');transition=self.backend.transition()
        need(transition.get('actual_numeric_exit_observed') is True and
             transition.get('parent_study')==self.c['parent_study'] and
             transition.get('scientific_status')=='revised_source_history_no_causal_learning_claim',
             'bootstrap lacks actual closed source-revision provenance')
        current=Path(self.c['parent_study']);self.backend.verify(current);self.ensure_baseline_closed(current)
        need(self.backend.protocol(current)['validation_seconds']==600,'interrupted original profile must retain validation600')
        self.checkpoint('resuming_original_exploration')
        if not self.continue_until_boundary(current,False,0,audit_both=True):
            self.checkpoint('user_stopped');return 1
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
            need(self.backend.protocol(current)['validation_seconds']==1800,'successor validation profile differs')
            if not self.continue_until_boundary(current,False,0):self.checkpoint('user_stopped');return 1
            if self.state['root_proved']:return 0
        self.checkpoint('user_stopped');return 1


def validate_config(c):
    required={'schema','parent_study','implementation_sha256','contract_path','contract_sha256',
        'profile_path','profile_sha256','owner_source_sha256','base_owner','history_source',
        'epoch_source','finalization_source','funding_source','revision_source','revision_config',
        'revision_finished','successor_root'}
    need(isinstance(c,dict) and set(c)==required and c.get('schema')==SCHEMA,'revision owner configuration differs')
    need(sha(__file__)==c['owner_source_sha256'] and sha(c['profile_path'])==c['profile_sha256'],'owner/profile changed')
    for key in required & {'base_owner','history_source','epoch_source','finalization_source','funding_source','revision_source','revision_config','revision_finished'}:reference(c[key])
    need(c['base_owner']=={'path':str(BASE_PATH),'sha256':BASE_SHA} and Path(c['history_source']['path'])==HERE/'history.py',
         'candidate source composition differs')
    for name in ('parent_study','contract_path','profile_path','successor_root'):
        path=Path(c[name]);need(path.is_absolute() and path.resolve().is_relative_to(ROOT),'configured path escaped repository')
    B.qualify_funding(c);verify_revision(c,initial=True);return c


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
    a=p.parse_args();c=validate_config(public_json(a.config));need(a.output.resolve().is_relative_to(ROOT),'output escaped workspace')
    import fcntl
    a.output.mkdir(parents=True,exist_ok=True)
    with (a.output/'owner.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        if (a.output/'OWNER_CHECKPOINT.json').exists():return 2
        keeper=subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        owner=Owner(c,a.output)
        try:return owner.run()
        except Refuted as exc:owner.checkpoint('conjecture_refuted',verified_refutation=exc.verdict,root_proved=False);return 3
        except (RuntimeError,OSError,ValueError,KeyError,TypeError) as exc:
            owner.checkpoint('needs_reconciliation',error_class=type(exc).__name__);return 2
        finally:
            if keeper.poll() is None:keeper.terminate()
            try:keeper.wait(timeout=5)
            except subprocess.TimeoutExpired:keeper.kill();keeper.wait(timeout=5)

if __name__=='__main__':
    def stop(*_):B.STOPPING=True
    signal.signal(signal.SIGINT,stop);signal.signal(signal.SIGTERM,stop)
    raise SystemExit(main())
