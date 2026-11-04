"""INACTIVE paid-curation adoption: migrate once, then continue the same goal.

The completed original research, finalizer and curator are never replayed.
No native source, receipt, budget, proof, guard or old operator is modified.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import signal
import subprocess
import time

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
PREDECESSOR=HERE.parent/'continuation-resume/owner.py'
PREDECESSOR_SHA='b51078f839b9771c808a94c8725c857741212165687192fd414653d981c63fd1'
PREDECESSOR_CONFIG_SHA='1767730dc301f69789dea589e2bd92acbd4ac442024773a43fa39c38e4e836b5'
SETTLEMENT_SHA='b098f844d014783d6d8fc33f895536a6e8745043bc5e7482b22208cd2a5d2dd8'
SCHEMA='math-gkm.gaussian-paid-curation-owner.v1'
CURRENT_SCHEMA='math-gkm.gaussian-paid-curation-current.v1'
HANDOFF_SCHEMA='math-gkm.gaussian-paid-curation-handoff.v1'
RETIREMENT_SCHEMA='math-gkm.closed-neutral-failure-retirement.v1'

def load(path,name,pin=None):
    path=Path(path)
    if pin is not None and hashlib.sha256(path.read_bytes()).hexdigest()!=pin:raise RuntimeError('pinned source changed')
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

S=load(PREDECESSOR,'paid_curation_pinned_predecessor',PREDECESSOR_SHA)
S.need(S.sha(HERE.parent/'continuation-resume/settlement.py')==SETTLEMENT_SHA,'published settlement source changed')
Hold=S.Hold;Refuted=S.Refuted;need=S.need;sha=S.sha;digest=S.digest;raw=S.raw;write=S.write;public_json=S.public_json;projection=S.projection
successor_prompt=S.successor_prompt;PYTHON=S.PYTHON;DESTINATION_PREFIX=S.DESTINATION_PREFIX;BOUNDARY_STOP_SCHEMA=S.BOUNDARY_STOP_SCHEMA


def reference(row):
    need(isinstance(row,dict) and set(row)=={'path','sha256'},'typed immutable public reference required')
    path=Path(row['path']);need(path.is_absolute() and path.resolve()==path and path.is_relative_to(ROOT) and sha(path)==row['sha256'],
        'pinned adoption source or artifact changed')
    return path


def selected(path,names):return projection().select(projection().fields(raw(path)),names)


def retained_curation(c,h):
    """Authenticate the completed paid result; task and payload tokens stay opaque."""
    row=h['curation'];directory=Path(row['directory']);e=projection()
    expected={'provenance':'provenance.json','receipt':'job/receipt.json','suite':'suite.json','spec':'job/spec.json',
        'request':'job/request.json','prompt':'job/prompt.txt','watchdog_launch':'watchdog-launch.json'}
    for key,name in expected.items():need(reference(row[key])==directory/name,'retained curator artifact escaped its paid origin')
    need(reference(row['context'])==directory.with_name(directory.name+'.context.json'),'curation chronology record differs')
    provenance=e.select(e.fields(raw(directory/'provenance.json')),('role','receipt','receipt_sha256','suite_sha256','model','reasoning_effort','transport','task_limits','layout'))
    receipt_fields=e.fields(raw(directory/'job/receipt.json'))
    receipt=e.select(receipt_fields,('role','request_id','outcome','model','reasoning_effort','elapsed_seconds','returncode','mathematical_resolution'))
    spec=e.select(e.fields(raw(directory/'job/spec.json')),('role','request_id','model','reasoning_effort','transport','readonly','seconds','workspace'))
    request=e.select(e.fields(raw(directory/'job/request.json')),('role','request_id','task_limits','layout'))
    suite=raw(directory/'suite.json');payload=e.fields(receipt_fields.get('payload',b'{}'))
    need(provenance.get('role')=='independent_pretrial_selector' and provenance.get('receipt')==str(directory/'job/receipt.json') and
         provenance.get('receipt_sha256')==row['receipt']['sha256'] and
         provenance.get('suite_sha256')==hashlib.sha256(suite).hexdigest() and payload.get('suite')==suite,
         'paid curation receipt/provenance/suite no longer agree')
    need(receipt.get('role')==spec.get('role')==request.get('role')=='curator' and
         receipt.get('request_id')==spec.get('request_id')==request.get('request_id')=='independent-curation' and
         receipt.get('outcome')=='completed' and type(receipt.get('returncode')) is int and receipt['returncode']==0 and
         receipt.get('mathematical_resolution') is False and spec.get('readonly') is True and
         spec.get('seconds')==1800 and spec.get('workspace')==str(directory/'workspace') and
         spec.get('transport')==provenance.get('transport')=='live' and
         receipt.get('model')==spec.get('model')==provenance.get('model')=='gpt-6.1-sol' and
         receipt.get('reasoning_effort')==spec.get('reasoning_effort')==provenance.get('reasoning_effort')=='high' and
         type(receipt.get('elapsed_seconds')) in (int,float) and 0<=receipt['elapsed_seconds']<=1800 and
         request.get('task_limits')==provenance.get('task_limits')=={'holdout':12,'regression':1} and
         request.get('layout')==provenance.get('layout')=={'method':8,'assessment':2,'final':2},
         'paid curator identity, readonly budget or completed disposition differs')
    for path in (directory/'seed/contract.json',directory/'workspace/contract.json'):
        need(hashlib.sha256(raw(path)).hexdigest()==c['contract_sha256'],'curator used a different clean goal')
    launch=selected(directory/'watchdog-launch.json',('returncode','termination','operationally_incomplete'))
    need(type(launch.get('returncode')) is int and launch['returncode']==0 and launch.get('termination') is None and launch.get('operationally_incomplete') is False,
         'paid curation watchdog has not completed cleanly')
    context=selected(reference(row['context']),('schema','owner_source_sha256','acquired_method_inputs_supplied','input_separation_only','statistical_independence_claimed'))
    need(context.get('schema')=='math-gkm.successor-curation-context.v1' and context.get('owner_source_sha256')==PREDECESSOR_SHA and
         context.get('acquired_method_inputs_supplied') is False and context.get('input_separation_only') is True and
         context.get('statistical_independence_claimed') is False,'paid curator chronology/source binding differs')
    return directory


def retired_neutral_failure(c,h):
    record=public_json(reference(h['retirement']));archive=Path(record['archived_destination'])
    need(record.get('schema')==RETIREMENT_SCHEMA and record.get('original_destination')==h['next_destination'] and
         record.get('neutral_only') is True and record.get('model_calls')==0 and
         archive.is_absolute() and archive.resolve()==archive and archive.is_relative_to(ROOT) and
         archive!=Path(h['next_destination']) and {x.name for x in archive.iterdir()}=={'deployment-preflight'},
         'failed successor is not preserved as an isolated neutral-only attempt')
    files={}
    for base,dirs,names in os.walk(archive,followlinks=False):
        need(not any((Path(base)/name).is_symlink() for name in dirs),'neutral archive directory alias')
        for name in names:
            p=Path(base)/name;need(not p.is_symlink(),'neutral archive file alias');files[str(p.relative_to(archive))]=sha(p)
            need(len(files)<=100,'failed neutral-preflight archive bound exceeded')
    need(files==record.get('files'),'failed neutral-preflight evidence changed')
    result_path=reference(record['result']);receipt_path=reference(record['receipt'])
    need(result_path==archive/'deployment-preflight/result.json' and receipt_path==archive/'deployment-preflight/receipt.json',
         'neutral failure artifact references escaped')
    report=selected(result_path,('schema','ready','neutral','hosted_model_calls','failure'))
    receipt=selected(receipt_path,('ready','result_sha256'))
    need(report.get('schema')=='math-gkm.deployment-preflight.v1' and report.get('ready') is False and
         report.get('neutral') is True and report.get('hosted_model_calls')==0 and receipt.get('ready') is False and
         receipt.get('result_sha256')==sha(result_path),'preserved deployment attempt is not the actual failed neutral report')
    return record


def verify_adoption(c,*,initial=False,native_checks=True):
    h=public_json(reference(c['adoption_handoff']));parent=Path(c['parent_study'])
    need(h.get('schema')==HANDOFF_SCHEMA and h.get('study')==str(parent) and h.get('arm')=='exploration' and
         h.get('contract_sha256')==c['contract_sha256']==S.CONTRACT_SHA and
         h.get('implementation_sha256')==c['implementation_sha256'] and
         h.get('predecessor_owner')=={'path':str(PREDECESSOR),'sha256':PREDECESSOR_SHA} and
         h.get('predecessor_config')==c['adoption_predecessor_config'] and
         h.get('paid_curation_replay_authorized') is False and h.get('original_research_replay_authorized') is False,
         'paid-curation handoff belongs to another source, goal or replay disposition')
    owner_exit=h.get('owner_exit',{})
    need(owner_exit.get('actual_numeric_exit_observed') is True and owner_exit.get('returncode')==2 and
         isinstance(owner_exit.get('owned_tool_handle'),str) and bool(owner_exit['owned_tool_handle']) and
         isinstance(owner_exit.get('completion_reference'),str) and bool(owner_exit['completion_reference']),
         'actual closed predecessor owner observation missing')
    checkpoint=public_json(reference(h['checkpoint']));old_output=Path(h['predecessor_output'])
    need(reference(h['checkpoint'])==old_output/'OWNER_CHECKPOINT.json' and checkpoint.get('phase')=='needs_reconciliation' and
         checkpoint.get('current_study')==str(parent) and checkpoint.get('pending_curation')==h['curation']['directory'] and
         checkpoint.get('pending_successor')==h['next_destination'] and checkpoint.get('epoch')==0 and checkpoint.get('root_proved') is False,
         'closed predecessor checkpoint does not name this paid pending migration')
    commands=h.get('commands',[]);need(len(commands)==3,'all three completed native/finalizer/curator commands required')
    for index,(row,kind) in enumerate(zip(commands,('research','finalization','curation'))):
        intent=public_json(reference(row['intent']));exit_record=public_json(reference(row['exit']))
        directory=old_output/'commands'/f'{index:06d}'
        need(reference(row['intent'])==directory/'INTENT.json' and reference(row['exit'])==directory/'EXIT.json' and
             reference(row['log'])==directory/'private.log' and intent.get('kind')==kind and
             exit_record.get('actual_numeric_exit_observed') is True and exit_record.get('owned_handle') is True and
             type(exit_record.get('returncode')) is int and exit_record['returncode']==0 and
             exit_record.get('log_sha256')==row['log']['sha256'],'paid predecessor command did not actually close successfully')
        need(intent.get('study')==(h['curation']['directory'] if kind=='curation' else str(parent)),
             'completed command belongs to another parent or curation')
    curator_argv=public_json(reference(commands[2]['intent']))['argv']
    need(curator_argv[-4:]==[h['curation']['directory'],c['contract_path'],str(PREDECESSOR),PREDECESSOR_SHA],
         'paid curator ran with a different goal or operator source')
    need(reference(h['seal'])==parent/'seal.json' and reference(h['protocol'])==parent/'protocol.json',
         'closed parent seal/protocol binding differs')
    states=h.get('parent_states',{});need(set(states)=={'baseline','exploration'},'both current closed-parent states required')
    for mode,row in states.items():
        need(row['current'].get('path')==str(parent/'arms'/mode/'state.json') and row['archive'].get('sha256')==row['current'].get('sha256'),
             'closed state/archive identity differs')
        observation=S.state_observation(reference(row['archive']))
        need(all(observation[x+'_is_null'] for x in ('active','active_intent','resolution')) and
             observation.get('phase')=='research' and observation.get('status')=='finite_budget_finished; root_open',
             'paid-curation handoff parent is not fully closed')
        if initial:reference(row['current'])
    old_outer=public_json(reference(c['adoption_predecessor_config']))
    old=S.configuration(old_outer,initial=False,native_checks=native_checks)
    transition=S.verify_handoff(old,initial=False,native_checks=native_checks)
    rows=S.public_study(parent,old,transition);end=selected(reference(h['protocol']),('rounds',)).get('rounds')
    need(all(row.get('all_jobs_settled') is True and row.get('active_is_null') is True and
             row.get('active_intent_is_null') is True and row.get('round')==end and
             row.get('phase')=='research' and row.get('status')=='finite_budget_finished; root_open'
             for row in rows.values()) and set(rows)=={'baseline','exploration'},
         'adopted original parent has an unsettled role or unfinished boundary')
    curation=retained_curation(c,h);retired_neutral_failure(c,h)
    destination=Path(h['next_destination'])
    need(destination==Path(c['successor_root'])/(DESTINATION_PREFIX+'0001'),'adopted first successor identity differs')
    if initial:need(not destination.exists() and not destination.is_symlink(),'adopted migration still needs a genuinely fresh destination')
    return {**transition,'curation':str(curation),'next_destination':str(destination),
        'adoption_handoff_sha256':c['adoption_handoff']['sha256']}


def configuration(outer,*,initial=False,native_checks=True):
    need(isinstance(outer,dict) and set(outer)=={'schema','predecessor_config','handoff','owner_source_sha256'} and
         outer.get('schema')==SCHEMA and sha(__file__)==outer.get('owner_source_sha256'),'paid-adoption owner configuration/source differs')
    need(outer['predecessor_config'].get('sha256')==PREDECESSOR_CONFIG_SHA,'exact closed predecessor config required')
    old=S.configuration(public_json(reference(outer['predecessor_config'])),initial=False,native_checks=native_checks)
    c={**old,'owner_source_sha256':outer['owner_source_sha256'],'adoption_predecessor_config':outer['predecessor_config'],'adoption_handoff':outer['handoff']}
    verify_adoption(c,initial=initial,native_checks=native_checks);return c


class Native(S.Native):
    def __init__(self,c,output):
        super().__init__(c,output);self.adoption_admitted=False;self.adoption_transition=None
    def transition(self):
        result=verify_adoption(self.c,initial=not self.adoption_admitted)
        self.adoption_admitted=True;self.adoption_transition=result;self.resume_admitted=True;self.resume_transition=result
        self.initial_revision_checked=True;self.grant_reference=result['grant'];self.transition_admitted=True;return result
    def check_inputs(self):
        outer={'schema':SCHEMA,'predecessor_config':self.c['adoption_predecessor_config'],'handoff':self.c['adoption_handoff'],
               'owner_source_sha256':self.c['owner_source_sha256']}
        need(configuration(outer,initial=not self.adoption_admitted)==self.c,'derived paid-adoption settings changed')
        if not self.adoption_admitted:self.transition()
    def public(self,study):
        if self.adoption_transition is None:self.transition()
        return S.public_study(study,self.c,self.adoption_transition)
    def command(self,kind,argv,study):
        if kind=='curation':
            need(argv[-2]==str(S.PREDECESSOR) and argv[-1]==self.c['owner_source_sha256'],'inherited curator source interface changed')
            argv=[*argv[:-2],str(Path(__file__).resolve()),argv[-1]]
        # Same qualified owned process implementation, avoiding two older
        # chronology-source adapters. Dynamic check_inputs is THIS override.
        return S.O.B.Native.command(self,kind,argv,study)


class Owner(S.Owner):
    def __init__(self,c,output,backend=None):
        super().__init__(c,output,backend or Native(c,output));self.state.update(schema=SCHEMA,migration_first=True)
    def checkpoint(self,phase,**values):
        self.state.update(phase=phase,updated_at=time.time(),**values);write(self.output/'OWNER_CHECKPOINT.json',self.state)
        keys=('phase','current_study','parent_study','original_comparison_study','epoch','root_proved','updated_at','migration_first','scientific_status')
        pointer={key:self.state.get(key) for key in keys}
        pointer.update(schema=CURRENT_SCHEMA,owner_source_sha256=self.c['owner_source_sha256'],contract_sha256=self.c['contract_sha256'],
            profile_sha256=self.c['profile_sha256'],revision_finished_sha256=self.c['revision_finished']['sha256'],
            adoption_handoff_sha256=self.c['adoption_handoff']['sha256'])
        write(self.output/'CURRENT.json',pointer)
    def run(self):
        self.output.mkdir(parents=True,exist_ok=True)
        need(not (self.output/'OWNER_CHECKPOINT.json').exists(),'existing adoption checkpoint needs explicit reconciliation')
        self.checkpoint('verifying_paid_curation_handoff');transition=self.backend.transition()
        current=Path(self.c['parent_study']);self.backend.verify(current);self.ensure_baseline_closed(current)
        proof=self.backend.proof(current,('baseline','exploration'))
        if proof is not None:self.record_exact_proof(proof);return 0
        curation=Path(transition['curation']);number=1
        while not self.stopping():
            if self.stop_at_boundary():return 4
            if not self.ensure_headroom(at_boundary=True):
                if self.stop_at_boundary():return 4
                self.checkpoint('user_stopped');return 1
            destination=Path(self.c['successor_root'])/(DESTINATION_PREFIX+f'{number:04d}')
            if number==1:need(destination==Path(transition['next_destination']),'paid adoption changed its first destination')
            self.checkpoint('migrating_closed_epoch',pending_curation=str(curation),pending_successor=str(destination),next_epoch=number)
            migrated=self.backend.migrate(current,destination,curation)
            need(Path(migrated['study']).resolve()==destination.resolve(),'migration returned another study')
            if self.stop_at_boundary():
                self.checkpoint('operator_transition_boundary',prepared_successor=str(destination),prepared_migration_provenance=migrated['provenance_path']);return 4
            current=destination
            self.checkpoint('successor_ready',current_study=str(current),epoch=number,bootstrap_pending=False,
                migration_provenance=migrated['provenance_path'],pending_curation=None,pending_successor=None)
            need(self.backend.protocol(current)['validation_seconds']==1800,'funded successor validation differs')
            if not self.continue_until_boundary(current,False,0):self.checkpoint('user_stopped');return 1
            if self.state['root_proved']:return 0
            if self.stop_at_boundary():return 4
            if not self.ensure_headroom(at_boundary=True):
                if self.stop_at_boundary():return 4
                self.checkpoint('user_stopped');return 1
            number+=1;curation=self.output/'curation'/f'{number:06d}'
            self.checkpoint('curating_next_epoch',pending_curation=str(curation),next_epoch=number)
            self.backend.curate(curation)
        self.checkpoint('user_stopped');return 1


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
    a=p.parse_args();c=configuration(public_json(a.config),initial=True);need(a.output.resolve().is_relative_to(ROOT),'fresh adoption output escaped')
    import fcntl
    a.output.mkdir(parents=True,exist_ok=True)
    with (a.output/'owner.lock').open('a') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        if (a.output/'OWNER_CHECKPOINT.json').exists():return 2
        keeper=subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        owner=Owner(c,a.output)
        try:return owner.run()
        except Refuted as exc:owner.checkpoint('conjecture_refuted',root_proved=False,verified_refutation=exc.verdict);return 3
        except (RuntimeError,OSError,ValueError,KeyError,TypeError) as exc:
            owner.checkpoint('needs_reconciliation',error_class=type(exc).__name__);return 2
        finally:
            if keeper.poll() is None:keeper.terminate()
            try:keeper.wait(timeout=5)
            except subprocess.TimeoutExpired:keeper.kill();keeper.wait(timeout=5)

if __name__=='__main__':
    def stop(*_):S.O.B.STOPPING=True
    signal.signal(signal.SIGINT,stop);signal.signal(signal.SIGTERM,stop)
    raise SystemExit(main())
