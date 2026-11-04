"""INACTIVE deduplicated qualification; existing gates, no persistent cache."""
import hashlib
import importlib.util
from pathlib import Path
import re

ROOT=Path('/Users/sasha/math_gkm')
HERE=Path(__file__).resolve().parent
PREDECESSOR=HERE.parent/'closed-round-reconciliation/coordinator.py'
PREDECESSOR_SHA='867691a030a2bdc207a008352da553b429baef35cfcdb2bee1df8bae850d53b8'
PREDECESSOR_CONFIG=HERE.parents[1]/'CLOSED_ROUND_OWNER_CONFIG.json'
PREDECESSOR_CONFIG_SHA='6533a081c336bf2da4440b7e6c13e746b1b9e5ac30bbb08c9a8df90c3d19454b'
SCHEMA='math-gkm.gaussian-efficient-owner.v1'
HANDOFF_SCHEMA='math-gkm.gaussian-efficient-handoff.v1'


def load(path,name,pin):
    path=Path(path)
    if hashlib.sha256(path.read_bytes()).hexdigest()!=pin:raise RuntimeError('qualified source changed')
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

O=load(PREDECESSOR,'efficient_unchanged_coordinator_component',PREDECESSOR_SHA)
need=O.need;sha=O.sha;reference=O.reference;public_json=O.public_json


def closed_handoff(binding,old,*,initial):
    h=public_json(reference(binding['handoff']));c=old['component'];study=Path(h['study']);epoch=h['epoch']
    need(h.get('schema')==HANDOFF_SCHEMA and h.get('arm')=='exploration' and type(epoch) is int and epoch>=1 and
         study.is_absolute() and study.resolve()==study and study.parent==ROOT/'.scratch/studies' and
         re.fullmatch(O.DESTINATION_PREFIX+r'[0-9]{4,}',study.name) is not None and int(study.name.rsplit('-',1)[-1])==epoch,
         'handoff must identify an exact existing exploration epoch')
    need(h.get('predecessor_source')==binding['predecessor_source'] and h.get('predecessor_config')==binding['predecessor_config'] and
         h.get('contract_sha256')==c['contract_sha256'] and h.get('implementation_sha256')==c['implementation_sha256'] and
         h.get('profile_sha256')==c['profile_sha256'],'closed owner source/goal/profile differs')
    exited=public_json(reference(h['exit']))
    need(exited.get('schema')=='math-gkm.owned-controller-exit.v1' and
         exited.get('source')==binding['predecessor_source'] and exited.get('config')==binding['predecessor_config'] and
         exited.get('output')==h['predecessor_output'] and type(exited.get('observed_at')) in (int,float) and exited['observed_at']>0 and
         exited.get('actual_numeric_exit_observed') is True and type(exited.get('returncode')) is int and
         exited['returncode']!=0 and isinstance(exited.get('owned_tool_handle'),str) and bool(exited['owned_tool_handle'].strip()) and
         isinstance(exited.get('completion_reference'),str) and bool(exited['completion_reference'].strip()),
         'actual closed predecessor owner evidence is required; no PID adoption')
    output=Path(h['predecessor_output'])
    need(output.is_absolute() and output.resolve()==output and output.is_relative_to(ROOT) and
         reference(h['checkpoint'])==output/'OWNER_CHECKPOINT.json','closed owner checkpoint escaped')
    cp=public_json(reference(h['checkpoint']))
    need(type(cp.get('updated_at')) in (int,float) and cp['updated_at']<=exited['observed_at'],'exit observation predates final checkpoint')
    need(cp.get('schema')==O.SCHEMA and cp.get('coordinator_source_sha256')==PREDECESSOR_SHA and
         cp.get('current_study')==str(study) and cp.get('epoch')==epoch and cp.get('root_proved') is False and
         cp.get('component_source')==old['binding']['component_source'] and
         cp.get('reconciliation_finished')==old['binding']['reconciliation_finished'],
         'closed owner checkpoint identifies another history or resolved goal')
    commands=h.get('commands')
    need(isinstance(commands,list) and len(commands)<=10000,'complete predecessor command closure list required')
    observed=set();command_root=output/'commands'
    if command_root.exists():
        need(command_root.is_dir() and command_root.resolve()==command_root,'predecessor commands root aliased')
        for entry in command_root.iterdir():
            need(not entry.is_symlink() and entry.is_dir() and re.fullmatch(r'[0-9]{6}',entry.name) is not None,
                 'unknown predecessor command entry')
            observed.add(entry)
            need(len(observed)<=10000,'predecessor command inventory bound')
    listed=set()
    for row in commands:
        need(isinstance(row,dict) and set(row)=={'intent','exit','log'},'typed closed command refs required')
        intent_path=reference(row['intent']);directory=intent_path.parent
        need(directory.parent==command_root and directory not in listed and intent_path.name=='INTENT.json' and
             reference(row['exit'])==directory/'EXIT.json' and reference(row['log'])==directory/'private.log',
             'predecessor command refs escaped their exact owned directory')
        intent=public_json(intent_path);closed=public_json(reference(row['exit']))
        need(intent.get('kind') in ('research','recover','finalization','curation') and
             type(intent.get('created')) in (int,float) and intent['created']<=exited['observed_at'] and
             closed.get('actual_numeric_exit_observed') is True and closed.get('owned_handle') is True and
             type(closed.get('returncode')) is int and closed.get('log_sha256')==row['log']['sha256'],
             'a predecessor native command has no genuine closed numeric owned receipt')
        listed.add(directory)
    need(listed==observed,'unlisted or open predecessor command directory')
    if initial:need(not (study/'STOP.json').exists(),'retained study STOP requires explicit operator disposition; never silently cleared')
    need(reference(h['seal'])==study/'seal.json' and reference(h['protocol'])==study/'protocol.json',
         'current epoch seal/protocol differs')
    need(set(h['states'])=={'baseline','exploration'},'both opaque closed-state pins are required')
    for mode,row in h['states'].items():
        need(set(row)=={'current','archive'} and row['current'].get('path')==str(study/'arms'/mode/'state.json') and
             row['current'].get('sha256')==row['archive'].get('sha256'),'closed-state/archive identity differs')
        reference(row['archive'])
        if initial:reference(row['current'])
    if initial:
        rows=O.C.public_study(study,c,old['transition'])
        need(set(rows)=={'baseline','exploration'} and all(row.get('all_jobs_settled') is True for row in rows.values()),
             'an unfinished role cannot be adopted or replayed')
        for row in h['states'].values():reference(row['current'])
    return h


