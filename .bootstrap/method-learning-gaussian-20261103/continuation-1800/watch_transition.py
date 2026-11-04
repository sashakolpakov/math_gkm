"""Prospective explicit boundary watcher. No activation is the default.

Retries only source-qualified transient pre-request refusal. It never times out
or interrupts an entered Gate.activate call, and never starts a successor owner.
"""
import argparse
import contextlib
import importlib.util
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
if str(ROOT) not in sys.path:sys.path.insert(0,str(ROOT))
SOURCE=HERE/'transition.py'
PYTHON='/opt/homebrew/bin/python3'
RUNNING_PHASES=frozenset({'waiting_initial_closure','research_running','recovering_closed_receipts','waiting_host_headroom'})
OWNER_PHASES=RUNNING_PHASES|frozenset({'waiting_initial_closure','finalizing_closed_candidate','epoch_closed_root_open',
    'curating_next_epoch','migrating_closed_epoch','successor_ready'})
ACTIVE_REFUSAL='parent active, unsettled, or mathematically resolved'
TRANSIENT=frozenset({
    'original comparison and parent must actually finish finite epochs',
    'owned boundary or heavy admission is busy',
    'owner already has an unsettled epoch transition',
    'parent active, unsettled, or mathematically resolved',
})

class Refused(ValueError):
    pass


def transition():
    spec=importlib.util.spec_from_file_location('qualified_boundary_gate',SOURCE)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    return module


@contextlib.contextmanager
def keep_awake():
    # Only our direct keeper is terminated; there are no saved-PID operations.
    child=subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],
        stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
    try:yield
    finally:
        if child.poll() is None:child.terminate()
        try:child.wait(timeout=5)
        except subprocess.TimeoutExpired:child.kill();child.wait(timeout=5)


