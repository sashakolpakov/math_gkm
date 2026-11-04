"""INACTIVE explicit closed-owner resume; no native edits or paid replay.

Only the exact recovered state is adopted, once, after actual closed execution
and a source-certified no-launch review disposition. Normal state evolution
thereafter does not have to equal the earlier source-revision transition state.
"""
import argparse
import hashlib
import importlib.util
import os
from pathlib import Path
import signal
import subprocess
import sys

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
PREDECESSOR=HERE.parent/'continuation/owner.py'
PREDECESSOR_SHA='2f47b2a56c667252939ef21fed8d7afee511b807d6066c1ec151599dc2439675'
HISTORY_SHA='1fee76a68a967cda5045d17f806eac6a27d35bed24f1038cbc3d952a96cbe849'
CONTRACT_SHA='a9802e5423169618ba4e9c4e2cac3003e86e6133a441b6f91abdc00f97745e49'
SCHEMA='math-gkm.gaussian-closed-resume-owner.v1'
CURRENT_SCHEMA='math-gkm.gaussian-closed-resume-current.v1'
HANDOFF_SCHEMA='math-gkm.gaussian-closed-owner-handoff.v1'

def load(path,name,pin=None):
    path=Path(path)
    if pin is not None and hashlib.sha256(path.read_bytes()).hexdigest()!=pin:raise RuntimeError('pinned predecessor source changed')
    spec=importlib.util.spec_from_file_location(name,path);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module

O=load(PREDECESSOR,'gaussian_closed_resume_predecessor',PREDECESSOR_SHA)
O.need(O.sha(HERE.parent/'continuation/history.py')==HISTORY_SHA,'published historical settlement source changed')
Hold=O.Hold;Refuted=O.Refuted;need=O.need;sha=O.sha;digest=O.digest;write=O.write;raw=O.raw;public_json=O.public_json
projection=O.projection;reference=O.reference;PYTHON=O.PYTHON
successor_prompt=O.successor_prompt
BOUNDARY_STOP_SCHEMA=O.BOUNDARY_STOP_SCHEMA
DESTINATION_PREFIX=O.DESTINATION_PREFIX


def state_observation(path):
    e=projection();envelope=e.fields(raw(path));body=envelope['state']
    need(e.select(envelope,('sha256',)).get('sha256')==hashlib.sha256(body).hexdigest(),'recovered state envelope differs')
    fields=e.fields(body);row=e.select(fields,('round','phase','status','calls','meta_calls'))
    for name in ('active','active_intent','resolution'):row[name+'_is_null']=fields.get(name,b'null')==b'null'
    return row


def verify_handoff(c,*,initial=False,native_checks=True):
    """Fixed history always; actual recovered current-state pins only initially."""
    handoff=public_json(reference(c['resume_handoff']))
    need(handoff.get('schema')==HANDOFF_SCHEMA and handoff.get('study')==c['parent_study'] and
         handoff.get('arm')=='exploration' and handoff.get('contract_sha256')==c['contract_sha256']==CONTRACT_SHA and
         handoff.get('implementation_sha256')==c['implementation_sha256'] and
         handoff.get('predecessor_owner')=={'path':str(PREDECESSOR),'sha256':PREDECESSOR_SHA} and
         handoff.get('predecessor_config')==c['resume_predecessor_config'] and
         handoff.get('revision_finished')==c['revision_finished'] and
         handoff.get('paid_review_replay_authorized') is False,'closed resume belongs to another source/goal/history')
    for key,success in (('owner_exit',False),('native_exit',False),('recovery_exit',True)):
        row=handoff.get(key,{})
        need(row.get('actual_numeric_exit_observed') is True and type(row.get('returncode')) is int and
             (row['returncode']==0)==success and isinstance(row.get('completion_reference'),str) and
             bool(row['completion_reference'].strip()),'actual closed owner/native/recovery observation required')
    need(isinstance(handoff['owner_exit'].get('owned_tool_handle'),str) and
         bool(handoff['owner_exit']['owned_tool_handle']),'actual predecessor owned handle missing')
    study=Path(c['parent_study'])
    for key,name in (('seal','seal.json'),('protocol','protocol.json')):
        need(reference(handoff[key])==study/name,'closed resume seal/protocol provenance differs')
    states=handoff.get('recovered_states',{})
    need(set(states)=={'baseline','exploration'},'both recovered stopped-state bindings required')
    for mode,row in states.items():
        need(set(row)=={'current','archive'} and row['current'].get('path')==str(study/'arms'/mode/'state.json') and
             row['archive'].get('sha256')==row['current'].get('sha256'),'recovered state/archive identity differs')
        archive=reference(row['archive']);observation=state_observation(archive)
        need(all(observation[x+'_is_null'] for x in ('active','active_intent','resolution')),
             'recovered handoff still has active work or a resolution needing exact audit')
        if initial:reference(row['current'])
    module=load(reference(c['resume_settlement_source']),'gaussian_closed_role_settlement')
    certificate=handoff.get('extra_nonlaunch')
    need(isinstance(certificate,dict),'exact review no-launch disposition missing')
    result=module.validate_certificate(certificate,c)
    need(result.get('settled') is True and result.get('role')=='reviewer' and
         result.get('paid_retry_authorized') is False,'review uncertainty is not a closed no-replay disposition')
    revision=O.verify_revision(c,initial=False,native_checks=native_checks)
    return {**revision,'resume_handoff_sha256':c['resume_handoff']['sha256'],'extra_nonlaunch':certificate}