def native_obligations(old):
    """Enumerate every native-only branch of the old recursive qualification.

    Repeated calls in that tree authenticate the same immutable objects. Each
    distinct obligation is executed once here; none is replaced by a fake hash,
    metadata-only content identity, process-wide cache or modified native gate.
    """
    c=old['component'];base=old['binding']
    O.C.P.S.O.verify_revision(c,initial=False,native_checks=True)
    from machinery.study_deployment import reuse_deployment
    h=public_json(reference(c['prepared_handoff']))
    reuse_deployment(O.C.deployment_from_archive(reference(h['prepared_seal']['archive'])))
    helper=load(reference(base['reconciliation_source']),'efficient_genuine_reconciliation_verifier',base['reconciliation_source']['sha256'])
    checked=helper.verify_finished(O.STUDY,Path(base['reconciliation_output']),
        expected_source_sha256=base['reconciliation_source']['sha256'],require_current_state=False,native_checks=True)
    need(checked==old['reconciliation'],'native-only reconciliation validation differs from pure history')


def headroom():
    from machinery.resources import headroom as native_headroom,limits
    return native_headroom(limits())


def qualify(binding,*,initial=False,native_checks=True):
    needed={'schema','owner_source','admission_source','runtime_source','predecessor_source','predecessor_config','handoff'}
    need(isinstance(binding,dict) and set(binding)==needed and binding.get('schema')==SCHEMA,'efficient owner binding differs')
    for key in needed-{'schema'}:reference(binding[key])
    need(binding['owner_source']['path']==str(HERE/'coordinator.py') and binding['admission_source']=={'path':str(Path(__file__).resolve()),'sha256':sha(__file__)} and
         binding['runtime_source']['path']==str(HERE/'runtime.py') and binding['predecessor_source']=={'path':str(PREDECESSOR),'sha256':PREDECESSOR_SHA} and
         binding['predecessor_config']=={'path':str(PREDECESSOR_CONFIG),'sha256':PREDECESSOR_CONFIG_SHA},
         'qualified implementation composition differs')
    if native_checks:headroom()  # Cheap unchanged guard before full tree hashing.
    old=O.configuration(public_json(reference(binding['predecessor_config'])),initial=False,native_checks=False)
    h=closed_handoff(binding,old,initial=initial)
    if native_checks:
        native_obligations(old)
        if initial:
            for row in h['states'].values():reference(row['current'])
        headroom()  # Fresh unchanged guard immediately before owned-child intent.
    return {'binding':binding,'predecessor':old,'handoff':h}