class Watch:
    def __init__(self,binding,output,module=None):
        self.binding=Path(binding);self.output=Path(output)
        # Authenticate gate bytes BEFORE executing even its import-time code.
        if self.binding.is_symlink() or self.binding.stat().st_size>1024**2:
            raise Refused('bounded ordinary binding required')
        preliminary=json.loads(self.binding.read_bytes())
        expected=preliminary.get('transition_source_sha256') if isinstance(preliminary,dict) else None
        if SOURCE.is_symlink() or hashlib.sha256(SOURCE.read_bytes()).hexdigest()!=expected:
            raise Refused('gate source differs before import')
        self.t=module or transition()
        self.binding_sha=self.t.sha(self.binding);self.source_sha=self.t.sha(SOURCE)
        self.watch_sha=self.t.sha(__file__)
        self.gate=self.t.Gate(self.binding,self.output)
    def pins(self,activation=None):
        t=self.t
        if t.sha(self.binding)!=self.binding_sha or t.sha(SOURCE)!=self.source_sha or t.sha(__file__)!=self.watch_sha:
            raise Refused('watcher, gate, or exact binding changed')
        value=t.read(self.binding)
        if not isinstance(value,dict) or value.get('transition_source_sha256')!=self.source_sha:
            raise Refused('binding does not pin this exact gate source')
        if activation is not None:
            approved=t.read(activation)
            if (not isinstance(approved,dict) or approved.get('schema')!=t.ACTIVATION or approved.get('activate') is not True or
                approved.get('binding_sha256')!=self.binding_sha or approved.get('transition_source_sha256')!=self.source_sha or
                approved.get('watch_source_sha256')!=self.watch_sha):
                raise Refused('explicit source-bound watcher activation required')
        return value
    def guards(self):
        """Cheap source/public guards prevent an earlier transient masking fatal state."""
        t=self.t;value,old,_,_,_=t.load_binding(self.binding,t.Native())
        if (t.ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():raise Refused('unresolved cleanup hold')
        output=Path(value['legacy_output']);current=t.read(output/'CURRENT.json')
        if not isinstance(current,dict):raise Refused('invalid public owner pointer')
        if (current.get('schema')!='math-gkm.gaussian-goal-current.v1' or
            current.get('phase') not in OWNER_PHASES or current.get('owner_source_sha256')!=old['owner_source_sha256'] or
            current.get('contract_sha256')!=value['contract_sha256'] or current.get('root_proved') is not False or
            type(current.get('epoch')) is not int or current['epoch']<0):raise Refused('owner pointer/source or root resolution changed')
        parent=t.own(current['current_study']);original=Path(old['initial_study'])
        expected=original if current['epoch']==0 else Path(old['successor_root'])/f'method-learning-gaussian-20261103-epoch-{current["epoch"]:04d}'
        if parent!=expected:raise Refused('unqualified current successor')
        if (output/'STOP').exists():raise Refused('existing owner stop')
        e=t.parser();unsettled=False
        for study in {parent,original}:
            if (study/'STOP.json').exists():raise Refused('existing study stop')
            for mode in (('baseline','exploration') if study==original else ('exploration',)):
                envelope=e.fields(t.raw(study/'arms'/mode/'state.json'));body=envelope['state']
                if e.select(envelope,('sha256',))['sha256']!=hashlib.sha256(body).hexdigest():
                    raise Refused('state envelope integrity changed')
                fields=e.fields(body)
                if fields.get('resolution',b'null')!=b'null':raise Refused('mathematical resolution requires final audit')
                unsettled=unsettled or any(fields.get(key,b'null')!=b'null' for key in ('active','active_intent'))
        # These are public operational command headers, never role/eval payloads.
        commands={};directory=output/'commands';open_wrapper=False
        for index,command in enumerate(directory.iterdir() if directory.exists() else ()):
            if index>=10000:raise Refused('bounded own command inventory exceeded')
            if not command.is_dir() or command.is_symlink():raise Refused('invalid own command evidence')
            intent=t.read(command/'INTENT.json')
            kind=intent.get('kind')
            if kind in ('research','recover') and not (command/'EXIT.json').exists():
                expected_argv=[PYTHON,'-m','machinery.study', 'run' if kind=='research' else 'recover', '--study',str(parent)]
                if kind=='research':expected_argv+=['--arm','both' if current['epoch']==0 else 'exploration']
                expected_phases=({'research_running','waiting_initial_closure'} if kind=='research' and current['epoch']==0 else
                    {'research_running'} if kind=='research' else {'recovering_closed_receipts'})
                if (current['phase'] not in expected_phases or intent.get('study')!=str(parent) or
                    intent.get('argv')!=expected_argv):
                    raise Refused('open own wrapper is not source-qualified active work')
                open_wrapper=True
                continue
            if kind not in ('research','recover','finalization'):continue
            closed=t.read(command/'EXIT.json')
            if (type(closed.get('returncode')) is not int or closed.get('actual_numeric_exit_observed') is not True or
                closed.get('owned_handle') is not True or closed.get('log_sha256')!=t.sha(command/'private.log')):
                raise Refused('uncertain prior own command')
            if kind!='finalization':continue
            commands[str(command)]={'kind':'finalization','returncode':closed['returncode'],'argv':intent.get('argv')}
        t.no_paid_finalizers(output,old['finalization_source'],value['implementation_sha256'],commands)
        return {'phase':current['phase'],'unsettled':unsettled,'open_wrapper':open_wrapper}
    def inspect(self):
        self.pins();self.guards()
        return self.gate.inspect()
    def run(self,activation,*,wait_seconds=86400,poll_seconds=1,clock=time.monotonic,sleep=time.sleep,keeper=keep_awake):
        if (type(wait_seconds) not in (int,float) or not 0<wait_seconds<=604800 or
            type(poll_seconds) not in (int,float) or not .25<=poll_seconds<=60):raise Refused('bounded watch duration and polling required')
        self.pins(activation);activation_sha=self.t.sha(activation);deadline=clock()+wait_seconds;attempts=0
        with keeper():
            while True:
                self.pins(activation)
                if self.t.sha(activation)!=activation_sha:raise Refused('activation file changed')
                if self.output.exists():raise Refused('transition output exists; uncertain request cannot replay')
                context=self.guards()
                if clock()>=deadline:raise Refused('boundary watch duration exhausted before any request')
                # A finite flag can precede final evaluation or the wrapper's
                # actual EXIT. Wait only for an exact own research/recover
                # intent in its matching running phase, before calling Gate.
                if context['open_wrapper']:
                    sleep(min(poll_seconds,deadline-clock()));continue
                try:
                    attempts+=1
                    result=self.gate.activate(activation)
                    return dict(attempts=attempts,receipt=result)
                except Exception as exc:
                    # Never retry an operation that created ANY output, even if
                    # it has not yet written REQUEST.json. Gate owns post-STOP wait.
                    if self.output.exists():raise Refused('transition artifacts exist; no retry') from exc
                    if not isinstance(exc,self.t.Refused) or str(exc) not in TRANSIENT:raise
                    self.pins(activation);context=self.guards()
                    if str(exc)==ACTIVE_REFUSAL and (context['phase'] not in RUNNING_PHASES or not context['unsettled']):
                        raise Refused('generic active refusal lacks source-qualified in-flight work') from exc
                    remaining=deadline-clock()
                    if remaining<=0:raise Refused('boundary watch duration exhausted before any request')
                    sleep(min(poll_seconds,remaining))


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binding',type=Path,required=True);p.add_argument('--output',type=Path,required=True)
    p.add_argument('--activate',type=Path);p.add_argument('--wait-seconds',type=float,default=86400)
    p.add_argument('--poll-seconds',type=float,default=1)
    a=p.parse_args();watch=Watch(a.binding,a.output)
    if a.activate:
        result=watch.run(a.activate,wait_seconds=a.wait_seconds,poll_seconds=a.poll_seconds)
        public={'finished':True,'attempts':result['attempts'],'receipt_path':str(a.output/'TRANSITION_FINISHED.json')}
    else:
        result=watch.inspect();public={k:result[k] for k in ('eligible_candidate','lock_qualified','parent_study','epoch')}
    print(json.dumps(public,sort_keys=True))

if __name__=='__main__':main()