def configuration(outer,*,initial=False,native_checks=True):
    required={'schema','predecessor_config','handoff','owner_source_sha256','settlement_source'}
    need(isinstance(outer,dict) and set(outer)==required and outer.get('schema')==SCHEMA,'closed-resume configuration differs')
    need(sha(__file__)==outer['owner_source_sha256'],'closed-resume owner source changed')
    predecessor=public_json(reference(outer['predecessor_config']))
    need(predecessor.get('schema')==O.SCHEMA and predecessor.get('owner_source_sha256')==PREDECESSOR_SHA and
         predecessor.get('history_source')=={'path':str(HERE.parent/'continuation/history.py'),'sha256':HISTORY_SHA},
         'published predecessor configuration/history differs')
    c={**predecessor,'owner_source_sha256':outer['owner_source_sha256'],
       'resume_predecessor_config':outer['predecessor_config'],'resume_handoff':outer['handoff'],
       'resume_settlement_source':outer['settlement_source']}
    for key in ('history_source','base_owner','epoch_source','finalization_source','funding_source','revision_source','revision_config','revision_finished','resume_settlement_source'):
        reference(c[key])
    need(c['base_owner']=={'path':str(O.BASE_PATH),'sha256':O.BASE_SHA},'qualified base-owner binding differs')
    need(sha(c['profile_path'])==c['profile_sha256'],'qualified future profile differs')
    O.B.qualify_funding(c);verify_handoff(c,initial=initial,native_checks=native_checks)
    return c


def public_study(study,c,transition):
    result=O.B.public_study(study);module=load(reference(c['resume_settlement_source']),'gaussian_closed_resume_settlement')
    for mode,row in result.items():
        row.update(module.settlement(Path(study),mode,transition['grant'],transition['extra_nonlaunch'],c))
    return result


class Native(O.Native):
    def __init__(self,c,output):
        super().__init__(c,output);self.resume_admitted=False;self.resume_transition=None
    def transition(self):
        value=verify_handoff(self.c,initial=not self.resume_admitted)
        self.resume_admitted=True;self.resume_transition=value
        self.initial_revision_checked=True;self.grant_reference=value['grant'];self.transition_admitted=True
        return value
    def check_inputs(self):
        outer={'schema':SCHEMA,'predecessor_config':self.c['resume_predecessor_config'],
            'handoff':self.c['resume_handoff'],'owner_source_sha256':self.c['owner_source_sha256'],
            'settlement_source':self.c['resume_settlement_source']}
        expected=configuration(outer,initial=not self.resume_admitted)
        need(expected==self.c,'derived closed-resume configuration changed')
        if not self.resume_admitted:self.transition()
    def public(self,study):
        if self.resume_transition is None:self.transition()
        return public_study(study,self.c,self.resume_transition)
    def command(self,kind,argv,study):
        if kind=='curation':
            # Rebind only the explicit chronology-source argument. Never run
            # new source under the predecessor's source identity.
            need(argv[-2]==str(PREDECESSOR) and argv[-1]==self.c['owner_source_sha256'],
                 'predecessor curator source interface changed')
            argv=[*argv[:-2],str(Path(__file__).resolve()),argv[-1]]
        return super().command(kind,argv,study)


class Owner(O.Owner):
    def __init__(self,c,output,backend=None):
        super().__init__(c,output,backend or Native(c,output));self.state['schema']=SCHEMA
    def checkpoint(self,phase,**values):
        super().checkpoint(phase,**values)
        pointer=public_json(self.output/'CURRENT.json')
        pointer.update(schema=CURRENT_SCHEMA,resume_handoff_sha256=self.c['resume_handoff']['sha256'])
        write(self.output/'CURRENT.json',pointer)


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
    a=p.parse_args();c=configuration(public_json(a.config),initial=True)
    need(a.output.resolve().is_relative_to(ROOT),'fresh resume output escaped repository')
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
    def stop(*_):O.B.STOPPING=True
    signal.signal(signal.SIGINT,stop);signal.signal(signal.SIGTERM,stop)
    raise SystemExit(main())
